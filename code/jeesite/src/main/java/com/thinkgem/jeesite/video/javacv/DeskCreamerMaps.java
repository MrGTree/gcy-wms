package com.thinkgem.jeesite.video.javacv;

import com.sensetime.ad.sdk.StPointF;
import com.thinkgem.jeesite.video.javacv.Entity.DeskCreamer;
import org.apache.poi.ss.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
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
       // List<DeskCreamer> deskCreamerList = parseFromExcel(filename, 1, DeskCreamer.class);
        List<DeskCreamer> deskCreamerList = parseFromExcel(filename, 1);
        logger.warn("读取桌面摄像头信息条数：{}", deskCreamerList.size());
       // deskCreamerList.forEach(e->logger.warn(e.toString()));
        if(!CollectionUtils.isEmpty(deskCreamerList)){
            result = deskCreamerList.stream().collect(Collectors.groupingBy(DeskCreamer::getCreamerName));
        }

        return  result;
    }

    @SuppressWarnings("deprecation")
    public static  List<DeskCreamer> parseFromExcel(String path, int firstIndex) {
        List<DeskCreamer> result = new ArrayList<DeskCreamer>();
        try {
            FileInputStream fis = new FileInputStream(path);
            Workbook workbook = WorkbookFactory.create(fis);
            //对excel文档的第一页,即sheet1进行操作
            Sheet sheet = workbook.getSheetAt(0);
            int lastRaw = sheet.getLastRowNum();
            for (int i = firstIndex; i < lastRaw; i++) {
                //第i行
                Row row = sheet.getRow(i);
                List<Cell> cells = new ArrayList<>();
                for(int j=0; j<7; j++){
                    Cell cell = row.getCell(j);
                    //很重要的一行代码,如果不加,像12345这样的数字是不会给你转成String的,只会给你转成double,而且会导致cell.getStringCellValue()报错
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    cells.add(cell);
                }
                DeskCreamer deskCreamer = new DeskCreamer();
                deskCreamer.setClassRoom(cells.get(0).getStringCellValue());
                deskCreamer.setCreamerName(cells.get(1).getStringCellValue());
                deskCreamer.setDeskNo(cells.get(2).getStringCellValue());
                deskCreamer.setIp(cells.get(3).getStringCellValue());
                deskCreamer.setLastSendTime(cells.get(4).getStringCellValue());
                deskCreamer.setTopLine(cells.get(5).getStringCellValue());
                deskCreamer.setResolution(cells.get(6).getStringCellValue());

                String topLine = deskCreamer.getTopLine();
                List<StPointF> stPointFS = DeskCreamerUtil.convertToList(topLine);
                deskCreamer.setRange(stPointFS);

                result.add(deskCreamer);
            }
            fis.close();
            return result;
        } catch ( Exception e) {
            e.printStackTrace();
            System.err.println("An error occured when parsing object from Excel. at DeskCreamerMaps");
        }
        return result;
    }

   /* public static  <T> List<T> parseFromExcel(String path, int firstIndex, Class<T> aimClass) {
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
                    }else if(type.equals(List.class)){
                        List<StPointF> line = new ArrayList<>();
                        String[] split = cellContent.split(";");
                        for (String s : split){
                            String[] point = s.split(",");
                            StPointF sp = new StPointF(Float.parseFloat(point[0]),Float.parseFloat(point[1]));
                            line.add(sp);
                        }
                        field.set(parseObject,line);
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
    */







}
