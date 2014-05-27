package com.managementsystem.energy.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.script.ScriptEngine;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.dao.OtherDao;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.ImportService;
  
@Service
public class ImportServiceImpl implements ImportService {

	@Autowired
	private CircuitinfoDao circuitinfoDao;
	
	@Autowired
	private OtherDao otherDao;

	@Autowired
	private CircuitinfoService circuitinfoService;
	
	@Override
	public String importExcelToCircuitinfo(MultipartFile mf, String type) {
		String returnStr = "true";

		try {
			String[][] result = getData(mf, 1);

			int rowLength = result.length;

			System.out.println("导入的excel行数--" + rowLength);

			String col_a = "", col_b = "", col_c = "", temp_b = "", temp_c = ""; // 存储excel中的内容
			
			Circuitinfo circuitinfo1 = new Circuitinfo();
			Circuitinfo circuitinfo2 = new Circuitinfo();
			Circuitinfo circuitinfo3 = new Circuitinfo();
			Circuitinfo circuitinfo4 = new Circuitinfo();
			
			int year = 0, month = 0; double total = 0; String time = "";
			if(StringUtils.hasLength(type) && ("water".equals(type) || "gas".equals(type))) { // 导入水表和导入气表
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy");
				SimpleDateFormat month_sf = new SimpleDateFormat("yyyy");
				year = (date.getMonth() == 0) ? (Integer.parseInt(sf.format(date)) - 1) : (Integer.parseInt(sf.format(date)));
				month = (date.getMonth() == 0) ? 12 : (date.getMonth());
				time = time;
			}

			int gas_num = 0;
			for (int i = 0; i < rowLength; i++) {
				
				for (int j = 0; j < result[i].length; j++) {
					
					if(StringUtils.hasLength(type) && "electricity".equals(type)) { // 导入电表
						
						if(j == 0 && !"".equals(result[i][j])) { // 第一列的数据不为空，直接插入数据
							col_a = result[i][j];
							circuitinfo1 = new Circuitinfo();
							circuitinfo1 = getCircuitForEnergy(circuitinfo1, col_a, circuitinfo1, type);
						}
						
						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据
							col_b = result[i][j];
						}
						
						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
							col_c = result[i][j];
						}
						
						if(j == 3) {
							if("".equals(result[i][j])){
								continue;
							} else {
								
								if(temp_b != col_b) { // 第二列的数据
									circuitinfo2 = new Circuitinfo();
									circuitinfo2 = getCircuitForEnergy(circuitinfo2, col_b, circuitinfo1, type);
									temp_b = col_b;
								}
								
								if(temp_c != col_c) { // 第三列数据
									circuitinfo3 = new Circuitinfo();
									circuitinfo3 = getCircuitForEnergy(circuitinfo3, col_c, circuitinfo2, type);
									temp_c = col_c;
								}
								
								circuitinfo4 = new Circuitinfo();
								circuitinfo4 = getCircuitForEnergy(circuitinfo4, result[i][j], circuitinfo3, type);
							}
						}
					
					} else if(StringUtils.hasLength(type) && "water".equals(type)) { // 导入水表
						
						if(j == 0 && !"".equals(result[i][j])) { // 第一列的数据不为空，直接插入数据
							col_a = result[i][j];
							circuitinfo1 = new Circuitinfo();
							circuitinfo1.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo1 = getCircuitForEnergy(circuitinfo1, col_a, circuitinfo1, type);
						}
						
						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据
							circuitinfo2 = new Circuitinfo();
							circuitinfo2.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo2 = getCircuitForEnergy(circuitinfo2, result[i][j], circuitinfo1, type);
						}
						
						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
							circuitinfo3 = new Circuitinfo();
							circuitinfo3.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo3 = getCircuitForEnergy(circuitinfo3, result[i][j], circuitinfo2, type);
						}
						
						if(j == 3 && !"".equals(result[i][j])) { // 第四列的数据
							circuitinfo4 = new Circuitinfo();
							circuitinfo4.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo4 = getCircuitForEnergy(circuitinfo4, result[i][j], circuitinfo3, type);
						}
						
					} else if(StringUtils.hasLength(type) && "gas".equals(type)) { // 导入气表
						
						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据不为空，直接插入数据
							circuitinfo1 = new Circuitinfo();
							circuitinfo1.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo1 = getCircuitForEnergy(circuitinfo1, result[i][j], circuitinfo1, type);
						}
						
						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
							circuitinfo2 = new Circuitinfo();
							circuitinfo2.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo2 = getCircuitForEnergy(circuitinfo2, result[i][j], circuitinfo1, type);
						}
						
						if(j == 3 && !"".equals(result[i][j])) { // 第四列的数据
							circuitinfo3 = new Circuitinfo();
							circuitinfo3.setCircuitCode(result[i][0]); // 对应的编号
							circuitinfoService.addReportinfo(new Reportinfo(type, result[i][0], time, BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4])))));
							circuitinfo3 = getCircuitForEnergy(circuitinfo3, result[i][j], circuitinfo2, type);
						}
					}
				}
			}
			
			if(StringUtils.hasLength(type) && ("water".equals(type) || "gas".equals(type))) { // 导入水表和导入气表
				try {
					saveOrUpdateWaterAndGas(type, year, month, total); // 更新sqlserver数据库中的数据
				} catch (Exception e) {
					System.out.println("更新" + type + "的数据到sqlserver中出错了--" + total);
				}
			}
			
			returnStr = "true";
		} catch (Exception e) {
			returnStr = "false";
			e.printStackTrace();
		}
		
		return returnStr;
	}
	
	/**
	 * 重新组织circuitinfo
	 * 
	 * @param circuitinfo
	 * @param code
	 * @param parentinfo
	 * @param type
	 * @return
	 */
	public Circuitinfo getCircuitForEnergy(Circuitinfo circuitinfo, String code, Circuitinfo parentinfo, String type) {
		try {
			Buildinfo buildinfo = new Buildinfo();
			buildinfo.setBuildId("000001070001");
			circuitinfo.setBuildinfo(buildinfo);
//			circuitinfo.setCircuitCode(code);
			circuitinfo.setCircuitName(code);
			circuitinfo.setCircuitState(1);
			circuitinfo.setCircuitinfo(parentinfo);
			circuitinfo.setSource(type); // 所属系统
			circuitinfoService.addCircuitinfoForEnergy(circuitinfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return circuitinfo;
	}
	
	/**
	 * 获取excel数据
	 * 
	 * @param file
	 * @param ignoreRows
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public String[][] getData(MultipartFile file, int ignoreRows) throws FileNotFoundException, IOException {

		List<String[]> result = new ArrayList<String[]>();

		int rowSize = 0;

		BufferedInputStream in = new BufferedInputStream(file.getInputStream());

		// 打开HSSFWorkbook

		POIFSFileSystem fs = new POIFSFileSystem(in);

		HSSFWorkbook wb = new HSSFWorkbook(fs);

		HSSFCell cell = null;

		HSSFSheet st = wb.getSheetAt(0);

		// 第一行为标题，不取

		for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {

			HSSFRow row = st.getRow(rowIndex);

			if (row == null) {

				System.out.println(rowIndex + "row为null");

				continue;

			}

			int tempRowSize = row.getLastCellNum() + 1;

			if (tempRowSize > rowSize) {

				rowSize = tempRowSize;

			}

			String[] values = new String[rowSize];

			Arrays.fill(values, "");

			boolean hasValue = false;

			for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {

				String value = "";

				cell = row.getCell(columnIndex);

				if (cell != null) {

					// 注意：一定要设成这个，否则可能会出现乱码
					// cell.setEncoding(HSSFCell.ENCODING_UTF_16);

					switch (cell.getCellType()) {

					case HSSFCell.CELL_TYPE_STRING:

						value = cell.getStringCellValue();

						break;

					case HSSFCell.CELL_TYPE_NUMERIC:

						if (HSSFDateUtil.isCellDateFormatted(cell)) {

							Date date = cell.getDateCellValue();

							if (date != null) {

								value = new SimpleDateFormat("yyyy-MM-dd").format(date);

							} else {

								value = "";

							}

						} else {

							value = new DecimalFormat("0").format(cell.getNumericCellValue());

						}

						break;

					case HSSFCell.CELL_TYPE_FORMULA:

						// 导入时如果为公式生成的数据则无值

//						if (!cell.getStringCellValue().equals("")) {
//
//							value = cell.getStringCellValue();
//
//						} else {

							value = cell.getNumericCellValue() + "";

//						}

						break;

					case HSSFCell.CELL_TYPE_BLANK:

						break;

					case HSSFCell.CELL_TYPE_ERROR:

						value = "";

						break;

					case HSSFCell.CELL_TYPE_BOOLEAN:

						value = (cell.getBooleanCellValue() == true ? "Y" : "N");

						break;

					default:

						value = "";

					}

				}

				if (columnIndex == 0 && columnIndex == 1
						&& columnIndex == 2 && columnIndex == 3
						&& columnIndex == 4 && value.trim().equals(""))
					break;

				values[columnIndex] = rightTrim(value);

				hasValue = true;

			}

			if (hasValue) {

				result.add(values);

			}

		}

		in.close();

		String[][] returnArray = new String[result.size()][rowSize];

		for (int i = 0; i < returnArray.length; i++) {

			returnArray[i] = (String[]) result.get(i);

		}

		return returnArray;

	}

	/**
	 * 
	 * 去掉字符串右边的空格
	 * 
	 * @param str
	 *            要处理的字符串
	 * 
	 * @return 处理后的字符串
	 * 
	 */
	public static String rightTrim(String str) {
		if (str == null) {
			return "";
		}
		int length = str.length();
		for (int i = length - 1; i >= 0; i--) {
			if (str.charAt(i) != 0x20)
				break;
			length--;
		}
		return str.substring(0, length);
	}
	
	/**
	 * 保存sqlserver中的水表和气表数据
	 * 
	 * @param tablename
	 * @param year
	 * @param month
	 * @throws Exception
	 */
	public void saveOrUpdateWaterAndGas(String tablename, int year, int month,
			double total) throws Exception {
		Connection conn = com.managementsystem.dbmanager.ConnectionManager
				.getConnection();
		CallableStatement cs = null;
		
		try {
			String yue = (month + "").length() == 1 ? ("0" + month) : String.valueOf(month); 
			String sql = "if exists(select * from energy_" + tablename + "#total#month where time = '" + year + "-" + yue + "' ) "
					   + " begin "
					   + " update energy_" + tablename + "#total#month set sum = '" + total + "' where time = '" + year + "-" + yue + "' "
					   + " end "
					   + " else "
					   + " begin "
					   + " insert into energy_" + tablename + "#total#month(time, sum) values('" + year + "-" + yue + "', '" + total + "') "
					   + " end";
			System.out.println("同步sqlserver的sql----" + sql);
			cs = conn.prepareCall(sql);
			cs.execute();
		} catch (Exception e) {
			throw new java.lang.RuntimeException(e);
		} finally {
			// 数据库资源释放
			if (cs != null) {
				cs.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

	}
	
	// 备份代码，导入水表和气表，修改模板前，2014-05-23
//	private String importExcelToCircuitinfoBak(MultipartFile mf, String type) {
//		String returnStr = "true";
//
//		try {
//			String[][] result = getData(mf, 1);
//
//			int rowLength = result.length;
//
//			System.out.println("导入的excel行数--" + rowLength);
//
//			String col_a = "", col_b = "", col_c = "", temp_b = "", temp_c = ""; // 存储excel中的内容
//			
//			Circuitinfo circuitinfo1 = new Circuitinfo();
//			Circuitinfo circuitinfo2 = new Circuitinfo();
//			Circuitinfo circuitinfo3 = new Circuitinfo();
//			Circuitinfo circuitinfo4 = new Circuitinfo();
//			
//			int year = 0, month = 0; double total = 0;
//			if(StringUtils.hasLength(type) && ("water".equals(type) || "gas".equals(type))) { // 导入水表和导入气表
//				Date date = new Date();
//				SimpleDateFormat sf = new SimpleDateFormat("yyyy");
//				SimpleDateFormat month_sf = new SimpleDateFormat("yyyy");
//				year = (date.getMonth() == 0) ? (Integer.parseInt(sf.format(date)) - 1) : (Integer.parseInt(sf.format(date)));
//				month = (date.getMonth() == 0) ? 12 : (date.getMonth());
//				// 首先删除对应月份的对应的记录，避免重复
//				circuitinfoService.delCircuitinfoForWaterAndGas(type, year, month);
//			}
//
//			int gas_num = 0;
//			for (int i = 0; i < rowLength; i++) {
//				
//				for (int j = 0; j < result[i].length; j++) {
//					
//					if(StringUtils.hasLength(type) && "electricity".equals(type)) { // 导入电表
//						
//						if(j == 0 && !"".equals(result[i][j])) { // 第一列的数据不为空，直接插入数据
//							col_a = result[i][j];
//							circuitinfo1 = new Circuitinfo();
//							circuitinfo1 = getCircuitForEnergy(circuitinfo1, col_a, circuitinfo1, type);
//						}
//						
//						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据
//							col_b = result[i][j];
//						}
//						
//						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
//							col_c = result[i][j];
//						}
//						
//						if(j == 3) {
//							if("".equals(result[i][j])){
//								continue;
//							} else {
//								
//								if(temp_b != col_b) { // 第二列的数据
//									circuitinfo2 = new Circuitinfo();
//									circuitinfo2 = getCircuitForEnergy(circuitinfo2, col_b, circuitinfo1, type);
//									temp_b = col_b;
//								}
//								
//								if(temp_c != col_c) { // 第三列数据
//									circuitinfo3 = new Circuitinfo();
//									circuitinfo3 = getCircuitForEnergy(circuitinfo3, col_c, circuitinfo2, type);
//									temp_c = col_c;
//								}
//								
//								circuitinfo4 = new Circuitinfo();
//								circuitinfo4 = getCircuitForEnergy(circuitinfo4, result[i][j], circuitinfo3, type);
//							}
//						}
//					
//					} else if(StringUtils.hasLength(type) && "water".equals(type)) { // 导入水表
//						
//						if(j == 0 && !"".equals(result[i][j])) { // 第一列的数据不为空，直接插入数据
//							col_a = result[i][j];
//							circuitinfo1 = new Circuitinfo();
//							circuitinfo1.setYear(year);
//							circuitinfo1.setMonth(month);
//							circuitinfo1.setZ_value(BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4]))));
//							circuitinfo1 = getCircuitForEnergy(circuitinfo1, col_a, circuitinfo1, type);
//						}
//						
//						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据
//							circuitinfo2 = new Circuitinfo();
//							circuitinfo2.setYear(year);
//							circuitinfo2.setMonth(month);
//							double zhi = Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4]));
//							total += zhi;
//							circuitinfo2.setZ_value(BigDecimal.valueOf(zhi));
//							circuitinfo2 = getCircuitForEnergy(circuitinfo2, result[i][j], circuitinfo1, type);
//						}
//						
//						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
//							circuitinfo3 = new Circuitinfo();
//							circuitinfo3.setYear(year);
//							circuitinfo3.setMonth(month);
//							circuitinfo3.setZ_value(BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4]))));
//							circuitinfo3 = getCircuitForEnergy(circuitinfo3, result[i][j], circuitinfo2, type);
//						}
//						
//						if(j == 3 && !"".equals(result[i][j])) { // 第四列的数据
//							circuitinfo4 = new Circuitinfo();
//							circuitinfo4.setYear(year);
//							circuitinfo4.setMonth(month);
//							circuitinfo4.setZ_value(BigDecimal.valueOf(Double.valueOf(("".equals(result[i][4]) ? "0" : result[i][4]))));
//							circuitinfo4 = getCircuitForEnergy(circuitinfo4, result[i][j], circuitinfo3, type);
//						}
//						
//					} else if(StringUtils.hasLength(type) && "gas".equals(type)) { // 导入气表
//						
//						if(j == 0 && !"".equals(result[i][j])) { // 第一列的数据不为空，直接插入数据
//							gas_num++;
//							col_a = result[i][j];
//							circuitinfo1 = new Circuitinfo();
//							circuitinfo1.setYear(year);
//							circuitinfo1.setMonth(month);
//							double num = 0;
//							if(gas_num == 1){
//								num = Double.valueOf(("".equals(result[i][3]) ? "0" : result[i][3])) + 
//									  Double.valueOf(("".equals(result[i+1][3]) ? "0" : result[i+1][3])) + 
//									  Double.valueOf(("".equals(result[i+2][3]) ? "0" : result[i+2][3])) + 
//									  Double.valueOf(("".equals(result[i+3][3]) ? "0" : result[i+3][3]));
//							} else if (gas_num == 2) {
//								num = Double.valueOf(("".equals(result[i][3]) ? "0" : result[i][3])) + 
//									  Double.valueOf(("".equals(result[i+1][3]) ? "0" : result[i+1][3])) + 
//									  Double.valueOf(("".equals(result[i+2][3]) ? "0" : result[i+2][3])) + 
//									  Double.valueOf(("".equals(result[i+3][3]) ? "0" : result[i+3][3])) + 
//									  Double.valueOf(("".equals(result[i+4][3]) ? "0" : result[i+4][3]));
//							} else if (gas_num == 3) {
//								num = Double.valueOf(("".equals(result[i][3]) ? "0" : result[i][3])) + 
//									  Double.valueOf(("".equals(result[i+1][3]) ? "0" : result[i+1][3])) + 
//									  Double.valueOf(("".equals(result[i+2][3]) ? "0" : result[i+2][3])) + 
//									  Double.valueOf(("".equals(result[i+3][3]) ? "0" : result[i+3][3])) + 
//									  Double.valueOf(("".equals(result[i+4][3]) ? "0" : result[i+4][3])) + 
//									  Double.valueOf(("".equals(result[i+5][3]) ? "0" : result[i+5][3]));
//							}
//							
//							circuitinfo1.setZ_value(BigDecimal.valueOf(num));
//							circuitinfo1 = getCircuitForEnergy(circuitinfo1, col_a, circuitinfo1, type);
//						}
//						
//						if(j == 1 && !"".equals(result[i][j])) { // 第二列的数据
//							circuitinfo2 = new Circuitinfo();
//							circuitinfo2.setYear(year);
//							circuitinfo2.setMonth(month);
//							double zhi = Double.valueOf(("".equals(result[i][3]) ? "0" : result[i][3]));
//							total += zhi;
//							circuitinfo2.setZ_value(BigDecimal.valueOf(zhi));
//							circuitinfo2 = getCircuitForEnergy(circuitinfo2, result[i][j], circuitinfo1, type);
//						}
//						
//						if(j == 2 && !"".equals(result[i][j])) { // 第三列的数据
//							circuitinfo3 = new Circuitinfo();
//							circuitinfo3.setYear(year);
//							circuitinfo3.setMonth(month);
//							circuitinfo3.setZ_value(BigDecimal.valueOf(Double.valueOf(("".equals(result[i][3]) ? "0" : result[i][3]))));
//							circuitinfo3 = getCircuitForEnergy(circuitinfo3, result[i][j], circuitinfo2, type);
//						}
//					}
//				}
//			}
//			
//			System.out.println(type + "--最后的总数---" + total);
//			if(StringUtils.hasLength(type) && ("water".equals(type) || "gas".equals(type))) { // 导入水表和导入气表
//				try {
//					saveOrUpdateWaterAndGas(type, year, month, total);
//				} catch (Exception e) {
//					System.out.println("更新" + type + "的数据到sqlserver中出错了--" + total);
//				}
//			}
//			
//			returnStr = "true";
//		} catch (Exception e) {
//			returnStr = "false";
//		}
//		
//		return returnStr;
//	}
}
