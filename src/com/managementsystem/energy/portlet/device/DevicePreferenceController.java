package com.managementsystem.energy.portlet.device;

import java.util.List;

import javax.portlet.ResourceRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.DeviceService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("Edit")
public class DevicePreferenceController extends BaseController {
	private final Log logger = LogFactory
			.getLog(DevicePreferenceController.class);

	@Autowired
	private DeviceService deviceService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	/**
	 * 新增制冷机信息
	 * */
	@RenderMapping(params = "action=addChiForm")
	public ModelAndView setupAddChiForm() {
		ModelAndView mav = new ModelAndView();
		Chi chi = new Chi();
		mav.addObject("chi", chi);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editChi");
		return mav;
	}

	/**
	 * 编辑制冷机信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editChiForm")
	public ModelAndView setupEditBuildinfoForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Chi chi = deviceService.getChi(ids);
		mav.addObject("chi", chi);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editChi");
		return mav;
	}

	@ResourceMapping(value = "submitChiForm")
	public Resultmsg onSubmitChiForm(@ModelAttribute("chi") Chi chi,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addChi(chi);
				} else {
					deviceService.updateChi(chi);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(chi.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeChi")
	public Resultmsg removeChi(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteChi(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增锅炉信息
	 * */
	@RenderMapping(params = "action=addBoiForm")
	public ModelAndView setupAddBoiForm() {
		ModelAndView mav = new ModelAndView();
		Boi boi = new Boi();
		mav.addObject("boi", boi);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editBoi");
		return mav;
	}

	/**
	 * 编辑锅炉信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editBoiForm")
	public ModelAndView setupEditBoiForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Boi boi = deviceService.getBoi(ids);
		mav.addObject("boi", boi);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editBoi");
		return mav;
	}

	@ResourceMapping(value = "submitBoiForm")
	public Resultmsg onSubmitBoiForm(@ModelAttribute("boi") Boi boi,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addBoi(boi);
				} else {
					deviceService.updateBoi(boi);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(boi.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeBoi")
	public Resultmsg removeBoi(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteBoi(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增水泵信息
	 * */
	@RenderMapping(params = "action=addPumpForm")
	public ModelAndView setupAddPumpForm() {
		ModelAndView mav = new ModelAndView();
		Pump pump = new Pump();
		mav.addObject("pump", pump);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editPump");
		return mav;
	}

	/**
	 * 编辑水泵信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editPumpForm")
	public ModelAndView setupEditPumpForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Pump pump = deviceService.getPump(ids);
		mav.addObject("pump", pump);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editPump");
		return mav;
	}

	@ResourceMapping(value = "submitPumpForm")
	public Resultmsg onSubmitPumpForm(@ModelAttribute("pump") Pump pump,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addPump(pump);
				} else {
					deviceService.updatePump(pump);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(pump.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removePump")
	public Resultmsg removePump(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deletePump(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增冷却塔信息
	 * */
	@RenderMapping(params = "action=addCtForm")
	public ModelAndView setupAddCtForm() {
		ModelAndView mav = new ModelAndView();
		Ct ct = new Ct();
		mav.addObject("ct", ct);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editCt");
		return mav;
	}

	/**
	 * 编辑冷却塔信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editCtForm")
	public ModelAndView setupEditCtForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Ct ct = deviceService.getCt(ids);
		mav.addObject("ct", ct);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editCt");
		return mav;
	}

	@ResourceMapping(value = "submitCtForm")
	public Resultmsg onSubmitCtForm(@ModelAttribute("ct") Ct ct,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addCt(ct);
				} else {
					deviceService.updateCt(ct);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(ct.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeCt")
	public Resultmsg removeCt(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteCt(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增空调箱信息
	 * */
	@RenderMapping(params = "action=addAhuForm")
	public ModelAndView setupAddAhuForm() {
		ModelAndView mav = new ModelAndView();
		Ahu ahu = new Ahu();
		mav.addObject("ahu", ahu);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editAhu");
		return mav;
	}

	/**
	 * 编辑空调箱信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editAhuForm")
	public ModelAndView setupEditAhuForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Ahu ahu = deviceService.getAhu(ids);
		mav.addObject("ahu", ahu);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editAhu");
		return mav;
	}

	@ResourceMapping(value = "submitAhuForm")
	public Resultmsg onSubmitAhuForm(@ModelAttribute("ahu") Ahu ahu,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addAhu(ahu);
				} else {
					deviceService.updateAhu(ahu);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(ahu.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeAhu")
	public Resultmsg removeAhu(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteAhu(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增风机盘管信息
	 * */
	@RenderMapping(params = "action=addFcuForm")
	public ModelAndView setupAddFcuForm() {
		ModelAndView mav = new ModelAndView();
		Fcu fcu = new Fcu();
		mav.addObject("fcu", fcu);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editFcu");
		return mav;
	}

