package com.managementsystem.energy.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.validation.EnergyitemdictValidator;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("EDIT")
public class EditEnergyitemdictController extends BaseController {
	private final Log logger = LogFactory.getLog(EditEnergyitemdictController.class);
	
	@Autowired
	private EnergyitemdictService energyitemdictService;
	
	@Autowired
	private EnergydictService energydictService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}

	/**
	 * 显示为新增数据中心
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editDefView");
		return mav;
	}

	
	/**
	 * 新增分类分项
	 * */
	@RenderMapping(params="action=addEnergyitemdictForm")
	public ModelAndView setupAddEnergyitemdictForm(
			@RequestParam("energyItemcode")String energyItemcode) {	
		ModelAndView mav = new ModelAndView();
		Energyitemdict energyitemdict = new Energyitemdict();
		energyitemdict.setEnergyItemstate(1);
		if(StringUtils.hasLength(energyItemcode)) {
			Energyitemdict parentEnergyitemdict = energyitemdictService.getEnergyitemdict(energyItemcode);
			if(parentEnergyitemdict!=null) {
				energyitemdict.setEnergyitemdict(parentEnergyitemdict);
				energyitemdict.setEnergyItemtype(1);
				energyitemdict.setEnergydict(parentEnergyitemdict.getEnergydict());
			}
		}
		mav.addObject("energyitemdict", energyitemdict);
		mav.addObject("isnew",true);
		mav.setViewName("energyitem/editEnergyitemdict");
		return mav;
	}
	
	/**
	 * 编辑分类分项
	 * @param energyItemcode 分类分项代码
	 * */
	@RenderMapping(params="action=editEnergyitemdictForm")
	public ModelAndView setupEditEnergyitemdictForm(
			@RequestParam("energyItemcode")String energyItemcode) {
		ModelAndView mav = new ModelAndView();
		Energyitemdict energyitemdict = energyitemdictService.getEnergyitemdict(energyItemcode);
		mav.addObject("energyitemdict", energyitemdict);
		mav.addObject("isnew",false);
		mav.setViewName("energyitem/editEnergyitemdict");
		return mav;
	}
	
	/**
	 * 提交并保存分类分项数据
	 * */
	@ResourceMapping(value="submitEnergyitemdictForm")
	public Resultmsg onSubmitEnergyitemdictForm(
			@ModelAttribute("energyitemdict")Energyitemdict energyitemdict,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest, ResourceResponse resResponse) {
		Resultmsg msg = new Resultmsg();
		
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		
		new EnergyitemdictValidator().validate(energyitemdict, result);
		if(result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if(isnew) {
					energyitemdictService.addEnergyitemdict(energyitemdict);
				}else {
					energyitemdictService.updateEnergyitemdict(energyitemdict);
				}
				status.setComplete();
				msg.setMsg(energyitemdict.getEnergyItemcode());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}
	
	/**
	 * 删除分类分项信息
	 *  @param energyItemcode 分类分项代码
	 * */
	@ResourceMapping(value = "removeEnergyitemdict")
	public Resultmsg onRemoveEnergyitemdict(
			@RequestParam("energyItemcode")String energyItemcode) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(energyItemcode)) {
			try {
				energyitemdictService.deleteEnergyitemdict(energyItemcode);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		} else {
			msg.setMsg("分类分项代码不能为空");
		}
		return msg;
	}

	@ResourceMapping(value = "getEnergydicts")
	public JsonResult getEnergydicts() {
		JsonResult result = new JsonResult();
		Set<Energydict> energydicts = energydictService.getEnergydicts();
		result.setData(new ArrayList<Energydict>(energydicts));
		return result;
	}
	
	@SuppressWarnings("rawtypes")
	@ResourceMapping(value = "getEnergyitemdicts")
	public JsonResult getEnergyitemdicts() {
		JsonResult result = new JsonResult();
		List list = energyitemdictService.getEnergyitemdictComboTree();
		result.setData(list);
		return result;
	}
	
}
