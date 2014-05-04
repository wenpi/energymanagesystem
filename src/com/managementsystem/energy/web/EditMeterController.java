package com.managementsystem.energy.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletContext;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.energy.service.MeterproService;
import com.managementsystem.energy.validation.MeterparaminfoValidator;
import com.managementsystem.energy.validation.MeterproinfoValidator;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.util.io.FileSystemObject;
import com.managementsystem.util.io.FileUploadBase;

@Controller
@RequestMapping("VIEW")
public class EditMeterController extends BaseController {
	private final Log logger = LogFactory.getLog(EditMeterController.class);

	@Autowired
	public MeterproService meterproService;

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
	 * 新增仪表产品
	 * */
	@RenderMapping(params = "action=addMeterproinfoForm")
	public ModelAndView setupAddMeterproinfoForm() {
		ModelAndView mav = new ModelAndView();
		Meterproinfo meterproinfo = new Meterproinfo();
		Meterparaminfo meterparaminfo = new Meterparaminfo();
		meterproinfo.setMeterProductid("");
		meterparaminfo.setMeterproinfo(meterproinfo);
		mav.addObject("meterproinfo", meterproinfo);
		mav.addObject("meterparaminfo", meterparaminfo);
		mav.addObject("isnew", true);
		mav.setViewName("meter/editMeterproinfo");
		return mav;
	}

	/**
	 * 编辑仪表产品
	 * */
	@RenderMapping(params = "action=editMeterproinfoForm")
	public ModelAndView setupEdutMeterproinfoForm(
			@RequestParam("meterProductid") String meterProductid) {
		ModelAndView mav = new ModelAndView();
		Meterproinfo meterproinfo = meterproService
				.getMeterproinfo(meterProductid);
		Meterparaminfo meterparaminfo = new Meterparaminfo();
		if (meterproinfo != null) {
			meterparaminfo.setMeterproinfo(meterproinfo);
		}
		meterparaminfo.setMeterParamstate(1);
		mav.addObject("meterproinfo", meterproinfo);
		mav.addObject("meterparaminfo", meterparaminfo);
		mav.addObject("fileUploadBase", new FileUploadBase());
		mav.addObject("isnew", false);
		mav.setViewName("meter/editMeterproinfo");
		return mav;
	}

