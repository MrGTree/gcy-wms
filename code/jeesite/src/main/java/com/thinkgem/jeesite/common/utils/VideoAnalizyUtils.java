package com.thinkgem.jeesite.common.utils;

import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.video.javacv.Entity.CloseMan;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import org.apache.commons.collections.CollectionUtils;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Scalar;
import org.opencv.imgproc.Imgproc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Set;

import static org.opencv.core.Core.addWeighted;
import static org.opencv.core.CvType.CV_32F;
import static org.opencv.core.CvType.CV_8UC3;
import static org.opencv.imgproc.Imgproc.COLORMAP_JET;
import static org.opencv.imgproc.Imgproc.FONT_HERSHEY_SIMPLEX;

/**
 * @author liuji
 * @create 2019-11-28 18:39
 */
public class VideoAnalizyUtils {

    private static Logger logger = LoggerFactory.getLogger(VideoAnalizyUtils.class);

    public static CloseMan getCloseMan(Set<CloseMan> closeManSet, Man manIn) {
        if (CollectionUtils.isEmpty(closeManSet)) {
            return null;
        }
        for (CloseMan closeMan : closeManSet) {
            Man man = closeMan.getMan();
            if (man.equals(manIn)) {
                return closeMan;
            }
        }
        return null;
    }

    public static Mat visualize_dmap(Mat ori_img, StCrowdDensityResult crowd_result) {
        Mat dmap = new Mat(crowd_result.getHeight(), crowd_result.getWidth(), CV_32F);
        dmap.put(0, 0, crowd_result.getDensityMap());
        // normalize dmap
        Core.MinMaxLocResult minMaxLoc = Core.minMaxLoc(dmap);
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
}
