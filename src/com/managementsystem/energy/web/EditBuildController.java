package com.managementsystem.energy.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletContext;
import javax.portlet.RenderRequest;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildexinfo;
import com.managementsystem.energy.domain.Buildgroupinfo;
import com.managementsystem.energy.domain.Buildgrouprelainfo;
import com.managementsystem.energy.domain.BuildgrouprelainfoId;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildgroupService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.DatacenterService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.validation.BuildaddfileValidator;
import com.managementsystem.energy.validation.BuildexinfoValidator;
import com.managementsystem.energy.validation.BuildgroupinfoValidator;
import com.managementsystem.energy.validation.BuildinfoValidator;
import com.managementsystem.energy.validation.BuildregioninfoValidator;
import com.managementsystem.energy.validation.BuildsettinginfoValidator;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;
import com.managementsystem.util.io.FileSystemObject;
import com.managementsystem.util.net.ServerUtil;

@Controller
@RequestMapping("EDIT")
public class EditBuildController extends BaseController {

	private final Log logger = LogFactory.getLog(EditSettingController.class);
	private final String FILEUPLOADMESSAGE = "FILEUPLOADMESSAGE";
	private final String FILEUPLOADSUCCESS = "FILEUPLOADSUCCESS";

	@Autowired
	private BuildService buildService;

	@Autowired
	private BuildgroupService buildgroupService;

	@Autowired
	private BuildregioninfoService buildregioninfoService;

	@Autowired
	private DatacenterService datacenterService;

	@Autowired
	private DistrictService districtService;

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
	 * 新增建筑信息
	 * */
	@RenderMapping(params = "action=addBuildinfoForm")
	public ModelAndView setupAddDatacenterForm() {
		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = new Buildinfo();
		Date today = Calendar.getInstance().getTime();
		buildinfo.setBuildMonitordate(today);
		buildinfo.setBuildAcceptdate(today);
		buildinfo.setBuildUpfloor(1);
		buildinfo.setBuildDownfloor(0);
		buildinfo.setBuildState(1);
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("isnew", true);
		mav.setViewName("build/editBuild");
		return mav;
	}

	/**
	 * 编辑建筑信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@RenderMapping(params = "action=editBuildinfoForm")
	public ModelAndView setupEditBuildinfoForm(
			@RequestParam("buildId") String buildId) {
		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = buildService.getBuildinfo(buildId);
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("isnew", false);
		mav.setViewName("build/editBuild");
		return mav;
	}

	/**
	 * 编辑建筑扩展信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@RenderMapping(params = "action=buildexinfo")
	public ModelAndView setupBuildexinfo(@RequestParam("buildId") String buildId) {
		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = null;
		Buildexinfo buildexinfo = null;
		if (StringUtils.hasLength(buildId)) {
			buildinfo = buildService.getBuildinfo(buildId);
			buildexinfo = buildService.getBuildexinfo(buildId);
			if (buildexinfo == null) {
				buildexinfo = new Buildexinfo();
				buildexinfo.setBuildId(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("buildexinfo", buildexinfo);
		mav.addObject("isnew", buildexinfo == null);
		mav.setViewName("build/editBuildexTab");
		return mav;
	}

	/**
	 * 编辑建筑附件信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@RenderMapping(params = "action=buildaddfile")
	public ModelAndView setupBuildaddfile(
			@RequestParam("buildId") String buildId, RenderRequest request) {

		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = null;
		Buildaddfile addfile = new Buildaddfile();
		if (StringUtils.hasLength(buildId)) {
			buildinfo = buildService.getBuildinfo(buildId);
			addfile.setBuildinfo(buildinfo);
			addfile.setAddfileDate(Calendar.getInstance().getTime());
		}
		String message = null;
		message = request.getParameter(FILEUPLOADMESSAGE);
		if (message != null) {
			addfile.setMessage(message);
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("buildaddfile", addfile);
		mav.setViewName("build/editBuildaddfileTab");
		return mav;
	}

	@RenderMapping(params = "action=success")
	public String processSuccess() {
		return "success";
	}

	/**
	 * 获取建筑附件列表
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 建筑附件列表
	 * */
	@ResourceMapping(value = "getBuildaddfiles")
	public Page getBuildaddfiles(@RequestParam("buildId") String buildId, ResourceRequest request,
			ResourceResponse response) {
		
		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = 10;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		
		Page dcPaged = buildService.getBuildaddfiles(buildId, page, rows);
		return dcPaged;
	}

