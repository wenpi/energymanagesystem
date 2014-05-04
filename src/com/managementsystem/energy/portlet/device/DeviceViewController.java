package com.managementsystem.energy.portlet.device;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletContext;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.DeviceService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.util.dao.Page;
import com.managementsystem.util.io.FileSystemObject;

@Controller
@RequestMapping("VIEW")
public class DeviceViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());
	private final String FILEUPLOADSUCCESS = "FILEUPLOADSUCCESS";
	@Autowired
	private DeviceService deviceService;

	@Autowired
	private BuildService buildService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	/**
	 * 设置模块显示首页
	 * */
	@RenderMapping
	public ModelAndView setupDevice() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listDevice");
		return mav;
	}

	/**
	 * 
	 * */
	@RenderMapping(params = "action=listBoi")
	public ModelAndView setupListBoi() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listBoi");
		return mav;
	}

	/**
	 * 水泵
	 * */
	@RenderMapping(params = "action=listPump")
	public ModelAndView setupListPump() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listPump");
		return mav;
	}

	/**
	 * 冷却塔
	 * */
	@RenderMapping(params = "action=listCt")
	public ModelAndView setupListCt() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listCt");
		return mav;
	}

	/**
	 * 空调箱
	 * */
	@RenderMapping(params = "action=listAhu")
	public ModelAndView setupListAhu() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listAhu");
		return mav;
	}

	/**
	 * 风机盘管
	 * */
	@RenderMapping(params = "action=listFcu")
	public ModelAndView setupListFcu() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listFcu");
		return mav;
	}

	/**
	 * 变风量箱
	 * */
	@RenderMapping(params = "action=listVav")
	public ModelAndView setupListVav() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listVav");
		return mav;
	}

	/**
	 * 灯具
	 * */
	@RenderMapping(params = "action=listLighting")
	public ModelAndView setupListLighting() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listLighting");
		return mav;
	}

	/**
	 * 电梯
	 * */
	@RenderMapping(params = "action=listLift")
	public ModelAndView setupListLift() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listLift");
		return mav;
	}

	/**
	 * 电梯
	 * */
	@RenderMapping(params = "action=listHeater")
	public ModelAndView setupListHeater() {
		ModelAndView mav = new ModelAndView();
		Buildaddfile buildaddfile = new Buildaddfile();
		mav.addObject("buildaddfile", buildaddfile);
		mav.setViewName(PORTLETFOLDER + "device/listHeater");
		return mav;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getChis")
	public Page getPagedChis(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedChis(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getChisBySearch")
	public Page getChisBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedChisBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	@ResourceMapping(value = "showbuild")
	public JsonResult showbuild(@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		ArrayList<Buildinfo> buildinfoList = new ArrayList<Buildinfo>();
		Buildinfo buildinfo = buildService.getBuildinfo(buildId);
		buildinfoList.add(buildinfo);
		result.setData(buildinfoList);
		return result;
	}

	/**
	 * 获取建筑区域树
	 * */
	@SuppressWarnings("rawtypes")
	@ResourceMapping(value = "getregionIds")
	public JsonResult getEnergyitemdicts(@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		List list = null;
		list = buildregioninfoService.getBuildregionComboTree(buildId);
		result.setData(list);
		return result;
	}

	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = buildService.getBuildinfos(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getBois")
	public Page getPagedBois(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedBois(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getBoisBySearch")
	public Page getBoisBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedBoisBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getPumps")
	public Page getPagedPumps(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedPumps(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getPumpsBySearch")
	public Page getPumpsBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedPumpsBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getCts")
	public Page getPagedCts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedCts(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getCtsBySearch")
	public Page getCtsBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedCtsBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getAhus")
	public Page getPagedAhus(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedAhus(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getAhusBySearch")
	public Page getAhusBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedAhusBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getFcus")
	public Page getPagedFcus(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedFcus(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getFcusBySearch")
	public Page getFcusBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedFcusBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getVavs")
	public Page getPagedVavs(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedVavs(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getVavsBySearch")
	public Page getVavsBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedVavsBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getLightings")
	public Page getPagedLightings(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedLightings(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getLightingsBySearch")
	public Page getLightingsBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedLightingsBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getLifts")
	public Page getPagedLifts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedLifts(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getLiftsBySearch")
	public Page getLiftsBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedLiftsBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return
	 * */
	@ResourceMapping(value = "getHeaters")
	public Page getPagedHeaters(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = deviceService.getPagedHeaters(page, rows);
		return dcPaged;
	}

	/**
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value = "getHeatersBySearch")
	public Page getHeatersBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Page dcPaged = deviceService.getPagedHeatersBySearch(page, rows, no,
				buildId, regionId);
		return dcPaged;
	}
    /**
     * 制冷机
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expChiExcel")
	public Resultmsg expChiExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Chi> list = deviceService.getChiList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createChiExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expChiModel")
	public Resultmsg expChiModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "制冷机编号", "说明", "厂家", "型号", "数量", "额定制冷量kw",
				"额定功率kw", "额定COP", "额定冷冻水流量 m³/h", "额定冷冻水供水温度℃", "额定冷冻水回温度℃",
				"额定冷却水流量m³/h", "额定冷却水供水温度℃", "额定冷却水回水温度℃" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 15; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "制冷机模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createChiExcel(List<Chi> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "制冷机编号", "说明", "厂家", "型号", "数量", "额定制冷量kw",
				"额定功率kw", "额定COP", "额定冷冻水流量 m³/h", "额定冷冻水供水温度℃", "额定冷冻水回温度℃",
				"额定冷却水流量m³/h", "额定冷却水供水温度℃", "额定冷却水回水温度℃" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Chi chi = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(chi.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(chi.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(chi.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(chi.getMaker());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(chi.getModel());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (chi.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getTotal() + "");
			}
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (chi.getCap() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getCap() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (chi.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getPower() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (chi.getCop() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getCop() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (chi.getFrChw() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getFrChw() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (chi.getTChwS() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getTChwS() + "");
			}
			cell = row1.createCell(11);
			cell.setCellStyle(cellStyle);
			if (chi.getTChwR() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getTChwR() + "");
			}
			cell = row1.createCell(12);
			cell.setCellStyle(cellStyle);
			if (chi.getFrClw() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getFrClw() + "");
			}
			cell = row1.createCell(13);
			cell.setCellStyle(cellStyle);
			if (chi.getTClwS() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getTClwS() + "");
			}
			cell = row1.createCell(14);
			cell.setCellStyle(cellStyle);
			if (chi.getTClwR() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(chi.getTClwR() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 15; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "制冷机.xls";
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

	public void importChi(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Chi chi = new Chi();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							chi.setBuildId(m + "");
						} else {
							chi.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							chi.setDeviceNo(m + "");
						} else {
							chi.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						chi.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						chi.setMaker(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						chi.setModel(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						chi.setTotal(Double.valueOf(val[5]).intValue());
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						chi.setCap(BigDecimal.valueOf(Double.valueOf(val[6])));
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						chi.setPower(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						chi.setCop(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						chi.setFrChw(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						chi.setTChwS(BigDecimal.valueOf(Double.valueOf(val[10])));
					}
					if (val[11].equals("") || val[11].equals("null")) {
					} else {
						chi.setTChwR(BigDecimal.valueOf(Double.valueOf(val[11])));
					}
					if (val[12].equals("") || val[12].equals("null")) {
					} else {
						chi.setFrClw(BigDecimal.valueOf(Double.valueOf(val[12])));
					}
					if (val[13].equals("") || val[13].equals("null")) {
					} else {
						chi.setTClwS(BigDecimal.valueOf(Double.valueOf(val[13])));
					}
					if (val[14].equals("") || val[14].equals("null")) {
					} else {
						chi.setTClwR(BigDecimal.valueOf(Double.valueOf(val[14])));
					}
					deviceService.addChi(chi);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 锅炉
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expBoiExcel")
	public Resultmsg expBoiExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Boi> list = deviceService.getBoiList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createBoiExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expBoiModel")
	public Resultmsg expBoiModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "锅炉编号", "说明", "厂家", "型号", "数量", "额定供热量kw",
				"燃料耗量Nm³/h", "热水供水温度℃", "热水回水温度℃", "热水流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 11; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "锅炉模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createBoiExcel(List<Boi> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "锅炉编号", "说明", "厂家", "型号", "数量", "额定供热量kw",
				"燃料耗量Nm³/h", "热水供水温度℃", "热水回水温度℃", "热水流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Boi boi = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(boi.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(boi.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(boi.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(boi.getMaker());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(boi.getModel());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (boi.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getTotal() + "");
			}
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (boi.getHc() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getHc() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (boi.getFrFue() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getFrFue() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (boi.getTHwS() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getTHwS() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (boi.getTHwR() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getTHwR() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (boi.getFrHw() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(boi.getFrHw() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 11; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "锅炉.xls";
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

	public void importBoi(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Boi boi = new Boi();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							boi.setBuildId(m + "");
						} else {
							boi.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							boi.setDeviceNo(m + "");
						} else {
							boi.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						boi.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						boi.setMaker(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						boi.setModel(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						boi.setTotal(Double.valueOf(val[5]).intValue());
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						boi.setHc(BigDecimal.valueOf(Double.valueOf(val[6])));
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						boi.setFrFue(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						boi.setTHwS(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						boi.setTHwR(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						boi.setFrHw(BigDecimal.valueOf(Double.valueOf(val[10])));
					}
					deviceService.addBoi(boi);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 水泵
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expPumpExcel")
	public Resultmsg expPumpExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Pump> list = deviceService.getPumpList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createPumpExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expPumpModel")
	public Resultmsg expPumpModel(ResourceRequest request,
			SessionStatus status, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "水泵编号", "用途", "说明", "厂家", "型号", "数量",
				"功率kw", "扬程m", "流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 10; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "水泵模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createPumpExcel(List<Pump> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "水泵编号", "用途", "说明", "厂家", "型号", "数量",
				"功率kw", "扬程m", "流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Pump pump = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(pump.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(pump.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(pump.getSummary());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(pump.getDescription());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(pump.getMaker());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(pump.getModel());
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (pump.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(pump.getTotal() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (pump.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(pump.getPower() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (pump.getPr() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(pump.getPr() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (pump.getFr() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(pump.getFr() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 6; w < 10; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "水泵.xls";
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

	public void importPump(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Pump pump = new Pump();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							pump.setBuildId(m + "");
						} else {
							pump.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							pump.setDeviceNo(m + "");
						} else {
							pump.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						pump.setSummary(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						pump.setDescription(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						pump.setMaker(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						pump.setModel(val[5]);
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						pump.setTotal(Double.valueOf(val[6]).intValue());
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						pump.setPower(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						pump.setPr(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						pump.setFr(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					deviceService.addPump(pump);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 冷却塔
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expCtExcel")
	public Resultmsg expCtExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Ct> list = deviceService.getCtList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createCtExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expCtModel")
	public Resultmsg expCtModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "冷却塔编号", "说明", "厂家", "型号", "数量", "水量m³/h",
				"风量m³/h", "风机数量", "风机功率kW", "风机杨程Pa", "额定供水温度℃", "额定回水温度℃",
				"额定室外温度℃", "额定室外湿度%", "效率%", "水加热器数量", "水加热器功率kW" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 11; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 11; w < 18; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "冷却塔模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createCtExcel(List<Ct> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "冷却塔编号", "说明", "厂家", "型号", "数量", "水量m³/h",
				"风量m³/h", "风机数量", "风机功率kW", "风机杨程Pa", "额定供水温度℃", "额定回水温度℃",
				"额定室外温度℃", "额定室外湿度%", "效率%", "水加热器数量", "水加热器功率kW" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Ct ct = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(ct.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(ct.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ct.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ct.getMaker());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ct.getModel());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (ct.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getTotal() + "");
			}
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (ct.getFrW() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getFrW() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (ct.getFrOa() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getFrOa() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (ct.getTotalF() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getTotalF() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (ct.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getPower() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (ct.getPr() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getPr() + "");
			}
			cell = row1.createCell(11);
			cell.setCellStyle(cellStyle);
			if (ct.getSt() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getSt() + "");
			}
			cell = row1.createCell(12);
			cell.setCellStyle(cellStyle);
			if (ct.getRt() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getRt() + "");
			}
			cell = row1.createCell(13);
			cell.setCellStyle(cellStyle);
			if (ct.getOat() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getOat() + "");
			}
			cell = row1.createCell(14);
			cell.setCellStyle(cellStyle);
			if (ct.getOarh() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getOarh() + "");
			}
			cell = row1.createCell(15);
			cell.setCellStyle(cellStyle);
			if (ct.getEff() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getEff() + "");
			}
			cell = row1.createCell(16);
			cell.setCellStyle(cellStyle);
			if (ct.getTotalHt() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getTotalHt() + "");
			}
			cell = row1.createCell(17);
			cell.setCellStyle(cellStyle);
			if (ct.getPowerHt() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ct.getPowerHt() + "");
			}
		}
		for (int w = 0; w < 11; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 11; w < 18; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "冷却塔.xls";
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

	public void importCt(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Ct ct = new Ct();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							ct.setBuildId(m + "");
						} else {
							ct.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							ct.setDeviceNo(m + "");
						} else {
							ct.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						ct.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						ct.setMaker(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						ct.setModel(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						ct.setTotal(Double.valueOf(val[5]).intValue());
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						ct.setFrW(BigDecimal.valueOf(Double.valueOf(val[6])));
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						ct.setFrOa(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						ct.setTotalF(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						ct.setPower(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						ct.setPr(BigDecimal.valueOf(Double.valueOf(val[10])));
					}
					if (val[11].equals("") || val[11].equals("null")) {
					} else {
						ct.setSt(BigDecimal.valueOf(Double.valueOf(val[11])));
					}
					if (val[12].equals("") || val[12].equals("null")) {
					} else {
						ct.setRt(BigDecimal.valueOf(Double.valueOf(val[12])));
					}
					if (val[13].equals("") || val[13].equals("null")) {
					} else {
						ct.setOat(BigDecimal.valueOf(Double.valueOf(val[13])));
					}
					if (val[14].equals("") || val[14].equals("null")) {
					} else {
						ct.setOarh(BigDecimal.valueOf(Double.valueOf(val[14])));
					}
					if (val[15].equals("") || val[15].equals("null")) {
					} else {
						ct.setEff(BigDecimal.valueOf(Double.valueOf(val[15])));
					}
					if (val[16].equals("") || val[16].equals("null")) {
					} else {
						ct.setTotalHt(BigDecimal.valueOf(Double
								.valueOf(val[16])));
					}
					if (val[17].equals("") || val[17].equals("null")) {
					} else {
						ct.setPowerHt(BigDecimal.valueOf(Double
								.valueOf(val[17])));
					}
					deviceService.addCt(ct);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}

	}
    /**
     * 空调箱
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expAhuExcel")
	public Resultmsg expAhuExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Ahu> list = deviceService.getAhuList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createAhuExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expAhuModel")
	public Resultmsg expAhuModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "空调箱编号", "说明", "位置", "厂家", "型号", "数量",
				"送风机功率kw", "送风机扬程Pa", "送风量m³/h", "回风机功率kW", "回风机扬程Pa",
				"回风量m³/h", "制冷量kW", "制热量kW", "额定冷水供水温度℃", "额定冷水回水温度℃",
				"额定冷水流量m³/h", "额定热水供水温度℃", "额定热水回水温度℃", "额定热水流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}

		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 21; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "空调箱模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createAhuExcel(List<Ahu> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "空调箱编号", "说明", "位置", "厂家", "型号", "数量",
				"送风机功率kw", "送风机扬程Pa", "送风量m³/h", "回风机功率kW", "回风机扬程Pa",
				"回风量m³/h", "制冷量kW", "制热量kW", "额定冷水供水温度℃", "额定冷水回水温度℃",
				"额定冷水流量m³/h", "额定热水供水温度℃", "额定热水回水温度℃", "额定热水流量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Ahu ahu = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(ahu.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(ahu.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ahu.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ahu.getPosition());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ahu.getMaker());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(ahu.getModel());
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (ahu.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getTotal() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (ahu.getPowerSf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getPowerSf() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (ahu.getPrSf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getPrSf() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (ahu.getFrSf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getFrSf() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (ahu.getPowerRf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getPowerRf() + "");
			}
			cell = row1.createCell(11);
			cell.setCellStyle(cellStyle);
			if (ahu.getPrRf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getPrRf() + "");
			}
			cell = row1.createCell(12);
			cell.setCellStyle(cellStyle);
			if (ahu.getFrRf() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getFrRf() + "");
			}
			cell = row1.createCell(13);
			cell.setCellStyle(cellStyle);
			if (ahu.getCp() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getCp() + "");
			}
			cell = row1.createCell(14);
			cell.setCellStyle(cellStyle);
			if (ahu.getHp() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getHp() + "");
			}
			cell = row1.createCell(15);
			cell.setCellStyle(cellStyle);
			if (ahu.getTCwS() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getTCwS() + "");
			}
			cell = row1.createCell(16);
			cell.setCellStyle(cellStyle);
			if (ahu.getTCwR() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getTCwR() + "");
			}
			cell = row1.createCell(17);
			cell.setCellStyle(cellStyle);
			if (ahu.getFrCw() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getFrCw() + "");
			}
			cell = row1.createCell(18);
			cell.setCellStyle(cellStyle);
			if (ahu.getTHwS() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getTHwS() + "");
			}
			cell = row1.createCell(19);
			cell.setCellStyle(cellStyle);
			if (ahu.getTHwR() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getTHwR() + "");
			}
			cell = row1.createCell(20);
			cell.setCellStyle(cellStyle);
			if (ahu.getFrHw() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(ahu.getFrHw() + "");
			}
		}
		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 21; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "空调箱.xls";
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

	public void importAhu(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Ahu ahu = new Ahu();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							ahu.setBuildId(m + "");
						} else {
							ahu.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							ahu.setDeviceNo(m + "");
						} else {
							ahu.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						ahu.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						ahu.setPosition(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						ahu.setMaker(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						ahu.setModel(val[5]);
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						ahu.setTotal(Double.valueOf(val[6]).intValue());
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						ahu.setPowerSf(BigDecimal.valueOf(Double
								.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						ahu.setPrSf(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						ahu.setFrSf(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						ahu.setPowerRf(BigDecimal.valueOf(Double
								.valueOf(val[10])));
					}
					if (val[11].equals("") || val[11].equals("null")) {
					} else {
						ahu.setPrRf(BigDecimal.valueOf(Double.valueOf(val[11])));
					}
					if (val[12].equals("") || val[12].equals("null")) {
					} else {
						ahu.setFrRf(BigDecimal.valueOf(Double.valueOf(val[12])));
					}
					if (val[13].equals("") || val[13].equals("null")) {
					} else {
						ahu.setCp(BigDecimal.valueOf(Double.valueOf(val[13])));
					}
					if (val[14].equals("") || val[14].equals("null")) {
					} else {
						ahu.setHp(BigDecimal.valueOf(Double.valueOf(val[14])));
					}
					if (val[15].equals("") || val[15].equals("null")) {
					} else {
						ahu.setTCwS(BigDecimal.valueOf(Double.valueOf(val[15])));
					}
					if (val[16].equals("") || val[16].equals("null")) {
					} else {
						ahu.setTCwR(BigDecimal.valueOf(Double.valueOf(val[16])));
					}
					if (val[17].equals("") || val[17].equals("null")) {
					} else {
						ahu.setFrCw(BigDecimal.valueOf(Double.valueOf(val[17])));
					}
					if (val[18].equals("") || val[18].equals("null")) {
					} else {
						ahu.setTHwS(BigDecimal.valueOf(Double.valueOf(val[18])));
					}
					if (val[19].equals("") || val[19].equals("null")) {
					} else {
						ahu.setTHwR(BigDecimal.valueOf(Double.valueOf(val[19])));
					}
					if (val[20].equals("") || val[20].equals("null")) {
					} else {
						ahu.setFrHw(BigDecimal.valueOf(Double.valueOf(val[20])));
					}
					deviceService.addAhu(ahu);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 风机盘管
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expFcuExcel")
	public Resultmsg expFcuExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Fcu> list = deviceService.getFcuList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createFcuExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expFcuModel")
	public Resultmsg expFcuModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "风机盘管编号", "说明", "位置", "厂家", "型号", "数量",
				"风机功率W", "额定冷量kW", "额定热量kW", "额定风量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 11; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "风机盘管模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createFcuExcel(List<Fcu> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "风机盘管编号", "说明", "位置", "厂家", "型号", "数量",
				"风机功率W", "额定冷量kW", "额定热量kW", "额定风量m³/h" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Fcu fcu = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(fcu.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(fcu.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(fcu.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(fcu.getPosition());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(fcu.getMaker());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(fcu.getModel());
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (fcu.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(fcu.getTotal() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (fcu.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(fcu.getPower() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (fcu.getCc() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(fcu.getCc() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (fcu.getHc() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(fcu.getHc() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (fcu.getFr() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(fcu.getFr() + "");
			}
			cell = row1.createCell(11);
		}
		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 11; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "风机盘管.xls";
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

	public void importFcu(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Fcu fcu = new Fcu();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							fcu.setBuildId(m + "");
						} else {
							fcu.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							fcu.setDeviceNo(m + "");
						} else {
							fcu.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						fcu.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						fcu.setPosition(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						fcu.setMaker(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						fcu.setModel(val[5]);
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						fcu.setTotal(Double.valueOf(val[6]).intValue());
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						fcu.setPower(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						fcu.setCc(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						fcu.setHc(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						fcu.setFr(BigDecimal.valueOf(Double.valueOf(val[10])));
					}
					deviceService.addFcu(fcu);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 变风量箱
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expVavExcel")
	public Resultmsg expVavExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Vav> list = deviceService.getVavList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createVavExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expVavModel")
	public Resultmsg expVavModel(ResourceRequest request, SessionStatus status,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "变风量箱编号", "说明", "位置", "厂家", "型号", "数量",
				"风机功率W", "额定冷量kW", "额定热量kW", "额定风量m³/h", "电加热功率kW" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 12; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "变风量箱模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createVavExcel(List<Vav> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "变风量箱编号", "说明", "位置", "厂家", "型号", "数量",
				"风机功率W", "额定冷量kW", "额定热量kW", "额定风量m³/h", "电加热功率kW" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Vav vav = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(vav.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(vav.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(vav.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(vav.getPosition());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(vav.getMaker());
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(vav.getModel());
			cell = row1.createCell(6);
			cell.setCellStyle(cellStyle);
			if (vav.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getTotal() + "");
			}
			cell = row1.createCell(7);
			cell.setCellStyle(cellStyle);
			if (vav.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getPower() + "");
			}
			cell = row1.createCell(8);
			cell.setCellStyle(cellStyle);
			if (vav.getCc() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getCc() + "");
			}
			cell = row1.createCell(9);
			cell.setCellStyle(cellStyle);
			if (vav.getHc() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getHc() + "");
			}
			cell = row1.createCell(10);
			cell.setCellStyle(cellStyle);
			if (vav.getFr() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getFr() + "");
			}
			cell = row1.createCell(11);
			cell.setCellStyle(cellStyle);
			if (vav.getPowerHt() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(vav.getPowerHt() + "");
			}
		}
		for (int w = 0; w < 7; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		for (int w = 7; w < 12; w++) {
			sheet1.setColumnWidth(w, 7000);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "变风量箱.xls";
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

	public void importVav(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Vav vav = new Vav();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							vav.setBuildId(m + "");
						} else {
							vav.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							vav.setDeviceNo(m + "");
						} else {
							vav.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						vav.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						vav.setPosition(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						vav.setMaker(val[4]);
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						vav.setModel(val[5]);
					}
					if (val[6].equals("") || val[6].equals("null")) {
					} else {
						vav.setTotal(Double.valueOf(val[6]).intValue());
					}
					if (val[7].equals("") || val[7].equals("null")) {
					} else {
						vav.setPower(BigDecimal.valueOf(Double.valueOf(val[7])));
					}
					if (val[8].equals("") || val[8].equals("null")) {
					} else {
						vav.setCc(BigDecimal.valueOf(Double.valueOf(val[8])));
					}
					if (val[9].equals("") || val[9].equals("null")) {
					} else {
						vav.setHc(BigDecimal.valueOf(Double.valueOf(val[9])));
					}
					if (val[10].equals("") || val[10].equals("null")) {
					} else {
						vav.setFr(BigDecimal.valueOf(Double.valueOf(val[10])));
					}
					if (val[11].equals("") || val[11].equals("null")) {
					} else {
						vav.setPowerHt(BigDecimal.valueOf(Double
								.valueOf(val[11])));
					}
					deviceService.addVav(vav);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 灯具
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expLightingExcel")
	public Resultmsg expLightingExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Lighting> list = deviceService.getLightingList(no, buildId,
				regionId);
		if (list.size() > 0) {
			try {
				createLightingExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expLightingModel")
	public Resultmsg expLightingModel(ResourceRequest request,
			SessionStatus status, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "灯具编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "灯具模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createLightingExcel(List<Lighting> clientList,
			ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "灯具编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Lighting lighting = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(lighting.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(lighting.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(lighting.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(lighting.getModel());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			if (lighting.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(lighting.getTotal() + "");
			}
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (lighting.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(lighting.getPower() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "灯具.xls";
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

	public void importLighting(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Lighting lighting = new Lighting();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							lighting.setBuildId(m + "");
						} else {
							lighting.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							lighting.setDeviceNo(m + "");
						} else {
							lighting.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						lighting.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						lighting.setModel(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						lighting.setTotal(Double.valueOf(val[4]).intValue());
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						lighting.setPower(BigDecimal.valueOf(Double
								.valueOf(val[5])));
					}
					deviceService.addLighting(lighting);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 电梯
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expLiftExcel")
	public Resultmsg expLiftExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Lift> list = deviceService.getLiftList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createLiftExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expLiftModel")
	public Resultmsg expLiftModel(ResourceRequest request,
			SessionStatus status, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "电梯编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "电梯模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createLiftExcel(List<Lift> clientList, ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "电梯编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Lift lift = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(lift.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(lift.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(lift.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(lift.getModel());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			if (lift.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(lift.getTotal() + "");
			}
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (lift.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(lift.getPower() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "电梯.xls";
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

	public void importLift(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Lift lift = new Lift();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							lift.setBuildId(m + "");
						} else {
							lift.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							lift.setDeviceNo(m + "");
						} else {
							lift.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						lift.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						lift.setModel(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						lift.setTotal(Double.valueOf(val[4]).intValue());
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						lift.setPower(BigDecimal.valueOf(Double.valueOf(val[5])));
					}
					deviceService.addLift(lift);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}
    /**
     * 电加热器
     * @param request
     * @param response
     * @return
     */
	@ResourceMapping(value = "expHeaterExcel")
	public Resultmsg expHeaterExcel(ResourceRequest request,
			ResourceResponse response) {
		// String id ="",name="",type="";
		String no = "", buildId = "", regionId = "";
		if (request.getParameter("deviceNo") != null) {
			no = request.getParameter("deviceNo");
		}
		if (request.getParameter("buildId") != null) {
			buildId = request.getParameter("buildId");
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		Resultmsg msg = new Resultmsg();
		List<Heater> list = deviceService.getHeaterList(no, buildId, regionId);
		if (list.size() > 0) {
			try {
				createHeaterExcel(list, request);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
			}
		}
		return null;
	}

	@ResourceMapping(value = "expHeaterModel")
	public Resultmsg expHeaterModel(ResourceRequest request,
			SessionStatus status, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "电加热器编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "电加热器模板.xls";
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
				status.setComplete();
				msg.setSuccess("true");
			} catch (IOException e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	public String createHeaterExcel(List<Heater> clientList,
			ResourceRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newdate = sdf.format(new Date());
		// 创建一个EXCEL
		Workbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		Sheet sheet1 = wb.createSheet(newdate);
		String[] title = { "项目编号", "电加热器编号", "说明", "型号", "数量", "功率W" };
		int i = 0;
		Font font = wb.createFont();
		CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setFont(font);
		CellStyle Contentstyle = wb.createCellStyle();
		Contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Contentstyle.setFont(font);
		// 创建一行
		Row row = sheet1.createRow((short) 0);
		// 填充标题
		for (String s : title) {
			Cell cell = row.createCell(i);
			cell.setCellValue(s);
			cell.setCellStyle(cellStyle);
			i++;
		}
		for (int j = 0; j < clientList.size(); j++) {
			Heater heater = clientList.get(j);
			Row row1 = sheet1.createRow((short) j + 1);
			Cell cell = row1.createCell(0);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(heater.getBuildId());
			cell = row1.createCell(1);
			cell.setCellStyle(Contentstyle);
			cell.setCellValue(heater.getDeviceNo());
			cell = row1.createCell(2);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(heater.getDescription());
			cell = row1.createCell(3);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(heater.getModel());
			cell = row1.createCell(4);
			cell.setCellStyle(cellStyle);
			if (heater.getTotal() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(heater.getTotal() + "");
			}
			cell = row1.createCell(5);
			cell.setCellStyle(cellStyle);
			if (heater.getPower() == null) {
				cell.setCellValue("");
			} else {
				cell.setCellValue(heater.getPower() + "");
			}
		}
		for (int w = 0; w < 6; w++) {
			sheet1.setColumnWidth(w, 3500);
		}
		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += "电加热器.xls";
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

	public void importHeater(String filePath) {
		try {
			HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(
					filePath));
			// HSSFSheet sheet = wookbook.getSheet("sheets");
			HSSFSheet sheet = wookbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < rows; i++) {
				HSSFRow rowInt = sheet.getRow(0);
				HSSFRow row = sheet.getRow(i);
				if (row != null) {
					int cells = rowInt.getLastCellNum();
					String value = "";
					for (int j = 0; j < cells; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null || cell.equals("")
								|| cell.equals("null")) {
							value += "null" + ",";
						} else {
							switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								value += cell.getNumericCellValue() + ",";
								break;
							case HSSFCell.CELL_TYPE_STRING:
								if (cell.getStringCellValue().equals("")) {
									value += "null" + ",";
								} else {
									value += cell.getStringCellValue() + ",";
								}
								break;
							default:
								value += "null" + ",";
								break;
							}
						}
					}
					String[] val = value.split(",");
					Heater heater = new Heater();
					if (val[0].equals("") || val[0].equals("null")) {
					} else {
						String string = val[0];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							heater.setBuildId(m + "");
						} else {
							heater.setBuildId(string);
						}
					}
					if (val[1].equals("") || val[1].equals("null")) {
					} else {
						String string = val[1];
						String sub = ".0";
						int a = string.indexOf(sub);
						if (a >= 0) {
							long m = Double.valueOf(string).longValue();
							heater.setDeviceNo(m + "");
						} else {
							heater.setDeviceNo(string);
						}
					}
					if (val[2].equals("") || val[2].equals("null")) {
					} else {
						heater.setDescription(val[2]);
					}
					if (val[3].equals("") || val[3].equals("null")) {
					} else {
						heater.setModel(val[3]);
					}
					if (val[4].equals("") || val[4].equals("null")) {
					} else {
						heater.setTotal(Double.valueOf(val[4]).intValue());
					}
					if (val[5].equals("") || val[5].equals("null")) {
					} else {
						heater.setPower(BigDecimal.valueOf(Double
								.valueOf(val[5])));
					}
					deviceService.addHeater(heater);
					File file = new File(filePath);
					if (file.exists())
						file.delete();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		} catch (IOException e) {
			e.printStackTrace();
			File file = new File(filePath);
			if (file.exists())
				file.delete();
		}
	}

	@ResourceMapping(value = "deleteFile")
	public Resultmsg removeFile(ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		try {
			String fileName = request.getParameter("fileName");
			if (fileName.equals("CHI")) {
				fileName = "制冷机.xls";
			}
			if (fileName.equals("BOI")) {
				fileName = "锅炉.xls";
			}
			if (fileName.equals("Pump")) {
				fileName = "水泵.xls";
			}
			if (fileName.equals("Ct")) {
				fileName = "冷却塔.xls";
			}
			if (fileName.equals("Ahu")) {
				fileName = "空调箱.xls";
			}
			if (fileName.equals("Fcu")) {
				fileName = "风机盘管.xls";
			}
			if (fileName.equals("Vav")) {
				fileName = "变风量箱.xls";
			}
			if (fileName.equals("Lighting")) {
				fileName = "灯具.xls";
			}
			if (fileName.equals("Lift")) {
				fileName = "电梯.xls";
			}
			if (fileName.equals("Heater")) {
				fileName = "电加热器.xls";
			}
			PortletContext portletContext = request.getPortletSession()
					.getPortletContext();
			String realPath = portletContext.getRealPath("");
			String addfilePath = "\\uploadfiles\\";
			realPath += addfilePath;
			realPath += fileName;
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

	@ResourceMapping(value = "deleteModelFile")
	public Resultmsg deleteModelFile(ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		try {
			String fileName = request.getParameter("fileName");
			if (fileName.equals("CHIModel")) {
				fileName = "制冷机模板.xls";
			}
			if (fileName.equals("BOIModel")) {
				fileName = "锅炉模板.xls";
			}
			if (fileName.equals("PumpModel")) {
				fileName = "水泵模板.xls";
			}
			if (fileName.equals("CtModel")) {
				fileName = "冷却塔模板.xls";
			}
			if (fileName.equals("AhuModel")) {
				fileName = "空调箱模板.xls";
			}
			if (fileName.equals("FcuModel")) {
				fileName = "风机盘管模板.xls";
			}
			if (fileName.equals("VavModel")) {
				fileName = "变风量箱模板.xls";
			}
			if (fileName.equals("LightingModel")) {
				fileName = "灯具模板.xls";
			}
			if (fileName.equals("LiftModel")) {
				fileName = "电梯模板.xls";
			}
			if (fileName.equals("HeaterModel")) {
				fileName = "电加热器模板.xls";
			}
			PortletContext portletContext = request.getPortletSession()
					.getPortletContext();
			String realPath = portletContext.getRealPath("");
			String addfilePath = "\\uploadfiles\\";
			realPath += addfilePath;
			realPath += fileName;
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

	@ActionMapping(params = "action=submitExcel")
	public void onSubmitExcel(
			@ModelAttribute("buildaddfile") Buildaddfile buildaddfile,
			BindingResult result, SessionStatus status, ActionRequest request,
			ActionResponse response) {
		CommonsMultipartFile file = buildaddfile.getFileData();
		if (file != null && file.getSize() > 0) {
			if (file.getSize() > 10000000) {
				buildaddfile.setMessage("上传失败：文件大小不能超过10M");
			}
			String fileName = file.getOriginalFilename();
			String fileType = file.getContentType();
			if (buildaddfile.getAddfileDate() == null) {
				buildaddfile.setAddfileDate(Calendar.getInstance().getTime());
			}

			buildaddfile.setAddfileSize(file.getSize());
			buildaddfile.setAddfileSuffix(fileType.split("/")[1]);

			PortletContext portletContext = request.getPortletSession()
					.getPortletContext();
			String realPath = portletContext.getRealPath("");
			String addfilePath = "\\uploadfiles\\";
			realPath += addfilePath;
			try {
				FileSystemObject.SaveFileFromInputStream(file.getInputStream(),
						realPath, fileName);
				buildaddfile.setMessage(file.getOriginalFilename() + " 上传成功");
				buildaddfile.setAddfileDate(Calendar.getInstance().getTime());
				response.setRenderParameter(FILEUPLOADSUCCESS, "true");
				this.insertDb(realPath + fileName,
						buildaddfile.getAddfileName());
			} catch (IOException e) {
				buildaddfile.setMessage(e.getMessage());
				File filed = new File(realPath + fileName);
				if (filed.exists())
					filed.delete();
				e.printStackTrace();
				logger.error(e);
			} catch (Exception e) {
				File filed = new File(realPath + fileName);
				if (filed.exists())
					filed.delete();
				e.printStackTrace();
				logger.error(e);
			}
		}
		status.setComplete();
		response.setRenderParameter("action", "success");
	}

	public void insertDb(String filePath, String fileName) {
		if (fileName.equals("chi")) {
			this.importChi(filePath);
		}
		if (fileName.equals("boi")) {
			this.importBoi(filePath);
		}
		if (fileName.equals("pump")) {
			this.importPump(filePath);
		}
		if (fileName.equals("ct")) {
			this.importCt(filePath);
		}
		if (fileName.equals("ahu")) {
			this.importAhu(filePath);
		}
		if (fileName.equals("fcu")) {
			this.importFcu(filePath);
		}
		if (fileName.equals("vav")) {
			this.importVav(filePath);
		}
		if (fileName.equals("lighting")) {
			this.importLighting(filePath);
		}
		if (fileName.equals("lift")) {
			this.importLift(filePath);
		}
		if (fileName.equals("heater")) {
			this.importHeater(filePath);
		}
	}
}
