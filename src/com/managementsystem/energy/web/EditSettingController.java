package com.managementsystem.energy.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.theme.ThemeDisplay;
import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Bigdistrictrelainfo;
import com.managementsystem.energy.domain.Datacenterinfo;
import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.domain.EnergyItemStandardDetail;
import com.managementsystem.energy.domain.EnergyRegionalStandardDetail;
import com.managementsystem.energy.domain.EnergyStandard;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.domain.Energyprice;
import com.managementsystem.energy.service.BigdistrictinfoService;
import com.managementsystem.energy.service.DatacenterService;
import com.managementsystem.energy.service.DictionaryService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.EnergyStandardService;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.service.EnergypriceService;
import com.managementsystem.energy.validation.BigdistrictinfoValidator;
import com.managementsystem.energy.validation.BigdistrictrelainfoValidator;
import com.managementsystem.energy.validation.DatacenterinfoValidator;
import com.managementsystem.energy.validation.DictitemValidator;
import com.managementsystem.energy.validation.DistrictinfoValidator;
import com.managementsystem.energy.validation.EnergydictValidator;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.util.dao.Page;

/**
 * 
 * */
@Controller
@RequestMapping("EDIT")
public class EditSettingController  extends BaseController {

	private final Log logger = LogFactory.getLog(EditSettingController.class);

	@Autowired
	private DatacenterService datacenterService;

	@Autowired
	private DistrictService districtService;

	@Autowired
	private EnergydictService energydictService;

	@Autowired
	private DictionaryService dictionaryService;
	
	@Autowired
	private BigdistrictinfoService bigdistrictinfoService;
	
	@Autowired
	private EnergypriceService energypriceService;
	
	@Autowired
	private EnergyStandardService energyStandardService;
	
	@Autowired
	private EnergyitemdictService energyitemdictService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
	
