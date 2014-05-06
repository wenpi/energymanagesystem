package com.managementsystem.energy.service.impl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.ImportService;

@Service
public class ImportServiceImpl implements ImportService {

	@Autowired
	private CircuitinfoDao circuitinfoDao;

	@Autowired
	private CircuitinfoService circuitinfoService;
	
	@Override
	public String importExcelToCircuitinfo(MultipartFile mf, String type) {
		String returnStr = "true";

		try {
			String[][] result = getData(mf, 1);

			int rowLength = result.length;

			System.out.println("导入的excel行数--" + rowLength);

			String col_a = "", col_b = "", col_c = "", col_d = ""; // 存储excel中的内容
			
			Circuitinfo circuitinfo1 = new Circuitinfo();
			Circuitinfo circuitinfo2 = new Circuitinfo();
			Circuitinfo circuitinfo3 = new Circuitinfo();
			Circuitinfo circuitinfo4 = new Circuitinfo();
			
			for (int i = 0; i < rowLength; i++) {
				
				for (int j = 0; j < result[i].length; j++) {

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
							
							if(!"".equals(col_b)) { // 第二列的数据
								circuitinfo2 = new Circuitinfo();
								circuitinfo2 = getCircuitForEnergy(circuitinfo2, col_b, circuitinfo1, type);
							}
							
							if(!"".equals(result[i][2])) { // 第三列数据
								circuitinfo3 = new Circuitinfo();
								circuitinfo3 = getCircuitForEnergy(circuitinfo3, result[i][2], circuitinfo2, type);
							}
							
							circuitinfo4 = new Circuitinfo();
							circuitinfo4 = getCircuitForEnergy(circuitinfo4, result[i][j], circuitinfo3, type);
						}
					}
				}
			}
			returnStr = "true";
		} catch (Exception e) {
			returnStr = "false";
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
			circuitinfo.setCircuitCode(code);
			circuitinfo.setCircuitName(code);
			circuitinfo.setCircuitState(1);
			circuitinfo.setCircuitinfo(parentinfo);
			circuitinfo.setCircuitText(type); // 所属系统
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

		for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {

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

							if (!cell.getStringCellValue().equals("")) {

								value = cell.getStringCellValue();

							} else {

								value = cell.getNumericCellValue() + "";

							}

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
	
}
