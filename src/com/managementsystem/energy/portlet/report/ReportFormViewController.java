package com.managementsystem.energy.portlet.report;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.service.QuerySchemeService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("VIEW")
public class ReportFormViewController extends BaseController {

	private final Log logger = LogFactory
			.getLog(ReportFormViewController.class);

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private EnergyStatisticService energyStatisticService;

	@Autowired
	private QuerySchemeService querySchemeService;
	
	@Autowired
	private BuildregioninfoService buildregioninfoService;

	/**
	 * 默认显示页面
	 * 
	 * @param prefs
	 * @param model
	 * @return
	 */
	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		model.addAttribute("reportform", preferenceinfo);

		return PORTLETFOLDER + "report/reportFormView";
	}

	/**
	 * 跳转到输出报表页面
	 * 
	 * @param prefs
	 * @param model
	 * @param request
	 * @param response
	 * @throws PortletException
	 * @throws ReadOnlyException
	 * @throws IOException
	 */
	@RenderMapping(params = "action=printReportInfo")
	public ModelAndView printReportInfo(PortletPreferences prefs, Model model,
			RenderRequest request, RenderResponse response)
			throws PortletException, ReadOnlyException, IOException {

		ModelAndView mav = new ModelAndView();

		// 获取前台传递过来的参数，分别是类型（day/week/month/year）、开始时间、结束时间
		String type = request.getParameter("type");
		String from_date = request.getParameter("from");
		String to_date = request.getParameter("to");
		String regionid = request.getParameter("regionid");
		model.addAttribute("regionid", regionid);

		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 首选项的信息
		model.addAttribute("reportform", preferenceinfo);

		model.addAttribute("s_type", type);
		model.addAttribute("from_date", from_date);
		model.addAttribute("to_date", to_date);

		String show_tfrom = request.getParameter("show_tfrom");
		String show_tto = request.getParameter("show_tto");
		model.addAttribute("show_tfrom", show_tfrom); // 显示的开始时间
		model.addAttribute("show_tto", show_tto); // 显示的结束时间

		mav.setViewName(PORTLETFOLDER + "report/reportFormListView");

		return mav;
	}

	/**
	 * 获取预览报表数据
	 * */
	@ResourceMapping(value = "getReportDataList")
	public Map<String, Object> getReportDataList(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		
		// 获取前台传递过来的参数，分别是类型（day/week/month/year）、开始时间、结束时间
		String type = request.getParameter("type");
		String from_date = request.getParameter("from");
		String to_date = request.getParameter("to");
		String decimals = request.getParameter("decimals"); // 保留小数位数
		String regionId = request.getParameter("regionId"); // 楼层id
		String regionText = request.getParameter("regionText"); // 楼层

		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}
		
		String name = preferenceinfo.getChoose_name();
		String id = preferenceinfo.getChoose_id();
		String ispd = preferenceinfo.getIspd();
		String row1 = preferenceinfo.getLinkName_1();
		String row2 = preferenceinfo.getLinkName_2();
		String row3 = preferenceinfo.getLinkName_3();
		
		try {
			// 求name、id、ispd，主要针对中国馆的运行监测，报表输出
			String distance = preferenceinfo.getDistance(); // 区分是什么报表
			if(!distance.equals("")) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				if("cwp".equalsIgnoreCase(distance)) { // 冷却泵数据输出
					map = querySchemeService.getDataListByCondition("chiller", "", "冷却泵", distance, "");
					map = getInfo(map, preferenceinfo);
				}
				if("chwp".equalsIgnoreCase(distance)) { // 冷冻泵数据输出
					map = querySchemeService.getDataListByCondition("chiller", "", "冷冻泵", distance, "");
					map = getInfo(map, preferenceinfo);
				}
				if("ct".equalsIgnoreCase(distance)) { // 冷却塔数据输出
					map = querySchemeService.getDataListByCondition("chiller", "", "冷却塔", distance, "");
					map = getInfo(map, preferenceinfo);
				}
				if("ahu".equalsIgnoreCase(distance) || "fau".equalsIgnoreCase(distance) || "acu".equalsIgnoreCase(distance)) { // 空调箱数据输出
					map = querySchemeService.getDataListByCondition("", "t_sa", "", distance, regionId);
					row1 = regionText;
					row2 = (String) map.get("showId");
					map = getMapForDevices(map, preferenceinfo.getChoose_name(), preferenceinfo.getIspd());
					map.put("row2", row2);
					map.put("row3", row3);
				}
				name = (String) map.get("name");
				id = (String) map.get("id");
				ispd = (String) map.get("ispd");
				row2 = (String) map.get("row2");
				row3 = (String) map.get("row3");
				
			}
			resultMap.put("message", "success");
		} catch (Exception e1) {
			resultMap.put("message", "none");
		}
		
		logger.info("-------getReportDataList------");
		logger.info("name--" + name);
		logger.info("id--" + id);
		logger.info("ispd--" + ispd);

		try {
			// 求对应的json数据
			resultMap = energyStatisticService.printReportInfo(name, id, ispd,
					type, from_date, to_date, decimals,
					preferenceinfo.getMultiplier(),
					preferenceinfo.getDistance(), preferenceinfo.getTitle());
			resultMap.put("message", "success");
		} catch (Exception e) {
			resultMap.put("message", "none");
			e.printStackTrace();
		}

		resultMap.put("preferenceinfo", preferenceinfo);
		resultMap.put("row1", row1);
		resultMap.put("row2", row2);
		resultMap.put("row3", row3);
		return resultMap;
	}
	
	/**
	 * 输出报表数据到EXCEL中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "expDeviceDataToExcel")
	public Resultmsg expDeviceDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		
		String type = request.getParameter("type");
		String from_date = request.getParameter("from");
		
		try {
			Map<String, Object> resultMap = getReportDataList(prefs, request, response);
			PreferenceInfo preferenceinfo = (PreferenceInfo) resultMap.get("preferenceinfo");
			expDeviceDataToExcel(from_date, type, preferenceinfo.getTitle(), resultMap, request);
			msg.setSuccess("true");
		} catch (Exception e) {
			logger.error(e);
		}

		return null;
	}
	
	
	
	
	
	/**
	 * 根据配置计算对应的name、id、ispd
	 * 
	 * @param dataMap
	 * @param preferenceinfo
	 * @return
	 */
	private Map<String, Object> getInfo(Map<String, Object> dataMap, PreferenceInfo preferenceinfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		String comments = (String) dataMap.get("comments"); // 中文注释
		String name = (String) dataMap.get("name");
		String id = (String) dataMap.get("id");
		String ispd = (String) dataMap.get("ispd");
		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");
		
		String t_1 = preferenceinfo.getLinkName_1();
		String[] one = t_1.split(",");
		int t1_len = one.length;
		String t_2 = (!preferenceinfo.getDistance().equals("")) ? comments : preferenceinfo.getLinkName_2(); // 如果配置了输出模块，则使用数据库中查询出来的数据
		String[] two = t_2.split(",");
		int t2_len = (t_2 == "") ? 0 :two.length;
		String t_3 = preferenceinfo.getLinkName_3();
		String[] thr = t_3.split(",");
		int t3_len = (t_3 == "") ? 0 : thr.length;
		
		// 1.确定列数
		int t2t3_len = (t2_len == 0 ? 1 : t2_len) * (t3_len == 0 ? 1 : t3_len);
		int total_col = t1_len * t2t3_len; // 第二行第三行总列数、总列数
		
		// 2.写入元素
		name = id = ispd = "";
		int k = 0, v = 0; // 分别记录第一行、第二行的索引
		for (int i = 1; i <= total_col; i++) {
			
			int index = 0;
			if (t2_len != 0) { // t2_len不为0，才考虑多行的情况
				
				if (t3_len != 0) { // t3_len不为0，才操作第二行的数据
					
					index = (total_col) % t3_len;
					if (index == 0) { // 循环写入第二行的数据
						name += names[v] + ",";
						id += ids[v] + ",";
						ispd += ispds[v] + ",";
						v++;
						if (v >= names.length) { v = 0; }
					}
					
				} else { // 说明没有第三行
					
					index = (total_col) % t2_len;
					if (index == 0) { // 循环写入第二行的数据
						name += names[v] + ",";
						id += ids[v] + ",";
						ispd += ispds[v] + ",";
						v++;
						if (v >= names.length) { v = 0; }
					}
					
				}

			} else { // 只有第一行的情况
				
				// 第一行数据
				index = (i - 1) % t2t3_len;
				if (index == 0) {
					name += names[k] + ",";
					id += ids[k] + ",";
					ispd += ispds[k] + ",";
					k++;
				}
				
			}
		}
		map.put("name", name);
		map.put("id", id);
		map.put("ispd", ispd);
		map.put("row2", t_2);
		map.put("row3", t_3);
		
		return map;
	}

	/**
	 * 输出报表数据到EXCEL中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResourceMapping(value = "expDataToExcel")
	public Resultmsg expDataToExcel(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		// 获取前台传递过来的参数，分别是类型（day/week/month/year）、开始时间、结束时间
		String type = request.getParameter("type");
		String from_date = request.getParameter("from");
		String to_date = request.getParameter("to");
		String decimals = request.getParameter("decimals"); // 保留小数位数

		PreferenceInfo preferenceinfo = null;

		if (prefs.getMap().size() == 0) {
			preferenceinfo = new PreferenceInfo();
		} else {
			preferenceinfo = preferenceInfoService.getPreferenceInfo(prefs);
		}

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.printReportInfo(
					preferenceinfo.getChoose_name(),
					preferenceinfo.getChoose_id(), preferenceinfo.getIspd(),
					type, from_date, to_date, decimals,
					preferenceinfo.getMultiplier(), "", "");
		} catch (Exception e) {
			logger.error(e);
		}

		try {
			expDataToExcel(from_date, type, preferenceinfo, resultMap, request);
			msg.setSuccess("true");
		} catch (Exception e) {
			logger.error(e);
		}

		return null;
	}

	// 输出报表数据到excel文件
	public String expDataToExcel(String from_date, String type,
			PreferenceInfo preferenceinfo, Map<String, Object> map,
			ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);

		// 获取配置项中的共有的列头数据
		String str = "日期" + ",";

		// 如果类型为day的话，将day特有的列加入到列头数据中
		if ("day".equals(type)) {
			str += preferenceinfo.getDayColumn() + ",";
		}

		str += preferenceinfo.getCommonColumn();

		// 将配置项中的列头信息分割成java中的数组，以便循环处理相关数据
		String str1 = str.replace("[", "").replace("]", "").replace(" ", "")
				.replace("'", "");

		// logger.info("分割后的数据为---" + str1);
		String[] title = str1.split(",");

		// 内容样式
		CellStyle contentstyle = wb.createCellStyle();
		contentstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		contentstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

		// 创建标题一行
		Row row = sheet1.createRow((short) 0);
		// 创建列
		for (int column = 0; column < title.length; column++) {
			Cell cell = row.createCell(column);
			cell.setCellValue(title[column]);
			cell.setCellStyle(contentstyle);// 设置单元格样式
			sheet1.setColumnWidth(column, title[column].getBytes().length * 1 * 256); // 设置列宽自适应
		}

		List<Object> resultList = new ArrayList<Object>();
		List<Object> dataList = (List<Object>) map.get("showDataList");

		// 创建列
		if ("day".equals(type)) {
			List<Object> tempList = new ArrayList<Object>();
			int hang = ((List<Object>) dataList.get(0)).size();
			for (int t = 0; t < hang; t++) {
				tempList.add(from_date);
			}
			resultList.add(tempList);

		}

		resultList.add((List<Object>) ((List<Object>) map.get("showCataList"))
				.get(0));
		resultList.addAll(dataList);

		List<Object> a = (List<Object>) resultList.get(0);
		int b = resultList.size();

		int rows = a.size();
		int cols = b;

		String result[][] = new String[rows][cols];

		// 设置全局的行数和列数
		int r = 0;
		int c = 0;

		// 循环将数据添加到二维数组中
		for (int j = 0; j < resultList.size(); j++) {
			List<Object> list = (List<Object>) resultList.get(j);
			for (int k = 0; k < list.size(); k++) {
				String valString = list.get(k) + "";
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet1.createRow((short) q + 1);

			for (int d = 0; d < result[q].length; d++) {
				Cell cell = row1.createCell(d);
				cell.setCellStyle(contentstyle);// 设置单元格样式
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
				try {
					cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
					cell.setCellValue(Double.parseDouble(result[q][d]));
				} catch (Exception e) {
					sheet1.setColumnWidth(d, result[q][d].getBytes().length * 1 * 256); // 设置列宽自适应
					cell.setCellValue(result[q][d]);
				}
			}
		}

		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += preferenceinfo.getTitle() + ".xls";

		File file = new File(realPath);
		if (file.exists())
			file.delete();
		try {
			fileOut = new FileOutputStream(realPath);
			wb.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realPath;
	}

	// 删除excel临时缓存文件
	@ResourceMapping(value = "deleteExcelTempFile")
	public Resultmsg deleteExcelTempFile(ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		try {
			String fileName = request.getParameter("fileName");
			PortletContext portletContext = request.getPortletSession()
					.getPortletContext();
			String realPath = portletContext.getRealPath("");
			String addfilePath = "\\uploadfiles\\";
			realPath += addfilePath;
			realPath += fileName + ".xls";
			File file = new File(realPath);
			if (file.exists())
				file.delete();
			msg.setSuccess("true");
		} catch (Exception e) {
			msg.setMsg(e.getMessage());
			logger.error(e);
		}

		return msg;
	}
	
	/**
	 * 根据name返回相应的取值数据
	 * 
	 * @param map
	 * @param name
	 * @return
	 */
	private Map<String, Object> getMapForDevices(Map<String, Object> map, String name, String ispd) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String[] names = name.split(",");
		String[] ids = map.get("id").toString().split(",");
		String[] ispds = ispd.split(",");
		String _name = "", _id = "", _ispd = "";
		
		for (int k = 0; k < ids.length; k++) {
			for (int i = 0; i < names.length; i++) {
				_name += names[i] + ",";
				_id += ids[k] + ",";
				_ispd += ispds[i] + ",";
			}
		}
		
		resultMap.put("name", _name.substring(0, _name.length() - 1 ));
		resultMap.put("id", _id.substring(0, _id.length() - 1 ));
		resultMap.put("ispd", _ispd.substring(0, _ispd.length() - 1 ));
		resultMap.put("comments", map.get("comments").toString());
		
		return resultMap;
	}
	
	/**
	 * 输出运行监测-设备报表数据到excel文件
	 * 
	 * @param from_date
	 * @param type
	 * @param title
	 * @param map
	 * @param request
	 * @return
	 */
	public String expDeviceDataToExcel(String from_date, String type, String title, Map<String, Object> map, ResourceRequest request) {
		HSSFWorkbook wb = new HSSFWorkbook();  
		HSSFSheet sheet = wb.createSheet(from_date); // 创建Excel的工作sheet,对应到一个excel文档的tab
		
		// 列样式
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);

		int column = 0, r = 0, total_r = 2; // 分别是列数、行数和列头总行数
		
		String[] oneList = map.get("row1").toString().split(","); // 第一行的列头数据
		String[] twoList = map.get("row2").toString().split(","); // 第二行的列头数据
		String three = map.get("row3").toString();
		String[] threeList = three.split(","); // 第三行的列头数据
		int length = threeList.length;
		if(three.trim().length() == 0) {
			total_r = 1;
			length = 0;
		}
		
		int child = twoList.length * (length == 0 ? 1 : length); // 第二行和第三行总列数
		int totalColumn = oneList.length * child; // 总列数
		Row row = sheet.createRow(r); // 创建第一行
		Row row2 = sheet.createRow(1); // 创建第二行
		Row total_row = sheet.createRow(total_r); // 创建第三行
		
		Cell cell = row.createCell(column);// 第一列
		cell.setCellValue("日期");
		cell.setCellStyle(cellStyle);
		sheet.addMergedRegion(new Region(r, (short) column, total_r, (short) column)); // 合并单元格
		
		column++; // 列加1

		for (int i = 0; i < (length == 0 ? 2 : length); i++) { // 设置单元格网格线
			cell = row2.createCell(i);// 第一列
			cell.setCellStyle(cellStyle);
			cell = total_row.createCell(i);// 第一列
			cell.setCellStyle(cellStyle);
		}
		
		// 循环写入数据
		int k = 0, v = 0; // 分别记录第一行、第二行的索引
		for (int i = 1; i <= totalColumn; i++) {
			int index = (i - 1) % child;
			if(index == 0 ) {

				// 设置单元格网格线
				for (int j = column; j <= (column + child - 1); j++) {
					cell = row.createCell(j);
					cell.setCellStyle(cellStyle);
				}
				// 	写入第一行数据
				cell = row.createCell(column);
				cell.setCellStyle(cellStyle);
				cell.setCellValue(oneList[k]);
				sheet.addMergedRegion(new Region(0, (short) column, 0, (short) (column + child - 1)));
				sheet.setColumnWidth(column, oneList[k].getBytes().length * 1 * 256); // 设置列宽自适应
				k++;
			
			}
			
			if(length != 0 ) { // length为0，说明没有第三行
				index = (i - 1) % threeList.length;
				if(index == 0) { // 循环写入第二行的数据
					
					// 设置单元格网格线
					int cellLength = column + threeList.length - 1;
					for (int j = column; j <= cellLength; j++) {
						cell = row2.createCell(j);
						cell.setCellStyle(cellStyle);
					}
					
					cell = row2.createCell(column);
					cell.setCellValue(twoList[v]);
					cell.setCellStyle(cellStyle);
					sheet.addMergedRegion(new Region(1, (short) column, 1, (short) cellLength));
					sheet.setColumnWidth(column, twoList[v].getBytes().length * 1 * 256); // 设置列宽自适应
					v++;
					if (v >= twoList.length) { v = 0; }
				
				}
			}
			
			// 从最底层开始写入excel
			cell = (length == 0 ? row2 : total_row).createCell(column);// 第一列
			cell.setCellValue(length == 0 ? twoList[index] : threeList[index]);
			cell.setCellStyle(cellStyle);
			sheet.setColumnWidth(column, (length == 0 ? twoList[index] : threeList[index]).getBytes().length * 1 * 256); // 设置列宽自适应

			column++;
		}

		List<Object> resultList = new ArrayList<Object>();
		List<Object> dataList = (List<Object>) map.get("showDataList");

		resultList.add((List<Object>) ((List<Object>) map.get("showCataList"))
				.get(0));
		resultList.addAll(dataList);

		List<Object> a = (List<Object>) resultList.get(0);
		int b = resultList.size();

		int rows = a.size();
		int cols = b;

		String result[][] = new String[rows][cols];

		// 设置全局的行数和列数
		r = 0;
		int c = 0;

		// 循环将数据添加到二维数组中
		for (int j = 0; j < resultList.size(); j++) {
			List<Object> list = (List<Object>) resultList.get(j);
			for (k = 0; k < list.size(); k++) {
				String valString = "";
				try {
					valString = list.get(k) + "";
				} catch (Exception e) {
					valString = "";
				}
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet.createRow((short) q + total_r + 1);

			for (int d = 0; d < result[q].length; d++) {
				cell = row1.createCell(d);
				cell.setCellStyle(cellStyle);// 设置单元格样式
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
				try {
					cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
					cell.setCellValue(Double.parseDouble(result[q][d]));
				} catch (Exception e) {
					if(result[q][d] != null) {
						cell.setCellValue(result[q][d]);
						sheet.setColumnWidth(0, result[q][d].getBytes().length * 1 * 256); // 设置列宽自适应
					} else {
						cell.setCellValue("");
					}
					
				}
			}
		}

		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += title + ".xls";

		File file = new File(realPath);
		if (file.exists())
			file.delete();
		try {
			fileOut = new FileOutputStream(realPath);
			wb.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realPath;
	}
	
	
	/**
	 * 获取预览报表数据
	 * */
	@ResourceMapping(value = "getFloorData")
	public Map<String, Object> getFloorData() {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			List<Buildregioninfo> list = buildregioninfoService.getAllBuildregioninfos();
			resultMap.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
