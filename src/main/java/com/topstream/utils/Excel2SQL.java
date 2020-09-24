package com.topstream.utils;

import com.alibaba.fastjson.JSONObject;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Excel2SQL {

    private static String fixStr = "char(";

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

                        //if (cellinfo.equals("")) {
                        //    continue;
                        //}
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

/*表样例：
    DROP TABLE IF EXISTS `t_table1`;
    CREATE TABLE `t_table1` (
       `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT '记录唯一ID；说明：记录唯一ID；样例：1234567',
       `name` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '名字；样例：张三',
       `age` int(5) NOT NULL COLLATE utf8_bin COMMENT '年龄；说明：小于150；样例：30',
       `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间',
    PRIMARY KEY (`id`)
    ) ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8
    COLLATE = utf8_bin
    COMMENT = '表1'
    ROW_FORMAT = COMPACT;
    */


    public static void printSQL(String filePath) {
        File file = new File(filePath); //根据文件path获取文件
        List sheelList = Excel2SQL.readExcel(file);
        //System.out.println("list中的数据打印出来");

        System.out.println("\nSET NAMES utf8mb4;\n" +
                "SET FOREIGN_KEY_CHECKS = 0;");

        Map<String, String> clnCommentMap = new HashMap();


        for (int i = 0; i < sheelList.size(); i++) {
            StringBuffer table = new StringBuffer();
            StringBuffer rows = new StringBuffer();
            StringBuffer insertC = new StringBuffer();
            StringBuffer insertV = new StringBuffer();
            StringBuilder nullMap = new StringBuilder();
            int startRow = 3;
            int tableNameRow = 0;

            List rowList = (List) sheelList.get(i);

            //表名、主键等
            String pk = ((List) rowList.get(startRow)).get(2).toString().trim();
            String tableName = ((List) rowList.get(tableNameRow)).get(1).toString().trim();
            String tableComment = ((List) rowList.get(tableNameRow)).get(9).toString().trim();

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


                //在excel中做固定，不要在程序中选择
                //第一列：列名，第二列类型，第三列描述....
                //字段ID	数据类型	可空	默认值	字段名称	字段补充说明	数据样例
                String clnName = columList.get(columStart + 1).toString().trim().replace(" ","");//字段ID
                String type = columList.get(columStart + 2).toString().trim();//数据类型
                String isNull = columList.get(columStart + 3).toString().trim();//可空
                String comment = columList.get(columStart + 5).toString().trim();//字段名（中文名称）
                String comment1 = columList.get(columStart + 6).toString().trim();//字段补充说明
                String comment2 = columList.get(columStart + 7).toString().trim();//数据样例
                comment = comment.replaceAll("'", "\"");

                clnCommentMap.put(clnName, comment + ":" + comment1);//记录、去重

                rows.append("   `").append(clnName).append("` ")//cln name
                        .append(type)//类型
                        .append(" " + isNull)//是否非空
                        //`import_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据插入时间'
                        .append(clnName.equals("import_time") ? " DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" : "")
                        .append(clnName.equals("id") ? " AUTO_INCREMENT" : "")
                        .append(" COLLATE utf8_bin COMMENT ")
                        .append("'")//注释
                        .append(comment)//字段名（中文名称）
                        .append(comment1 == null || comment1.trim().equals("") ? "" : "；说明：" + comment1)//字段补充说明
                        .append(comment2 == null || comment2.trim().equals("") ? "" : "；样例：" + comment2)//数据样例
                        .append("',\n");

                //组将insert
                if (!clnName.equals("id")
                        && !clnName.equals("import_batch_no")
                        && !clnName.equals("import_time")) { //跳过id,import_batch_no，import_time
                    //组合列
                    insertC.append(clnName)
                            .append(",");
                    //组合值，只能处理两种：加引号、不加
                    insertV.append(type.contains("int") || type.contains("decimal") ? "" : "\"")//如果是数值型，不加引号；否则加引号开始
                            .append(type.contains("int") || type.contains("decimal") ? 0 : "")//如果是数值型,用0
                            .append(type.contains("char") ? "testval" + j : "")
                            .append(type.contains("date") ? "2019-01-16" : "")
                            .append(type.contains("int") || type.contains("decimal") ? "" : "\"")//如果是数值型，不加引号；否则加引号结束
                            .append(",");
                    //t_card_info.put("l_card_no", 0);
                    if (!isNull.equals("NOT NULL")) {
                        nullMap.append(tableName + ".put(\"" + clnName + "\", 0);\n");
                    }
                }
            }


            table.append("\nDROP TABLE IF EXISTS `" + tableName + "`;\nCREATE TABLE `" + tableName + "` (\n");
            table.append(rows.toString().substring(0, rows.length() - 1) + "\n");
            table.append("PRIMARY KEY (`" + pk + "`)\n) ");
            table.append("ENGINE = InnoDB\n" +
                    "DEFAULT CHARACTER SET = utf8\n" +
                    "COLLATE = utf8_bin\n");
            table.append("COMMENT = '" + tableComment + "'\n" +
                    "ROW_FORMAT = COMPACT;");


            //******************打印建表语句******************
            //System.out.println(table);


            //******************打印插入语句******************
            //String replace = insertV.toString().replace("\"\"", "");
            //String ins = "insert into " + tableName + " (" + insertC.substring(0, insertC.length() - 1) + ")values(" + replace.substring(0, replace.length() - 1) + ");";
            //System.out.println(ins);

            //******************打印CleanlingConf类的字段******************
            System.out.println("private static String " + tableName + "_clns=\"" + insertC.substring(0, insertC.length() - 1) + "\";");
            System.out.println(nullMap);


        }
        //叠加的，所以放外面
        //******************打印CleanlingConf类的字段+描述******************
        //System.out.println(JSONObject.toJSON(clnCommentMap));

    }

    /**
     * ***********如果都是utf-8类型的，不需要转换***********
     * varchar、char字段长度增长1.3倍，适应hive
     *
     * @param table
     * @return
     */
    @Deprecated
    private static String sql4Hive(String table) {
        String s = " DROP TABLE IF EXISTS `t_table1`;\n" +
                "    CREATE TABLE `t_table1` (\n" +
                "       `id` int NOT NULL AUTO_INCREMENT COLLATE utf8_bin COMMENT '记录唯一ID；说明：记录唯一ID；样例：1234567',\n" +
                "       `name` varchar(10) NOT NULL COLLATE utf8_bin COMMENT '名字；样例：张三',\n" +
                "       `age` int(5) NOT NULL COLLATE utf8_bin COMMENT '年龄；说明：小于150；样例：30',\n" +
                "       `import_time` datetime  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COLLATE utf8_bin COMMENT '数据插入时间',\n" +
                "    PRIMARY KEY (`id`)\n" +
                "    ) ENGINE = InnoDB\n" +
                "    DEFAULT CHARACTER SET = utf8\n" +
                "    COLLATE = utf8_bin\n" +
                "    COMMENT = '表1'\n" +
                "    ROW_FORMAT = COMPACT;";

        String[] split = s.split("\n");
        for (String sp : split) {
            String tmp = sp.split(" ")[1];
            String rpstr = s.substring(s.indexOf(fixStr) + fixStr.length(), s.indexOf(") "));
            int lens = Integer.valueOf(rpstr);

            int tl = (int) (lens * 1.3);


            System.out.println(tmp);
        }
        return null;
    }

    public static void main(String[] args) {
        //sql4Hive("");
        String s = "varchar(50) NOT NULL COLLATE utf8_bin COMMENT '名字；样例：张三'";

        String substring = s.substring(s.indexOf(fixStr) + fixStr.length(), s.indexOf(") "));
        System.out.println(substring);
        int tl = (int) (Integer.valueOf(substring) * 1.35);
        System.out.println(tl);

    }


}

