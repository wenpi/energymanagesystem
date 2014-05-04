package com.managementsystem.energy.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.domain.Energyitemresult;
import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.MeteruseattributeId;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.service.EnergyitemresultService;
import com.managementsystem.energy.service.MeterproService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.energy.validation.CircuitinfoValidator;
import com.managementsystem.energy.validation.MeteruseattributeValidator;
import com.managementsystem.energy.validation.MeteruseinfoValidator;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("EDIT")
public class EditCircuitController extends BaseController {

	private static final Log logger = LogFactory.getLog(EditSettingController.class);

	@Autowired
	private CircuitinfoService circuitinfoService;
	
	@Autowired
	private MeteruseinfoService meteruseinfoService;

	@Autowired
	public MeterproService meterproService;
	
	@Autowired
	private BuildregioninfoService buildregioninfoService;

	@Autowired
	private EnergyitemdictService energyitemdictService;  //能耗分类分项服务接口
	
	@Autowired
	private EnergyitemresultService energyitemresultService;	//分类分项及装表关系服务接口

	/**
	 * 显示显示为新增数据中心
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editDefView");
		return mav;
	}

	@RenderMapping(params = "action=success")
	public String processSuccess() {
		return "success";
	}

	/**
	 * 新增支路信息
	 * */
	@RenderMapping(params = "action=addCircuitinfoForm")
	public ModelAndView setupAddCircuitinfoForm(
			@RequestParam("circuitId") String circuitId,
			RenderRequest request,RenderResponse response) {
		ModelAndView mav = new ModelAndView();
		Circuitinfo circuitinfo = new Circuitinfo();
		if (StringUtils.hasLength(circuitId)) {
			Circuitinfo parentCircuitinfo = circuitinfoService
					.getCircuitinfo(circuitId);
			if (parentCircuitinfo != null) {
				circuitinfo.setBuildinfo(parentCircuitinfo.getBuildinfo());
				circuitinfo.setCircuitinfo(parentCircuitinfo);
			}
		}
		circuitinfo.setCircuitState(1);
		mav.addObject("circuitinfo", circuitinfo);
		
		mav.addObject("isnew", true);
		mav.setViewName("circuit/editCircuitinfo");
		return mav;
	}

	/**
	 * 修改支路信息
	 * 
	 * @param circuitId
	 *            支路ID
	 * */
	@RenderMapping(params = "action=editCircuitinfoForm")
	public ModelAndView setupEditCircuitinfoForm(
			@RequestParam("circuitId") String circuitId,
			RenderRequest request,RenderResponse response) {
		ModelAndView mav = new ModelAndView();
		Circuitinfo circuitinfo = circuitinfoService.getCircuitinfo(circuitId);
		mav.addObject("circuitinfo", circuitinfo);
		mav.addObject("isnew", false);
		request.setAttribute("circuitId", circuitId);
		mav.addObject("circuitId",circuitId);
		mav.setViewName("circuit/editCircuitinfo");
		return mav;
	}

