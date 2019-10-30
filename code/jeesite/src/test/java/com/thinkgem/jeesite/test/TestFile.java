package com.thinkgem.jeesite.test;

import java.io.File;

/*
利用File构造器，new 一个目录file
1）在其中创建多个文件和目录
2）编写方法，实现删除file中文件的操作
 */
public class TestFile {

    private static int count = 0;

    public static void main(String[] args) {
        boolean b = deleteFile(new File("C:\\Users\\qingn\\Desktop\\jeesite-1.2.7"));
        System.out.println(b);
    }

    public static boolean deleteFile(File file) {

        if (!file.exists()) {
            return true;
        }

        if (file.isDirectory()) {

            File[] files = file.listFiles();

            for (File f : files) {
                deleteFile(f);//递归方法调用
            }
            //return file.delete();
            //只删除文件，不删除文件夹
            return true;

        } else {
            String name = file.getName();

            if (name.startsWith(".")) {
                System.out.println("this is "+ ++count +" time , delete file  name: " + name);
                file.delete();
            }

            return true;
        }

    }

}