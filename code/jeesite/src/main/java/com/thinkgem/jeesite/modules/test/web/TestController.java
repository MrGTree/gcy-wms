/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.video.javacv.CloseMan;
import com.thinkgem.jeesite.video.javacv.CloseRelation;
import com.thinkgem.jeesite.video.javacv.Man;
import com.thinkgem.jeesite.video.javacv.RuleBreak;
import com.thinkgem.jeesite.websocket.WsHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import static com.thinkgem.jeesite.video.javacv.ConvertVideoPakcet.getCloseMan;

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
        RuleBreak ruleBreak = new RuleBreak(new Man(100, 100), new Man(200, 200), "1");
        ObjectMapper objectMapper = new ObjectMapper();
        String s = objectMapper.writeValueAsString(ruleBreak);
        SpringContextHolder.getBean(WsHandler.class).sendMessageToUsers(new TextMessage(s));
        return s;
    }

    /**
     * 测试算法功能，不含图片识别
     * a/test/test/websocket
     *
     * @return
     * @throws JsonProcessingException
     */
    @RequestMapping(value = "analizy")
    @ResponseBody
    public String analizy() throws InterruptedException {

        ArrayList<Man> manList = new ArrayList<>();
        for (int i = 0; i < 50; i++) {
            Man man = new Man(i * 60, i * 30);
            manList.add(man);

        }

        HashMap<Man, CloseRelation> closeRelationMap = new HashMap<>();

        for (; ; ) {
            long startTime = System.currentTimeMillis();


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
                                        System.out.println(manOut + " | " + man + "|" + time + "|" + distance);
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
            //System.out.println("(endTime - startTime) = " + (endTime - startTime));
            long timeSleep = 1000 - (endTime - startTime);
            if (timeSleep > 0) {
                Thread.sleep(timeSleep);
            }
        }
    }


}
