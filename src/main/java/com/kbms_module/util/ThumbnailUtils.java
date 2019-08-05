package com.kbms_module.util;


import com.kbms_module.enums.webConstant;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.util.GraphicsRenderingHints;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by warkey on 2018-04-04.
 * 获取缩略图，借助工具类，获取缩略图工具
 */
public class ThumbnailUtils {
    public static void pdfGetThumb(String path, String filePath) {
        // TODO Auto-generated method stub
        Document document = new Document();

        try {
            document.setFile(path);
        } catch (Exception e1) {
            e1.printStackTrace();
        }

        BufferedImage image = null;

        RenderedImage rendImage = null;

        for (int i = 0; i < 1; i++) {
            image = (BufferedImage) document.getPageImage(i, GraphicsRenderingHints.SCREEN, i, 0f, 1.5f);
            rendImage = image;
            File file = new File(filePath);
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    ImageIO.write(rendImage, "png", file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                image.flush();
            }
        }

        document.dispose();

    }

    public static boolean videoGetThumb(String filePath, String outPath) {
        File file = new File(filePath);

        if (!file.exists()) {

            System.out.println("路径[" + filePath + "]对应的视频文件不存在!");

        }

        List<String> commands = new ArrayList<String>();


        commands.add(webConstant.CONTAINER_PATH + "resource/ffmpeg/ffmpeg.exe");

        commands.add("-i");

        commands.add(filePath);

        commands.add("-ss");

        commands.add("05");

        commands.add("-y");

        commands.add("-f");

        commands.add("image2");

        commands.add("-vframes");

        commands.add("1");

        commands.add("-s");

        commands.add("320x240");

        commands.add(outPath);
        StringBuffer test=new StringBuffer();
        for(int i=0;i<commands.size();i++)
            test.append(commands.get(i)+" ");
        //System.out.println(test);
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commands);
            builder.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }



}
