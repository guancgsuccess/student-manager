package com.tz.service.impl;

import com.tz.dao.IUserDao;
import com.tz.entity.User;
import com.tz.service.IExcelService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.OutputStream;
import java.util.List;

/**
 * Created by Administrator on 2018/1/16 0016.
 */
@Service
public class ExcelServiceImpl implements IExcelService{

    @Autowired
    private IUserDao userDao;

    @Override
    public void exportDefalut(OutputStream out) {

            List<User> userList = userDao.findAll(null,null);
            // 第一步，创建一个webbook，对应一个Excel文件
            HSSFWorkbook wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
            HSSFSheet sheet = wb.createSheet("学生表");
            sheet.setColumnWidth(0,3766);//编号列
            sheet.setColumnWidth(1,5700);//真实姓名
            sheet.setColumnWidth(2,3766);//性别
            sheet.setColumnWidth(3,8766);//联系方式
             sheet.setColumnWidth(4,10766);//remark
            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
            // 第四步，创建单元格，并设置值表头 设置表头居中
            CellStyle style = wb.createCellStyle();

            style.setWrapText(true);//设置自动换行
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中格式

            //生成一个字体
            HSSFFont font=wb.createFont();
            //font.setColor(HSSFColor.BLACK.index);//HSSFColor.VIOLET.index //字体颜色
            font.setFontHeightInPoints((short) 12);
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
                    4 // last column
            );
            sheet.addMergedRegion(region);

            HSSFCellStyle s = wb.createCellStyle();

            //设置背景颜色
            //s.setFillForegroundColor((short) 11);
            //s.setFillPattern(CellStyle.SOLID_FOREGROUND);

            HSSFRow rowHeader = sheet.createRow(0);
            HSSFCell c = rowHeader.createCell(0);
            s.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            s.setAlignment(HSSFCellStyle.ALIGN_CENTER);

            //生成一个字体
            HSSFFont f=wb.createFont();
            //font.setColor(HSSFColor.BLACK.index);//HSSFColor.VIOLET.index //字体颜色
            f.setFontHeightInPoints((short) 12);
            f.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);         //字体增粗
            f.setFontName("楷体");

            s.setFont(f);

            s.setBorderTop(HSSFCellStyle.BORDER_THIN);
            s.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            s.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            s.setBorderRight(HSSFCellStyle.BORDER_THIN);

            for(int i=0;i<5;i++){
                Cell cc = rowHeader.createCell(i);
                // if(i==2){
                cc.setCellStyle(s);
                //}
            }

            c.setCellValue("蚌埠学院");
            c.setCellStyle(s);
            rowHeader.setHeightInPoints(25);

            HSSFRow row = sheet.createRow(1);
            HSSFCell cell = row.createCell((short) 0);
            cell.setCellValue("学号");
            cell.setCellStyle(style);
            cell = row.createCell((short) 1);
            cell.setCellValue("学生姓名");
            cell.setCellStyle(style);
            cell = row.createCell((short) 2);
            cell.setCellValue("学生性别");
            cell.setCellStyle(style);
            cell = row.createCell(3);
            cell.setCellValue("联系方式");
            cell.setCellStyle(style);
            cell = row.createCell(4);
            cell.setCellValue("访谈结果");
            cell.setCellStyle(style);

            //标记:
            CellStyle s2 = wb.createCellStyle();
            s2.setFillForegroundColor((short) 11);
            s2.setFillPattern(CellStyle.SOLID_FOREGROUND);

            // 第五步，写入实体数据 实际应用中这些数据从数据库得到，
            for (int i = 0; i < userList.size(); i++) {
                row = sheet.createRow(i + 2);
                User stu = userList.get(i);
                // 第四步，创建单元格，并设置值
                HSSFCell cell0 = row.createCell(0);
                cell0.setCellValue(i+1);
                cell0.setCellStyle(style);

                HSSFCell cell1 = row.createCell(1);
                cell1.setCellValue(stu.getRealName());
                cell1.setCellStyle(style);

                HSSFCell cell2 = row.createCell(2);
                cell2.setCellValue(stu.getGender().toString().equals("F")?"女":"男");
                cell2.setCellStyle(style);

                HSSFCell cell3 = row.createCell(3);
                cell3.setCellValue(stu.getPhone());
                cell3.setCellStyle(style);

                HSSFCell cell4 = row.createCell(4);
                cell4.setCellValue(stu.getRemark());
                cell4.setCellStyle(style);

                row.setHeightInPoints(30);//设置行高
            }
            // 第六步，将文件存到指定位置
            try
            {
                wb.write(out);
                out.close();
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
    }
}
