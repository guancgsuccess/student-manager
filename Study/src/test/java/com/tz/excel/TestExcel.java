package com.tz.excel;

import com.tz.dao.IUserDao;
import com.tz.entity.User;
import org.apache.poi.hssf.usermodel.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.springframework.test.context.web.WebAppConfiguration;
import org.testng.annotations.Test;

import java.io.FileOutputStream;
import java.util.List;

/**
 * 利用POI到处Excel表
 */
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
@WebAppConfiguration
public class TestExcel extends AbstractTestNGSpringContextTests{
    @Autowired
    private IUserDao userDao;

    @Test
    public void writeToExcel(){
        List<User> userList = userDao.findAll(1,4);
        // 第一步，创建一个webbook，对应一个Excel文件
              HSSFWorkbook wb = new HSSFWorkbook();
               // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
               HSSFSheet sheet = wb.createSheet("用户表一");
               sheet.setColumnWidth(0,3766);
               sheet.setColumnWidth(1,5700);
               sheet.setColumnWidth(2,3766);
               sheet.setColumnWidth(3,3766);
                // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short

              // 第四步，创建单元格，并设置值表头 设置表头居中
              CellStyle style = wb.createCellStyle();


              style.setWrapText(true);//设置自动换行
              style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
              style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中格式

                //生成一个字体
                HSSFFont font=wb.createFont();
                //font.setColor(HSSFColor.BLACK.index);//HSSFColor.VIOLET.index //字体颜色
                font.setFontHeightInPoints((short) 14);
                font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);         //字体增粗
                font.setFontName("楷体");

                //把字体应用到当前的样式
                style.setFont(font);

                //設置邊框
                style.setBorderTop(CellStyle.BORDER_THIN);
                style.setBorderBottom(CellStyle.BORDER_THIN);
                style.setBorderLeft(CellStyle.BORDER_DOTTED);
                style.setBorderRight(CellStyle.BORDER_THIN);

                CellRangeAddress region = new CellRangeAddress(0, // first row
                        0, // last row
                        0, // first column
                        2 // last column
                );
                sheet.addMergedRegion(region);

                 HSSFCellStyle s = wb.createCellStyle();
                s.setFillForegroundColor((short) 11);
                s.setFillPattern(CellStyle.SOLID_FOREGROUND);
               HSSFRow rowHeader = sheet.createRow(0);
               HSSFCell c = rowHeader.createCell(0);
               s.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
               s.setAlignment(HSSFCellStyle.ALIGN_CENTER);

                //生成一个字体
                HSSFFont f=wb.createFont();
                //font.setColor(HSSFColor.BLACK.index);//HSSFColor.VIOLET.index //字体颜色
                f.setFontHeightInPoints((short) 14);
                f.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);         //字体增粗
                f.setFontName("楷体");

                s.setFont(f);

                s.setBorderTop(HSSFCellStyle.BORDER_THIN);
                s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                s.setBorderRight(HSSFCellStyle.BORDER_THIN);

                for(int i=0;i<3;i++){
                    Cell cc = rowHeader.createCell(i);
                   // if(i==2){
                        cc.setCellStyle(s);
                    //}
                }

               c.setCellValue("蚌埠学院");
               c.setCellStyle(s);
               rowHeader.setHeightInPoints(30);

               HSSFRow row = sheet.createRow(1);
               HSSFCell cell = row.createCell((short) 0);
               cell.setCellValue("学号");
               cell.setCellStyle(style);
               cell = row.createCell((short) 1);
               cell.setCellValue("用户名");
               cell.setCellStyle(style);
               cell = row.createCell((short) 2);
               cell.setCellValue("真实姓名");
               cell.setCellStyle(style);
               // 第五步，写入实体数据 实际应用中这些数据从数据库得到，
               for (int i = 0; i < userList.size(); i++) {

                       row = sheet.createRow(i + 2);
                       User stu = userList.get(i);
                      // 第四步，创建单元格，并设置值
                       HSSFCell cell0 = row.createCell(0);
                       cell0.setCellValue(stu.getId());
                       cell0.setCellStyle(style);

                       HSSFCell cell1 = row.createCell(1);
                       cell1.setCellValue(stu.getUsername());
                       cell1.setCellStyle(style);

                       HSSFCell cell2 = row.createCell(2);
                       cell2.setCellValue(stu.getRealName());
                       cell2.setCellStyle(style);

                       row.setHeightInPoints(60);//设置行高

                    }
                // 第六步，将文件存到指定位置
               try
               {
                      FileOutputStream fout = new FileOutputStream("E:/users.xls");
                      wb.write(fout);
                      fout.close();
                   System.out.println("==导出成功==");
                  }
             catch (Exception e)
             {
                 e.printStackTrace();
                  }

    }
}
