package com.tz.controller;

import com.tz.entity.User;
import com.tz.service.IExcelService;
import com.tz.service.IUserService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

/**
 * 到处Excel
 */
@Controller
@RequestMapping("/excel")
public class ExcelController {

    @Autowired
    private IExcelService excelService;

    @RequestMapping("/excelView")
    public String excelView(){
        return "excel/excel";
    }

    /**
     * 默认导出
     */
    @RequestMapping("/exportDefault")
    public void exportDefault(HttpServletResponse resp){
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/x-download");
        resp.addHeader("Content-Disposition", "attachment;filename=users.xls");

        try {
            OutputStream out = resp.getOutputStream();
            excelService.exportDefalut(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