	/**
	 * 编辑风机盘管信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editFcuForm")
	public ModelAndView setupEditFcuForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Fcu fcu = deviceService.getFcu(ids);
		mav.addObject("fcu", fcu);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editFcu");
		return mav;
	}

	@ResourceMapping(value = "submitFcuForm")
	public Resultmsg onSubmitFcuForm(@ModelAttribute("fcu") Fcu fcu,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addFcu(fcu);
				} else {
					deviceService.updateFcu(fcu);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(fcu.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeFcu")
	public Resultmsg removeFcu(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteFcu(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增变风量箱信息
	 * */
	@RenderMapping(params = "action=addVavForm")
	public ModelAndView setupAddVavForm() {
		ModelAndView mav = new ModelAndView();
		Vav vav = new Vav();
		mav.addObject("vav", vav);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editVav");
		return mav;
	}

	/**
	 * 编辑变风量箱信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editVavForm")
	public ModelAndView setupEditVavForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Vav vav = deviceService.getVav(ids);
		mav.addObject("vav", vav);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editVav");
		return mav;
	}

	@ResourceMapping(value = "submitVavForm")
	public Resultmsg onSubmitVavForm(@ModelAttribute("vav") Vav vav,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addVav(vav);
				} else {
					deviceService.updateVav(vav);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(vav.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeVav")
	public Resultmsg removeVav(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteVav(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增灯具信息
	 * */
	@RenderMapping(params = "action=addLightingForm")
	public ModelAndView setupAddLightingForm() {
		ModelAndView mav = new ModelAndView();
		Lighting lighting = new Lighting();
		mav.addObject("lighting", lighting);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editLighting");
		return mav;
	}

	/**
	 * 编辑灯具信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editLightingForm")
	public ModelAndView setupEditLightingForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Lighting lighting = deviceService.getLighting(ids);
		mav.addObject("lighting", lighting);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editLighting");
		return mav;
	}

	@ResourceMapping(value = "submitLightingForm")
	public Resultmsg onSubmitLightingForm(
			@ModelAttribute("lighting") Lighting lighting,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addLighting(lighting);
				} else {
					deviceService.updateLighting(lighting);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(lighting.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeLighting")
	public Resultmsg removeLighting(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteLighting(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增电梯信息
	 * */
	@RenderMapping(params = "action=addLiftForm")
	public ModelAndView setupAddLiftForm() {
		ModelAndView mav = new ModelAndView();
		Lift lift = new Lift();
		mav.addObject("lift", lift);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editLift");
		return mav;
	}

	/**
	 * 编辑电梯信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editLiftForm")
	public ModelAndView setupEditLiftForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Lift lift = deviceService.getLift(ids);
		mav.addObject("lift", lift);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editLift");
		return mav;
	}

	@ResourceMapping(value = "submitLiftForm")
	public Resultmsg onSubmitLiftForm(@ModelAttribute("lift") Lift lift,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addLift(lift);
				} else {
					deviceService.updateLift(lift);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(lift.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeLift")
	public Resultmsg removeLift(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteLift(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	
	/**
	 * 新增电加热器信息
	 * */
	@RenderMapping(params = "action=addHeaterForm")
	public ModelAndView setupAddHeaterForm() {
		ModelAndView mav = new ModelAndView();
		Heater heater = new Heater();
		mav.addObject("heater", heater);
		mav.addObject("isnew", true);
		mav.setViewName(PORTLETFOLDER + "device/editHeater");
		return mav;
	}

	/**
	 * 编辑电加热器信息
	 * 
	 * @param Id
	 * 
	 * */
	@RenderMapping(params = "action=editHeaterForm")
	public ModelAndView setupEditHeaterForm(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		long ids = Long.parseLong(id);
		Heater heater = deviceService.getHeater(ids);
		mav.addObject("heater", heater);
		mav.addObject("isnew", false);
		mav.setViewName(PORTLETFOLDER + "device/editHeater");
		return mav;
	}

	@ResourceMapping(value = "submitHeaterForm")
	public Resultmsg onSubmitHeaterForm(@ModelAttribute("heater") Heater heater,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					deviceService.addHeater(heater);
				} else {
					deviceService.updateHeater(heater);
				}
				status.setComplete();
				msg.setMsg(String.valueOf(heater.getId()));
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除信息
	 * 
	 * @param
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeHeater")
	public Resultmsg removeHeater(@RequestParam("id") String id) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(id)) {
			try {
				long idLong = Long.parseLong(id);
				deviceService.deleteHeater(idLong);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
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
}
