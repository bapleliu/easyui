package com.excel.utils;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;


public class AnalyseExcelUtil {
	private Workbook wb = null;
	private File fileDir = null;
	private int sheetNum=1;//需要解析的sheet页个数(默认解析一页)。0代表解析全部sheet。

	public static void main(String[] args) {
		String filePath = "D:\\零担、整车测试.xlsx";
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			new AnalyseExcelUtil().excel2Obj(result, filePath,0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("解析的excel结果：");
		/*
		result组成：
		result{//整个excel的解析结果
			0:sheet0,
			1:sheet1,
			name0:sheet0 name,
			name1:sheet1 name,
		}
		
		sheet0=ArrayList(rowList)//一个sheet的解析结果，List类型
		rowList = ArrayList(cellValue)//一行的内容，List类型
		 */
		for(int i=0;i< (int)result.get("sheetC");i++){//遍历sheet
			System.out.println(result.get("name"+i));
			List sheet = (List)result.get(i);//一个sheet页
			for(int j=0; j< sheet.size(); j++){//遍历所有行
				List row = (List)sheet.get(j);//一行内容
				System.out.print("第" + j + "行：");
				for(int k=0; k<row.size(); k++){
					System.out.print(row.get(k) + "  ,");//一个单元格
				}
				System.out.println();
			}
		}
	}
	/**
	 * @Description: 将路径filePath对应的文件内容解析到参数result中
	 * @param @param result
	 * @param @param filePath
	 * @param @param sheetNum 需要解析的sheet页的个数，0代表全部解析。
	 * @param @return
	 * @param @throws Exception   
	 * @return Map<String,Object>  
	 * @throws
	 * @author Panyk
	 * @date 2016年3月16日
	 */
	public Map<String, Object> excel2Obj(Map<String, Object> result, String filePath, int sheetNum) throws Exception {
		this.fileDir = new File(filePath);
		this.sheetNum = sheetNum;
		result = isDirectory(fileDir, result);
		return result;
	}

	/**
	 * 判断该文件是否存在；并对文件进行读取
	 * @param file
	 * @param result
	 * @param sjlx
	 * @return
	 * @throws Exception 
	 */
	public Map<String, Object> isDirectory(File file, Map<String, Object> result) throws Exception {
		if (file.exists()) {
			if (file.isFile()) {
				if (file.getAbsolutePath().endsWith(".xls") || file.getAbsolutePath().endsWith(".xlsx")) {
					readExcel2ObjsByPath(result, file);
				}
			}
			/*else {
				File[] list = file.listFiles();
				if (list.length == 0) {
				} else {
					for (int i = 0; i < list.length; i++) {
						isDirectory(list[i], result);
					}
				}
			}*/
		} else {
			throw new RuntimeException("文件不存在！");
		}
		return result;
	}

	/**
	 * 从文件路径读取相应的Excel文件到对象列表
	 * 
	 * @param result
	 * @param file
	 * @param fileType
	 * @param readLine
	 * @param tailLine
	 * @return
	 */
	public void readExcel2ObjsByPath(Map<String, Object> result, File file) throws Exception{
		wb = WorkbookFactory.create(new FileInputStream(file));
		handlerExcel2Objs(result, wb);
	}

	/**
	 * 解析Excel数据
	 * 
	 * @param result
	 * @param wb
	 * @param clz
	 * @param readLine
	 * @param tailLine
	 * @param tailLine
	 * @return
	 */
	private void handlerExcel2Objs(Map result, Workbook wb) throws Exception{
//		result 的内容是整个excel的内容
		List<List> sheetData = null;//一个sheet页的内容
		List<String> rowTemp;//一行的内容
		int startRow = 0;// 开始行
		// 循环取出sheet
		Row row;
		Sheet sheet;
		try {
			if(sheetNum==0){//0 代表全部解析，否则解析sheetNum个数个sheet页
				sheetNum = wb.getNumberOfSheets();//sheet页数
			}
			result.put("sheetC", sheetNum);
			for (int i = 0; i < sheetNum; i++) {
				sheetData = new ArrayList();//一个sheet页的内容
				sheet = wb.getSheetAt(i);
				if (null == sheet || sheet.getLastRowNum()<0) {
					result.put(i, sheetData);
					result.put("name"+i,"");
					continue;
				} else {
					int rowTotal = sheet.getLastRowNum();//行数
					result.put("name"+i,sheet.getSheetName());
					String rowStr = "";//这一行内容拼到一起，判断这一行到底有没有内容
					for (int j = startRow; j <= rowTotal; j++) {//遍历每一行
						row = sheet.getRow(j);
						rowStr = "";
						if (null == row) {
							continue;
						} else {
							rowTemp = new ArrayList<String>();
							for (int k = 0; k < row.getLastCellNum(); k++) {
								Cell cell = row.getCell(k);
								String value = "";
								if (cell != null) {
									switch (cell.getCellType()) {
									case Cell.CELL_TYPE_NUMERIC:// 数值型
										if (DateUtil.isCellDateFormatted(cell)) {// 如果是date类型则 ，获取该cell的date值
											Date date = DateUtil.getJavaDate(cell.getNumericCellValue());
/*											SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
											value = format.format(date);*/
											SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
											value = format.format(date);
										} else {// 纯数字
											value = String.valueOf(cell.getNumericCellValue());
											if(value.contains("E")){//将科学计数法的数字转成正常字符串
												DecimalFormat df = new DecimalFormat("0");  
												value = df.format(cell.getNumericCellValue());  
											}
											/*
											// 解决1234.0 去掉后面的.0
											if (null != value && !"".equals(value.trim())) {
												String[] item = value.split("[.]");
												if (1 < item.length && ("0".equals(item[1]) || "00".equals(item[1]))) {
													value = item[0];
												}
											}
											*/
										}
										break;
									case Cell.CELL_TYPE_STRING:// 字符串类型
										value = cell.getStringCellValue().toString().trim();
										break;
									case Cell.CELL_TYPE_FORMULA:// 公式类型
										// 读公式计算值
										value = String.valueOf(cell.getNumericCellValue());
										if (value.equals("NaN")) {// 如果获取的数据值为非法值,则转换为获取字符串
											value = cell.getStringCellValue().toString();
										}
										break;
									case Cell.CELL_TYPE_BOOLEAN:// 布尔类型
										value = "" + cell.getBooleanCellValue();
										break;
									case Cell.CELL_TYPE_BLANK:// 空值
										value = "";
										break;
									case Cell.CELL_TYPE_ERROR:// 故障
										value = "";
										throw new RuntimeException("解析excel出现异常！");//这里直接抛出异常，就不在解析了，也不break了。
//										break;
									default:
										value = cell.getStringCellValue().toString();
									}
								}
								rowTemp.add(value);
								rowStr += value;
							}
							if(rowStr.trim().length()>0){//只有当这一行确实有内容的时候，才进行添加
								sheetData.add(rowTemp);
							}
						}
					}
				}
				result.put(i, sheetData);
			}
		} catch (Exception e) {
			throw e;
		}finally{
			 wb = null;
			 fileDir = null;
		}
	}
}