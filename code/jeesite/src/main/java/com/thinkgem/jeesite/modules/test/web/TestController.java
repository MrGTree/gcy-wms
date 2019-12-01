/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import static com.thinkgem.jeesite.common.utils.VideoAnalizyUtils.getCloseMan;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.sensetime.ad.core.StCrowdDensityDetector;
import com.sensetime.ad.core.StFaceException;
import com.sensetime.ad.sdk.StCrowdDensityResult;
import com.sensetime.ad.sdk.StImageFormat;
import com.sensetime.ad.sdk.StLibrary;
import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.video.javacv.BreakRulePushMessage;
import com.thinkgem.jeesite.video.javacv.Entity.CloseMan;
import com.thinkgem.jeesite.video.javacv.Entity.CloseRelation;
import com.thinkgem.jeesite.video.javacv.Entity.Man;
import com.thinkgem.jeesite.video.javacv.Entity.UrlMapper;
import com.thinkgem.jeesite.video.javacv.VideoAnalizyHandler;
import com.thinkgem.jeesite.websocket.WsHandler;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 测试Controller
 *
 * @author ThinkGem
 * @version 2013-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/test/test")
public class TestController extends BaseController {

    @Autowired
    private WsHandler wsHandler;
    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    /**
     * 测试通知请求
     * a/test/test/websocket
     *
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "websocket")
    @ResponseBody
    public String websocket() throws JsonProcessingException {
        ((ThreadPoolTaskExecutor) SpringContextHolder.getBean("threadPoolTaskExecutor")).execute(new BreakRulePushMessage(1080, 1902, new Man(100, 100), new Man(200, 200), "1", null, null));
        return "ok";
    }

    /**
     * 测试通知请求
     * a/test/test/websocket
     *
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "saveImage")
    @ResponseBody
    public Object saveImage(String path) throws StFaceException {
        int[] width1 = new int[1];
        int[] height1 = new int[1];

        String filePath = path;
        logger.debug("input path = " + filePath);

        byte[] imageData = StLibrary.stGetBgrDataFromImage(path, width1, height1);

        StCrowdDensityDetector detector = new StCrowdDensityDetector(Global.getModelPath());
        StCrowdDensityResult crowdResult = detector.track(imageData, StImageFormat.ST_PIX_FMT_BGR888,
                width1[0], height1[0]);

        logger.debug("Width: " + crowdResult.getWidth());
        logger.debug("Height: " + crowdResult.getHeight());
        logger.debug("Number of People: " + crowdResult.getNumberOfPeople());
        logger.debug("Number of keypoints: " + crowdResult.getKeypointCount());
        logger.debug("keypoints coordinator: ");
        StPointF[] pts = crowdResult.getKeypoints();
        for (StPointF pt : pts) {
            logger.debug(String.format("(x, y) = (%.2f - %.2f)", pt.x, pt.y));
        }

        ((ThreadPoolTaskExecutor) SpringContextHolder.getBean("threadPoolTaskExecutor")).execute(new BreakRulePushMessage(width1[0], height1[0], new Man(1, 2), new Man(2, 4), "123", imageData, crowdResult));

        if (detector != null) {
            detector.release();
        }
        return "ok";

    }

    /**
     * 测试通知请求
     * a/test/test/startAnalizy
     *
     * @return
     * @throws
     */
    @RequestMapping(value = "toStartAnalizy")
    public String toStartAnalizy(String password, Model model) {
        if (!StringUtils.equals("1qaz@WSX", password)) {
            return "redirect:/a";
        }
        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        Page<UrlMapper> page = new Page<>();
        page.setList(new ArrayList<>(urlMappers));
        page.setCount(urlMappers.size());
        model.addAttribute("page", page);
        return "modules/test/testList";
    }


    @ModelAttribute
    public UrlMapper get() {
        return new UrlMapper();
    }

    /**
     * 测试通知请求
     * a/test/test/startAnalizy
     *
     * @return
     * @throws
     */
    @RequestMapping(value = "startAnalizy")
    @ResponseBody
    public String startAnalizy(UrlMapper urlMapper) {
        Set<UrlMapper> urlMappers = SpringContextHolder.getBean("urlMapperSet");
        if (urlMapper != null && StringUtils.isNotEmpty(urlMapper.getInputUrl())) {
            urlMappers.add(urlMapper);
        }
        if (CollectionUtils.isNotEmpty(urlMappers)) {
            // 每个用一个线程处理
            for (UrlMapper urlMapperPush : urlMappers) {
                threadPoolTaskExecutor.execute(new VideoAnalizyHandler(urlMapperPush));
            }
            return "push ok";
        }

        return "no new urlMapper need to push ";

    }


