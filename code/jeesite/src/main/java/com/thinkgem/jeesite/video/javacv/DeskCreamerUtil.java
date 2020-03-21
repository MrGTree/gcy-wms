package com.thinkgem.jeesite.video.javacv;

import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 *  提供静态方法，传入坐标，找到最近的那个摄像头，返回
 *
 */
public class DeskCreamerUtil {

    private static Logger logger = LoggerFactory.getLogger(DeskCreamerUtil.class);

    public static DeskCreamer calcAndGetDeskCreamer(String creamerName, float x , float y){
        //早8点到晚上6点执行，否则返回
        int hour = LocalTime.now().getHour();
        if(!(hour>=8 && hour<18)){
            return null;
        }
        Map<String,List<DeskCreamer>> map = SpringContextHolder.getBean("deskCreamerMapList");
        if(CollectionUtils.isEmpty(map)){
            try {
                throw new Exception("未取得桌面摄像头桌位ip信息");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<DeskCreamer> deskCreamers = map.get(creamerName);
        DeskCreamer minDistDC = getMinDistDC(deskCreamers, x, y);
        logger.warn("桌面摄像头桌位ip信息 {}", minDistDC.toString());
        return minDistDC;
    }

    private static DeskCreamer getMinDistDC(List<DeskCreamer> deskCreamers, float x , float y){
        StPointF targetPoint = new StPointF(x,y);
        for(DeskCreamer dc : deskCreamers){
            List<StPointF> range = dc.getRange();
            boolean isIn = isPtInPoly(targetPoint, range);
            if(isIn){
                return dc;
            }
        }
        return null;
    }

    /**
     * 判断目标点是否在多边形内
     * @param point
     * @param pts
     * @return
     */
    public static boolean isPtInPoly(StPointF point, List<StPointF> pts){
        int N = pts.size();
        boolean boundOrVertex = true; //如果点位于多边形的顶点或边上，也算做点在多边形内，直接返回true
        int intersectCount = 0;//cross points count of x
        double precision = 2e-10; //浮点类型计算时候与0比较时候的容差
        StPointF p1, p2;//neighbour bound vertices
        StPointF p = point; //当前点

        p1 = pts.get(0);//left vertex
        for(int i = 1; i <= N; ++i){//check all rays
            if(p.equals(p1)){
                return boundOrVertex;//p is an vertex
            }

            p2 = pts.get(i % N);//right vertex
            if(p.x < Math.min(p1.x, p2.x) || p.x > Math.max(p1.x, p2.x)){//ray is outside of our interests
                p1 = p2;
                continue;//next ray left point
            }

            if(p.x > Math.min(p1.x, p2.x) && p.x < Math.max(p1.x, p2.x)){//ray is crossing over by the algorithm (common part of)
                if(p.y <= Math.max(p1.y, p2.y)){//x is before of ray
                    if(p1.x == p2.x && p.y >= Math.min(p1.y, p2.y)){//overlies on a horizontal ray
                        return boundOrVertex;
                    }

                    if(p1.y == p2.y){//ray is vertical
                        if(p1.y == p.y){//overlies on a vertical ray
                            return boundOrVertex;
                        }else{//before ray
                            ++intersectCount;
                        }
                    }else{//cross point on the left side
                        double xinters = (p.x - p1.x) * (p2.y - p1.y) / (p2.x - p1.x) + p1.y;//cross point of y
                        if(Math.abs(p.y - xinters) < precision){//overlies on a ray
                            return boundOrVertex;
                        }

                        if(p.y < xinters){//before ray
                            ++intersectCount;
                        }
                    }
                }
            }else{//special case when ray is crossing through the vertex
                if(p.x == p2.x && p.y <= p2.y){//p crossing over p2
                    StPointF p3 = pts.get((i+1) % N); //next vertex
                    if(p.x >= Math.min(p1.x, p3.x) && p.x <= Math.max(p1.x, p3.x)){//p.x lies between p1.x & p3.x
                        ++intersectCount;
                    }else{
                        intersectCount += 2;
                    }
                }
            }
            p1 = p2;//next ray left point
        }

        if(intersectCount % 2 == 0){//偶数在多边形外
            return false;
        } else { //奇数在多边形内
            return true;
        }

    }

    public static List<StPointF> convertToList(String lines){
        List<StPointF> res = new ArrayList<>();
        if(StringUtils.isEmpty(lines)){
            return res;
        }
        String[] pointStr = lines.split(";");
        if(pointStr.length==1){
            return res;
        }
        for (String str : pointStr){
            String[] split = str.split(",");
            if(split.length==2){
                float x = Float.parseFloat(split[0].trim());
                float y = Float.parseFloat(split[1].trim());
                res.add(new StPointF(x,y));
            }else {
                continue;
            }

        }
        return res;
    }


  /*  public static void main(String[] args) {
        StPointF p1 = new StPointF(2,2);
        StPointF p2 = new StPointF(3,1);
        StPointF p3 = new StPointF(5,1);
        StPointF p4 = new StPointF(6,3);
        StPointF p5 = new StPointF(4,4);
        List<StPointF> pts = new ArrayList<>();
        pts.add(p1);
        pts.add(p2);
        pts.add(p3);
        pts.add(p4);
        pts.add(p5);

        StPointF tp = new StPointF(2.4f,1.4f);

        System.out.println(isPtInPoly(tp,pts));


    }*/



}
