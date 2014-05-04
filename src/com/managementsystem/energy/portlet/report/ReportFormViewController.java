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
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.PreferenceInfoService;
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
					preferenceinfo.getMultiplier());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
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
					preferenceinfo.getMultiplier());
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
		contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);

		// 创建标题一行
		Row row = sheet1.createRow((short) 0);
		// 创建列
		for (int column = 0; column < title.length; column++) {
			Cell cell = row.createCell(column);
			cell.setCellValue(title[column]);
			sheet1.setColumnWidth(column, 6000);
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
				//
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
}