	/**
	 * 提交并保存支路信息
	 * */
	@ResourceMapping(value = "submitCircuitinfoForm")
	public Resultmsg onSubmitCircuitinfoForm(
			@ModelAttribute("circuitinfo") Circuitinfo circuitinfo,
			BindingResult result, SessionStatus status, ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (request.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
		} else {
			isnew = Boolean.valueOf(request.getParameter("isnew"));
		}
		new CircuitinfoValidator().validate(circuitinfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					circuitinfoService.addCircuitinfo(circuitinfo);
				} else {
					circuitinfoService.updateCircuitinfo(circuitinfo);
				}
				status.setComplete();
				msg.setMsg(circuitinfo.getCircuitId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 删除支路信息
	 * 
	 * @param circuitId
	 *            支路ID
	 * */
	@ResourceMapping(value = "removeCircuitinfo")
	public Resultmsg onRemoveCircuitinfo(
			@RequestParam("circuitId") String circuitId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(circuitId)) {
			try {
				circuitinfoService.deleteCircuitinfo(circuitId);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		} else {
			msg.setMsg("支路ID为空");
		}
		return msg;
	}

	/**
	 * 返回所有支路信息
	 * */
	@SuppressWarnings("rawtypes")
	@ResourceMapping(value = "getCircuitinfos")
	public JsonResult getCircuitinfos(@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		List list = new ArrayList();
		if (StringUtils.hasLength(buildId)) {
			list = circuitinfoService.getCircuitComboTree(buildId);
		} else {
			list = circuitinfoService.getCircuitComboTree("");
		}
		result.setData(list);
		return result;
	}

	/**
	 * 支路装表信息
	 * */
	@RenderMapping(params = "action=meteruseinfo")
	public ModelAndView setupMeteruseinfo(
			@RequestParam("circuitId") String circuitId) {
		ModelAndView mav = new ModelAndView();
		Circuitinfo circuitinfo = null;
		Meteruseinfo meteruseinfo = new Meteruseinfo();
		if (StringUtils.hasLength(circuitId)) {
			circuitinfo = circuitinfoService.getCircuitinfo(circuitId);
			meteruseinfo.setCircuitinfo(circuitinfo);
		}
		Meteruseattribute meteruseattribute = new Meteruseattribute();
		Energyitemresult energyitemresult = new Energyitemresult();
		mav.addObject("circuitinfo", circuitinfo); //支路信息
		mav.addObject("meteruseinfo", meteruseinfo); //仪表使用信息
		mav.addObject("meteruseattribute", meteruseattribute); //仪表属性
		mav.addObject("energyitemresult", energyitemresult); //能耗分类分项及装表关系
		mav.addObject("isnew", false);
		mav.setViewName("circuit/editMeteruseinfoTab");
		return mav;
	}

	@ResourceMapping(value="submitMeteruseinfoForm")
	public Resultmsg onSubmitMeteruseinfoForm(
			@ModelAttribute("meteruseinfo")Meteruseinfo meteruseinfo,
			BindingResult result, SessionStatus status, ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (request.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
		} else {
			isnew = Boolean.valueOf(request.getParameter("isnew"));
		}
		new MeteruseinfoValidator().validate(meteruseinfo,result);
		if(result.hasErrors()) {
			logger.error(result);
			StringBuilder sb = new StringBuilder();
			for(ObjectError err : result.getAllErrors()) {
				sb.append(err.getDefaultMessage());
			}
			msg.setMsg(sb.toString());
		} else {
			try {
				if(!StringUtils.hasLength(meteruseinfo.getBuildregioninfo().getRegionId())){
					meteruseinfo.setBuildregioninfo(null);
				}
				Circuitinfo circuitinfo = circuitinfoService.getCircuitinfo(meteruseinfo.getCircuitinfo().getCircuitId());
				meteruseinfo.setCircuitinfo(circuitinfo);
				if("系统生成".equals(meteruseinfo.getMeterId()) || "".equals(meteruseinfo.getMeterId())) {
					meteruseinfoService.addMeteruseinfo(meteruseinfo);
				} else {
					meteruseinfoService.updateMeteruseinfo(meteruseinfo);
				}
				
				//meteruseinfoService.saveOrUpdateMeteruseinfo(meteruseinfo);
				
				//保存分类分项与装表关系数据
				if(StringUtils.hasLength(request.getParameter("energyItemcode"))) {
					String energyItemcode = request.getParameter("energyItemcode").trim();
					String resultId = request.getParameter("resultId").trim();
					Energyitemresult energyitemresult = new Energyitemresult();
					energyitemresult.setResultId(resultId);
					energyitemresult.setMeteruseinfo(meteruseinfo);
					Energyitemdict energyitemdict = energyitemdictService.getEnergyitemdict(energyItemcode);
					energyitemresult.setEnergyitemdict(energyitemdict);
					energyitemresultService.saveOrUpdateEnergyitemresult(energyitemresult);
				}
				status.setComplete();
				msg.setMsg(meteruseinfo.getMeterId());
				msg.setSuccess("true");
			} catch(Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	
	/**
	 * 删除仪表信息
	 * */
	@ResourceMapping(value="removeMeteruseinfo")
	public Resultmsg onRemoveMeteruseinfo(@RequestParam("meterId") String meterId) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(meterId)) {
			try {
				meteruseinfoService.deleteMeteruseinfo(meterId);
				msg.setSuccess("true");
			} catch(Exception e) {
				msg.setMsg(e.getMessage());
			}
		} else {
			msg.setMsg("仪表ID为空");
		}
		
		
		return msg;
	}
	

	
	/**
	 *  获取仪表产品信息
	 *  @param page 当前页码
	 *  @param rows 每页显示条数
	 * */
	@ResourceMapping(value="getMeterproinfos")
	public Page getMeterproinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapParams = new HashMap<String,Object>();
		Page dcPaged = meterproService.getMeterproinfos(page, rows,mapParams);
		return dcPaged;
	}
	
	@ModelAttribute("meterTypes")
	public Set<Dictitem> getMeterTypes() {
		return dictionaryService.getDictitemBygroupCode("meter_type");
	}
	
	/**
	 * 获取建筑区域树
	 * */
	@ResourceMapping(value="getBuildregioninfoByBuildId")
	public Page getBuildregionComboTree(
			@RequestParam("buildId") String buildId,
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapParams = new HashMap<String,Object>();
		Page regions = buildregioninfoService.getBuildregioninfos(buildId,page, rows, mapParams);
		return regions;
	}
	
	/**
	 * 获取指定支路的安装仪表
	 * @param circuitid 支路ID
	 * @param page	当前页码
	 * @param rows	显示条数
	 * */
	@ResourceMapping(value="getMeteruseinfosByCircuitid")
	public Page getMeteruseinfosByCircuitid(
			@RequestParam("circuitId") String circuitId,
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapParams = new HashMap<String,Object>();
		mapParams.put("circuit_Id", circuitId);
		return meteruseinfoService.getMeteruseinfos(page, rows, mapParams);
	}
	
	/**
	 * 获取仪表属性列表
	 * */
	@ResourceMapping(value="getMeteruseattributes")
	public JsonResult getMeteruseattributes(
			@RequestParam("meterId") String meterId) {
		JsonResult result = new JsonResult();
		Set<Meteruseattribute> attrs = meteruseinfoService.getMeteruseattributeByMeterId(meterId);
		result.setData(new ArrayList<Meteruseattribute>(attrs));
		return result;
	}
	
	/**
	 * 获取能耗分类分项分页数据
	 * */
	@ResourceMapping(value="getEnergyitemdicts")
	public Page getEnergyitemdicts(ResourceRequest request,
			ResourceResponse response) {
		int page=1,rows=1000;
		if(request.getParameter("page")!=null) {
			String sPage = request.getParameter("page");
			if(org.apache.commons.lang3.StringUtils.isNumeric(sPage)) {
				page = Integer.parseInt(sPage);
			}
		}
		if(request.getParameter("rows")!=null) {
			String sRows = request.getParameter("rows");
			if(org.apache.commons.lang3.StringUtils.isNumeric(sRows)) {
				rows = Integer.parseInt(sRows);
			}
		}
		return energyitemdictService.getPagedEnergyitemdicts(page, rows);
	}
	
	/**
	 * 获取分类分项及装表关系对象
	 * */
	@ResourceMapping(value="getEnergyitemresult")
	public Map<String,Object> getEnergyitemresult(ResourceRequest request,
			ResourceResponse response) {
		String meterId = "";
		if(StringUtils.hasLength(request.getParameter("meterId"))) {
			meterId = request.getParameter("meterId");
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if("".equals(meterId)){
			map.put("errmsg", "装表ID不能为空");
		} else {
			Energyitemresult energyitemresult  = energyitemresultService.getEnergyitemresultByMeterId(meterId);
			map.put("energyitemresult", energyitemresult);
		}
		return map;
	}
	
	/**
	 * 获取仪表参数列表
	 * */
	@ResourceMapping(value="getMeterparaminfos")
	public Map<String,Object> getMeterparaminfosByProductid(ResourceRequest request,
			ResourceResponse response) {
		String meterProductid = "";
		if(StringUtils.hasLength(request.getParameter("meterProductid"))) {
			meterProductid = request.getParameter("meterProductid");
		}
		Map<String,Object> map = new HashMap<String,Object>();
		if("".equals(meterProductid)){
			map.put("errmsg", "装表ID不能为空");
		} else {
			Set<Meterparaminfo> meterparaminfos = meterproService.getMeterparaminfosByProductid(meterProductid);
			map.put("meterparaminfos", meterparaminfos);
		}
		return map;
	}
	
	
	
	/**
	 * 执行仪表属性提交
	 * */
	@ResourceMapping(value="submitMeteruseattributeForm")
	public Resultmsg onSubmitMeteruseattributeForm(
			@ModelAttribute("meteruseattribute")Meteruseattribute meteruseattribute,
			BindingResult result,SessionStatus status,
			ResourceRequest request,
			ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		
		String meterId = "";
		if(request.getParameter("meterId")!=null) {
			meterId = request.getParameter("meterId");
			MeteruseattributeId id = new MeteruseattributeId();
			id.setMeterId(meterId);
			id.setMeterattrName(meteruseattribute.getId().getMeterattrName());
			meteruseattribute.setId(id);
		}
		
		new MeteruseattributeValidator().validate(meteruseattribute, result);
		if(result.hasErrors()) {
			logger.error(result);
			StringBuilder sb = new StringBuilder();
			for(ObjectError err : result.getAllErrors()) {
				sb.append(err.getDefaultMessage());
			}
			msg.setMsg(sb.toString());
		} else {
			try {
				meteruseinfoService.saveOrUpdateMeteruseattribute(meteruseattribute);
				status.setComplete();
				msg.setSuccess("true");
			} catch(Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	/**
	 * 删除指定的仪表属性
	 * 
	 * @param meterId 		仪表ID
	 * @param meterattrName 属性名称
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value="removeAttribute")
	public Resultmsg onRemoveAttribute(
			@RequestParam("meterId") String meterId,
			@RequestParam("meterattrName") String meterattrName) {
		Resultmsg msg = new Resultmsg();
		if(!StringUtils.hasLength(meterId)) {
			msg.setMsg("未能获取到仪表ID");
		} else if(!StringUtils.hasLength(meterattrName)) {
			msg.setMsg("未能获取到属性名称");
		} else {
			try {
				meteruseinfoService.deleteMeteruseattribute(meterattrName, meterId);
				msg.setSuccess("true");
			}catch(Exception e) {
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	
}
