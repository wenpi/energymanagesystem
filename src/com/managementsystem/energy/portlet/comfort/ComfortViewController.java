package com.managementsystem.energy.portlet.comfort;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.domain.QueryTotalresult;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.ComfortService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Datagrid;

@Controller
@RequestMapping("VIEW")
public class ComfortViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private BuildService buildService;
	
	@Autowired
	private ComfortService comfortService;
	
	@Autowired
	private BuildregioninfoService buildregioninfoService;
	
	@Autowired
	private MeteruseinfoService meteruseinfoService;
	
	@Autowired
	private ChartService chartService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		Buildinfo buildinfo = null;
		String imagefilePath = "";
		if (prefs.getMap().size() == 0) {
			List<Buildregioninfo> buildregionParentList =  new ArrayList<Buildregioninfo>();
		  } 
		else {
			String buildId = prefs.getValue("buildId", "");
				if (StringUtils.hasLength(buildId)) {
					Set<Buildregioninfo> buildregionParentList = buildregioninfoService.getParentBuildregioninfos(buildId);
					model.addAttribute("buildregionParentList", buildregionParentList);
					buildinfo = buildService.getBuildcover(buildId);
					if (buildinfo != null&& buildinfo.getBuildaddfiles().size() > 0) {
						Set<Buildaddfile> addfiles = buildinfo.getBuildaddfiles();
						for(Iterator<Buildaddfile> it = addfiles.iterator();it.hasNext();) {
							Buildaddfile addfile = it.next();
							if(addfile.getAddfileFunctype()==0) {
								imagefilePath = addfile.getAddfilePath();
								break;
							}
						}
					}
				}
		}
		model.addAttribute("imagefilePath", imagefilePath);
		model.addAttribute("imageChildfilePath", "");
		return PORTLETFOLDER + "comfort/comfortView";
	}
	
	@RenderMapping(params="action=getbuildregion")
	public ModelAndView getsChildbuildregion(@RequestParam(value="regionId",required=true) String regionId,PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "comfort/comfortView";
		String pid = regionId;
		mav.setViewName(url);
		
		try {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				Set<Buildregioninfo> buildregionParentList = buildregioninfoService.getParentBuildregioninfos(buildId);
				mav.addObject("buildregionParentList", buildregionParentList);
//				Set<Buildregioninfo> buildregionChildList = buildregioninfoService.getBuildregioninfos(buildId);
//				mav.addObject("buildregionChildList", buildregionChildList);
			 }
			Buildregioninfo  buildregioninfo = buildregioninfoService.getBuildregioninfo(regionId);
			String imageChildfilePath = buildregioninfo.getRegionImage();
			mav.addObject("imageChildfilePath", imageChildfilePath);
			mav.addObject("pid", pid);
			mav.addObject("imagefilePath", "");
			
			ArrayList<Buildregioninfo> tagidList = new ArrayList<Buildregioninfo>();
			
			String wsUrl = null;
			Buildsettinginfo settinginfo = null;
			Buildinfo buildinfo = new Buildinfo();
			buildinfo = buildService.getBuildinfo(buildId);
			settinginfo = buildinfo.getBuildsettinginfo();
			if (settinginfo != null) {
				wsUrl = settinginfo.getSettingWsurl();
			}
			String st1 = "serie13"+pid,  st11 = "serie11"+pid, st12 = "serie12"+pid;
			String st2 = "serie23"+pid,  st21 = "serie21"+pid, st22 = "serie22"+pid;
			String st3 = "serie33"+pid,  st31 = "serie31"+pid, st32 = "serie32"+pid;
			String st4 = "serie43"+pid,  st41 = "serie41"+pid, st42 = "serie42"+pid;
			String st5 = "serie53"+pid,  st51 = "serie51"+pid, st52 = "serie52"+pid;
			String st6 = "serie63"+pid,  st61 = "serie61"+pid, st62 = "serie62"+pid;
			String st7 = "serie73"+pid,  st71 = "serie71"+pid, st72 = "serie72"+pid;
			String st8 = "serie83"+pid,  st81 = "serie81"+pid, st82 = "serie82"+pid;
			String tagid1 = prefs.getValue(st1, "");
			  if(!tagid1.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st11, "");
				  String to = prefs.getValue(st12, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setTitle("A");
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid1));
				  tagidList.add(buildregioninfotagid);
			  }
			  
			String tagid2 = prefs.getValue(st2, "");
			if(!tagid2.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st21, "");
				  String to = prefs.getValue(st22, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTitle("B");
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid2));
				  tagidList.add(buildregioninfotagid);
			  }
			
			String tagid3 = prefs.getValue(st3, "");
			if(!tagid3.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st31, "");
				  String to = prefs.getValue(st32, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setTitle("C");
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid3));
				  tagidList.add(buildregioninfotagid);
			  }
			String tagid4 = prefs.getValue(st4, "");
			if(!tagid4.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st41, "");
				  String to = prefs.getValue(st42, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTitle("D");
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid4));
				  tagidList.add(buildregioninfotagid);
			  }
			String tagid5 = prefs.getValue(st5, "");
			if(!tagid5.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st51, "");
				  String to = prefs.getValue(st52, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setTitle("E");
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid5));
				  tagidList.add(buildregioninfotagid);
			  }
			String tagid6 = prefs.getValue(st6, "");
			if(!tagid6.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st61, "");
				  String to = prefs.getValue(st62, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setTitle("F");
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid6));
				  tagidList.add(buildregioninfotagid);
			  }
			String tagid7 = prefs.getValue(st7, "");
			if(!tagid7.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st71, "");
				  String to = prefs.getValue(st72, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTitle("G");
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid7));
				  tagidList.add(buildregioninfotagid);
			  }
			String tagid8 = prefs.getValue(st8, "");
			if(!tagid8.equals("")){
				  Buildregioninfo  buildregioninfotagid = new  Buildregioninfo();
				  String le = prefs.getValue(st81, "");
				  String to = prefs.getValue(st82, "");
				  if(le.equals("")){
					  le="0";
				  }
				  if(to.equals("")){
					  to="0";
				  }
				  Double left = Double.valueOf(le);
				  Double top =  Double.valueOf(to);
				  buildregioninfotagid.setTitle("H");
				  buildregioninfotagid.setLeft(left);
				  buildregioninfotagid.setTop(top);
				  buildregioninfotagid.setUrl(getQueryUrl(wsUrl,tagid8));
				  tagidList.add(buildregioninfotagid);
			  }
			mav.addObject("tagidList", tagidList);
			
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}
	
	private String getQueryUrl(String wsUrl, String tagid) 
	{
    List<Queryresult> tempQr = null;
	Date d = new Date(); 
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss "); 
	sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai")); 
	String str = sdf.format(d);
	String a[] = str.split(" "); 
	String str1 = a[0];
	String str2 = a[1];
	String F = str1+ "T"+str2.substring(0, 2)+":00:00";
	String queryUrl = wsUrl + "/tag/history/query/p?tagid="+tagid+"&tfrom="+F+"&tspan=3600";
	try {
	tempQr = chartService.getQueryresult(queryUrl);
	 }
	  catch (NullPointerException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {

			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
        }
	Queryresult queryresult = new Queryresult();
	queryresult = tempQr.get(0);
	String fh = queryresult.getVal();
	return fh;
   }
}