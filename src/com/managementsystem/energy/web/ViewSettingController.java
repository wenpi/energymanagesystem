package com.managementsystem.energy.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.domain.Energyprice;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.QueryTotalresult;
import com.managementsystem.energy.portlet.chart.model.Queryresult;
import com.managementsystem.energy.portlet.chart.service.ChartService;
import com.managementsystem.energy.service.BigdistrictinfoService;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.DatacenterService;
import com.managementsystem.energy.service.DictionaryService;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.energy.service.EnergyStandardService;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.service.EnergypriceService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.ui.easyui.Datagrid;
import com.managementsystem.util.dao.Page;

/**
 * 系统设置
 * 
 * @author CHENPING
 * */
@Controller
@RequestMapping("VIEW")
public class ViewSettingController  extends BaseController {

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
	private CircuitinfoService circuitinfoService;
	
	@Autowired
	private MeteruseinfoService meteruseinfoService;
	
	@Autowired
	private EnergyitemdictService energyitemdictService;
	
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private ChartService chartService;
	
	@Autowired
	private EnergyStandardService energyStandardService;
	
	/**
	 * 设置模块显示首页
	 * */
	@RenderMapping
	public ModelAndView setupDatacenter() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listSetting");
		return mav;
	}
	
	/**
	 * 获取数据中心数据
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value="getDatacenters")
	public Page getDatacenters(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page dcPaged = datacenterService.getPagedDatacenters(page, rows);
		return dcPaged;
	}
	
	/**
	 * 获取数据中心查询
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 查询结果
	 * */
	@ResourceMapping(value="getDatacentersBySearch")
	public Page getDatacentersBySearch(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		String id ="",name="",type="";
		if(request.getParameter("datacenterId")!=null) {
			id = request.getParameter("datacenterId");
		}
		if(request.getParameter("datacenterName")!=null) {
			name = request.getParameter("datacenterName");	
		}
		if(request.getParameter("datacenterType")!=null) {
			type = request.getParameter("datacenterType");		
		}
		Page dcPaged = datacenterService.getPagedDatacentersBySearch(page, rows, id,name,type);
		return dcPaged;
	}
	
	
	/**
	 * 设置数据字典
	 * */
	@RenderMapping(params="action=listDictionary")
	public ModelAndView setupListDictionary() {
		ModelAndView mav = new ModelAndView();
		Set<Dictgroup> dictgroups = dictionaryService.getDictgroups();
		mav.addObject("dictgroups", dictgroups);
		mav.setViewName("setting/listDictionary");
		return mav;
	}
	
	/**
	 * 获取指定字典组代码的字典数据
	 * @param groupCode 字典组代码
	 * 
	 * @return 字典数据
	 * */
	@ResourceMapping(value="getDictitemByGroupcode")
	public Datagrid getDictitemByGroupcode(@RequestParam("groupCode") String groupCode) {
		Datagrid datagrid = new Datagrid();
		
		Set<Dictitem> dictitems = dictionaryService.getDictitemBygroupCode(groupCode);
		datagrid.setTotal(new Long(dictitems.size()));
		datagrid.setRows(new ArrayList<Dictitem>(dictitems));
		
		return datagrid;
	}

	/**
	 * 获取行政区划字典
	 * */
	@RenderMapping(params="action=listDistrict")
	public ModelAndView setupListDistrict() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listDistrict");
		return mav;
	}
	
	/**
	 * 获取行政区划数据
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value="getDistricts")
	public Page getDistricts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapCondition = new HashMap<String,Object>();
		
		String districtId ="",districtName="",districtPostcode="",districtAreacode;
		if(request.getParameter("districtId")!=null) {
			districtId = request.getParameter("districtId");
			mapCondition.put("districtId", districtId);
		}
		if(request.getParameter("districtName")!=null) {
			districtName = request.getParameter("districtName");	
			mapCondition.put("districtName", districtName);
		}
		if(request.getParameter("districtPostcode")!=null) {
			districtPostcode = request.getParameter("districtPostcode");
			mapCondition.put("districtPostcode", districtPostcode);
		}
		if(request.getParameter("districtAreacode")!=null) {
			districtAreacode = request.getParameter("districtAreacode");
			mapCondition.put("districtAreacode", districtAreacode);
		}
		
		Page dcPaged = districtService.getPagedDictgrouies(page, rows, mapCondition);
		return dcPaged;
	}
	
	/**
	 * 获取价格信息页面
	 * */
	@RenderMapping(params="action=listEnergytotal")
	public ModelAndView setupListEnergytotal() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listEnergytotal");
		return mav;
	}
	
	/**
	 * 获取建筑能耗标准页面
	 * */
	@RenderMapping(params="action=listEnergystandard")
	public ModelAndView setuplistEnergystandard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listEnergystandard");
		return mav;
	}
	
	/**
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 
	 * */
	@ResourceMapping(value="getListEnergystandard")
	public Page getListEnergystandard(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapCondition = new HashMap<String,Object>();
		
		String standardName=null,standardType=null;
		if(request.getParameter("standardName")!=null) {
			standardName = request.getParameter("standardName");
			mapCondition.put("standardName", standardName);
		}
		if(request.getParameter("standardType")!=null) {
			standardType= request.getParameter("standardType");
			mapCondition.put("standardType", standardType);
		}
		Page dcPaged = energyStandardService.findEnergyStandards(page, rows, mapCondition);
		return dcPaged;
	}
	
	/**
	 * 获取价格信息页面
	 * */
	@RenderMapping(params="action=listEnergyprice")
	public ModelAndView setupListEnergyprice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listEnergyprice");
		return mav;
	}
	
	/**
	 * 获取价格信息
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 
	 * */
	@ResourceMapping(value="getListEnergyprice")
	public Page getListEnergyprice(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapCondition = new HashMap<String,Object>();
		
		int pricetype , pricetypevalue ;
		if(request.getParameter("pricetype")!=null) {
			String   str = request.getParameter("pricetype");
			pricetype = Integer.parseInt(str);
			mapCondition.put("pricetype", pricetype);
		}
		if(request.getParameter("pricetypevalue")!=null) {
			String   str1= request.getParameter("pricetypevalue");
			pricetypevalue = Integer.parseInt(str1);
			mapCondition.put("pricetypevalue", pricetypevalue);
		}
		
		Page dcPaged = energypriceService.getListEnergyprice(page, rows, mapCondition);
		return dcPaged;
	}
	
	
	/**
	 * 获取能源字典
	 * 
	 * */
	@RenderMapping(params="action=listEnergydict")
	public ModelAndView setupListEnergydict() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listEnergydict");
		return mav;
	}
	

	/**
	 * 获取能源字典数据
	 * @param page 当前页
	 * @param rows 每页显示条数
	 * 
	 * @return 数据中心数据
	 * */
	@ResourceMapping(value="getEnergydicts")
	public Page getEnergydicts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String,Object> mapCondition = new HashMap<String,Object>();
		
		String energydictId ="",energydictName="";
		if(request.getParameter("energydictId")!=null) {
			energydictId = request.getParameter("energydictId");
			mapCondition.put("energydictId", energydictId);
		}
		if(request.getParameter("energydictName")!=null) {
			energydictName = request.getParameter("energydictName");	
			mapCondition.put("energydictName", energydictName);
		}

		Page dcPaged = energydictService.getEnergydicts(page, rows, mapCondition);
		return dcPaged;
	}
	
	/**
	 * 设置气候区信息 列表
	 * */
	@RenderMapping(params="action=listBigdistrict")
	public ModelAndView setupListBigdistricts() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("setting/listBigdistrict");
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
	
	@ResourceMapping(value = "getCircuit")
	public Datagrid getCircuit(ResourceRequest request, ResourceResponse response) {
		String id = "", sd = "",  st="", circuitId="", nh="", ed="", sxs="",exs="";
		List<Queryresult> tempQr = null;
		Page itemPage = null;
		Datagrid dg = new Datagrid();
		if(request.getParameter("id")!=null)
			id = request.getParameter("id");
		if(request.getParameter("sd")!=null)
			sd = request.getParameter("sd");
		if(request.getParameter("st")!=null)
			st = request.getParameter("st");
		if(request.getParameter("nh")!=null)
			nh = request.getParameter("nh");
		if(request.getParameter("ed")!=null)
			ed = request.getParameter("ed");
		if(request.getParameter("sxs")!=null)
			sxs = request.getParameter("sxs");
		if(request.getParameter("exs")!=null)
			exs = request.getParameter("exs");
		
		
		Energyitemdict energyitemdict = new Energyitemdict();
		energyitemdict = energyitemdictService.getEnergyitemdict(nh);
		String  energydictId = energyitemdict.getEnergydict().getEnergydictId();
		Energyprice  energyprice = new Energyprice();
		energyprice = energypriceService.getEnergypriceByenergydictId(energydictId);
		Double price =energyprice.getPrice()  ;
		String wsUrl = null, tagids = null;
		Buildsettinginfo settinginfo = null;
		Buildinfo buildinfo = new Buildinfo();
		buildinfo = buildService.getBuildinfo(id);
		settinginfo = buildinfo.getBuildsettinginfo();
		if (settinginfo != null) {
			wsUrl = settinginfo.getSettingWsurl();
		}
		// 获取能耗分类项
//				Set<Energyitemdict> energyitemdicts = energyitemdictService
//						.getEnergyitemdictsByType();
//				Energyitemdict energyitemdict = null;
//	     for (Iterator<Energyitemdict> iterator = energyitemdicts.iterator(); iterator
//						.hasNext();) {
//					energyitemdict = (Energyitemdict) iterator.next();	
//					List<Queryresult> result = null;
					// 获取当前建筑指定的能耗分类分项代码的设备属性
			    List<Meteruseattribute> attributelist = meteruseinfoService
							.getMeteruseattributesByEnergyitemcode(
									id,nh);			
					
			    tagids = meteruseinfoService
						.getMeteruseattributesByEnergyitemcodeToString(attributelist);
			    List<QueryTotalresult> list= new ArrayList<QueryTotalresult>();
			    if(tagids==null||tagids.equals("")||tagids.equals("null")){
			    	list= new ArrayList<QueryTotalresult>();
			    }
			    else{
			    int num = 0;
			    for (int tj = 0; tj < tagids.length(); tj++) {
			    	String getS = tagids.substring(tj , tj + 1);			
			    	if(getS.equals(","))
			    	num ++ ;
			    }
			  try {
				int counts=0;
				if(st.equals("1")){
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			         Date bDate = format.parse(sd);
			         Date eDate = format.parse(ed);
			         Calendar d1 = new GregorianCalendar();
			         d1.setTime(bDate);
			         Calendar d2 = new GregorianCalendar();
			         d2.setTime(eDate);
			         int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
			         int y2 = d2.get(Calendar.YEAR);
			        if (d1.get(Calendar.YEAR) != y2)
			        {
			               d1 = (Calendar) d1.clone();
			              do   {
			                          days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);//得到当年的实际天数
			                          d1.add(Calendar.YEAR, 1);
			            }
			              while (d1.get(Calendar.YEAR) != y2);
			       }
			      counts =  days;
			      if(counts>=2){
			    	  counts = 24;
			      }
			      else{
			    	  int test =0; 
			    	  if(counts==1){
			    		test = 24-Integer.parseInt(sxs)+Integer.parseInt(exs);
			    	    if(test>24){
			    		  counts = 24; 
			    	    }
			    	    else{
			    		  counts = test+1;
			    	    }
			           }
			    	  else{
			    		 counts = Integer.parseInt(exs) - Integer.parseInt(sxs)+1;
			    	  }
			      }
			      wsUrl = getQueryUrl(wsUrl,tagids,sd,st,sxs)+"&count="+String.valueOf(counts);
			      tempQr = chartService.getQueryresult(wsUrl);
					for(int k = 0;k<counts; k++){
						Queryresult queryresult = new Queryresult();
						QueryTotalresult queryTotalresult = new QueryTotalresult();
						queryresult = tempQr.get(k);
						  String time =  queryresult.getTime();
						  float val =  Float.parseFloat(queryresult.getVal());
						   for(int m = 0; m<num ; m++){
							   val += Float.parseFloat(tempQr.get(k+counts*(m+1)).getVal());
					   }   
						   Double valDouble = Double.valueOf(String.valueOf(val));
						   Double total = valDouble*price;
						   queryTotalresult.setTime(time);
						   queryTotalresult.setVal(String.valueOf(val));
						   queryTotalresult.setPrice(String.valueOf(price));
						   queryTotalresult.setTotal(String.valueOf(total));
						   list.add(queryTotalresult);
					} 
				}
				
				
				
                if(st.equals("2")){
                	wsUrl = getQueryUrl(wsUrl,tagids,sd,st,sxs);
  			        tempQr = chartService.getQueryresult(wsUrl);
                	for(int k = 0;k<7; k++){
						Queryresult queryresult = new Queryresult();
						QueryTotalresult queryTotalresult = new QueryTotalresult();
						queryresult = tempQr.get(k);
						  String time =  queryresult.getTime();
						  float val =  Float.parseFloat(queryresult.getVal());
						   for(int m = 0; m<num ; m++){
							   val += Float.parseFloat(tempQr.get(k+7*(m+1)).getVal());
					   }   
						   Double valDouble = Double.valueOf(String.valueOf(val));
						   Double total = valDouble*price;
						   queryTotalresult.setTime(time);
						   queryTotalresult.setVal(String.valueOf(val));
						   queryTotalresult.setPrice(String.valueOf(price));
						   queryTotalresult.setTotal(String.valueOf(total));
						   list.add(queryTotalresult);
					} 
				}
                if(st.equals("3")){
                	wsUrl = getQueryUrl(wsUrl,tagids,sd,st,sxs);
                	tempQr = chartService.getQueryresult(wsUrl);
					String bz = tempQr.get(0).getTagid();
					int yb = 0;
					for(int hf=0;hf<tempQr.size();hf++){
						if(bz.equals(tempQr.get(hf).getTagid())){
							yb+=1;
						}
						else{
							break;
						}
					}
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			         Date bDate = format.parse(sd);
			         Date eDate = format.parse(ed);
			         Calendar d1 = new GregorianCalendar();
			         d1.setTime(bDate);
			         Calendar d2 = new GregorianCalendar();
			         d2.setTime(eDate);
			         int days = d2.get(Calendar.DAY_OF_YEAR) - d1.get(Calendar.DAY_OF_YEAR);
			         int y2 = d2.get(Calendar.YEAR);
			        if (d1.get(Calendar.YEAR) != y2)
			        {
			               d1 = (Calendar) d1.clone();
			              do   {
			                          days += d1.getActualMaximum(Calendar.DAY_OF_YEAR);//得到当年的实际天数
			                          d1.add(Calendar.YEAR, 1);
			            }
			              while (d1.get(Calendar.YEAR) != y2);
			        }
			        
			        counts =  days+1;
			        
			        if(counts>yb){
			        	counts = yb;
			        }
			        wsUrl = getQueryUrl(wsUrl,tagids,sd,st,sxs)+"&count="+String.valueOf(counts);
				    tempQr = chartService.getQueryresult(wsUrl);
					for(int k = 0;k<counts; k++){
						Queryresult queryresult = new Queryresult();
						QueryTotalresult queryTotalresult = new QueryTotalresult();
						queryresult = tempQr.get(k);
						  String time =  queryresult.getTime();
						  float val =  Float.parseFloat(queryresult.getVal());
						   for(int m = 0; m<num ; m++){
							   val += Float.parseFloat(tempQr.get(k+counts*(m+1)).getVal());
					   }   
						   Double valDouble = Double.valueOf(String.valueOf(val));
						   Double total = valDouble*price;
						   queryTotalresult.setTime(time);
						   queryTotalresult.setVal(String.valueOf(val));
						   queryTotalresult.setPrice(String.valueOf(price));
						   queryTotalresult.setTotal(String.valueOf(total));
						   list.add(queryTotalresult);
					} 	
				   	
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
			   
	     
	     
//		
//	 List<Tree> trees = circuitinfoService.getCircuitComboTree(id);
//	 for(int i=0;i<trees.size();i++){
//		 Tree tree =  trees.get(i); 
//		 circuitId =  tree.getId();
//		 List<Meteruseinfo> data = new ArrayList<Meteruseinfo>(
//					meteruseinfoService.getMeteruseinfosByCircuitId(circuitId));
//		 
//		for(int ) 
//		 Meteruseattribute meteruseattribut = meteruseinfoService.getMeteruseattribute(data);
//	 }
	
//		Datagrid dg = new Datagrid();
//		List<BuildEnergyItem> result = new ArrayList<BuildEnergyItem>();
//		if(reportDetailData!=null) {
//			Iterator it = reportDetailData.entrySet().iterator();
//			while(it.hasNext()) {
//				 Map.Entry pairs = (Map.Entry)it.next();
//				 String key = pairs.getKey().toString();
//				 if(energyItemname.equals(key)) {
//					 Map<String,Object> buildEnergy = (Map<String,Object>)pairs.getValue();
//					 for(Iterator itrator=buildEnergy.entrySet().iterator();itrator.hasNext();) {
//						 Map.Entry buildpairs = (Map.Entry)itrator.next();
//						 BuildEnergyItem item = new BuildEnergyItem();
//						 item.setBuildName(buildpairs.getKey().toString());
//						 item.setEnergyVal(buildpairs.getValue().toString());
//						 result.add(item);
//					 }
//					break; 
//				 }
//			}
//		}
//		dg.setRows(result);
//		dg.setTotal(new Long(result.size()));
//		return dg;
			    }
		dg.setRows(list);
		dg.setTotal(new Long(list.size()));
		return dg;	    
	}
	
	/**
	 * 获取查询URL
	 * @return 查询URL
	 * */
	private String getQueryUrl(String wsUrl, String tagids,
			String from, String type, String sxs) {
		String cxlx="";
		String tfrom ="";
		// 定义查询URL
		String queryUrl = wsUrl + "/tag/history/";
		// 查询类型
		if(type.equals("1")){
			cxlx = "dayreport";
		    tfrom = from + "T"+sxs+":0:0";
		}
		if(type.equals("2")){
			cxlx = "weekreport";
		    tfrom = from;
		}
		if(type.equals("3")){
			cxlx = "monthreport";
		    tfrom = from;
		}
		queryUrl += cxlx;
		queryUrl += "/list?";
		if (StringUtils.hasLength(tagids)) {
			queryUrl += "tagid=" + tagids;
		}
		queryUrl += "&tfrom=" + tfrom;
		return queryUrl;
	}
	
	/**
	 * 获取能耗分类分项数据
	 * 
	 * @param page 当前页码
	 * @param rows 每页显示行数
	 * */
	@ResourceMapping(value="getEnergyitemdictsByType")
	public Page getEnergyitemdicts(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Page itemPage = energyitemdictService.getPagedEnergyitemdictsByType(page, rows);
		return itemPage;
	}
}
