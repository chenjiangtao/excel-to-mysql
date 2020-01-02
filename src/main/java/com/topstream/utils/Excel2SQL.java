package com.topstream.utils;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Excel2SQL {

    //表样例：
    //    CREATE TABLE `batch_record` (
    //            `batch_no` char(50) COLLATE utf8_bin NOT NULL COMMENT '',
    //            `request_no` char(50) COLLATE utf8_bin DEFAULT '' COMMENT '',
    //            `market_code` char(50) COLLATE utf8_bin DEFAULT '' COMMENT '',
    //            `store_no` char(50) COLLATE utf8_bin DEFAULT '' COMMENT '门店号',
    //            `pos_no` char(50) COLLATE utf8_bin DEFAULT '' COMMENT '',
    //            `sku_no` char(50) COLLATE utf8_bin DEFAULT '' COMMENT '',
    //            `apply_count` int(8) DEFAULT '0' COMMENT '申请数量',
    //            `created_count` int(8) DEFAULT '0' COMMENT '生成数量',
    //            `task_id` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '任务id',
    //            `remark1` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '备注信息1',
    //            `remark2` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '备注信息2',
    //            `delete_flag` int(1) DEFAULT '0' COMMENT '删除标识(0:正常 1:删除)',
    //            `create_time` bigint(20) DEFAULT '0' COMMENT '创建时间(UTC)',
    //            `update_time` bigint(20) DEFAULT '0' COMMENT '更新时间(UTC)',
    //    PRIMARY KEY (`batch_no`)
    //) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='号表';

    public static void printSQL(String filePath) {
        File file = new File(filePath); //根据文件path获取文件
        List sheelList = Excel2SQL.readExcel(file);
        System.out.println("list中的数据打印出来");

        System.out.println("\nSET NAMES utf8mb4;\n" +
                "SET FOREIGN_KEY_CHECKS = 0;");


        for (int i = 0; i < sheelList.size(); i++) {
            List rowList = (List) sheelList.get(i);
            StringBuffer table = new StringBuffer();

            StringBuffer rows = new StringBuffer();

            String Pkey = "";

            int startRow = 3;
            int tableNameRow = 0;

            for (int j = startRow; j < rowList.size(); j++) {

                List columList = (List) rowList.get(j);

                int columStart, columEnd;
                if (rowList.size() >= 3) {
                    columStart = 1;//起始列
                    columEnd = 3;//结束列
                } else {
                    columStart = 0;//起始列
                    columEnd = rowList.size();//结束列
            }

                //for (int x = columStart; x < columEnd; x++) {
                //    String colum = columList.get(x).toString();
                //    rows.append(colum).append("`").append(columList.get(x).toString()).append("` ")
                //            .append();
                //    if (j == 2 && x == 0) Pkey = colum;
                //}
                //在excel中做固定，不要在程序中选择
                //第一列：列名，第二列类型，第三列描述....
                rows.append("   `").append(columList.get(columStart).toString().trim()).append("` ")
                        .append(columList.get(columStart + 1).toString().trim()).append(" COLLATE utf8_bin COMMENT ")
                        .append("'" + columList.get(columStart + 2).toString().trim() + "',\n");
                //System.out.println(rows.toString());
            }


            String tableName = ((List) rowList.get(tableNameRow)).get(0).toString().trim();
            table.append("\nDROP TABLE IF EXISTS `"+tableName+"`;\nCREATE TABLE `" + tableName + "` (\n");
            table.append(rows.toString().substring(0, rows.length() - 1) + "\n");
            table.append("PRIMARY KEY (`" + ((List) rowList.get(startRow)).get(1).toString().trim() + "`)\n) ");
            table.append("ENGINE = InnoDB\n" +
                    "DEFAULT CHARACTER SET = utf8\n" +
                    "COLLATE = utf8_bin\n");
            table.append("COMMENT = '" + ((List) rowList.get(tableNameRow)).get(1).toString().trim() + "'\n" +
                    "ROW_FORMAT = COMPACT;");

            System.out.println(table);
        }
    }

    // 去读Excel的方法readExcel，该方法的入口参数为一个File对象
    public static List readExcel(File file) {
        try {
            // 创建输入流，读取Excel
            InputStream is = new FileInputStream(file.getAbsoluteFile());

            // jxl提供的Workbook类
            Workbook wb = Workbook.getWorkbook(is);

            // Excel的页签数量
            int sheet_size = wb.getNumberOfSheets();

            List<List> sheetList = new ArrayList<List>();
            for (int index = 0; index < sheet_size; index++) {
                List<List> rowList = new ArrayList<List>();

                // 每个页签创建一个Sheet对象
                Sheet sheet = wb.getSheet(index);

                // sheet.getRows()返回该页的总行数
                for (int i = 0; i < sheet.getRows(); i++) {
                    List columList = new ArrayList();

                    // sheet.getColumns()返回该页的总列数
                    //System.out.println("列数：" + sheet.getColumns());
                    for (int j = 0; j < sheet.getColumns(); j++) {
                        String cellinfo = sheet.getCell(j, i).getContents();

                        if (cellinfo.equals("")) {
                            continue;
                        }
                        columList.add(cellinfo);
                    }
                    rowList.add(columList);
                }
                sheetList.add(rowList);
            }

            return sheetList;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }


}

