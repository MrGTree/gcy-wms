package com.thinkgem.jeesite.video.javacv.test;

import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StImageFormat;
import com.sensetime.ad.sdk.StLibrary;
import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.common.utils.VideoAnalizyUtils;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.imgcodecs.Imgcodecs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

public class SDK_test {
    static {
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
    }
    private static final String LICENSE_PATH = "./models/license.lic";
    private static final String MODEL_PATH = "./models/M_Crowd_Keypoint_1.0.0.model";
    private static final String RESULT_PATH = "./test.jpg";


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
            Man man = new Man();
            Man man1 = new Man();
            man.setX(crowdResult.getKeypoints()[0].x);
            man.setY(crowdResult.getKeypoints()[0].y);
            man1.setY(crowdResult.getKeypoints()[1].y);
            man1.setY(crowdResult.getKeypoints()[1].y);
            for (StPointF pt : pts) {
                System.out.println(String.format("(x, y) = (%.2f - %.2f)", pt.x, pt.y));
            }

            Mat colorMat = VideoAnalizyUtils.visualize_dmap(mat, crowdResult,man,man1,new UrlMapper());
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
