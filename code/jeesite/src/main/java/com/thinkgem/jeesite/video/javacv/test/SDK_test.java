package com.thinkgem.jeesite.video.javacv.test;

import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.*;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Scalar;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import java.io.*;

import static org.opencv.core.Core.addWeighted;
import static org.opencv.core.CvType.CV_32F;
import static org.opencv.core.CvType.CV_8UC3;
import static org.opencv.imgproc.Imgproc.COLORMAP_JET;
import static org.opencv.imgproc.Imgproc.FONT_HERSHEY_SIMPLEX;

public class SDK_test {
    static {
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
    }
    private static final String LICENSE_PATH = "./models/license.lic";
    private static final String MODEL_PATH = "./models/M_Crowd_Keypoint_1.0.0.model";
    private static final String RESULT_PATH = "./test.jpg";

    private static Mat visualize_dmap(Mat ori_img,
                                      StCrowdDensityResult crowd_result) {
        Mat dmap = new Mat(crowd_result.getHeight(), crowd_result.getWidth(), CV_32F);
        dmap.put(0, 0, crowd_result.getDensityMap());
        // normalize dmap
        Core.MinMaxLocResult minMaxLoc =  Core.minMaxLoc(dmap);
        dmap = dmap.mul(dmap, 1 / minMaxLoc.maxVal);
        dmap.convertTo(dmap, CV_8UC3, 255);
        // gen color map and resize
        Mat color_dmap = new Mat();
        Imgproc.applyColorMap(dmap, color_dmap, COLORMAP_JET);
        Imgproc.resize(color_dmap, color_dmap, ori_img.size());
        // add weight for visualize
        Mat vis_dmap = new Mat(ori_img.rows(), ori_img.cols(), ori_img.type());
        Mat base_img = ori_img.clone();

        float alpha = 0.5f;
        addWeighted(color_dmap, alpha, base_img, 1 - alpha, 0, vis_dmap);

        // draw keypoint
        StPointF[] pts = crowd_result.getKeypoints();
        Scalar color = new Scalar(255, 255, 255);
        for (int i = 0; i < crowd_result.getKeypointCount(); ++i) {
            Imgproc.circle(
                    vis_dmap,
                    new Point(pts[i].x, pts[i].y),
                    3, color, -1);

            Imgproc.putText(vis_dmap, String.format("%.2f", crowd_result.getPointsScore()[i]),
                    new Point(pts[i].x, pts[i].y - 5),
                    FONT_HERSHEY_SIMPLEX, 1, new Scalar(255, 0, 0),
                    2, 8, false);
        }
        return vis_dmap;
    }

    public static void main(String[] args) {
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
        if (args.length != 1) {
            System.out.println("Usage: CrowdDensity test.jpg");
            return;
        }

        System.out.println("version = " + Core.getVersionString());

        int[] retCode = new int[1];
        String lic = readToString(LICENSE_PATH);
        String activeCode = StLibrary.onlineActivite("", lic, retCode);
        if (retCode[0] != 0) {
            System.out.println("get online activation code failed, rc = " + retCode[0]);
            return;
        }
        retCode[0] = StLibrary.addLic("", lic, activeCode);
        if (retCode[0] != 0) {
            System.out.println("add lic failed, rc = " + retCode[0]);
            return;
        }

        int[] width1 = new int[1];
        int[] height1 = new int[1];

        String filePath = args[0];
        System.out.println("input path = " + filePath);
        Mat mat = Imgcodecs.imread(args[0]);

        byte[] imageData = StLibrary.stGetBgrDataFromImage(args[0], width1, height1);
        System.out.println(width1[0]);
        System.out.println(height1[0]);

        StCrowdDensityDetector detector = null;
        try {
            detector = new StCrowdDensityDetector(MODEL_PATH);
            StCrowdDensityResult crowdResult = detector.track(imageData, StImageFormat.ST_PIX_FMT_BGR888,
                    width1[0], height1[0]);

            System.out.println("Width: " + crowdResult.getWidth());
            System.out.println("Height: " + crowdResult.getHeight());
            System.out.println("Number of People: " + crowdResult.getNumberOfPeople());
            System.out.println("Number of keypoints: " + crowdResult.getKeypointCount());
            System.out.println("keypoints coordinator: ");
            StPointF[] pts = crowdResult.getKeypoints();
            for (StPointF pt : pts) {
                System.out.println(String.format("(x, y) = (%.2f - %.2f)", pt.x, pt.y));
            }

            Mat colorMat = visualize_dmap(mat, crowdResult);
            Imgcodecs.imwrite(RESULT_PATH, colorMat);
        } catch (StFaceException e) {
            e.printStackTrace();
        }

        if (detector != null) {
            detector.release();
        }

    }

    public static String readToString(String fileName) {
        String encoding = "UTF-8";
        File file = new File(fileName);
        long filelength = file.length();
        byte[] filecontent = new byte[(int) filelength];
        try {
            FileInputStream in = new FileInputStream(file);
            in.read(filecontent);
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            return new String(filecontent, encoding);
        } catch (UnsupportedEncodingException e) {
            System.err.println("The OS does not support " + encoding);
            e.printStackTrace();
            return null;
        }
    }
}