	/**
	 * 提交保存仪表产品信息
	 * 
	 * @param meterproinfo
	 *            仪表产品信息
	 * @param result
	 *            验证结果
	 * @param status
	 *            Session状态
	 * */
	@ResourceMapping(value = "submitMeterproinfoForm")
	public Resultmsg onSubmitMeterproinfoForm(
			@ModelAttribute("meterproinfo") Meterproinfo meterproinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest, ResourceResponse resResponse) {
		Resultmsg msg = new Resultmsg();
		    String zfc = meterproinfo.getMeterPhoto();
		    if(!zfc.equals("")){
		    String a[] = zfc.split("/energymanagesystem");
		    String photo = "/energymanagesystem"+a[1];
		    meterproinfo.setMeterPhoto(photo);
		    }
		boolean isnew = true;
		if (resRequest.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(resRequest.getParameter("isnew"));
		}
		new MeterproinfoValidator().validate(meterproinfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					meterproService.addMeterproinfo(meterproinfo);
				} else {
					meterproService.updateMeterproinfo(meterproinfo);
				}
				status.setComplete();
				msg.setMsg(meterproinfo.getMeterProductid());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 提交产品图片
	 * */
	@ActionMapping(params = "action=submitMeterphoto")
	public void onSubmitMeterphoto(
			@ModelAttribute("fileUploadBase") FileUploadBase fileUploadBase,
			ActionRequest request, ActionResponse response) {

		String meterProductid = "";
		if (request.getParameter("meterProductid") != null) {
			meterProductid = request.getParameter("meterProductid");
		}
		if (StringUtils.hasLength(meterProductid)) {
			Meterproinfo meterproinfo = meterproService
					.getMeterproinfo(meterProductid);
			try {
				String filePath = "";
				CommonsMultipartFile file = fileUploadBase.getFileData();
				if (file != null && file.getSize() > 0) {
					if (file.getSize() > 1000000) {
						fileUploadBase.setMessage("上传失败：文件大小不能超过1M");
					} else {
						String fileName = file.getOriginalFilename();
						PortletContext portletContext = request
								.getPortletSession().getPortletContext();
						String realPath = portletContext.getRealPath("/");

						String addfilePath = "/uploadfiles/meter/";
						filePath = "/" + portletContext.getPortletContextName()
								+ addfilePath + fileName;
						realPath += addfilePath;
						FileSystemObject.SaveFileFromInputStream(
								file.getInputStream(), realPath, fileName);
						fileUploadBase.setMessage(file.getOriginalFilename()
								+ " 上传成功");
						if (meterproinfo != null) {
							meterproinfo.setMeterPhoto(filePath);
							meterproService.updateMeterproinfo(meterproinfo);
						}
						response.setRenderParameter("filepath", filePath);
						response.setRenderParameter("result",
								"{resultmsg:{success:'true',msg:'"
										+ fileUploadBase.getMessage() + "'}}");

					}
				}
			} catch (IOException e) {
				fileUploadBase.setMessage(e.getMessage());
				e.printStackTrace();
				logger.error(e);
			} catch (Exception e) {

			}
		}
	}

	/**
	 * 删除仪表产品信息
	 * 
	 * @param meterProductid
	 *            仪表产品ID
	 * */
	@ResourceMapping(value = "removeMeterproinfo")
	public Resultmsg onRemoveMeterproinfo(
			@RequestParam("meterProductid") String meterProductid) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(meterProductid)) {
			try {
				meterproService.deleteMeterproinfo(meterProductid);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		} else {
			msg.setMsg("产品ID不能为空");
		}
		return msg;
	}

	/**
	 * 获取仪表参数信息
	 * 
	 * @param meterProductid
	 *            仪表产品ID
	 * */
	@ResourceMapping(value = "getMeterparaminfoByProductid")
	public JsonResult getMeterparaminfoByProductid(ResourceRequest request) {
		JsonResult data = new JsonResult();
		String meterProductid = "";
		if (request.getParameter("meterProductid") != null) {
			meterProductid = request.getParameter("meterProductid");
		}
		Set<Meterparaminfo> params = meterproService
				.getMeterparaminfosByProductid(meterProductid);
		data.setData(new ArrayList<Meterparaminfo>(params));
		return data;
	}

	/**
	 * 提交保存产品参数信息
	 * */
	@ResourceMapping(value = "submitMeterparaminfo")
	public Resultmsg onsubmitMeterparaminfo(
			@ModelAttribute("meterparaminfo") Meterparaminfo meterparaminfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest, ResourceResponse resResponse) {
		Resultmsg msg = new Resultmsg();

		new MeterparaminfoValidator().validate(meterparaminfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				meterproService.saveOrUpdateMeterparaminfo(meterparaminfo);
				msg.setSuccess("true");
				msg.setMsg(meterparaminfo.getMeterParamid());
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 删除产品参数
	 * 
	 * @param meterParamid
	 *            产品参数ID
	 * */
	@ResourceMapping(value = "removeMeterparaminfo")
	public Resultmsg onRemoveMeterparaminfo(
			@RequestParam("meterParamid") String meterParamid) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(meterParamid)) {
			try {
				meterproService.deleteMeterparaminfo(meterParamid);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		} else {
			msg.setMsg("参数ID为空");
		}
		return msg;
	}

	@ResourceMapping(value = "getMeterproinfo")
	public Map<String, Meterproinfo> getMeterproinfo(
			@RequestParam("meterProductid") String meterProductid) {
		Map<String, Meterproinfo> map = new HashMap<String, Meterproinfo>();
		Meterproinfo meterproinfo = meterproService
				.getMeterproinfo(meterProductid);
		map.put("meterproinfo", meterproinfo);
		return map;
	}

}
