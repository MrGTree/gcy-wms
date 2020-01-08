package com.thinkgem.jeesite.video.javacv;

import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.apache.poi.ss.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.io.FileInputStream;
import java.lang.reflect.Field;
import java.util.*;
import java.util.stream.Collectors;

@Configuration
@Component
public class DeskCreamerMaps {

    private Logger logger = LoggerFactory.getLogger(getClass());


    @Bean(name = "deskCreamerMapList")
    public Map<String, List<DeskCreamer>> deskCreamerMapList() {
        Map<String, List<DeskCreamer>> result = new HashMap<>();
        String filename = "/home/ron/deskCreamer.xlsx";
        List<DeskCreamer> deskCreamerList = parseFromExcel(filename, 1, DeskCreamer.class);
        deskCreamerList.forEach(e->{logger.warn(e.toString());logger.error(e.toString());});
        if(!CollectionUtils.isEmpty(deskCreamerList)){
            result = deskCreamerList.stream().collect(Collectors.groupingBy(DeskCreamer::getCreamerName));
        }

        return  result;
    }

    @SuppressWarnings("deprecation")
    public static  <T> List<T> parseFromExcel(String path, int firstIndex, Class<T> aimClass) {
        List<T> result = new ArrayList<T>();
        try {
            FileInputStream fis = new FileInputStream(path);
            Workbook workbook = WorkbookFactory.create(fis);
            //对excel文档的第一页,即sheet1进行操作
            Sheet sheet = workbook.getSheetAt(0);
            int lastRaw = sheet.getLastRowNum();
            for (int i = firstIndex; i < lastRaw; i++) {
                //第i行
                Row row = sheet.getRow(i);
                T parseObject = aimClass.newInstance();
                Field[] fields = aimClass.getDeclaredFields();
                for (int j = 0; j < fields.length; j++) {
                    Field field = fields[j];
                    field.setAccessible(true);
                    Class<?> type = field.getType();
                    //第j列
                    Cell cell = row.getCell(j);
                    if (cell == null)
                        continue;
                    //很重要的一行代码,如果不加,像12345这样的数字是不会给你转成String的,只会给你转成double,而且会导致cell.getStringCellValue()报错
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    String cellContent = cell.getStringCellValue();
                    cellContent = "".equals(cellContent) ? "0" : cellContent;
                    if (type.equals(String.class)) {
                        field.set(parseObject, cellContent);
                    } else if (type.equals(char.class) || type.equals(Character.class)) {
                        field.set(parseObject, cellContent.charAt(0));
                    } else if (type.equals(int.class) || type.equals(Integer.class)) {
                        field.set(parseObject, Integer.parseInt(cellContent));
                    } else if (type.equals(long.class) || type.equals(Long.class)) {
                        field.set(parseObject, Long.parseLong(cellContent));
                    } else if (type.equals(float.class) || type.equals(Float.class)) {
                        field.set(parseObject, Float.parseFloat(cellContent));
                    } else if (type.equals(double.class) || type.equals(Double.class)) {
                        field.set(parseObject, Double.parseDouble(cellContent));
                    } else if (type.equals(short.class) || type.equals(Short.class)) {
                        field.set(parseObject, Short.parseShort(cellContent));
                    } else if (type.equals(byte.class) || type.equals(Byte.class)) {
                        field.set(parseObject, Byte.parseByte(cellContent));
                    } else if (type.equals(boolean.class) || type.equals(Boolean.class)) {
                        field.set(parseObject, Boolean.parseBoolean(cellContent));
                    }
                }
                result.add(parseObject);
            }
            fis.close();
            return result;
        } catch ( Exception e) {
            e.printStackTrace();
            System.err.println("An error occured when parsing object from Excel. at DeskCreamerMaps");
        }
        return result;
    }




}
