package com.tz.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/3 0003.
 */
public class DateUtil {

    public static void main(String[] args) {
        for(;;){
            Date d = new Date();
            System.out.println(d.getTime());
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static Date parse(String sdate,String pattern){
        Date d = null;
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try {
            d = sdf.parse(sdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return d;
    }

    public static String format(Date d,String pattern){
        String sdate=null;
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        sdate = sdf.format(d);
        return sdate;
    }
}