    /**
     * 测试算法功能，不含图片识别
     * a/test/test/analizy
     *
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "analizy")
    @ResponseBody
    public String analizy() throws InterruptedException {

        HashMap<Man, CloseRelation> closeRelationMap = new HashMap<>();
        ArrayList<Man> manList = new ArrayList<>();
        for (; ; ) {
            long startTime = System.currentTimeMillis();

            manList.clear();
            Random random = new Random();
            for (int i = 0; i < 50; i++) {
                Man man = new Man(random.nextInt(1000), random.nextInt(1000));
                manList.add(man);

            }


            manLoop:
            for (Man manOut : manList) {
                for (Man manIn : manList) {
                    double distance = Math.sqrt(Math.pow(manOut.getX() - manIn.getX(), 2) + Math.pow(manOut.getY() - manIn.getY(), 2));
                    if (distance == 0) {
                        continue;
                    }

                    CloseRelation closeRelation = null;
                    Man key = null;
                    if (closeRelationMap.size() > 0) {
                        for (Map.Entry<Man, CloseRelation> manCloseRelationEntry : closeRelationMap.entrySet()) {
                            key = manCloseRelationEntry.getKey();
                            if (manOut.equals(key)) {
                                closeRelation = manCloseRelationEntry.getValue();
                                break;
                            }
                        }
                    }

                    //距离小于 200 像素
                    if (distance < 200) {
                        if (closeRelation != null) {
                            Set<CloseMan> closeManSet = closeRelation.getCloseManSet();
                            if (closeManSet != null && !closeManSet.isEmpty()) {
                                CloseMan closeManOn = getCloseMan(closeManSet, manIn);
                                if (closeManOn == null) {
                                    CloseMan closeMan = new CloseMan(1, manIn, true);
                                    closeManSet.add(closeMan);
                                    continue;
                                } else {
                                    Man man = closeManOn.getMan();
                                    int time = closeManOn.getTime();
                                    if (time >= 6) {
                                        //违规了，发流等待 3 分钟
                                        logger.debug(manOut + " | " + man + "|" + time + "|" + distance);
                                        //清空map
                                        closeRelationMap.clear();
                                        break manLoop;
                                    } else {
                                        //时间小了
                                        if (closeManOn.isCurrentInc()) {
                                            continue;
                                        }
                                        closeManOn.setCurrentInc(true);
                                        closeManSet.remove(closeManOn);
                                        CloseMan closeMan1 = new CloseMan(time + 1, manIn);
                                        closeMan1.setCurrentInc(true);//此次增长标记
                                        closeManSet.add(closeMan1);
                                        continue;
                                    }
                                }
                            } else {
                                Set<CloseMan> closeManNewSet = new HashSet<>();
                                CloseMan closeMan = new CloseMan(1, manIn, true);
                                closeManNewSet.add(closeMan);
                                continue;
                            }
                        } else {
                            Set<CloseMan> closeManNewSet = new HashSet<>();
                            CloseMan closeMan = new CloseMan(1, manIn, true);
                            closeManNewSet.add(closeMan);
                            CloseRelation closeRelation1 = new CloseRelation(manOut, closeManNewSet);
                            closeRelationMap.put(manOut, closeRelation1);
                            continue;
                        }
                    } else {
                        //不违规，清数据
                        if (closeRelation == null) {
                            continue;
                        } else {
                            Set<CloseMan> closeManSet = closeRelation.getCloseManSet();
                            if (closeManSet == null || closeManSet.isEmpty()) {
                                closeRelationMap.remove(key);
                                continue;
                            } else {
                                CloseMan closeMan = getCloseMan(closeManSet, manIn);
                                if (closeMan == null) {
                                    continue;
                                } else {
                                    closeManSet.remove(closeMan);
                                }
                            }

                        }


                    }
                }


            }
            if (closeRelationMap != null && !closeRelationMap.isEmpty()) {
                //这一秒的计步结束，初始化
                for (Map.Entry<Man, CloseRelation> manCloseRelationEntry : closeRelationMap.entrySet()) {
                    CloseRelation value = manCloseRelationEntry.getValue();
                    Set<CloseMan> closeManSet = value.getCloseManSet();
                    if (closeManSet != null && !closeManSet.isEmpty()) {
                        for (CloseMan closeMan : closeManSet) {
                            closeMan.setCurrentInc(false);
                        }
                    }
                }
            }
            long endTime = System.currentTimeMillis();
            //1000 - (endTime - startTime)
            //logger.debug("(endTime - startTime) = " + (endTime - startTime));
            long timeSleep = 1000 - (endTime - startTime);
            if (timeSleep > 0) {
                Thread.sleep(timeSleep);
            }
        }
    }


}
