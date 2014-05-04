package com.managementsystem.energy.portlet.comfort;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.ComfortService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("Edit")
public class ComfortPreferenceController extends BaseController {
	private final Log logger = LogFactory.getLog(ComfortPreferenceController.class);
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private ComfortService comfortService;
	
	@Autowired
	private BuildregioninfoService buildregioninfoService;
	
	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		
		Buildinfo buildinfo = null;
		if (prefs.getMap().size() == 0) {
			buildinfo = new Buildinfo();
		} else {
			String buildId = prefs.getValue("buildId", "");
			if(StringUtils.hasLength(buildId)){
			buildinfo = buildService.getBuildinfo(buildId);
			}
		}
		mav.addObject("buildinfo", buildinfo);
		mav.addObject("bz", "");
		mav.setViewName(PORTLETFOLDER + "comfort/preferences");
		return mav;
	}
	
	/**
	 * 保存
	 * 
	 * @param buildinfo 设置对象
	 * @param prefs	 首选项对象
	 * */
	@SuppressWarnings("rawtypes")
	@ActionMapping(params = "action=savePreferences")
	public void savePreferences(PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		
		List<String> errorMessages = new ArrayList<String>();
		try {
			String buildId = "",regionId = "";
			if(request.getParameter("buildId")!=null) {
				buildId = request.getParameter("buildId");
				prefs.setValue("buildId",buildId);
			}
			
			if(request.getParameter("regionId")!=null) {
				regionId = request.getParameter("regionId");
				prefs.setValue("regionId",regionId);
			}
			
			if(request.getParameter("serie1")!=null) {
				String serieId1 = "serie1"+ regionId;
				String a1 =  request.getParameter("serie1");
				prefs.setValue(serieId1,a1);
			}
			if(request.getParameter("serie11")!=null) {
				String serieId11 = "serie11"+ regionId;
				String a1 =  request.getParameter("serie11");
				prefs.setValue(serieId11,a1);
			}
			if(request.getParameter("serie12")!=null) {
				String serieId12 = "serie12"+ regionId;
				String a1 =  request.getParameter("serie12");
				prefs.setValue(serieId12,a1);
			}
			if(request.getParameter("serie13")!=null) {
				String serieId13 = "serie13"+ regionId;
				String a1 =  request.getParameter("serie13");
				prefs.setValue(serieId13,a1);
			}
			
			if(request.getParameter("serie2")!=null) {
				String serieId2 = "serie2"+ regionId;
				String a2 =  request.getParameter("serie2");
				prefs.setValue(serieId2,a2);
			}
			if(request.getParameter("serie21")!=null) {
				String serieId21 = "serie21"+ regionId;
				String a1 =  request.getParameter("serie21");
				prefs.setValue(serieId21,a1);
			}
			if(request.getParameter("serie22")!=null) {
				String serieId22 = "serie22"+ regionId;
				String a1 =  request.getParameter("serie22");
				prefs.setValue(serieId22,a1);
			}
			if(request.getParameter("serie23")!=null) {
				String serieId23 = "serie23"+ regionId;
				String a1 =  request.getParameter("serie23");
				prefs.setValue(serieId23,a1);
			}
			
			if(request.getParameter("serie3")!=null) {
				String serieId3 = "serie3"+ regionId;
				String a3 =  request.getParameter("serie3");
				prefs.setValue(serieId3,a3);
			}
			if(request.getParameter("serie31")!=null) {
				String serieId31 = "serie31"+ regionId;
				String a1 =  request.getParameter("serie31");
				prefs.setValue(serieId31,a1);
			}
			if(request.getParameter("serie32")!=null) {
				String serieId32 = "serie32"+ regionId;
				String a1 =  request.getParameter("serie32");
				prefs.setValue(serieId32,a1);
			}
			if(request.getParameter("serie33")!=null) {
				String serieId33 = "serie33"+ regionId;
				String a1 =  request.getParameter("serie33");
				prefs.setValue(serieId33,a1);
			}
			
			if(request.getParameter("serie4")!=null) {
				String serieId4 = "serie4"+ regionId;
				String a4 =  request.getParameter("serie4");
				prefs.setValue(serieId4,a4);
			}
			if(request.getParameter("serie41")!=null) {
				String serieId41 = "serie41"+ regionId;
				String a1 =  request.getParameter("serie41");
				prefs.setValue(serieId41,a1);
			}
			if(request.getParameter("serie42")!=null) {
				String serieId42 = "serie42"+ regionId;
				String a1 =  request.getParameter("serie42");
				prefs.setValue(serieId42,a1);
			}
			if(request.getParameter("serie43")!=null) {
				String serieId43 = "serie43"+ regionId;
				String a1 =  request.getParameter("serie43");
				prefs.setValue(serieId43,a1);
			}
			
			if(request.getParameter("serie5")!=null) {
				String serieId5 = "serie5"+ regionId;
				String a5 =  request.getParameter("serie5");
				prefs.setValue(serieId5,a5);
			}
			if(request.getParameter("serie51")!=null) {
				String serieId51 = "serie51"+ regionId;
				String a1 =  request.getParameter("serie51");
				prefs.setValue(serieId51,a1);
			}
			if(request.getParameter("serie52")!=null) {
				String serieId52 = "serie52"+ regionId;
				String a1 =  request.getParameter("serie52");
				prefs.setValue(serieId52,a1);
			}
			if(request.getParameter("serie53")!=null) {
				String serieId53 = "serie53"+ regionId;
				String a1 =  request.getParameter("serie53");
				prefs.setValue(serieId53,a1);
			}
			
			if(request.getParameter("serie6")!=null) {
				String serieId6 = "serie6"+ regionId;
				String a6 =  request.getParameter("serie6");
				prefs.setValue(serieId6,a6);
			}
			if(request.getParameter("serie61")!=null) {
				String serieId61 = "serie61"+ regionId;
				String a1 =  request.getParameter("serie61");
				prefs.setValue(serieId61,a1);
			}
			if(request.getParameter("serie62")!=null) {
				String serieId62 = "serie62"+ regionId;
				String a1 =  request.getParameter("serie62");
				prefs.setValue(serieId62,a1);
			}
			if(request.getParameter("serie63")!=null) {
				String serieId63 = "serie63"+ regionId;
				String a1 =  request.getParameter("serie63");
				prefs.setValue(serieId63,a1);
			}
			
			if(request.getParameter("serie7")!=null) {
				String serieId7 = "serie7"+ regionId;
				String a7 =  request.getParameter("serie7");
				prefs.setValue(serieId7,a7);
			}
			
			if(request.getParameter("serie71")!=null) {
				String serieId71 = "serie71"+ regionId;
				String a1 =  request.getParameter("serie71");
				prefs.setValue(serieId71,a1);
			}
			if(request.getParameter("serie72")!=null) {
				String serieId72 = "serie72"+ regionId;
				String a1 =  request.getParameter("serie72");
				prefs.setValue(serieId72,a1);
			}
			if(request.getParameter("serie73")!=null) {
				String serieId73 = "serie73"+ regionId;
				String a1 =  request.getParameter("serie73");
				prefs.setValue(serieId73,a1);
			}
			
			if(request.getParameter("serie8")!=null) {
				String serieId8 = "serie8"+ regionId;
				String a8 =  request.getParameter("serie8");
				prefs.setValue(serieId8,a8);
			}
			
			if(request.getParameter("serie81")!=null) {
				String serieId81 = "serie81"+ regionId;
				String a1 =  request.getParameter("serie81");
				prefs.setValue(serieId81,a1);
			}
			if(request.getParameter("serie82")!=null) {
				String serieId82 = "serie82"+ regionId;
				String a1 =  request.getParameter("serie82");
				prefs.setValue(serieId82,a1);
			}
			if(request.getParameter("serie83")!=null) {
				String serieId83 = "serie83"+ regionId;
				String a1 =  request.getParameter("serie83");
				prefs.setValue(serieId83,a1);
			}
			
			prefs.store();
		} catch(Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		response.setRenderParameter("", "");
		request.setAttribute("errorMessages", errorMessages);
		request.setAttribute("successMessages", "操作成功");
	}
	
	/**
	 * 返回所有建筑信息
	 * */
	@ResourceMapping(value = "getBuildinfos")
	public Page getBuildinfos(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();

		if (request.getParameter("keyword") != null) {
			String keyword = request.getParameter("keyword");
			mapCondition.put("buildName", keyword);
		}
		Page buildinfos = buildService.getBuildinfos(page, rows);
		return buildinfos;
	}
	
	@SuppressWarnings("rawtypes")
	@ResourceMapping(value = "getregionIds")
	public JsonResult getEnergyitemdicts(@RequestParam("buildId") String buildId) {
		JsonResult result = new JsonResult();
		List<Buildinfo>buildinfosList = null;
		List list = null;
		buildinfosList = comfortService.getBuildinfo();
		if(buildinfosList.size()>0)
		list = buildregioninfoService.getBuildregionComboTree(buildinfosList);
		result.setData(list);
		return result;
	}
	
	@RenderMapping(params = "action=editForm")
	public ModelAndView setEditForm(PortletPreferences prefs,
			@RequestParam("regionId") String regionId) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bz", "1");
		mav.addObject("regionId", regionId);
		String serieId1 = "serie1"+ regionId;
		String serie1 = prefs.getValue(serieId1, "");
		String serieId11 = "serie11"+ regionId;
		String serie11 = prefs.getValue(serieId11, "");
		String serieId12 = "serie12"+ regionId;
		String serie12 = prefs.getValue(serieId12, "");
		String serieId13 = "serie13"+ regionId;
		String serie13 = prefs.getValue(serieId13, "");
		
		String serieId2 = "serie2"+ regionId;
		String serie2 = prefs.getValue(serieId2, "");
		String serieId21 = "serie21"+ regionId;
		String serie21 = prefs.getValue(serieId21, "");
		String serieId22 = "serie22"+ regionId;
		String serie22 = prefs.getValue(serieId22, "");
		String serieId23 = "serie23"+ regionId;
		String serie23 = prefs.getValue(serieId23, "");
		
		String serieId3 = "serie3"+ regionId;
		String serie3 = prefs.getValue(serieId3, "");
		String serieId31 = "serie31"+ regionId;
		String serie31 = prefs.getValue(serieId31, "");
		String serieId32 = "serie32"+ regionId;
		String serie32 = prefs.getValue(serieId32, "");
		String serieId33 = "serie33"+ regionId;
		String serie33 = prefs.getValue(serieId33, "");
		
		String serieId4 = "serie4"+ regionId;
		String serie4 = prefs.getValue(serieId4, "");
		String serieId41 = "serie41"+ regionId;
		String serie41 = prefs.getValue(serieId41, "");
		String serieId42 = "serie42"+ regionId;
		String serie42 = prefs.getValue(serieId42, "");
		String serieId43 = "serie43"+ regionId;
		String serie43 = prefs.getValue(serieId43, "");
		
		String serieId5 = "serie5"+ regionId;
		String serie5 = prefs.getValue(serieId5, "");
		String serieId51 = "serie51"+ regionId;
		String serie51 = prefs.getValue(serieId51, "");
		String serieId52 = "serie52"+ regionId;
		String serie52 = prefs.getValue(serieId52, "");
		String serieId53 = "serie53"+ regionId;
		String serie53 = prefs.getValue(serieId53, "");
		
		String serieId6 = "serie6"+ regionId;
		String serie6 = prefs.getValue(serieId6, "");
		String serieId61 = "serie61"+ regionId;
		String serie61 = prefs.getValue(serieId61, "");
		String serieId62 = "serie62"+ regionId;
		String serie62 = prefs.getValue(serieId62, "");
		String serieId63 = "serie63"+ regionId;
		String serie63 = prefs.getValue(serieId63, "");
		
		String serieId7 = "serie7"+ regionId;
		String serie7 = prefs.getValue(serieId7, "");
		String serieId71 = "serie71"+ regionId;
		String serie71 = prefs.getValue(serieId71, "");
		String serieId72 = "serie72"+ regionId;
		String serie72 = prefs.getValue(serieId72, "");
		String serieId73 = "serie73"+ regionId;
		String serie73 = prefs.getValue(serieId73, "");
		
		String serieId8 = "serie8"+ regionId;
		String serie8 = prefs.getValue(serieId8, "");
		String serieId81 = "serie81"+ regionId;
		String serie81 = prefs.getValue(serieId81, "");
		String serieId82 = "serie82"+ regionId;
		String serie82 = prefs.getValue(serieId82, "");
		String serieId83 = "serie83"+ regionId;
		String serie83 = prefs.getValue(serieId83, "");
		
		mav.addObject("serie1", serie1);
		mav.addObject("serie11", serie11);
		mav.addObject("serie12", serie12);
		mav.addObject("serie13", serie13);
		mav.addObject("serie2", serie2);
		mav.addObject("serie21", serie21);
		mav.addObject("serie22", serie22);
		mav.addObject("serie23", serie23);
		mav.addObject("serie3", serie3);
		mav.addObject("serie31", serie31);
		mav.addObject("serie32", serie32);
		mav.addObject("serie33", serie33);
		mav.addObject("serie4", serie4);
		mav.addObject("serie41", serie41);
		mav.addObject("serie42", serie42);
		mav.addObject("serie43", serie43);
		mav.addObject("serie5", serie5);
		mav.addObject("serie51", serie51);
		mav.addObject("serie52", serie52);
		mav.addObject("serie53", serie53);
		mav.addObject("serie6", serie6);
		mav.addObject("serie61", serie61);
		mav.addObject("serie62", serie62);
		mav.addObject("serie63", serie63);
		mav.addObject("serie7", serie7);
		mav.addObject("serie71", serie71);
		mav.addObject("serie72", serie72);
		mav.addObject("serie73", serie73);
		mav.addObject("serie8", serie8);
		mav.addObject("serie81", serie81);
		mav.addObject("serie82", serie82);
		mav.addObject("serie83", serie83);
		mav.setViewName(PORTLETFOLDER + "comfort/preferences");
		return mav;
	}
}
