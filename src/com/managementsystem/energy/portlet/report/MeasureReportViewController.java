package com.managementsystem.energy.portlet.report;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;
import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.CircuitinfoTree;
import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.energystatistic.service.EnergyStatisticService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.PreferenceInfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.ui.easyui.Tree;

/**
 * 第二版能源产品-报表管理-计量报表
 * 
 * @author zouzhixiang
 * 
 */
@Controller
@RequestMapping("VIEW")
public class MeasureReportViewController extends BaseController {

	private final Log logger = LogFactory
			.getLog(MeasureReportViewController.class);

	@Autowired
	private PreferenceInfoService preferenceInfoService;

	@Autowired
	private EnergyStatisticService energyStatisticService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	@Autowired
	private CircuitinfoService circuitinfoService;

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
		model.addAttribute("measurereport", preferenceinfo);

		return PORTLETFOLDER + "report/measureReportView";
	}

	/**
	 * 返回建筑区域树形数据
	 * */
	@ResourceMapping(value = "getBuildregionstree")
	public JsonResult getBuildregionstree() {
		JsonResult result = new JsonResult();
		List<Tree> trees = buildregioninfoService.getBuildregionComboTree("");
		result.setData(trees);
		return result;
	}

	/**
	 * 返回装表支路树形数据
	 * */
	@ResourceMapping(value = "getCircuitTreeByBuildId")
	public JsonResult getCircuitTreeByBuildId(ResourceRequest request) {
		JsonResult result = new JsonResult();
		String text = request.getParameter("text"); // 区分是查询电表还是水表
		List<CircuitinfoTree> trees = circuitinfoService.getCircuitTreeByBuildId("", text);
		result.setData(trees);
		return result;
	}
	
	/**
	 * 获取有数据的支路信息时间列表
	 * 
	 * */
	@ResourceMapping(value = "getCircuitTimeList")
	public Map<String, Object> getCircuitTimeList(ResourceRequest request) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		
		List<Circuitinfo> list = new ArrayList<Circuitinfo>();
		try {
			String year = request.getParameter("year"); 
			String text = request.getParameter("text"); // 区分水、电、气
			
			// 求对应的json数据
			list = circuitinfoService.getCircuitTimeList(year, text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultMap.put("result", list);
		return resultMap;
	}
	
	/**
	 * 获取有数据的支路信息时间列表
	 * 
	 * */
	@ResourceMapping(value = "getCircuitDataList")
	public Map<String, Object> getCircuitDataList(ResourceRequest request) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			String time = request.getParameter("time"); // 获取传递过来的时间
			String text = request.getParameter("text"); // 区分水、电、气
			String treeIds = request.getParameter("treeIds"); // 选择的左侧数结构的id
			
			// 求对应的json数据
			resultMap = circuitinfoService.getCircuitDataList(time, text, treeIds);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 获取预览报表数据
	 * */
	@ResourceMapping(value = "getReportDataList")
	public Map<String, Object> getReportDataList(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {

		// 获取前台传递过来的参数，分别是类型（day/week/month/year）、开始时间、结束时间
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String ispd = request.getParameter("ispd");
		String multiplier = request.getParameter("multiplier");
		String from_date = request.getParameter("from");
		String to_date = request.getParameter("to");
		String decimals = request.getParameter("decimals"); // 保留小数位数

		// 结果map
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			// 求对应的json数据
			resultMap = energyStatisticService.printReportInfo(name, id, ispd,
					type, from_date, to_date, decimals, multiplier, "", "");
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
	@ResourceMapping(value = "outputDataForWaterAndGas")
	public Resultmsg outputDataForWaterAndGas(PortletPreferences prefs,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();

		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String time = request.getParameter("time"); // 获取传递过来的时间
		String text = request.getParameter("text"); // 区分水、电、气
		String treeIds = request.getParameter("treeIds"); // 选择的左侧数结构的id
		String treeCodes = request.getParameter("treeCodes"); // 选择的左侧数结构的code
		String excelName = request.getParameter("excelName"); // excel的名字
		
		try {
			resultMap = circuitinfoService.getCircuitDataList(time, text, treeIds);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			expWaterAndGasDataToExcel(treeCodes, time, excelName, resultMap, request);
			msg.setSuccess("true");
		} catch (Exception e) {
			logger.error(e);
		}

		return null;
	}

	// 输出报表数据到excel文件
	public String expWaterAndGasDataToExcel(String treeCodes, String time, String excelName, Map<String, Object> map,
			ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);

		// 内容样式
		CellStyle contentstyle = wb.createCellStyle();
		contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);

		// 创建标题一行
		Row row = sheet1.createRow((short) 0);
		// 创建列
		Cell cell0 = row.createCell(0);
		cell0.setCellValue("序号");
		sheet1.setColumnWidth(0, 6000);
		Cell cell1 = row.createCell(1);
		cell1.setCellValue("表名");
		sheet1.setColumnWidth(1, 6000);
		
		String[] times = time.split(","); // 根据选择的时间来创建对应列
		for (int column = 0; column < times.length; column++) {
			Cell cell = row.createCell(column + 2);
			cell.setCellValue(times[column]);
			sheet1.setColumnWidth(column, 6000);
		}

		List<Object> resultList = new ArrayList<Object>();
		List<Object> dataList = (List<Object>) map.get("result");

		// 创建列
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
				String valString = ((Reportinfo)list.get(k)).getZhi() + "";
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		String[] codes = treeCodes.split(",");
		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet1.createRow((short) q + 1);
			
			// 第一列序号、第二列对应表名
			Cell c0 = row1.createCell(0);
			c0.setCellStyle(contentstyle);// 设置单元格样式
			c0.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
			Cell c1 = row1.createCell(1);
			try {
				c0.setCellValue(q + 1);
				c1.setCellValue(codes[q]);
			} catch (Exception e) {
				c0.setCellValue("");
				c1.setCellValue("");
			}

			for (int d = 0; d < result[q].length; d++) {
				Cell cell = row1.createCell(d + 2);
				cell.setCellStyle(contentstyle);// 设置单元格样式
				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
				try {
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
		realPath += addfilePath + excelName + ".xls";

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
