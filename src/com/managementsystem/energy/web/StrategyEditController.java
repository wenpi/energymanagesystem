package com.managementsystem.energy.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
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

import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.domain.Strategydetail;
import com.managementsystem.energy.domain.Strategydetailparam;
import com.managementsystem.energy.service.StrategyService;
import com.managementsystem.energy.validation.StrategyValidator;
import com.managementsystem.energy.validation.StrategydetailValidator;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.ui.easyui.Tree;

/**
 * 编辑策略设置
 * */
@Controller
@RequestMapping("VIEW")
public class StrategyEditController extends BaseController {

	private final Log logger = LogFactory.getLog(StrategyEditController.class);

	@Autowired
	private StrategyService strategyService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}

	/**
	 * 默认新增策略
	 * */
	@RenderMapping
	public ModelAndView setup() {
		return getNewStrategyModelAndView("");
	}

	/**
	 * 新增策略
	 * */
	@RenderMapping(params = "action=addStrategy")
	public ModelAndView setupAddStrategy(@RequestParam("strategyid") String strategyid) {
		return getNewStrategyModelAndView(strategyid);
	}

	/**
	 * 返回新增策略视图模块
	 * @param strategyid 策略ID
	 * */
	private ModelAndView getNewStrategyModelAndView(String strategyid) {
		ModelAndView mav = new ModelAndView();
		Strategy strategy = new Strategy();
		if (StringUtils.hasLength(strategyid)) {
			Strategy parentStrategy = strategyService.getStrategy(strategyid);
			if(parentStrategy!=null) {
				strategy.setBuildinfo(parentStrategy.getBuildinfo());
				strategy.setStrategy(parentStrategy);
			}
		}
		strategy.setStatus(-1);
		strategy.setCreatedondate(Calendar.getInstance().getTime());
		mav.addObject("strategy", strategy);
		mav.addObject("isnew", true);
		mav.setViewName("strategy/strategyEdit");
		return mav;
	}

	/**
	 * 编辑策略
	 * */
	@RenderMapping(params = "action=editStrategy")
	public ModelAndView setupEditStrategy(
			@RequestParam("strategyid") String strategyid) {
		ModelAndView mav = new ModelAndView();
		Strategy strategy = strategyService.getStrategy(strategyid);
		Calendar calstart = Calendar.getInstance();
		calstart.set(2000, 0, 1,0,0,0);
		if(strategy.getPlanstartdate().equals(calstart.getTime())) {
			strategy.setPlanstartdate(null);
		}
		
		mav.addObject("strategy", strategy);
		mav.addObject("isnew", false);
		mav.setViewName("strategy/strategyEdit");
		return mav;
	}

	/**
	 * 处理策略表单提交数据
	 * 
	 * */
	@ResourceMapping(value = "submitStrategyForm")
	public Resultmsg onSubmitStrategyForm(
			@ModelAttribute("strategy") Strategy strategy,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest, ResourceResponse resResponse) {
		Resultmsg msg = new Resultmsg();
		Calendar cal = Calendar.getInstance();
		cal.set(2000, 0, 1,0,0,0);
		if (strategy.getPlanstartdate() == null) {
			strategy.setPlanstartdate(cal.getTime());
		}
		if (strategy.getPlanstopdate() == null) {
			strategy.setPlanstopdate(cal.getTime());
		}
		new StrategyValidator().validate(strategy, result);
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if("".equals(strategy.getStrategy().getStrategyid())) {
					strategy.setStrategy(null);
				}
				if (isnew) {
					strategyService.addStrategy(strategy);
				} else {
					strategyService.updateStrategy(strategy);
				}
				status.setComplete();
				msg.setMsg(strategy.getStrategyid());
				msg.setSuccess("true");
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	@ResourceMapping(value = "removeStrategy")
	public Resultmsg onRemoveStrategy(
			@RequestParam("strategyid") String strategyid) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(strategyid)) {
			try {
				strategyService.deleteStrategy(strategyid);
				msg.setSuccess("true");
			}catch(Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		} else {
			msg.setMsg("策略ID不能为空");
		}
		return msg;
	}
	
	/**
	 * 返回所有父级策略
	 * */
	@ResourceMapping(value = "getParentStrategies")
	public JsonResult getParentStrategies(@RequestParam("buildId")String buildId) {
		JsonResult result = new JsonResult();
		List<Tree> list = new ArrayList<Tree>();
		if (StringUtils.hasLength(buildId)) {
			list = strategyService.getStrategiesComboTree(buildId);
		}
		result.setData(list);
		return result;
	}
	

	/**
	 * 编辑策略明细
	 * */
	@RenderMapping(params = "action=strategydetail")
	public ModelAndView setupStrategydetail(
			@RequestParam("strategyid") String strategyid) {
		ModelAndView mav = new ModelAndView();
		Strategy strategy = strategyService.getStrategy(strategyid);
		mav.addObject("strategy", strategy);
		Strategydetail strategydetail = new Strategydetail();
		mav.addObject("strategydetail", strategydetail);
		
		mav.setViewName("strategy/strategyDetailTab");
		return mav;
	}
	
	/**
	 * 异步获取策略明细
	 * @param strategyid 策略ID
	 * */
	@ResourceMapping(value = "getStrategydetails")
	public JsonResult getStrategydetails(@RequestParam("strategyid") String strategyid) {
		JsonResult result = new JsonResult();
		List<Strategydetail> strategydetails = strategyService.getStrategydetails(strategyid);
		result.setData(strategydetails);
		return result;
	}
	
	
	/**
	 * 提交保存策略明细
	 * */
	@ResourceMapping(value = "submitStrategydetailForm")
	public Resultmsg onSubmitStrategydetailForm(@ModelAttribute("strategydetail") Strategydetail strategydetail,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest, ResourceResponse resResponse) {
		Resultmsg msg = new Resultmsg();
		
		new StrategydetailValidator().validate(strategydetail, result);
		if(result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {		
				List<Strategydetailparam> detailparams = strategydetail.getDetailparams();
				strategydetail.setStrategydetailparams(new HashSet<Strategydetailparam>(detailparams));
				strategyService.saveOrUpdate(strategydetail);
				status.setComplete();
				msg.setMsg(strategydetail.getDetailid());
				msg.setSuccess("true");
			}catch(Exception e) {
				logger.error(e);
				e.printStackTrace();
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	/**
	 * 返回指定明细ID的明细参数列表
	 * @param detailid 明细ID
	 * */
	@ResourceMapping(value="getStrategydetailparams")
	public JsonResult getStrategydetailparams(@RequestParam("detailid")String detailid) {
		JsonResult result = new JsonResult();
		List<Strategydetailparam> list = strategyService.getStrategydetailparamsBydetailid(detailid);	
		result.setData(list);
		return result;
	}
	
	/**
	 * 删除指定的策略明细
	 * @param detailid 策略明细ID
	 * */
	@ResourceMapping(value = "removeStrategydetail")
	public Resultmsg onRemoveStrategydetail(
			@RequestParam("detailid") String detailid) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(detailid)) {
			try {
				strategyService.deleteStrategydetail(detailid);
				msg.setSuccess("true");
			}catch(Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		} else {
			msg.setMsg("策略明细ID不能为空");
		}
		return msg;
	}
}
