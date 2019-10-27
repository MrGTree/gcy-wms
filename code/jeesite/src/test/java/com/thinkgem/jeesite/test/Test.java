package com.thinkgem.jeesite.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

    public static void main(String[] args) {
        //String string = new String("select uin_ as wx_uin,alias_ as wx_nickname,qq_ as qq,mobile_ as mobile,fullname_ as wx_fullid,openid_ as openid,from_unixtime(opentime_) as reg_time from da::t_weixin_account t where t.ds=${Part_D} and t.alias_ in(\"${Param_wx_nickname}\") \u200B\u200B\u200B\u200B");
        /*String s = "AuCrBBBWBArB";
        String[] split = s.split("A");

        for (String s1 : split) {
        System.out.println("s1 = " + s1);
        }*/

		/*String[] split = string.split("");
        for (String s : split) {
			System.out.println ("s = " + s);
		}*/

		/*String regex = "^A*B$";
        Pattern p = Pattern.compile(regex);
		java.util.regex.Matcher m = p.matcher("AuCrBBBWBArB");
		while (m.find()) {
			System.out.println(m.group());
		}*/

        String ss="ooaaoo";
        ss.trim();
        Pattern pt= Pattern.compile("(o+)");
        Matcher mt=pt.matcher(ss);
        // mt.lookingAt();
        // mt.matches();
        while(mt.find()){
            System.out.println(mt.group());
        }



      /*  String str = "123热发的发1231";
        String pattern = "[\u4e00-\u9fa5]";



        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(str);
        System.out.println(m.matches());*/


    }
}
