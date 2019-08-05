package com.kbms_module.pojo;

/**
 * Created by warkey on 2018-04-18.
 */
public class Score {
   public  String key;
   public   float significance;

    @Override
    public String toString() {
        return "关键词=" + key +
                ", 重要程度=" + significance;
    }
}
