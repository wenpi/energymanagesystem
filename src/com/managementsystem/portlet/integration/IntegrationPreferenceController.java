package com.managementsystem.portlet.integration;

import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletContext;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.web.BaseController;
import com.managementsystem.portlet.common.Constants;
import com.managementsystem.ui.easyui.JsonResult;

public class IntegrationPreferenceController extends BaseController {

	private final Log logger = LogFactory
			.getLog(IntegrationPreferenceController.class);

	@Autowired
	private IntegrationService integrationService;

	/**
	 * 设置首选项
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();

		logger.info("RenderMapping setup of "
				+ IntegrationPreferenceController.class);

		IntegrationMode integrationMode = null;
		if (prefs.getMap().size() == 0) {
			integrationMode = new IntegrationMode();
		} else {
			integrationMode = integrationService.getIntegrationMode(prefs);
		}

		PortletContext portletContext = request.getPortletSession().getPortletContext();
		// 获取文件目录
		String realPath = portletContext.getRealPath("/");
		// 集成目录
		realPath += Constants.PATH_UPLOADFILE_INTEGRATION;

		mav.addObject("realPath", realPath);
		mav.addObject("integrationMode", integrationMode);

		mav.setViewName(PORTLETFOLDER + "integration/prefs");
		return mav;

	}

	/**
	 * 上传文件
	 * 
	 * @param prefs
	 *            选项设置
	 * @param request
	 *            请求对象
	 * @param response
	 *            响应对象
	 * */
	@ActionMapping(params = "action=uploadfiles")
	public void processUploadfiles(@ModelAttribute("integrationMode")IntegrationMode integrationMode,
			PortletPreferences prefs,ActionRequest request, ActionResponse response) {
		String result = "";
		try {
			
			String realPath = request.getParameter("realPath");
			if(!StringUtils.hasLength(realPath)) {
				PortletContext portletContext = request.getPortletSession().getPortletContext();
				// 获取文件目录
				realPath = portletContext.getRealPath("/");
				// 集成目录
				realPath += Constants.PATH_UPLOADFILE_INTEGRATION;
			}
			realPath +=  integrationMode.getBuildId();
			result = integrationService.uploadFiles(integrationMode,realPath);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			request.setAttribute("errorMessages", e.getMessage());
			result = e.getMessage();
		}
		response.setRenderParameter("", "");
		request.setAttribute("successMessages", result);
	}

	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs,
			ActionRequest request, ActionResponse response) {
		try {
			// integrationService.savePreferenceModel(preferenceModel, prefs);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			request.setAttribute("errorMessages", e.getMessage());
		}
		response.setRenderParameter("", "");
		request.setAttribute("successMessages", "操作成功");
	}

	/**
	 * 获取目录文件
	 * 
	 * @param dirName
	 *            目录名称
	 * */
	@ResourceMapping(value = "getFiles")
	public JsonResult getFiles(@RequestParam("buildId") String buildId,
			@RequestParam("suffix") String suffix,
			@RequestParam("realPath") String realPath,
			@RequestParam("subPath") String subPath, ResourceRequest resRequest) {

		Assert.hasLength(buildId);

		JsonResult result = new JsonResult();
		String fileDir = "";
		fileDir = realPath + buildId;
		if (StringUtils.hasLength(subPath)) {
			if (!subPath.substring(0, 1).equals("/")) {
				subPath = "/" + subPath;
			}
			fileDir += subPath;
		}

		List<IntegrationFile> files = integrationService.getFiles(fileDir, suffix);
		result.setData(files);

		return result;
	}

}
