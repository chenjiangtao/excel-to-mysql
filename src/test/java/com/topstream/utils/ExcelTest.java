package com.topstream.utils;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.util.List;

@SpringBootTest
class ExcelTest {

    @Test
    void contextLoads() {
        //Excel2SQL.printSQL("doc/template.xls");
        Excel2SQL.printSQL("doc/excampleFile.xls");
    }

}