	/**
	 * 显示显示为新增数据中心
	 * */
	@RenderMapping
	public ModelAndView setup() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("editDefView");
		return mav;
	}
	
	/**
	 * 设置新增数据中心表单
	 * */
	@RenderMapping(params = "action=addDatacenterForm")
	public ModelAndView setupAddDatacenterForm() {
		ModelAndView mav = new ModelAndView();
		Datacenterinfo datacenterinfo = new Datacenterinfo();
		mav.addObject("datacenterinfo", datacenterinfo);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editDatacenter");
		return mav;
	}

	/**
	 * 设置编辑数据中心表单
	 * 
	 * @param datacenterId
	 *            数据中心ID
	 * */
	@RenderMapping(params = "action=editDatacenterForm")
	public ModelAndView setupEditDatacenterForm(
			@RequestParam("datacenterId") String datacenterId) {
		ModelAndView mav = new ModelAndView();
		Datacenterinfo datacenterinfo = datacenterService
				.getDatacenterinfo(datacenterId);
		mav.addObject("datacenterinfo", datacenterinfo);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editDatacenter");
		return mav;
	}

	/**
	 * 保存数据中心数据
	 * */
	@ResourceMapping(value = "submitDatacenterForm")
	public Resultmsg processSubmitDatacenterForm(
			@ModelAttribute("datacenterinfo") Datacenterinfo datacenterinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();

		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		}

		new DatacenterinfoValidator().validate(datacenterinfo, result);
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if (isnew) {
					datacenterService.addDatacenterinfo(datacenterinfo);
				} else {
					datacenterService.updateDatacenterinfo(datacenterinfo);
				}
				status.setComplete();
				msg.setMsg(datacenterinfo.getDatacenterId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 删除数据中心
	 * 
	 * @param datacenterId
	 *            数据中心ID
	 * */
	@ResourceMapping(value = "removeDatacenter")
	public Resultmsg processRemoveDatacenter(
			@RequestParam("datacenterId") String datacenterId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(datacenterId)) {
			try {
				datacenterService.deleteDatacenterinfo(datacenterId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增数据字典项
	 * */
	@RenderMapping(params = "action=addDictitemForm")
	public ModelAndView setupAddDictitemForm(
			@RequestParam("groupCode") String groupCode) {
		ModelAndView mav = new ModelAndView();
		Dictitem dictitem = new Dictitem();
		Dictgroup dictgroup = dictionaryService.getDictgroup(groupCode);
		dictitem.setDictgroup(dictgroup);
		mav.addObject("dictitem", dictitem);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editDictionary");
		return mav;
	}

	/**
	 * 编辑数据字典项
	 * 
	 * @param itemCode
	 *            字典项代码
	 * @param groupCode
	 *            字典分组代码
	 * */
	@RenderMapping(params = "action=editDictitemForm")
	public ModelAndView setupEditDictitemForm(
			@RequestParam("itemId") String itemId) {
		ModelAndView mav = new ModelAndView();
		Dictitem dictitem = dictionaryService.getDictitem(itemId);
		mav.addObject("dictitem", dictitem);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editDictionary");
		return mav;
	}

	/**
	 * 保存数据字典项
	 * */
	@ResourceMapping(value = "submitDictitemForm")
	public Resultmsg processSubmitDictitemForm(
			@ModelAttribute("dictitem") Dictitem dictitem,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {

		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		}

		new DictitemValidator().validate(dictitem, result);
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if (isnew) {
					dictionaryService.addDictitem(dictitem);
				} else {
					dictionaryService.updateDictitem(dictitem);
				}
				status.setComplete();
				msg.setMsg(dictitem.getItemId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 删除数据字典
	 * 
	 * @param datacenterId
	 *            数据中心ID
	 * */
	@ResourceMapping(value = "removeDictitem")
	public Resultmsg processRemoveDictitem(
			@RequestParam("itemId") String itemId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(itemId)) {
			try {
				dictionaryService.deleteDictitem(itemId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 设置行政区划新增表单
	 * */
	@RenderMapping(params = "action=addDistrictForm")
	public ModelAndView setupAddDistrictForm() {
		ModelAndView mav = new ModelAndView();
		Districtinfo districtinfo = new Districtinfo();
		mav.addObject("districtinfo", districtinfo);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editDistrict");
		return mav;
	}

	/**
	 * 设置行政区划编辑表单
	 * */
	@RenderMapping(params = "action=editDistrictForm")
	public ModelAndView setupEditDistrictForm(
			@RequestParam("districtId") String districtId) {
		ModelAndView mav = new ModelAndView();
		Districtinfo districtinfo = districtService.getDistrictinfo(districtId);
		mav.addObject("districtinfo", districtinfo);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editDistrict");
		return mav;
	}

	/**
	 * 保存行政区划
	 * */
	@ResourceMapping(value = "submitDistrictForm")
	public Resultmsg processSubmitDistrictForm(
			@ModelAttribute("districtinfo") Districtinfo districtinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {

		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		}
		new DistrictinfoValidator().validate(districtinfo, result);
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if (isnew) {
					districtService.addDistrictinfo(districtinfo);
				} else {
					districtService.updateDistrictinfo(districtinfo);
				}
				status.setComplete();
				msg.setMsg(districtinfo.getDistrictId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	/**
	 * 设置
	 * */
	@RenderMapping(params = "action=addEnergypriceForm")
	public ModelAndView setupAddEnergypriceForm() {
		ModelAndView mav = new ModelAndView();
		Energyprice energyprice = new Energyprice();
		mav.addObject("energyprice", energyprice);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editListEnergyprice");
		return mav;
	}
	
	/**
	 * 修改
	 * */
	@RenderMapping(params = "action=editEnergypriceForm")
	public ModelAndView setupEditEnergypriceForm(
			@RequestParam("priceid") String priceid) {
		ModelAndView mav = new ModelAndView();
		Energyprice energyprice = energypriceService.getEnergyprice(priceid);
		mav.addObject("energyprice", energyprice);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editListEnergyprice");
		return mav;
	}

	
	/**
	 * 保存
	 * */
	@ResourceMapping(value = "submitEnergypriceForm")
	public Resultmsg processSubmitEnergypriceForm(
			@ModelAttribute("energyprice") Energyprice energyprice,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest
				.getAttribute(WebKeys.THEME_DISPLAY);
		User user = null;
		user = themeDisplay.getUser();
		Long organizationid = user.getCompanyId();
		energyprice.setOrganizationid(organizationid);
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		}
		
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if (isnew) {
					energypriceService.addEnergyprice(energyprice);
				} else {
					energypriceService.updateEnergyprice(energyprice);
				}
				status.setComplete();
				msg.setMsg(energyprice.getPriceid());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	/**
	 * 删除
	 * 
	 * @param energydictId
	 *            能源ID
	 * */
	@ResourceMapping(value = "removeEnergyprice")
	public Resultmsg processRemoveEnergyprice(
			@RequestParam("priceid") String priceid) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(priceid)) {
			try {
				energypriceService.deleteEnergyprice(priceid);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	
	/**
	 * 设置
	 * */
	@RenderMapping(params = "action=addEnergystandardForm")
	public ModelAndView setupAddEnergystandardForm() {
		ModelAndView mav = new ModelAndView();
		EnergyStandard energyStandard = new EnergyStandard();
		mav.addObject("energyStandard", energyStandard);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editEnergystandard");
		return mav;
	}
	
	/**
	 * 修改
	 * */
	@RenderMapping(params = "action=editEnergystandardForm")
	public ModelAndView setupEnergystandardForm(
			@RequestParam("standardId") String standardId) {
		ModelAndView mav = new ModelAndView();
		EnergyStandard energyStandard = energyStandardService.getEnergyStandard(standardId);
		mav.addObject("energyStandard", energyStandard);
		mav.addObject("isnew", false);
		Date now = Calendar.getInstance().getTime();
		EnergyRegionalStandardDetail energyRegionalStandardDetail = new EnergyRegionalStandardDetail();
		energyRegionalStandardDetail.setCreatedOnDate(now);
		energyRegionalStandardDetail.setLastModifiedOnDate(now);
		mav.addObject("energyRegionalStandardDetail", energyRegionalStandardDetail);
		EnergyItemStandardDetail energyItemStandardDetail = new EnergyItemStandardDetail();
		energyItemStandardDetail.setCreatedOnDate(now);
		energyItemStandardDetail.setLastModifiedOnDate(now);
		mav.addObject("energyItemStandardDetail", energyItemStandardDetail);
		mav.setViewName("setting/editEnergystandard");
		return mav;
	}
	
	@ResourceMapping(value = "findEnergyRegionalStandardDetails")
	public Datagrid findEnergyRegionalStandardDetails(ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Datagrid data = new Datagrid();
		String standardId = "";
		if (resourceRequest.getParameter("standardId") != null)
			standardId = resourceRequest.getParameter("standardId");	
		try {
			Set<EnergyRegionalStandardDetail> energyRegionalStandardDetail = energyStandardService.findEnergyRegionalStandardDetails(standardId);
			List<EnergyRegionalStandardDetail> details = new ArrayList<EnergyRegionalStandardDetail>(energyRegionalStandardDetail);
			data.setTotal(new Long(details.size()));
			data.setRows(details);
		}catch(Exception e) {
			data.setTotal(0l);
			data.setRows(null);
			logger.error(e);
		}	
		return data;
	}
	
	@ResourceMapping(value = "findEnergyItemStandardDetails")
	public Datagrid findEnergyItemStandardDetails(ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Datagrid data = new Datagrid();
		String standardId = "";
		if (resourceRequest.getParameter("standardId") != null)
			standardId = resourceRequest.getParameter("standardId");	
		try {
			Set<EnergyItemStandardDetail> energyItemStandardDetail = energyStandardService.findEnergyItemStandardDetails(standardId);
			List<EnergyItemStandardDetail> details = new ArrayList<EnergyItemStandardDetail>(energyItemStandardDetail);
			data.setTotal(new Long(details.size()));
			data.setRows(details);
		}catch(Exception e) {
			data.setTotal(0l);
			data.setRows(null);
			logger.error(e);
		}	
		return data;
	}
	
	/**
	 * 保存
	 * */
	@ResourceMapping(value = "submitEnergystandardForm")
	public Resultmsg processSubmitEnergypriceForm(
			@ModelAttribute("energyStandard") EnergyStandard energyStandard,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		if(energyStandard.getIsdefault()==1){
			List<EnergyStandard> list = energyStandardService.energyStandardList(energyStandard.getStandardType());
			if(list.size()>0){
				 if(list.size()==1 && list.get(0).getStandardId().equals(energyStandard.getStandardId())){
					 ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest
								.getAttribute(WebKeys.THEME_DISPLAY);
						User user = null;
						user = themeDisplay.getUser();
						Long companyId = user.getCompanyId();
						energyStandard.setCompanyId(companyId);
						boolean isnew = true;
						if (resourceRequest.getParameter("isnew") == null) {
							msg.setMsg("页面缺少新增或编辑标记 isnew");
							return msg;
						} else {
							isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
						}
						
						if (result.hasErrors()) {
							msg.setMsg(result.toString());
							logger.error(result);
						} else {
							try {
								if (isnew) {
									energyStandardService.addEnergyStandard(energyStandard);
								} else {
									energyStandardService.updateEnergyStandard(energyStandard);
								}
								status.setComplete();
								msg.setMsg(energyStandard.getStandardId());
								msg.setSuccess("true");
							} catch (Exception e) {
								logger.error(e);
								msg.setMsg(e.getMessage());
							}
						}
				     }
				 else{
				     msg.setMsg("同种类型的标准只能设置一个为默认");
				     }
			       }
			else{
				ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest
						.getAttribute(WebKeys.THEME_DISPLAY);
				User user = null;
				user = themeDisplay.getUser();
				Long companyId = user.getCompanyId();
				energyStandard.setCompanyId(companyId);
				boolean isnew = true;
				if (resourceRequest.getParameter("isnew") == null) {
					msg.setMsg("页面缺少新增或编辑标记 isnew");
					return msg;
				} else {
					isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
				}
				
				if (result.hasErrors()) {
					msg.setMsg(result.toString());
					logger.error(result);
				} else {
					try {
						if (isnew) {
							energyStandardService.addEnergyStandard(energyStandard);
						} else {
							energyStandardService.updateEnergyStandard(energyStandard);
						}
						status.setComplete();
						msg.setMsg(energyStandard.getStandardId());
						msg.setSuccess("true");
					} catch (Exception e) {
						logger.error(e);
						msg.setMsg(e.getMessage());
					}
				 }
			}
			    }	
			else{
				ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest
						.getAttribute(WebKeys.THEME_DISPLAY);
				User user = null;
				user = themeDisplay.getUser();
				Long companyId = user.getCompanyId();
				energyStandard.setCompanyId(companyId);
				boolean isnew = true;
				if (resourceRequest.getParameter("isnew") == null) {
					msg.setMsg("页面缺少新增或编辑标记 isnew");
					return msg;
				} else {
					isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
				}
				
				if (result.hasErrors()) {
					msg.setMsg(result.toString());
					logger.error(result);
				} else {
					try {
						if (isnew) {
							energyStandardService.addEnergyStandard(energyStandard);
						} else {
							energyStandardService.updateEnergyStandard(energyStandard);
						}
						status.setComplete();
						msg.setMsg(energyStandard.getStandardId());
						msg.setSuccess("true");
					} catch (Exception e) {
						logger.error(e);
						msg.setMsg(e.getMessage());
					}
				 }
			}
		return msg;
	}
	
	@ResourceMapping(value = "submitEnergyItemStandardDetailForm")
	public Resultmsg processSubmitEnergyItemStandardDetailForm(
			@ModelAttribute("energyItemStandardDetail") EnergyItemStandardDetail energyItemStandardDetail,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		if(energyItemStandardDetail.getEnergyStandard()==null || !StringUtils.hasLength(energyItemStandardDetail.getEnergyStandard().getStandardId())) {
			//设置主键ID
			String standardId = "";
			if(resourceRequest.getParameter("standardId")!=null)
				standardId = resourceRequest.getParameter("standardId");
			if(StringUtils.hasLength(standardId)) {
				EnergyStandard energyStandard = energyStandardService.getEnergyStandard(standardId);
				energyItemStandardDetail.setEnergyStandard(energyStandard);
			} 
		}
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if(StringUtils.hasLength(energyItemStandardDetail.getDetailId())){
					energyStandardService.updateEnergyItemStandardDetail(energyItemStandardDetail);
				}
				else{
					energyStandardService.addEnergyItemStandardDetail(energyItemStandardDetail);
				}
				status.setComplete();
				msg.setMsg(energyItemStandardDetail.getDetailId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	@ResourceMapping(value = "submitEnergyRegionalStandardDetailForm")
	public Resultmsg processSubmitEnergyRegionalStandardDetailForm(
			@ModelAttribute("energyRegionalStandardDetail") EnergyRegionalStandardDetail energyRegionalStandardDetail,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		if(energyRegionalStandardDetail.getEnergyStandard()==null || !StringUtils.hasLength(energyRegionalStandardDetail.getEnergyStandard().getStandardId())) {
			//设置主键ID
			String standardId = "";
			if(resourceRequest.getParameter("standardId")!=null)
				standardId = resourceRequest.getParameter("standardId");
			if(StringUtils.hasLength(standardId)) {
				EnergyStandard energyStandard = energyStandardService.getEnergyStandard(standardId);
				energyRegionalStandardDetail.setEnergyStandard(energyStandard);
			} 
		}
		
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if(StringUtils.hasLength(energyRegionalStandardDetail.getDetailId())){
					energyStandardService.updateEnergyRegionalStandardDetail(energyRegionalStandardDetail);
				}
				else{
					energyStandardService.addEnergyRegionalStandardDetail(energyRegionalStandardDetail);
				}
				status.setComplete();
				msg.setMsg(energyRegionalStandardDetail.getDetailId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	@ResourceMapping(value = "removeEnergyItemStandardDetail")
	public Resultmsg processRemoveEnergyItemStandardDetail(@RequestParam(value="detailId",required=true) String detailId,
			ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		
		if(!StringUtils.hasLength(detailId)) {
			msg.setMsg("明细ID不能为空");
		} else {
			try {
				energyStandardService.deleteEnergyItemStandardDetail(detailId);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	@ResourceMapping(value = "removeEnergyRegionalStandardDetail")
	public Resultmsg processRemoveEnergyRegionalStandardDetail(@RequestParam(value="detailId",required=true) String detailId,
			ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		
		if(!StringUtils.hasLength(detailId)) {
			msg.setMsg("明细ID不能为空");
		} else {
			try {
				energyStandardService.deleteEnergyRegionalStandardDetail(detailId);
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	/**
	 * 删除
	 * 
	 * @param energydictId
	 *            能源ID
	 * */
	@ResourceMapping(value = "removeEnergyStandard")
	public Resultmsg processRemoveEnergyStandard(
			@RequestParam("standardId") String standardId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(standardId)) {
			try {
				energyStandardService.deleteEnergyStandard(standardId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
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

	/**
	 * 删除行政区划
	 * 
	 * @param datacenterId
	 *            数据中心ID
	 * */
	@ResourceMapping(value = "removeDistrict")
	public Resultmsg processRemoveDistrict(
			@RequestParam("districtId") String districtId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(districtId)) {
			try {
				districtService.deleteDistrictinfo(districtId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 新增能源字典
	 * */
	@RenderMapping(params = "action=addEnergydictForm")
	public ModelAndView setupAddEnergydictForm() {
		ModelAndView mav = new ModelAndView();
		Energydict energydict = new Energydict();
		mav.addObject("energydict", energydict);
		mav.addObject("isnew", true);
		mav.setViewName("setting/editEnergydict");
		return mav;
	}

	/**
	 * 编辑能源字典
	 * 
	 * @param energydictId
	 *            能源ID
	 * */
	@RenderMapping(params = "action=editEnergydictForm")
	public ModelAndView setupEditEnergydictForm(
			@RequestParam("energydictId") String energydictId) {
		ModelAndView mav = new ModelAndView();
		Energydict energydict = energydictService.getEnergydict(energydictId);
		mav.addObject("energydict", energydict);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editEnergydict");
		return mav;
	}
	
	/**
	 * 保存能源字典
	 * 
	 * @param energydict 能源字典数据
	 * @param result 验证结果
	 * */
	@ResourceMapping(value = "submitEnergydictForm")
	public Resultmsg processSubmitEnergydictForm(
			@ModelAttribute("energydict") Energydict energydict,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {

		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		} 
		if(isnew) {
			Energydict existEnergydict = energydictService.getEnergydict(energydict.getEnergydictId());
			if(existEnergydict!=null) {
				result.rejectValue("energydictId", "energydict.energydictId", "能源ID已经存在");
			}
		}
		
		new EnergydictValidator().validate(energydict, result);
		if (result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				if (isnew) {
					energydictService.addEnergydict(energydict);
				} else {
					energydictService.updateEnergydict(energydict);
				}
				status.setComplete();
				msg.setMsg(energydict.getEnergydictId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 删除能源字典数据
	 * 
	 * @param energydictId
	 *            能源ID
	 * */
	@ResourceMapping(value = "removeEnergydict")
	public Resultmsg processRemoveEnergydict(
			@RequestParam("energydictId") String energydictId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(energydictId)) {
			try {
				energydictService.deleteEnergydict(energydictId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	
	/**
	 * 获取行政区划数据
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value = "getDistricts")
	public Page getDistricts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("districtName", keyword);
		}
		Page dcPaged = districtService.getPagedDictgrouies(page, rows,
				mapCondition);
		return dcPaged;
	}
	
	/**
	 * 新增气候区信息
	 * */
	@RenderMapping(params = "action=addBigdistrictForm")
	public ModelAndView setupAddBigdistrictForm() {
		ModelAndView mav = new ModelAndView();
		Bigdistrictinfo bigdistrictinfo = new Bigdistrictinfo();
		mav.addObject("bigdistrictinfo", bigdistrictinfo);
		mav.addObject("bigdistrictrelainfo",new Bigdistrictrelainfo());
		mav.addObject("isnew", true);
		mav.setViewName("setting/editBigdistrict");
		return mav;
	}
	
	/**
	 * 编辑气候区信息
	 * @param bigdistrictId 气候区ID
	 * */
	@RenderMapping(params = "action=editBigdistrictForm")
	public ModelAndView setupEditBigdistrictForm(
			@RequestParam("bigdistrictId") String bigdistrictId) {
		ModelAndView mav = new ModelAndView();
		Bigdistrictinfo bigdistrictinfo =bigdistrictinfoService.getBigdistrictinfo(bigdistrictId);
		Bigdistrictrelainfo bigdistrictrelainfo = new Bigdistrictrelainfo();
		bigdistrictrelainfo.setBigdistrictinfo(bigdistrictinfo);
		mav.addObject("bigdistrictrelainfo",bigdistrictrelainfo);
		mav.addObject("bigdistrictinfo", bigdistrictinfo);
		mav.addObject("isnew", false);
		mav.setViewName("setting/editBigdistrict");
		return mav;
	}
	
	/**
	 * 获取所有气候区信息
	 * @param page 当前页索引
	 * @param rows	每页显示数
	 * */
	@ResourceMapping(value="getBigdistricts")
	public Page getgetBigdistricts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapCondition = new HashMap<String,Object>();
		String bigdistrictId ="",bigdistrictName="";
		if(request.getParameter("bigdistrictId")!=null) {
			bigdistrictId = request.getParameter("bigdistrictId");
			mapCondition.put("bigdistrictId", bigdistrictId);
		}
		if(request.getParameter("bigdistrictName")!=null) {
			bigdistrictName = request.getParameter("bigdistrictName");	
			mapCondition.put("bigdistrictName", bigdistrictName);
		}

		Page dcPaged = bigdistrictinfoService.getBigdistrictinfos(page, rows, mapCondition);
		return dcPaged;
	}
	
	@ResourceMapping(value="getEnergyitemdicts")
	public Page getEnergyitemdicts(ResourceRequest request,
			ResourceResponse response) {
		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = -1;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}

		Page itemPage = energyitemdictService.getPagedEnergyitemdicts(page, rows);
		return itemPage;
	}
	
	/**
	 * 提交保存气候区信息
	 * @param bigdistrictinfo 气候区信息
	 * @param result	对象验证结果
	 * @param status	会话状态
	 * */
	@ResourceMapping(value = "submitBigdistrictForm")
	public Resultmsg processSubmitBigdistrictForm(
			@ModelAttribute("bigdistrictinfo") Bigdistrictinfo bigdistrictinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resourceRequest, ResourceResponse resourceResponse) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (resourceRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resourceRequest.getParameter("isnew"));
		} 
		if(isnew) {
			Bigdistrictinfo existBigdistrictinfo = bigdistrictinfoService.getBigdistrictinfo(bigdistrictinfo.getBigdistrictId().toString());
			if(existBigdistrictinfo!=null) {
				result.rejectValue("energydictId", "energydict.energydictId", "气候区ID已经存在");
			}
		}
		new BigdistrictinfoValidator().validate(bigdistrictinfo, result);
		if(result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				bigdistrictinfoService.saveOrUpdateBigdistrictinfo(bigdistrictinfo);
				status.setComplete();
				msg.setSuccess("true");
				msg.setMsg(bigdistrictinfo.getBigdistrictId());
			}catch(Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	/**
	 * 删除指定的气候区
	 * @param bigdistrictId 气候区ID
	 * */
	@ResourceMapping(value = "removeBigdistrict")
	public Resultmsg processRemoveBigdistrict(
			@RequestParam("bigdistrictId") String bigdistrictId) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(bigdistrictId)) {
			try {
				bigdistrictinfoService.deleteBigdistrictinfo(bigdistrictId);
				msg.setSuccess("true");
			}catch(Exception e) {
				logger.error(e);
				e.printStackTrace();
				msg.setMsg(e.getMessage());
			}
		} else {
			msg.setMsg("气候区ID为空");
		}		
		return msg;
	}
	
	/**
	 * 获取指定气候区ID所辖行政区范围
	 * */
	@ResourceMapping(value = "getBigdistrictrelainfos")
	public Page getBigdistrictrelainfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		String bigdistrictId ="";
		if(request.getParameter("bigdistrictId")!=null) {
			bigdistrictId = request.getParameter("bigdistrictId");
		}
		Page paged = bigdistrictinfoService.getDistrictinfosByBigdistrictId(page, rows, bigdistrictId);
		return paged;
	}
	
	/**
	 * 提交保存气候区对应的行政地区
	 * 
	 * */
	@ResourceMapping(value = "submitBigdistrictrelainfo")
	public Resultmsg processSubmitBigdistrictrelainfo(
			@ModelAttribute("bigdistrictrelainfo") Bigdistrictrelainfo bigdistrictrelainfo,
			BindingResult result, SessionStatus status,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		String bigdistrictId ="";
		if(request.getParameter("bigdistrictId")!=null) {
			bigdistrictId = request.getParameter("bigdistrictId");

			Bigdistrictinfo bigdistrictinfo = new Bigdistrictinfo();
			bigdistrictinfo.setBigdistrictId(bigdistrictId);			
			bigdistrictrelainfo.setBigdistrictinfo(bigdistrictinfo);
		}
		new BigdistrictrelainfoValidator().validate(bigdistrictrelainfo, result);
		if(result.hasErrors()) {
			msg.setMsg(result.toString());
			logger.error(result);
		} else {
			try {
				bigdistrictinfoService.saveOrUpdateBigdistrictrelainfo(bigdistrictrelainfo);
				status.setComplete();
				msg.setSuccess("true");
				msg.setMsg(bigdistrictrelainfo.getRelationId());
			}catch(Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}
	
	
	/**
	 * 删除指定的气候区辖
	 * @param relationId 气候区辖行政区对象ID
	 * */
	@ResourceMapping(value = "removeBigdistrictrelainfo")
	public Resultmsg processRemoveBigdistrictrelainfo(
			@RequestParam("relationId") String relationId) {
		Resultmsg msg = new Resultmsg();
		if(StringUtils.hasLength(relationId)) {
			try {
				bigdistrictinfoService.deleteBigdistrictrelainfo(relationId);
				msg.setSuccess("true");
			}catch(Exception e) {
				logger.error(e);
				e.printStackTrace();
				msg.setMsg(e.getMessage());
			}
		} else {
			msg.setMsg("气候区ID为空");
		}		
		return msg;
	}
	
}