	@ResourceMapping(value = "setBuildcover")
	public Resultmsg setBuildcover(@RequestParam("addfileId") String addfileId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(addfileId)) {
			try {
				Buildaddfile buildaddfile = buildService.getBuildaddfile(addfileId);
				if(buildaddfile!=null) {
					if(buildaddfile.getAddfileFunctype()==0) {
						buildService.setBuildcover(buildaddfile);
						msg.setSuccess("true");
					} else {
						msg.setMsg("附件类型必须为图片！");
					}
				}
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	

	/**
	 * 提交建筑附件
	 * 
	 * @param buildaddfile
	 *            建筑附件
	 * */
	@ActionMapping(params = "action=submitBuildaddfileForm")
	public void onSubmitBuildaddfileForm(
			@ModelAttribute("buildaddfile") Buildaddfile buildaddfile,
			BindingResult result, SessionStatus status, ActionRequest request,
			ActionResponse response) {

		new BuildaddfileValidator().validate(buildaddfile, result);
		if (result.hasErrors()) {
			logger.error(result);
			response.setRenderParameter("action", "buildaddfile");
			response.setRenderParameter("buildId", buildaddfile.getBuildinfo()
					.getBuildId());
		} else {
			CommonsMultipartFile file = buildaddfile.getFileData();
			if (file != null && file.getSize() > 0) {
				
				//if(file.getContentType())
				
				
				if (file.getSize() > 10000000) {
					buildaddfile.setMessage("上传失败：文件大小不能超过10M");
				}
				String fileName = file.getOriginalFilename();
				String fileType = file.getContentType();
				if(buildaddfile.getAddfileDate()==null) {
					buildaddfile.setAddfileDate(Calendar.getInstance().getTime());
				}

				buildaddfile.setAddfileSize(file.getSize());
				buildaddfile.setAddfileSuffix(fileType.split("/")[1]);

				PortletContext portletContext = request.getPortletSession()
						.getPortletContext();
				String realPath = portletContext.getRealPath("/");

				String addfilePath = "/uploadfiles/builds/"
						+ buildaddfile.getBuildinfo().getBuildId() + "/";

				String filePath = "";
				filePath = "/" + portletContext.getPortletContextName()
						+ addfilePath + fileName;
				buildaddfile.setAddfilePath(filePath);
				realPath += addfilePath;
				try {
					FileSystemObject.SaveFileFromInputStream(
							file.getInputStream(), realPath, fileName);
					buildaddfile.setMessage(file.getOriginalFilename()
							+ " 上传成功");
					buildaddfile.setAddfileDate(Calendar.getInstance()
							.getTime());
					response.setRenderParameter(FILEUPLOADSUCCESS, "true");
				} catch (IOException e) {
					buildaddfile.setMessage(e.getMessage());
					e.printStackTrace();
					logger.error(e);
				} catch (Exception e) {
					e.printStackTrace();
					logger.error(e);
				}
			}
			if (StringUtils.hasLength(buildaddfile.getAddfileId())) {
				buildService.updateBuildaddfile(buildaddfile);
			} else {
				buildService.addBuildaddfile(buildaddfile);
			}
			status.setComplete();
			response.setRenderParameter("action", "success");
		}
	}

	@ResourceMapping(value = "removeBuildaddfile")
	public Resultmsg onRemoveBuildaddfile(
			@RequestParam("addfileId") String addfileId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(addfileId)) {
			try {
				buildService.deleteBuildaddfile(addfileId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}
	
	/**
	 * 编辑建筑区域信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@RenderMapping(params = "action=buildregioninfo")
	public ModelAndView setupBuildregioninfo(
			@RequestParam("buildId") String buildId) {
		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = null;
		Buildregioninfo buildregioninfo = new Buildregioninfo();
		if (StringUtils.hasLength(buildId)) {
			buildinfo = buildService.getBuildinfo(buildId);
			buildregioninfo.setBuildinfo(buildinfo);
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("buildregioninfo", buildregioninfo);
		mav.setViewName("build/editBuildregionTab");
		return mav;
	}

	/**
	 * 编辑建筑网络设置信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@RenderMapping(params = "action=buildsettinginfo")
	public ModelAndView setupBuildsettinginfo(
			@RequestParam("buildId") String buildId) {
		ModelAndView mav = new ModelAndView();
		Buildinfo buildinfo = null;
		Buildsettinginfo buildsettinginfo = null;
		if (StringUtils.hasLength(buildId)) {
			buildinfo = buildService.getBuildinfo(buildId);
			buildsettinginfo = buildService.getBuildsettinginfo(buildId);
			if (buildsettinginfo == null) {
				buildsettinginfo = new Buildsettinginfo();
				buildsettinginfo.setBuildinfo(buildinfo);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("buildsettinginfo", buildsettinginfo);
		mav.setViewName("build/editBuildsettingTab");
		return mav;
	}

	// ////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 保存建筑信息
	 * 
	 * @param buildinfo
	 *            建筑信息对象
	 * @param result
	 *            数据验证结果
	 * @param status
	 *            Session状态
	 * @param resRequest
	 *            资源请求对象
	 * 
	 * @return success or error message
	 * */
	@ResourceMapping(value = "submitBuildinfoForm")
	
	public Resultmsg onSubmitBuildinfoForm(
			@ModelAttribute("buildinfo") Buildinfo buildinfo,
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
		if (resRequest.getParameter("buildFunction") != null) {
			if (StringUtils.hasLength(resRequest.getParameter("buildFunction"))) {
				buildinfo.setBuildFunction(Integer.parseInt(resRequest
						.getParameter("buildFunction")));
			} else {
				buildinfo.setBuildFunction(0);
			}
		}

		new BuildinfoValidator().validate(buildinfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				if (isnew) {
					buildService.addBuildinfo(buildinfo);
				} else {
					buildService.updateBuildinfo(buildinfo);
				}
				status.setComplete();
				msg.setMsg(buildinfo.getBuildId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}

		return msg;
	}

	/**
	 * 删除建筑信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * 
	 * @return 成功或失败消息
	 * */
	@ResourceMapping(value = "removeBuildinfo")
	public Resultmsg onRemovebuildinfo(@RequestParam("buildId") String buildId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(buildId)) {
			try {
				buildService.deleteBuildinfo(buildId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 提交并保存建筑扩展信息
	 * 
	 * */
	@ResourceMapping(value = "submitBuildexinfoForm")
	public Resultmsg onSubmitBuildexinfoForm(
			@ModelAttribute("buildexinfo") Buildexinfo buildexinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		new BuildexinfoValidator().validate(buildexinfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				buildService.saveOrUpdateBuildexinfo(buildexinfo);
				status.setComplete();
				msg.setMsg(buildexinfo.getBuildId());
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}

		return msg;
	}

	/**
	 * 删除建筑扩展信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@ResourceMapping(value = "removeBuildexinfo")
	public Resultmsg onRemoveBuildexinfo(@RequestParam("buildId") String buildId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(buildId)) {
			try {
				buildService.deleteBuildexinfo(buildId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 保存建筑区域信息
	 * 
	 * @param buildregioninfo
	 *            建筑区域信息
	 * @param result
	 *            验证结果
	 * @param status
	 *            SESSION状态
	 * */
	@ResourceMapping(value = "submitBuildregioninfoForm")
	public Resultmsg onSubmitBuildregioninfoForm(
			@ModelAttribute("buildregioninfo") Buildregioninfo buildregioninfo,
			BindingResult result, SessionStatus status,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		new BuildregioninfoValidator().validate(buildregioninfo, result);
		if (result.hasErrors()) {
			logger.error(request);
			StringBuilder sb = new StringBuilder();
			for (ObjectError err : result.getAllErrors()) {
				sb.append(err.getDefaultMessage());
			}
			msg.setMsg(sb.toString());
		} else {
			try {
				buildregioninfoService
						.saveOrUpdateBuildregioninfo(buildregioninfo);
				status.setComplete();
				msg.setSuccess("true");
				msg.setMsg(buildregioninfo.getRegionId());
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	@ActionMapping(params = "action=uploadBuildregioninfo")
	public void onUploadBuildregioninfo(
			@ModelAttribute("buildregioninfo") Buildregioninfo buildregioninfo,
			BindingResult result, SessionStatus status, ActionRequest request,
			ActionResponse response) {
		try {
			String filePath = "";
			CommonsMultipartFile file = buildregioninfo.getFileData();
			if (file != null && file.getSize() > 0) {
				if (file.getSize() > 5000000) {
					buildregioninfo.setMessage("上传失败：文件大小不能超过5M");
				} else {
					String fileName = file.getOriginalFilename();
					PortletContext portletContext = request.getPortletSession()
							.getPortletContext();
					String realPath = portletContext.getRealPath("/");

					String addfilePath = "/uploadfiles/builds/"
							+ buildregioninfo.getBuildinfo().getBuildId() + "/";
					filePath = "/" + portletContext.getPortletContextName()
							+ addfilePath + fileName;
					realPath += addfilePath;
					try {
						FileSystemObject.SaveFileFromInputStream(
								file.getInputStream(), realPath, fileName);
						buildregioninfo.setMessage(file.getOriginalFilename()
								+ " 上传成功");

						String regionId = request.getParameter("regionId");
						if (StringUtils.hasLength(regionId)) {
							Buildregioninfo buildregioninfo2 = buildregioninfoService
									.getBuildregioninfo(regionId);
							buildregioninfo2.setRegionImage(filePath);
							buildregioninfoService
									.updateBuildregioninfo(buildregioninfo2);
						}
					} catch (IOException e) {
						buildregioninfo.setMessage(e.getMessage());
						e.printStackTrace();
						logger.error(e);
					} catch (Exception e) {
						e.printStackTrace();
						logger.error(e);
					}
				}
			}

			status.setComplete();
			response.setRenderParameter("action", "success");
			response.setRenderParameter("filepath", filePath);

		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
	}

	/**
	 * 获取指定建筑区域信息
	 * @param regionId 建筑区域ID
	 * */
	@ResourceMapping(value="getBuildregioninfo")
	public Map<String,Buildregioninfo> getBuildregioninfo(@RequestParam("regionId") String regionId) {
		Map<String,Buildregioninfo> map = new HashMap<String,Buildregioninfo>();
		Buildregioninfo buildregioninfo = buildregioninfoService
		.getBuildregioninfo(regionId);
		map.put("buildregioninfo", buildregioninfo);
		return map;
	}
	
	
	/**
	 * 删除建筑区域信息
	 * 
	 * @param regionId
	 *            建筑区域ID
	 * */
	@ResourceMapping(value = "removeBuildregioninfo")
	public Resultmsg onRemoveBuildregioninfo(
			@RequestParam("regionId") String regionId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(regionId)) {
			try {
				buildregioninfoService.deleteBuildregioninfo(regionId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	
	/**
	 * 测试服务地址是否可以正常访问
	 * */
	@ResourceMapping(value = "pingServer")
	public Resultmsg processPingServer(String settingWsurl) {
		Resultmsg msg = new Resultmsg();
		try {
			Boolean result = ServerUtil.pingServer(settingWsurl);
			msg.setSuccess(result.toString());
		}catch(Exception e) {
			logger.error(e);
			msg.setMsg(e.getMessage());
		}
		return msg;
	}

	/**
	 * 提交并保存建筑设置信息
	 * */
	@ResourceMapping(value = "submitBuildsettinginfoForm")
	public Resultmsg onSubmitBuildsettinginfoForm(
			@ModelAttribute("Buildsettinginfo") Buildsettinginfo buildsettinginfo,
			BindingResult result, SessionStatus status,
			ResourceRequest resRequest) {
		Resultmsg msg = new Resultmsg();
		new BuildsettinginfoValidator().validate(buildsettinginfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			msg.setMsg(result.toString());
		} else {
			try {
				buildService.saveOrUpdateBuildsettinginfo(buildsettinginfo);
				status.setComplete();
				msg.setMsg(buildsettinginfo.getBuildId());
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 删除建筑设置
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@ResourceMapping(value = "removeBuildsettinginfo")
	public Resultmsg onRemoveBuildsettinginfo(
			@RequestParam("buildId") String buildId) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(buildId)) {
			try {
				buildService.deleteBuildsettinginfo(buildId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		}
		return msg;
	}

	/**
	 * 获取建筑区域信息
	 * 
	 * @param buildId
	 *            建筑ID
	 * */
	@ResourceMapping(value = "getBuildregioninfoByBuildId")
	public Page getBuildregioninfoByBuildId(
			@RequestParam("buildId") String buildId) {
		Map<String, Object> mapParams = new HashMap<String, Object>();
		return buildregioninfoService.getBuildregioninfos(buildId, 1, -1,
				mapParams);
	}

	/**
	 * 获取建筑区域树
	 * */
	@ResourceMapping(value = "getBuildregionComboTree")
	public JsonResult getBuildregionComboTree(
			@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		List<Tree> trees = buildregioninfoService
				.getBuildregionComboTree(buildId);
		result.setData(trees);
		return result;
	}

	/**
	 * 获取数据中心数据
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value = "getDatacenters")
	public Page getDatacenters(ResourceRequest request,
			ResourceResponse response) {
		
		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = 15;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		
		Page dcPaged = datacenterService.getPagedDatacenters(page, rows);
		return dcPaged;
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
	public Page getDistricts(ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = 25;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		
		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("districtName", keyword);
		}
		Page dcPaged = districtService.getPagedDictgrouies(page, rows,
				mapCondition);
		return dcPaged;
	}

	/**
	 * 新增建筑群信息
	 * */
	@RenderMapping(params = "action=addBuildgroupinfoForm")
	public ModelAndView setupAddBuildgroupinfoForm() {
		ModelAndView mav = new ModelAndView();
		Buildgroupinfo buildgroupinfo = new Buildgroupinfo();
		mav.addObject("buildgroupinfo", buildgroupinfo);
		mav.addObject("buildinfo", new Buildinfo());
		mav.addObject("isnew", true);
		mav.setViewName("build/editBuildgroupTab");
		return mav;
	}

	/**
	 * 编辑建筑群信息
	 * */
	@RenderMapping(params = "action=editBuildgroupinfoForm")
	public ModelAndView setupEditBuildgroupinfoForm(
			@RequestParam(value = "buildgroupId", required = true) String buildgroupId) {
		ModelAndView mav = new ModelAndView();
		Buildgroupinfo buildgroupinfo = buildgroupService
				.getBuildgroupinfo(buildgroupId);
		mav.addObject("buildgroupinfo", buildgroupinfo);
		mav.addObject("buildinfo", new Buildinfo());
		mav.addObject("isnew", false);
		mav.setViewName("build/editBuildgroupTab");
		return mav;
	}

	/**
	 * 提交保存建筑群信息
	 * 
	 * @param buildgroupinfo
	 *            建筑群信息
	 * @param result
	 *            验证信息
	 * */
	@ResourceMapping(value = "submitBuildgroupinfoForm")
	public Resultmsg onSubmitBuildgroupinfoForm(
			@ModelAttribute("buildgroupinfo") Buildgroupinfo buildgroupinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		boolean isnew = true;
		if (request.getParameter("isnew") == null) {
			msg.setMsg("页面缺少新增或编辑标记 isnew");
			return msg;
		} else {
			isnew = Boolean.valueOf(request.getParameter("isnew"));
		}
		new BuildgroupinfoValidator().validate(buildgroupinfo, result);
		if (result.hasErrors()) {
			logger.error(result);
			StringBuilder sb = new StringBuilder();
			for (ObjectError err : result.getAllErrors()) {
				sb.append(err.getDefaultMessage());
			}
			msg.setMsg(sb.toString());
		} else {
			try {
				if (isnew) {
					buildgroupService.addBuildgroupinfo(buildgroupinfo);
				} else {
					buildgroupService.updateBuildgroupinfo(buildgroupinfo);
				}
				status.setComplete();
				msg.setMsg(buildgroupinfo.getBuildgroupId());
				msg.setSuccess("true");
			} catch (Exception e) {
				logger.error(e);
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 删除建筑群信息
	 * 
	 * @param buildgroupId
	 *            建筑群ID
	 * */
	@ResourceMapping(value = "removeBuildgroupinfo")
	public Resultmsg onRemoveBuildgroupinfo(
			@RequestParam(value = "buildgroupId", required = true) String buildgroupId,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		if (StringUtils.hasLength(buildgroupId)) {
			try {
				buildgroupService.deleteBuildgroupinfo(buildgroupId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
			}
		} else {
			msg.setMsg("建筑群ID为空");
		}
		return msg;
	}

	/**
	 * 获取建筑群关联建筑列表数据
	 * 
	 * @param page
	 *            当前页
	 * @param rows
	 *            每页显示条数
	 * 
	 * @return 建筑群关联建筑列表数据
	 * */
	@ResourceMapping(value = "getBuildinfosBygroupId")
	public JsonResult getBuildinfosBygroupId(
			@RequestParam("buildgroupId") String buildgroupId,
			ResourceRequest request, ResourceResponse response) {
		JsonResult result = new JsonResult();
		Set<Buildinfo> buildinfos = buildgroupService
				.getBuildinfosByBuildgroupId(1, -1, buildgroupId);
		result.setData(new ArrayList<Buildinfo>(buildinfos));
		return result;
	}

	/**
	 * 提交保存建筑群与建筑关系统数据
	 * */
	@ResourceMapping(value = "submitBuildgrouprelainfoForm")
	public Resultmsg onsubmitBuildgrouprelainfoForm(
			@ModelAttribute("buildinfo") Buildinfo buildinfo,
			BindingResult result, SessionStatus status,
			ResourceRequest request, ResourceResponse response) {
		Resultmsg msg = new Resultmsg();
		String buildgroupId = "";
		if (request.getParameter("buildgroupId") != null)
			buildgroupId = request.getParameter("buildgroupId");
		if (!StringUtils.hasLength(buildinfo.getBuildId())) {
			msg.setMsg("没有选择相关建筑");
		} else if (!StringUtils.hasLength(buildgroupId)) {
			msg.setMsg("请保存建筑群信息后添加关联建筑");
		} else {
			try {
				Buildgrouprelainfo buildgrouprelainfo = new Buildgrouprelainfo();
				BuildgrouprelainfoId id = new BuildgrouprelainfoId();
				id.setBuildId(buildinfo.getBuildId());
				id.setBuildgroupId(buildgroupId);
				buildgrouprelainfo.setId(id);
				buildgroupService.addBuildgrouprelainfo(buildgrouprelainfo);
				status.setComplete();
				msg.setMsg(buildgroupId);
				msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
			}
		}
		return msg;
	}

	/**
	 * 获取所有建筑信息
	 * */
	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		Integer page = -1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Integer rows = 20;
		if(request.getParameter("rows")!=null) {
			rows = Integer.parseInt(request.getParameter("rows"));
		}
		
		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("buildName", keyword);
		}
		Page buildinfos = buildService.getBuildinfos(page, rows);
		return buildinfos;
	}
}
