package com.kbms_module.enums;

import java.io.File;

/**
 * 常量类
 */
public class webConstant {
    /**
     * 用户登录前的url
     */
    public static final String SESSION_FROM_URL="FROMURL";
    /**
     * 被拦截的url
     */
    public static final String SESSION_GO_URL="GOURL";
    /**
     * 上传图片的最大值为
     */
    public static final String MAX_IMAGE_LENGTH="1048576000";
    /**
     * 支持上传图片的类型是png,jpg,jpeg,gif
     */
    public static final String IMG_UPLOADTYPE="png,jpg,jpeg,gif";
    /**
     * 每一页显示的知识数量
     */
    public static final int PageListSize=8;
    /**
     * 建立索引的位置
     */
    public static final String INDEX_PATH ="E:\\Demo\\index";
    /**
     * 搜索结果列表每一页显示的条数为
     */
    public static final Integer SearchListSize=6;
    /**
     * 显示没有解决问题的数目，默认为三条
     */
    public static final Integer UsolveProblem=3;
    /**
     * 每一页要显示默认问题的数量
     */

    public static final Integer PageQuesNums=5;
    /**
     * 磁盘的根目录位置
     */
    public static final String ROOT_PATH="E:\\kbfile\\";
    /**
     * 项目的根目录
     */
    public static String CONTAINER_PATH = null;// 项目根路径
    public static String HEAD_URL = null;// 项目根路径
    public static String STREAM_PATH = null;

    public static void loadRootPath() {
       // Properties prop = new Properties();
       // InputStream in = Const.class.getResourceAsStream("/jdbc.properties");
        try {
          //  prop.load(in);

            File RootDir = new File(ROOT_PATH);
            if (!RootDir.exists()) {
                RootDir.mkdirs();
            }
            STREAM_PATH = ROOT_PATH + "red5-server/webapps/oflaDemo/streams/";
            File streamDir = new File(STREAM_PATH);
            if (!streamDir.exists()) {
                streamDir.mkdirs();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
