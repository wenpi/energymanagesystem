package com.managementsystem.energy.portlet.buildstruct;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import com.managementsystem.energy.domain.QueryTotalresult;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.ui.easyui.JsonResult;

@Controller
@RequestMapping("VIEW")
public class BuildstructViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private BuildService buildService;
	@Autowired
	private DistrictService districtService;
	@Autowired
	private BuildregioninfoService buildregioninfoService;
	@Autowired
	private ChartService chartService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		Buildinfo buildinfo = null;
		String imagefilePath = "";
		if (prefs.getMap().size() == 0) {
			List<Buildregioninfo> buildregionParentList = new ArrayList<Buildregioninfo>();
		} else {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				Set<Buildregioninfo> buildregionParentList = buildregioninfoService
						.getParentBuildregioninfos(buildId);
				model.addAttribute("buildregionParentList",
						buildregionParentList);
				buildinfo = buildService.getBuildcover(buildId);
				if (buildinfo != null
						&& buildinfo.getBuildaddfiles().size() > 0) {
					Set<Buildaddfile> addfiles = buildinfo.getBuildaddfiles();
					for (Iterator<Buildaddfile> it = addfiles.iterator(); it
							.hasNext();) {
						Buildaddfile addfile = it.next();
						if (addfile.getAddfileFunctype() == 0) {
							imagefilePath = addfile.getAddfilePath();
							break;
						}
					}
				}
			}
		}
		model.addAttribute("imagefilePath", imagefilePath);
		model.addAttribute("imageChildfilePath", "");
		return PORTLETFOLDER + "buildstruct/buildstructView";
	}

	@RenderMapping(params = "action=getbuildregion")
	public ModelAndView getsChildbuildregion(
			@RequestParam(value = "regionId", required = true) String regionId,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		String url = PORTLETFOLDER + "buildstruct/buildstructView";
		String pid = regionId;
		mav.setViewName(url);
		String qdserie2 = "serie2" + regionId;
		String fHserie2 = prefs.getValue(qdserie2, "");

		try {
			String buildId = prefs.getValue("buildId", "");
			if (StringUtils.hasLength(buildId)) {
				Set<Buildregioninfo> buildregionParentList = buildregioninfoService
						.getParentBuildregioninfos(buildId);
				mav.addObject("buildregionParentList", buildregionParentList);
			}
			Buildregioninfo buildregioninfo = buildregioninfoService
					.getBuildregioninfo(regionId);
			String imageChildfilePath = buildregioninfo.getRegionImage();
			mav.addObject("imageChildfilePath", imageChildfilePath);
			mav.addObject("pid", pid);
			mav.addObject("fHserie2", fHserie2);
			mav.addObject("imagefilePath", "");
		} catch (Exception e) {
			logger.error(e);
		}
		return mav;
	}

	@ResourceMapping(value = "showPMV")
	public JsonResult showPMV(ResourceRequest request,
			ResourceResponse response, PortletPreferences prefs) {
		ArrayList<Buildregioninfo> tagidList = new ArrayList<Buildregioninfo>();
		String pid = "";
		if (request.getParameter("regionId") != null) {
			pid = request.getParameter("regionId");
		}
		String buildId = prefs.getValue("buildId", "");
		String wsUrl = null;
		Buildsettinginfo settinginfo = null;
		Buildinfo buildinfo = new Buildinfo();
		buildinfo = buildService.getBuildinfo(buildId);
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
		}
		for (int i = 1; i <= 8; i++) {
			String st = "serie" + String.valueOf(i) + "3" + pid;
			String stle = "serie" + String.valueOf(i) + "1" + pid;
			String stto = "serie" + String.valueOf(i) + "2" + pid;
			String sttitle = "serie" + String.valueOf(i) + "4" + pid;
			String tagidXh = prefs.getValue(st, "");
			if (!tagidXh.equals("")) {
				Buildregioninfo buildregioninfotagid = new Buildregioninfo();
				String le = prefs.getValue(stle, "");
				String to = prefs.getValue(stto, "");
				String title = prefs.getValue(sttitle, "");
				if (le.equals("")) {
					le = "0";
				}
				if (to.equals("")) {
					to = "0";
				}
				Double left = Double.valueOf(le);
				Double top = Double.valueOf(to);
				buildregioninfotagid.setTitle(title);
				buildregioninfotagid.setLeft(left);
				buildregioninfotagid.setTop(top);
				buildregioninfotagid.setUrl(getQueryUrlBy(wsUrl, tagidXh));
				tagidList.add(buildregioninfotagid);
			}
		}
		JsonResult result = new JsonResult();
		result.setData(tagidList);
		return result;
	}

	@ResourceMapping(value = "getHdresult")
	public Datagrid getHdresult(ResourceRequest request,
			ResourceResponse response, PortletPreferences prefs) {
		String gs = getGs();
		String regionId = "";
		List<Queryresult> tempQr = null;
		Datagrid dg = new Datagrid();
		String buildId = prefs.getValue("buildId", "");
		String wsUrl = null, tagids = null;
		Buildsettinginfo settinginfo = null;
		Buildinfo buildinfo = new Buildinfo();
		buildinfo = buildService.getBuildinfo(buildId);
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		String serieId1 = "serie1" + regionId;
		tagids = prefs.getValue(serieId1, "");
		List<QueryTotalresult> list = new ArrayList<QueryTotalresult>();
		if (tagids == null || tagids.equals("") || tagids.equals("null")) {
			list = new ArrayList<QueryTotalresult>();
		} else {
			int num = 0;
			for (int tj = 0; tj < tagids.length(); tj++) {
				String getS = tagids.substring(tj, tj + 1);
				if (getS.equals(","))
					num++;
			}
			try {
				wsUrl = getQueryUrl(wsUrl, tagids);
				tempQr = chartService.getQueryresult(wsUrl);
//				for (int wlq = 0; wlq < tempQr.size(); wlq++) {
//					double twlq = (double) (wlq - 10);
//					tempQr.get(wlq).setVal(String.valueOf(twlq));
//				}
				int counts = Integer.parseInt(gs) + 1;
				double total = 0;
				for (int k = 1; k < counts; k++) {
					Queryresult queryresult = new Queryresult();
					Queryresult queryresult0 = new Queryresult();
					QueryTotalresult queryTotalresult = new QueryTotalresult();
					queryresult = tempQr.get(k);
					queryresult0 = tempQr.get(k - 1);
					String time = queryresult.getTime();
					double val = Double.parseDouble(queryresult.getVal());
					val=(val<0)?0:val;
					double val0 = Double.parseDouble(queryresult0.getVal());
					val0 = (val0 < 0)?0:val0;
					double zgVal = val - val0;
					zgVal = (zgVal < 0)?0:zgVal;
					double sumZj = 0;
					for (int m = 0; m < num; m++) {
						double zj1 = Double.parseDouble(tempQr.get(
								k + counts * (m + 1)).getVal());
						zj1 = (zj1 < 0)?0:zj1;
						double zj2 = Double.parseDouble(tempQr.get(
								k + counts * (m + 1) - 1).getVal());
						zj2 = (zj2 < 0)?0:zj2;
						double zj = zj1 - zj2;
						sumZj += zj;
						sumZj = (sumZj < 0)?0:sumZj;
					}
					zgVal += sumZj;
					total += zgVal;
					queryTotalresult.setTotal(String.valueOf(total));
					queryTotalresult.setTime(time);
					queryTotalresult.setVal(String.valueOf(zgVal));
					list.add(queryTotalresult);
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {

				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		dg.setRows(list);
		dg.setTotal(new Long(list.size()));
		return dg;
	}

	@ResourceMapping(value = "getLlresult")
	public Datagrid getLlresult(ResourceRequest request,
			ResourceResponse response, PortletPreferences prefs) {
		String gs = getGs();
		String regionId = "";
		List<Queryresult> tempQr = null;
		Datagrid dg = new Datagrid();
		String buildId = prefs.getValue("buildId", "");
		String wsUrl = null, tagids = null;
		Buildsettinginfo settinginfo = null;
		Buildinfo buildinfo = new Buildinfo();
		buildinfo = buildService.getBuildinfo(buildId);
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		String serieId2 = "serie2" + regionId;
		tagids = prefs.getValue(serieId2, "");
		List<QueryTotalresult> list = new ArrayList<QueryTotalresult>();
		if (tagids == null || tagids.equals("") || tagids.equals("null")) {
			list = new ArrayList<QueryTotalresult>();
		} else {
			int num = 0;
			for (int tj = 0; tj < tagids.length(); tj++) {
				String getS = tagids.substring(tj, tj + 1);
				if (getS.equals(","))
					num++;
			}
			try {
				wsUrl = getQueryUrl(wsUrl, tagids);
				tempQr = chartService.getQueryresult(wsUrl);
//				for (int wlq = 0; wlq < tempQr.size(); wlq++) {
//					double twlq = (double) (wlq - 10);
//					tempQr.get(wlq).setVal(String.valueOf(twlq));
//				}
				int counts = Integer.parseInt(gs) + 1;
				double total = 0;
				for (int k = 1; k < counts; k++) {
					Queryresult queryresult = new Queryresult();
					Queryresult queryresult0 = new Queryresult();
					QueryTotalresult queryTotalresult = new QueryTotalresult();
					queryresult = tempQr.get(k);
					queryresult0 = tempQr.get(k - 1);
					String time = queryresult.getTime();
					double val = Double.parseDouble(queryresult.getVal());
					val=(val<0)?0:val;
					double val0 = Double.parseDouble(queryresult0.getVal());
					val0 = (val0 < 0)?0:val0;
					double zgVal = val - val0;
					zgVal = (zgVal < 0)?0:zgVal;
					double sumZj = 0;
					for (int m = 0; m < num; m++) {
						double zj1 = Double.parseDouble(tempQr.get(
								k + counts * (m + 1)).getVal());
						zj1 = (zj1 < 0)?0:zj1;
						double zj2 = Double.parseDouble(tempQr.get(
								k + counts * (m + 1) - 1).getVal());
						zj2 = (zj2 < 0)?0:zj2;
						double zj = zj1 - zj2;
						sumZj += zj;
						sumZj = (sumZj < 0)?0:sumZj;
					}
					zgVal += sumZj;
					total += zgVal;
					queryTotalresult.setTotal(String.valueOf(total));
					queryTotalresult.setTime(time);
					queryTotalresult.setVal(String.valueOf(zgVal));
					list.add(queryTotalresult);
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {

				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		dg.setRows(list);
		dg.setTotal(new Long(list.size()));
		return dg;
	}

	@ResourceMapping(value = "getPMVresult")
	public Datagrid getPMVresult(ResourceRequest request,
			ResourceResponse response, PortletPreferences prefs) {
		String gs = getGs();
		String regionId = "";
		List<Queryresult> tempQr = null;
		Datagrid dg = new Datagrid();
		String buildId = prefs.getValue("buildId", "");
		String wsUrl = null, tagids = null;
		Buildsettinginfo settinginfo = null;
		Buildinfo buildinfo = new Buildinfo();
		buildinfo = buildService.getBuildinfo(buildId);
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
		}
		if (request.getParameter("regionId") != null) {
			regionId = request.getParameter("regionId");
		}
		String serieId3 = "serie3" + regionId;
		tagids = prefs.getValue(serieId3, "");
		List<QueryTotalresult> list = new ArrayList<QueryTotalresult>();
		if (tagids == null || tagids.equals("") || tagids.equals("null")) {
			list = new ArrayList<QueryTotalresult>();
		} else {
			int num = 0;
			for (int tj = 0; tj < tagids.length(); tj++) {
				String getS = tagids.substring(tj, tj + 1);
				if (getS.equals(","))
					num++;
			}
			try {
				wsUrl = getQueryUrl(wsUrl, tagids);
				tempQr = chartService.getQueryresult(wsUrl);
				int counts = Integer.parseInt(gs) + 1;
				for (int k = 0; k < counts; k++) {
					Queryresult queryresult = new Queryresult();
					QueryTotalresult queryTotalresult = new QueryTotalresult();
					queryresult = tempQr.get(k);
					String time = queryresult.getTime();
					double val = Double.parseDouble(queryresult.getVal());
					for (int m = 0; m < num; m++) {
						val += Double.parseDouble(tempQr.get(
								k + counts * (m + 1)).getVal());
					}

					queryTotalresult.setTime(time);
					queryTotalresult.setVal(String.valueOf(val));
					list.add(queryTotalresult);
				}
			} catch (NullPointerException e) {
				e.printStackTrace();
			} catch (MalformedURLException e) {

				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}
		dg.setRows(list);
		dg.setTotal(new Long(list.size()));
		return dg;
	}

	private String getQueryUrl(String wsUrl, String tagid) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		String str = sdf.format(d);
		String a[] = str.split(" ");
		String str1 = a[0];
		String str2 = a[1];
		Date date = null;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = format.parse(str1);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.util.Date yestoday = new java.util.Date(
				date.getTime() - 24 * 3600 * 1000);
		yestoday.toString();
		String f = format.format(yestoday) + "T23:00:00";
		String t = str1 + "T" + str2.substring(0, 2) + ":00:00";
		String queryUrl = wsUrl + "/tag/history/query/p?tagid=" + tagid
				+ "&tfrom=" + f + "&tto=" + t + "&tspan=3600";
		return queryUrl;
	}

	private String getGs() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		String str = sdf.format(d);
		String a[] = str.split(" ");
		String str1 = a[1];
		String t = str1.substring(0, 2);
		String gt = t.substring(0, 1);
		if (gt.equals("0")) {
			t = t.substring(1, 2);
		}
		int tjgs = Integer.parseInt(t) + 1;
		return String.valueOf(tjgs);
	}

	private String getQueryUrlBy(String wsUrl, String tagid) {
		List<Queryresult> tempQr = null;
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
		sdf.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		String str = sdf.format(d);
		String a[] = str.split(" ");
		String str1 = a[0];
		String str2 = a[1];
		String F = str1 + "T" + str2.substring(0, 2) + ":00:00";
		String queryUrl = wsUrl + "/tag/history/query/p?tagid=" + tagid
				+ "&tfrom=" + F + "&tspan=3600";
		try {
			tempQr = chartService.getQueryresult(queryUrl);
		} catch (NullPointerException e) {
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
