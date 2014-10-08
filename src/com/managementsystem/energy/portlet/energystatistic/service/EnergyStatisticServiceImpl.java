package com.managementsystem.energy.portlet.energystatistic.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletContext;
import javax.portlet.ResourceRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.type.TypeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.managementsystem.energy.portlet.energystatistic.model.CommonModel;
import com.managementsystem.energy.portlet.energystatistic.model.PreferenceInfo;
import com.managementsystem.energy.portlet.holographic.service.RemoteServiceInvoker;
import com.managementsystem.energy.portlet.holographic.vo.ServcieSettingHolder;
import com.managementsystem.energy.portlet.holographic.vo.ServiceReqParam;

@Service
public class EnergyStatisticServiceImpl implements EnergyStatisticService {

	private final Log logger = LogFactory
			.getLog(EnergyStatisticServiceImpl.class);

	@Autowired
	private RemoteServiceInvoker remoteServiceInvoker;

	/**
	 * 获取取值的URL后，根据其获取httpConnection
	 * 
	 * @param name
	 * @param id
	 * @param type
	 * @param tfrom
	 * @param attribute
	 * @param tspan
	 * @param ispd
	 * @param build_id
	 * @param region_id
	 * @return
	 * @throws IOException
	 */
	private HttpURLConnection getHttpConnection(String name, String id,
			String type, String tfrom, String attribute, String tspan,
			String ispd, String build_id, String region_id) throws IOException {
		ServiceReqParam param = new ServiceReqParam();
		param.setName(name);
		param.setId(id);
		param.setType(type);
		// param.setType(("span".equalsIgnoreCase(type) ? "day" : type)); //
		// 如果type传递过来是span，则暂时用day代替
		param.setTfrom(tfrom);
		param.setAttribute(attribute == null ? "" : attribute);
		param.setTspan(tspan);
		param.setIspd(ispd);
		param.setBuild_id(build_id);
		param.setRegion_id(region_id);

		if ("span".equalsIgnoreCase(type)) // 如果type为span，设置tto的值，为了获取开启
			param.setTto(new ServcieSettingHolder().getCurrentDate());

		if ("test_span".equalsIgnoreCase(type)) { // 如果type为test_span，设置tto的值，test_span为测试配置时间
			param.setTto(new ServcieSettingHolder().getConfigDate(tfrom));
			param.setType("span");
		}
		
		String appendUrl = remoteServiceInvoker.getServiceAddress() + param + "";

		logger.info("url--" + appendUrl);

		URLConnection URLconnection = null;
		URL url = null;
		try {
			url = new URL(appendUrl);
			URLconnection = url.openConnection();
		} catch (MalformedURLException e) {
			logger.error(e);
		}
		HttpURLConnection httpConnection = (HttpURLConnection) URLconnection;

		return httpConnection;
	}

	/**
	 * 返回day的循环次数
	 * 
	 * @param starttime
	 * @param list
	 * @return
	 */
	private int getLoopsOfDay(String starttime, List list) {
		int loop = list.size(); // 循环数
		// 只循环添加小于当前小时数的值
		SimpleDateFormat shours = new SimpleDateFormat("HH");
		Date date = new Date();
		// 判断开始时间是否是今天
		SimpleDateFormat todayFormat = new SimpleDateFormat("yyyy-M-d");
		SimpleDateFormat todayFormat1 = new SimpleDateFormat("yyyy-MM-dd");

		if (starttime.equals(todayFormat.format(date))
				|| starttime.equals(todayFormat1.format(date))) { // 如果是今天，则只显示到当前的小时
			// 取配置项中配置的小时
			int prefHours = Integer
					.parseInt(com.managementsystem.portlet.common.Constants.TIMEZONE_HOUR);
			int hours = Integer.parseInt(shours.format(date)) + prefHours;
			if (list.size() > hours) {
				loop = hours;
			}
		}
		return loop;
	}

	/**
	 * 返回week的循环次数
	 * 
	 * @param list
	 * @return
	 */
	private int getLoopsOfWeek(List list) {
		int loop = list.size(); // 循环数
		if (list.size() <= 7) {
			loop = list.size();
		} else {
			loop = 7;
		}
		return loop;
	}

	// 返回单个图标需要的X轴和图标数据信息
	@Override
	public Map<String, Object> getSingleChartList(
			PreferenceInfo preferenceinfo, String type, String tfrom,
			String tto, String id, String name, String ispd, String decimals) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		try {
			List<Object> list = new ArrayList<Object>();

			HttpURLConnection httpConnection = getHttpConnection(name, id,
					type, tfrom, preferenceinfo.getAttribute(),
					preferenceinfo.getTspan(), ispd, "", "");

			int responseCode = httpConnection.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
				// 获取查询结果
				list = returnList(httpConnection, CommonModel.class);

				// 分别表示，格式化前的格式和格式化后的格式
				String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

				List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表
				List<Double> dataList = new ArrayList<Double>();// 存储数据

				// 循环处理数据，组织成对应需要的数据
				int loop = list.size();

				if ("day".equals(type)) {
					beforeFormat = "yyyy-MM-dd HH:mm:ss";
					afterFormat = "HH:mm";
					loop = getLoopsOfDay(tfrom, list); // 获取当前需要循环的次数
				} else if ("week".equals(type)) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
					loop = getLoopsOfWeek(list); // 获取周需要循环的次数
				} else if ("month".equals(type)) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
				} else if ("year".equals(type)) {
					beforeFormat = "yyyy-MM";
					afterFormat = "yyyy/MM";
					loop = list.size();
				}

				SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
				SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);

				String def = (decimals != null && decimals.length() > 0) ? decimals : "0.00";
				DecimalFormat df = new DecimalFormat(def);
				
				for (int i = 0; i < loop; i++) {
					CommonModel cm = (CommonModel) list.get(i);

					try {
						String datavalue = df.format(Double.parseDouble(cm.getValue()));

						dataList.add(Double.parseDouble(datavalue));
					} catch (Exception e) {
						dataList.add(Double.parseDouble("0"));
						logger.error(e);
					}
					
					try {
						Date nowtime = sf.parse(cm.getTime());
						cataList.add(sformat.format(nowtime));
					} catch (ParseException e) {
						cataList.add("");
						logger.error(e);
					}
				}

				resultMap.put("cataList", cataList);
				resultMap.put("dataList", dataList);
			}
		} catch (IOException e) {
			logger.error(e);
		}

		return resultMap;

	}

	// 获取多个图表需要的数据信息以及X轴需要的数据信息
	@Override
	public Map<String, Object> getMoreChartList(PreferenceInfo preferenceinfo,
			String type, String tfrom, String tto, String id, String name,
			String ispd, String reference, String referenceList, String decimals) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>(); // 存储返回对象的map
		List list = new ArrayList();
		try {
			HttpURLConnection httpConnection = getHttpConnection(name, id,
					type, tfrom, preferenceinfo.getAttribute(),
					preferenceinfo.getTspan(), ispd, "", "");
			int responseCode = httpConnection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
				// 获取查询结果
				list = returnList(httpConnection, CommonModel.class);

				// 分别表示，格式化前的格式和格式化后的格式
				String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

				List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表
				List<Double> dataList = new ArrayList<Double>();// 表示第一个图数据列表
				List<Double> paraList = new ArrayList<Double>();// 表示第二个图数据列表

				// 获取配置的对应的参考值
				String referencevalue = reference;
				if ("".equals(referencevalue) || "null".equals(referencevalue))
					referencevalue = "";

				// 循环处理数据，组织成对应需要的数据
				int loop = list.size();

				if ("day".equals(type)) {
					beforeFormat = "yyyy-MM-dd HH:mm:ss";
					afterFormat = "HH:mm";
					loop = getLoopsOfDay(tfrom, list); // 获取当前需要循环的次数
				} else if ("week".equals(type)) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
					loop = getLoopsOfWeek(list); // 获取周需要循环的次数
				} else if ("month".equals(type)) {
					beforeFormat = "yyyy-MM-dd";
					afterFormat = "MM/dd";
				} else if ("year".equals(type)) {
					beforeFormat = "yyyy-MM";
					afterFormat = "yyyy/MM";
					loop = list.size();
				}

				SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
				SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);

				// 保留小数位数
				String def = (decimals != null && decimals.length() > 0) ? decimals
						: "0.00";
				DecimalFormat df = new DecimalFormat(def);
				for (int i = 0; i < loop; i++) {
					CommonModel cm = (CommonModel) list.get(i);
					
					try {
						// 展示在图表上的数据
						double dvalue = Double.parseDouble(cm.getValue());

						// referenceList如果有值，说明是能效分析中的单位面积总能耗/单位面积空调能耗/单位面积照明能耗三项
						// 此时对referencevalue参考值进行特殊处理
						if (referenceList != null
								&& !"".equals(referenceList)
								&& referenceList.trim().length() > 0) {
							String[] reList = referenceList.split(",");

							try {
								// 如果满足以上条件的话，则需特殊处理，在数据基础上*1000
								dvalue = Double.parseDouble(cm.getValue()) * 1000;

								if ("day".equals(type)) {
									referencevalue = reList[0];
								} else if ("week".equals(type)) {
									referencevalue = reList[1];
								} else if ("month".equals(type)) {
									referencevalue = reList[2];
								} else if ("year".equals(type)) {
									referencevalue = reList[3];
								}
							} catch (Exception e) {
								logger.info("referencevalue转换的时候报错了！");
								referencevalue = "0";
							}
						}

						String datavalue = df.format(dvalue);
						dataList.add(Double.parseDouble(datavalue));

					} catch (Exception e) {
						dataList.add(Double.parseDouble("0"));
						logger.error(e);
					}
					
					try {
						Date nowtime = sf.parse(cm.getTime());
						cataList.add(sformat.format(nowtime));
					} catch (ParseException e) {
						cataList.add("");
						logger.error(e);
					}

					// 添加参考值数据到list中
					try {
						paraList.add(Double.parseDouble(referencevalue));
					} catch (NumberFormatException e) {
						paraList.add(Double.parseDouble("0"));
						logger.error(e);
					}
				}

				resultMap.put("cataList", cataList);
				resultMap.put("dataList", dataList);
				resultMap.put("paraList", paraList);
			}
		} catch (IOException e) {
			logger.error(e);
		}

		return resultMap;

	}

	// 返回单个页面需要的效果数据，此方法name只能传递单个参数，attribute支持传多个参数
	@Override
	public Map<String, Object> getValueByNameAndId(String type, String tfrom,
			String tto, String id, String name, String ispd, String att,
			String decimals, String mult) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<String> valueList = new ArrayList<String>();
			List list = new ArrayList();
			String returnStr = ""; // 返回的值

			String[] atts = att.split(",");// attrubite属性，求对应的值
			for (int i = 0; i < atts.length; i++) {
				// 获取httpConnection
				HttpURLConnection httpConnection = getHttpConnection(name, id,
						type, tfrom, atts[i], "", ispd, "", "");
				int responseCode = httpConnection.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 保留小数位数
					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					if (list.size() > 0) {
						CommonModel cm = (CommonModel) list.get(0);
						try {
							double val = Double.parseDouble(cm.getValue());
							if (atts[i].equalsIgnoreCase("change")) // 如果attribute为change的话，则乘以100
								val = val * 100;
							returnStr = df.format(val);
						} catch (Exception e) {
							returnStr = "0";
						}
					}
				}

				valueList.add(returnStr);
			}
			resultMap.put("data", valueList);
		} catch (IOException e) {
			logger.error(e);
		}
		return resultMap;
	}

	// 获取map格式的数据(针对第二版能源产品中类似最大值、最小值以及对应的时间)
	@Override
	public Map<String, Object> getDatasForAtts(String type, String tfrom,
			String tto, String id, String name, String ispd, String att,
			String decimals, String mult, String build_id, String region_id) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<Object> finalList = new ArrayList<Object>();
			List list = new ArrayList();
			String[] atts = att.split(",");// attrubite属性，求对应的值
			for (int i = 0; i < atts.length; i++) {
				List<Object> tempList = new ArrayList<Object>();
				// 获取httpConnection
				HttpURLConnection httpConnection = getHttpConnection(name, id,
						type, tfrom, atts[i], "", ispd, build_id, region_id);
				int responseCode = httpConnection.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 保留小数位数
					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					if (list.size() > 0) {
						CommonModel cm = (CommonModel) list.get(0);
						try {
							double val = Double.parseDouble(cm.getValue());
							if (atts[i].equalsIgnoreCase("change")) // 如果attribute为change的话，则乘以100
								val = val * 100;
							tempList.add(df.format(val));
							tempList.add(cm.getTime());
						} catch (Exception e) {
							logger.error("getDatasForAtts----" + e.getMessage());
							tempList.add(0);
							tempList.add("0");
						}
					}
					finalList.add(tempList);
				}
			}
			resultMap.put("data", finalList);
		} catch (IOException e) {
			logger.error(e);
		}
		return resultMap;
	}
	
	//  获取map格式的数据(针对第二版能源产品中取多栋建筑的开启台数)
	@Override
	public Map<String, Object> getDatasForBuilds(String type, String tfrom,
			String tto, String id, String name, String ispd, String att,
			String decimals, String mult, String build_id, String region_id) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<Object> finalList = new ArrayList<Object>();
			List list = new ArrayList();
			String[] builds = build_id.split(",");// build_id属性，求对应的值
			String[] names = name.split(","); 
			String[] ids = id.split(",");
			String[] ispds = ispd.split(",");
			for (int i = 0; i < builds.length; i++) {
				List<Object> tempList = new ArrayList<Object>();
				
				for (int k = 0; k < names.length; k++) {
					
					// 获取httpConnection
					HttpURLConnection httpConnection = getHttpConnection(names[k], (ids[k] + "_" + region_id + "_" + builds[i]),
							type, tfrom, att, "", ispds[k], builds[i], region_id);
					int responseCode = httpConnection.getResponseCode();
					if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
						// 获取查询结果
						list = returnList(httpConnection, CommonModel.class);
						
						// 保留小数位数
						String def = (decimals != null && decimals.length() > 0) ? decimals : "0.00";
						DecimalFormat df = new DecimalFormat(def);
						
						if (list.size() > 0) {
							CommonModel cm = (CommonModel) list.get(0);
							try {
								double val = Double.parseDouble(cm.getValue());
								tempList.add(df.format(val));
							} catch (Exception e) {
								logger.error("getDatasForBuilds----" + e.getMessage());
								tempList.add(0);
							}
						}
					}
					
				}
				finalList.add(tempList);
			}
			resultMap.put("data", finalList);
		} catch (IOException e) {
			logger.error(e);
		}
		return resultMap;
	}
	
	// 获取map格式的数据(针对第二版能源产品中取某一栋建筑的不同层数的开启数)
	@Override
	public Map<String, Object> getDatasForRegions(String type, String tfrom,
			String tto, String id, String name, String ispd, String att,
			String decimals, String mult, String build_id, String region_id) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<Object> finalList = new ArrayList<Object>();
			List list = new ArrayList();
			String[] regionids = region_id.split(",");// build_id属性，求对应的值
			String[] names = name.split(","); 
			String[] ids = id.split(",");
			String[] ispds = ispd.split(",");
			for (int i = 0; i < regionids.length; i++) {
				List<Object> tempList = new ArrayList<Object>();
				
				for (int k = 0; k < names.length; k++) {
					
					// 获取httpConnection
					HttpURLConnection httpConnection = getHttpConnection(names[k], (ids[k] + "_" + regionids[i] + "_" + build_id),
							type, tfrom, att, "", ispds[k], build_id, regionids[i]);
					int responseCode = httpConnection.getResponseCode();
					if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
						// 获取查询结果
						list = returnList(httpConnection, CommonModel.class);
						
						// 保留小数位数
						String def = (decimals != null && decimals.length() > 0) ? decimals : "0.00";
						DecimalFormat df = new DecimalFormat(def);
						
						if (list.size() > 0) {
							CommonModel cm = (CommonModel) list.get(0);
							try {
								double val = Double.parseDouble(cm.getValue());
								tempList.add(df.format(val));
							} catch (Exception e) {
								logger.error("getDatasForRegions----" + e.getMessage());
								tempList.add(0);
							}
						}
					}
					
				}
				finalList.add(tempList);
			}
			resultMap.put("data", finalList);
		} catch (IOException e) {
			logger.error(e);
		}
		return resultMap;
	}

	// 获取map格式的数据(针对第二版能源产品中多name和多attribute等情况做出处理)
	@Override
	public Map<String, Object> getDatasForNamesAndAtts(String type,
			String tfrom, String tto, String id, String name, String ispd,
			String att, String decimals, String mult, String build_id, String region_id) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<Object> finalList = new ArrayList<Object>();
			List list = new ArrayList();

			String[] atts = att.split(",");// attrubite属性，求对应的值
			String[] names = name.split(",");// name属性，求对应的值
			String[] ids = id.split(",");// id属性，求对应的值
			String[] ispds = ispd.split(",");// ispd属性，求对应的值
			for (int a = 0; a < names.length; a++) {
				List<Object> t_List = new ArrayList<Object>();
				for (int i = 0; i < atts.length; i++) {
					List<Object> tempList = new ArrayList<Object>();
					// 获取httpConnection
					HttpURLConnection httpConnection = getHttpConnection(
							names[a], ids[a], type, tfrom, atts[i], "",
							ispds[a], build_id, region_id);
					int responseCode = httpConnection.getResponseCode();
					if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
						// 获取查询结果
						list = returnList(httpConnection, CommonModel.class);

						// 保留小数位数
						String def = (decimals != null && decimals.length() > 0) ? decimals
								: "0.00";
						DecimalFormat df = new DecimalFormat(def);

						if (list.size() > 0) {
							CommonModel cm = (CommonModel) list.get(0);
							try {
								double val = Double.parseDouble(cm.getValue());
								if (atts[i].equalsIgnoreCase("change")) // 如果attribute为change的话，则乘以100
									val = val * 100;
								tempList.add(df.format(val));
								tempList.add(cm.getTime());
							} catch (Exception e) {
								logger.error("getDatasForAtts----"
										+ e.getMessage());
								tempList.add(0);
								tempList.add("0");
							}
						}
						t_List.add(tempList);
					}
				}
				finalList.add(t_List);
			}
			resultMap.put("data", finalList);
		} catch (IOException e) {
			logger.error(e);
		}
		return resultMap;
	}
	
	// 获取map格式的数据(针对第二版能源产品中运行监测模块的处理，多name情况做出处理)
	@Override
	public Map<String, Object> getDatasByNamesForMonitor(String type,
			String tfrom, String tto, String id, String name, String ispd,
			String att, String decimals, String mult, String build_id, String region_id) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		try {
			List<Object> finalList = new ArrayList<Object>();
			List list = new ArrayList();

			String[] names = name.split(",");// name属性，求对应的值
			String[] ids = id.split(",");// id属性，求对应的值
			String[] ispds = ispd.split(",");// ispd属性，求对应的值
			for (int a = 0; a < names.length; a++) {
				
				List<Object> datalist = new ArrayList<Object>();
				List<Object> catalist = new ArrayList<Object>();
				// 获取httpConnection
				HttpURLConnection httpConnection = null;
				int responseCode = 0;
				try {
					httpConnection = getHttpConnection(
							names[a], ids[a], type, tfrom, att, "",
							ispds[a], build_id, region_id);
					responseCode = httpConnection.getResponseCode();
				} catch (Exception e1) {
					logger.error(e1);
				}
				if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					if ("day".equals(type)) {
						beforeFormat = "yyyy-MM-dd HH:mm:ss";
						afterFormat = "HH:mm";
					} else if ("week".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
					} else if ("month".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
						loop = list.size();
					} else if ("year".equals(type)) {
						beforeFormat = "yyyy-MM";
						afterFormat = "yyyy/MM";
						loop = list.size();
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);
					DecimalFormat df = new DecimalFormat((decimals != null && decimals.length() > 0) ? decimals : "0.00");

					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try { // 求X轴的数据
							Date nowtime = sf.parse(cm.getTime());
							catalist.add(sformat.format(nowtime));
						} catch (ParseException e) {
							catalist.add("");
							logger.error("求X轴的数据----" + e);
						}
						
						try { // 求具体数值数据
							String datavalue = df.format(Double.parseDouble(cm.getValue()));
							datalist.add(Double.parseDouble(datavalue));
						} catch (Exception e) {
							datalist.add(Double.parseDouble("0"));
							logger.error("求具体数值数据----" + e);
						}
					}

				}
				
				finalList.add(datalist);
				resultMap.put("catalist", catalist);
				
			}
			resultMap.put("datalist", finalList);
		} catch (Exception e) {
			logger.error(e);
		}
		return resultMap;
	}
		
	// 返回单个页面需要的效果数据，此方法name支持传递多个参数，attribute支持传多个参数
	@Override
	public Map<String, Object> getValueListByNamesAndAtts(String type,
			String tfrom, String tto, String id, String name, String ispd,
			String att, String decimals, String multiplier) {
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		List list = new ArrayList();
		String returnStr = ""; // 返回的值

		try {
			List<String> valueList = new ArrayList<String>();

			// attrubite属性，判断是求对应的值
			String[] atts = att.split(",");
			String[] names = name.split(",");
			String[] ids = id.split(",");
			String[] ispds = ispd.split(",");
			for (int i = 0; i < atts.length; i++) {
				// 获取httpConnection
				HttpURLConnection httpConnection = getHttpConnection(names[i],
						ids[i], type, tfrom, atts[i], "", ispds[i], "", "");
				int responseCode = httpConnection.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) { // 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 保留小数位数
					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					if (list.size() > 0) {
						CommonModel cm = (CommonModel) list.get(0);
						try {
							returnStr = df.format(Double.parseDouble(cm
									.getValue()));

							if (multiplier != null && !"".equals(multiplier)
									&& multiplier.trim().length() > 0) {
								try {
									// 如果满足以上条件的话，则需特殊处理，在数据基础上*1000
									returnStr = df.format(Double.parseDouble(cm
											.getValue())
											* Double.parseDouble(multiplier));

								} catch (Exception e) {
									logger.error("getValueListByNamesAndAtts-------multiplier转换的时候报错了！");
								}
							}

						} catch (Exception e) {
							returnStr = "0";
							logger.error(e);
						}
					}
				}

				valueList.add(returnStr);
			}

			resultMap.put("data", valueList);

		} catch (IOException e) {
			logger.error(e);
		}

		return resultMap;

	}

	/**
	 * 转换List
	 * 
	 * @param httpConnection
	 * @param c_lass
	 * @return
	 */
	private List returnList(HttpURLConnection httpConnection, Class c_lass) {
		List list = new ArrayList();
		String resultString = "";
		InputStream urlStream;
		try {
			urlStream = httpConnection.getInputStream();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(urlStream));
			String currentLine = "";
			while ((currentLine = bufferedReader.readLine()) != null) {
				resultString += currentLine;
			}

			// 转换接收到的json字符为list列表
			ObjectMapper mapper = new ObjectMapper();
			TypeFactory typeFactory = TypeFactory.defaultInstance();
			list = mapper.readValue(resultString.toLowerCase(),
					typeFactory.constructCollectionType(List.class, c_lass));
		} catch (IOException e) {
			logger.error(e);
		}

		return list;
	}

	// 返回多个charts对应的数据列表，数据格式如：[[1],[2],[3]]
	@Override
	public Map<String, Object> getMoreChartsByNames(
			PreferenceInfo preferenceinfo, String type, String tfrom,
			String id, String name, String ispd, String decimals, String att,
			String mult) {

		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");

		List<Object> dataList = new ArrayList<Object>();// 存储数据

		// 循环处理name和id为多参数的情况
		for (int w = 0; w < names.length; w++) {

			List<Object> list = new ArrayList<Object>();
			try {
				HttpURLConnection httpConnection = getHttpConnection(
						names[w],
						ids[w],
						type,
						tfrom,
						((att != null && !"".equals(att) && !"null".equals(att)) ? att
								: preferenceinfo.getAttribute()),
						preferenceinfo.getTspan(), ispds[w], "", "");

				int responseCode = httpConnection.getResponseCode();

				if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

					List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					if ("day".equals(type)) {
						beforeFormat = "yyyy-MM-dd HH:mm:ss";
						afterFormat = "HH:mm";
						loop = getLoopsOfDay(tfrom, list); // 获取当前需要循环的次数
					} else if ("week".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
						loop = getLoopsOfWeek(list); // 获取周需要循环的次数
					} else if ("month".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
					} else if ("year".equals(type)) {
						beforeFormat = "yyyy-MM";
						afterFormat = "yyyy/MM";
						loop = list.size();
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);

					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					List<Double> tempDataList = new ArrayList<Double>();// 存储数据
					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try {
							String datavalue = df.format(Double.parseDouble(cm.getValue()));

							if (mult != null && !"".equals(mult) && mult.trim().length() > 0) {
								try {
									// 如果满足以上条件的话，则需特殊处理，在数据基础上*1000
									datavalue = df.format(Double.parseDouble(cm.getValue()) * Double.parseDouble(mult));
								} catch (Exception e) {
									logger.info("getMoreChartsByNames-----mult转换的时候报错了！");
								}
							}

							tempDataList.add(Double.parseDouble(datavalue));

						} catch (Exception e) {
							tempDataList.add(Double.parseDouble("0"));
							logger.error(e);
						}

						try {
							Date nowtime = sf.parse(cm.getTime());
							cataList.add(sformat.format(nowtime));
						} catch (Exception e) {
							cataList.add("");
							logger.error("转换出错了！" + cm.getTime());
							logger.error(e);
						}
					}

					dataList.add(tempDataList);
					resultMap.put("cataList", cataList);
				}
			} catch (IOException e) {
				logger.error(e);
			}

		}

		resultMap.put("dataList", dataList);

		return resultMap;

	}

	// 获取 报表输出 信息
	@Override
	public Map<String, Object> printReportInfo(String name, String id,
			String ispd, String type, String tfrom, String tto,
			String decimals, String multiplier, String distance, String title) {

		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");

		List<Object> dataList = new ArrayList<Object>();// 存储数据
		List<Object> cataList = new ArrayList<Object>();// X轴存储数据
		List<Object> showCataList = new ArrayList<Object>();// 预览报表时显示的日期
		List<Object> showDataList = new ArrayList<Object>();// 预览报表时显示的日期

		// 循环处理name和id为多参数的情况
		for (int w = 0; w < names.length; w++) {
			List<Object> list = new ArrayList<Object>();
			try {
				HttpURLConnection httpConnection = getHttpConnection(names[w],
						ids[w], type, tfrom, "", "", ispds[w], "", "");

				int responseCode = httpConnection.getResponseCode();

				if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm", preFormat = "HH:mm";

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					// 判断是否是输出运行监测的报表，运行监测报表需要特殊处理
					if(!"".equalsIgnoreCase(distance) || "冷机报表".equals(title) || "水系统报表".equals(title)) { // 针对中国馆的运行监测报表输出
						
						beforeFormat = "yyyy-MM-dd HH:mm";
						afterFormat = "yyyy-MM-dd HH:mm";
						preFormat = "yyyy-MM-dd HH:mm";
						loop = list.size(); // 获取当前需要循环的次数
						
					} else {
						
						if ("day".equals(type)) {
							beforeFormat = "yyyy-MM-dd HH:mm:ss";
							afterFormat = "HH:mm";
							preFormat = "HH:mm";
							loop = getLoopsOfDay(tfrom, list); // 获取当前需要循环的次数
						} else if ("week".equals(type)) {
							beforeFormat = "yyyy-MM-dd";
							afterFormat = "MM/dd";
							preFormat = "yyyy/MM/dd";
							loop = getLoopsOfWeek(list); // 获取周需要循环的次数
						} else if ("month".equals(type)) {
							beforeFormat = "yyyy-MM-dd";
							afterFormat = "MM/dd";
							preFormat = "yyyy/MM/dd";
						} else if ("year".equals(type)) {
							beforeFormat = "yyyy-MM";
							afterFormat = "yyyy/MM";
							preFormat = "yyyy/MM";
							loop = list.size();
						}
						
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);
					SimpleDateFormat pre_format = new SimpleDateFormat(
							preFormat); // 预览格式化时间戳

					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					List<Double> tempShowDataList = new ArrayList<Double>();// 存储预览的数据列表
					List<Double> tempDataList = new ArrayList<Double>();// 存储数据
					List<String> tempCataList = new ArrayList<String>();// 存储X轴的显示列表
					List<String> tempShowCataList = new ArrayList<String>();// 存储预览视图页面的的日期

					// 求和
					double total = 0;
					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try {
							double datavalue = Double.parseDouble(df
									.format(Double.parseDouble(cm
											.getValue())));
							// 如果满足以上条件的话，则需特殊处理，在数据基础上*multiplier
							if (multiplier != null
									&& !"".equals(multiplier)
									&& multiplier.trim().length() > 0) {
								try {
									datavalue = Double
											.parseDouble(df.format(Double
													.parseDouble(cm
															.getValue())
													* Double.parseDouble(multiplier)));

								} catch (Exception e) {
									logger.error("printReportInfo--multiplier转换的时候报错了！");
								}
							}

							tempDataList.add(datavalue);
							tempShowDataList.add(datavalue);
							total += datavalue;
						} catch (Exception e) {
							total += 0;
							tempDataList.add(Double.parseDouble("0"));
							tempShowDataList.add(Double.parseDouble("0"));
							logger.error(e);
						}

						try {
							tempCataList.add(sformat.format(sf.parse(cm
									.getTime())));
						} catch (Exception e) {
							tempCataList.add(cm.getTime());
							logger.error(e);
						}

						// 处理预览情况
						try {
							tempShowCataList.add(pre_format.format(sf
									.parse(cm.getTime())));
						} catch (Exception e) {
							tempShowCataList.add(cm.getTime());
							logger.error(e);
						}

					}

					showDataList.add(tempShowDataList); // 显示在预览页面的数据列表
					showCataList.add(tempShowCataList); // 显示在预览页面的日期列表
					tempCataList.add("合计");
					cataList.add(tempCataList);
					tempDataList.add(Double.parseDouble(df.format(total)));
					dataList.add(tempDataList);
				}
			} catch (IOException e) {
				logger.error(e);
			}

		}

		resultMap.put("showDataList", showDataList);
		resultMap.put("showCataList", showCataList);
		resultMap.put("cataList", cataList);
		resultMap.put("dataList", dataList);

		return resultMap;

	}

	// 返回多个页面需要的数据，此方法name支持传递多个参数，返回格式为[value1,value2,value3,......]
	@Override
	public Map<String, Object> getValueListByNames(
			PreferenceInfo preferenceinfo, String type, String tfrom,
			String tto, String id, String name, String ispd, String decimals) {

		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");

		List<Object> dataList = new ArrayList<Object>();// 存储数据

		// 循环处理name和id为多参数的情况
		for (int w = 0; w < names.length; w++) {

			List<Object> list = new ArrayList<Object>();
			try {

				HttpURLConnection httpConnection = getHttpConnection(names[w],
						ids[w], type, tfrom, preferenceinfo.getAttribute(),
						preferenceinfo.getTspan(), ispds[w], "", "");

				int responseCode = httpConnection.getResponseCode();

				if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";

					List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					if ("day".equals(type)) {
						beforeFormat = "yyyy-MM-dd HH:mm:ss";
						afterFormat = "HH:mm";
						loop = getLoopsOfDay(tfrom, list); // 获取当前需要循环的次数
					} else if ("week".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
						loop = getLoopsOfWeek(list); // 获取周需要循环的次数
					} else if ("month".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
					} else if ("year".equals(type)) {
						beforeFormat = "yyyy-MM";
						afterFormat = "yyyy/MM";
						loop = list.size();
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat);

					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					List<Double> tempDataList = new ArrayList<Double>();// 存储数据
					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try {
							String datavalue = df.format(Double
									.parseDouble(cm.getValue()));

							tempDataList.add(Double.parseDouble(datavalue));
						} catch (Exception e) {
							tempDataList.add(Double.parseDouble("0"));
							logger.error(e);
						}

						try {
							Date nowtime = sf.parse(cm.getTime());
							cataList.add(sformat.format(nowtime));
						} catch (Exception e) {
							cataList.add("");
							logger.error("转换出错了！" + cm.getTime());
							logger.error(e);
						}

					}

					dataList.add(tempDataList);
					resultMap.put("cataList", cataList);
				}
			} catch (IOException e) {
				logger.error(e);
			}

		}
		resultMap.put("dataList", dataList);
		return resultMap;
	}

	// 单个图表和多个图表使用用一个方法可查询出对应的数据系信息
	@Override
	public Map<String, Object> getCommonChartData(
			PreferenceInfo preferenceinfo, String type, String tfrom,
			String id, String name, String ispd, String att, String decimals,
			String mult, String build_id, String region_id, String source) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Object> resultList = new ArrayList<Object>();
		List<Object> legendList = new ArrayList<Object>();
		List<Object> yearList = new ArrayList<Object>();
		List<Object> expExcelTimeList = new ArrayList<Object>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放
		List<Object> expExcelCataList = new ArrayList<Object>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放

		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");
		String[] tfroms = tfrom.split(",");
		String[] atts = null;
		if (att != null && att.trim().length() > 0) {
			atts = att.split(",");
		}

		// 格式话时间格式
		SimpleDateFormat yearSf = new SimpleDateFormat("MM");
		SimpleDateFormat legendSf = new SimpleDateFormat("yyyy/MM/dd");

		for (int k = 0; k < names.length; k++) {

			List list = new ArrayList();
			try {

				// 设置attribute的值
				String _attribute = "";
				if (att != null && att.trim().length() > 0) {
					_attribute = atts[k];
				}
				String url_id = ids[k];
				if(source != null && "moniotr".equals(source)) {
					url_id = ids[k] + "_" + region_id + "_" + build_id;
				}
				HttpURLConnection httpConnection = getHttpConnection(names[k],
						url_id, type, tfroms[k], _attribute, "", ispds[k], build_id,
						region_id);
				int responseCode = httpConnection.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm", expExcelFormat = "yyyy/MM/dd";

					List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表
					List<Double> dataList = new ArrayList<Double>();// 表示图数据列表
					List<String> tempLegendList = new ArrayList<String>();// 表示对比图图例列表
					List<String> tempYearList = new ArrayList<String>();// 表示对比图年份图例列表

					List<String> tempExpExcelTimeList = new ArrayList<String>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放
					List<String> tempExpExcelCataList = new ArrayList<String>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					if ("day".equals(type)) {
						beforeFormat = "yyyy-MM-dd HH:mm:ss";
						afterFormat = "HH:mm";
						loop = getLoopsOfDay(tfroms[k], list); // 获取当前需要循环的次数
					} else if ("week".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
						loop = getLoopsOfWeek(list); // 获取周需要循环的次数
					} else if ("month".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
					} else if ("year".equals(type)) {
						beforeFormat = "yyyy-MM";
						afterFormat = "yyyy/MM";
						expExcelFormat = "yyyy/MM"; // 导出到excel时，只需要导出年和月
						loop = list.size();
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);// 为了将返回的数据转换成Date类型
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat); // 将对应的Date类型转换成需要的格式
					SimpleDateFormat excelFormat = new SimpleDateFormat(
							expExcelFormat); // 导出excel的格式化工具

					// 保留小数位数
					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try {
							// 展示在图表上的数据
							double dvalue = Double.parseDouble(cm
									.getValue());

							if (mult != null && !"".equals(mult)
									&& mult.trim().length() > 0) {
								try {
									// 如果满足以上条件的话，则需特殊处理，在数据基础上*mult的值
									if(names[k].indexOf("t_oa") == -1) { // 温度不能乘数
										dvalue = Double
												.valueOf(df.format(dvalue
														* Double.parseDouble(mult)));
									}
								} catch (Exception e) {
									logger.error("getCommonChartData--multiplier转换的时候报错了！");
								}
							}
							
							String datavalue = df.format(dvalue);

							dataList.add(Double.parseDouble(datavalue));

						} catch (Exception e) {
							logger.error(e);
							dataList.add(Double.parseDouble("0"));
						}

						// 此处格式化时间格式，为的是将通过url返回的数据格式化成前台需要的X轴的数据，此处因多处调用，可能有极个别的模块调用时，会格式化错误，此时的错误可以忽略
						// 具体模块，不一一列出，请知悉
						try {
							Date nowtime = sf.parse(cm.getTime());
							String val = sformat.format(nowtime);
							cataList.add(val); // 添加X轴数据
							tempExpExcelCataList.add(val); // 添加X轴数据
						} catch (Exception e) {
							cataList.add("");
							tempExpExcelCataList.add("");
							logger.error("---getCommonChartData此处有可能在格式化时报错，此处的错误可以忽略---");
						}

						// 此处格式化时间格式，为的是将通过url返回的数据格式化成前台需要的X轴的数据，此处因多处调用，可能有极个别的模块调用时，会格式化错误，此时的错误可以忽略
						// 具体模块，不一一列出，请知悉
						try {
							Date nowtime = sf.parse(cm.getTime());
							tempExpExcelTimeList.add(excelFormat
									.format(nowtime)); // 添加导出到excel中的X数据
						} catch (Exception e) {
							tempExpExcelTimeList.add("");
							logger.error("---tempExpExcelTimeList此处有可能在格式化时报错，此处的错误可以忽略---");
						}

						try {
							Date nowtime = sf.parse(cm.getTime());

							// 如果循环到第一个和最后一个的时候，将其存放在对应的list中，此处存是为了返回给前台设置对应的图表居中标题
							if (i == 0 || (i == (loop - 1))) {
								tempLegendList
										.add(legendSf.format(nowtime));
							}

							// 将对应的年份添加到list中，用于前台展示图例用
							tempYearList.add(yearSf.format(nowtime));
						} catch (Exception e) {
							tempLegendList.add("");
							tempYearList.add("");
							logger.error("tempLegendList转换的时候报错了！");
						}

					}

					// 保存对应的图例列表
					legendList.add(tempLegendList);
					yearList.add(tempYearList);

					// k等于0的时候才将其加入到list中，为了避免重复添加X轴数据到list中
					if (k == 0) {
						resultMap.put("cataList", cataList);
					}
					resultList.add(dataList);
					expExcelTimeList.add(tempExpExcelTimeList);
					expExcelCataList.add(tempExpExcelCataList);
				}

			} catch (IOException e) {
				logger.error(e);
			}

			resultMap.put("yearList", yearList);
			resultMap.put("legendList", legendList);
			resultMap.put("dataList", resultList);
			resultMap.put("expExcelCataList", expExcelCataList);
			resultMap.put("expExcelTimeList", expExcelTimeList);
		}

		return resultMap;

	}

	// 输出图表数据到excel文件
	public String expChartDataToExcel(String from_date, String expColumnName,
			String isNotCompare, String type, PreferenceInfo preferenceinfo,
			Map<String, Object> map, ResourceRequest request, String excelName) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		Workbook wb = new HSSFWorkbook();// 创建一个EXCEL
		Sheet sheet1 = wb.createSheet(excelName);// 创建一个SHEET

		// 获取配置项中的共有的列头数据
		String str = "日期" + ",";
		// 如果类型为day的话，将day特有的列加入到列头数据中
		if ("day".equals(type))
			str += "时间,";

		// 循环导出列头名称，为了既适应单个的图表(只传递一个不带逗号的值)，又适应饼图(传递多个带逗号的值)，这种特殊的图表输出
		String[] expsStrings = expColumnName.split(",");
		for (int i = 0; i < expsStrings.length; i++) {
			str += expsStrings[i] + ((expsStrings.length - 1) == i ? "" : ",");
		}

		String columnTitle = ""; // 存储第一列的数据，确定列头的列数
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) { // 如果是对比图的话，列数要相应增加一倍
			columnTitle = str + "," + str;
		} else { // 默认列头为单个图表信息
			columnTitle = str;
		}

		String[] title = columnTitle.split(","); // 将列头的字符创切割成数组，确定列头的列数

		// 内容样式
		CellStyle contentstyle = wb.createCellStyle();
		contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Row row = sheet1.createRow((short) 0);// 创建第一行标题
		// 创建列
		for (int column = 0; column < title.length; column++) {
			Cell cell = row.createCell(column);
			cell.setCellStyle(contentstyle);
			cell.setCellValue(title[column]);
			sheet1.setColumnWidth(column, 3000);
		}

		List resultList = new ArrayList(); // 存储最终的数据列表
		List dataList = (List) map.get("dataList");// 从map中获取数据
		List cataList = (List) map.get("cataList"); // 从map中取出对应的X轴的数据信息
		List expExcelCataList = (List) map.get("expExcelCataList"); // 从map中取出对应的导出到excel中X轴的数据信息
		List expExcelTimeList = (List) map.get("expExcelTimeList"); // 从map中取出对应的导出到excel中的数据信息

		// 创建列,type为day需要做特殊处理，因为day比week、month、year多一列
		if ("day".equals(type)) { // 因日报比较特殊，所以在此做特殊处理
			List d_list = (List) dataList.get(0);
			List list = new ArrayList();
			String[] fdates = from_date.split(",");
			List tempList = new ArrayList();
			// 根据dataList的条数循环添加第一行的数据到list中
			int hang = d_list.size();
			for (int t = 0; t < hang; t++) {
				try {
					tempList.add(sdf.format(sf.parse(fdates[0] + "")));
				} catch (ParseException e) {
					logger.error("---导出excel时，转换时间格式出错了00---" + fdates[0]);
					tempList.add(fdates[0]);
				}
			}

			List columnList = new ArrayList();
			// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
			if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
				int compareRows = ((List) dataList.get(1)).size();
				int cha = compareRows - hang;
				if (cha > 0) {
					columnList = (List) expExcelCataList.get(0);
					for (int k = 0; k < cha; k++) {
						tempList.add("");
						columnList.add("");
						d_list.add("");
					}
				} else {
					columnList = (List) expExcelCataList.get(0);
				}
			} else {
				columnList = (List) expExcelCataList.get(0);
			}

			resultList.add(tempList);
			// 往list中添加第二列(如果是日报，此为第二列，否则为第一列)的值，日报因多一列“时间”列，所以此时添加cataList，cataList中此时存放的数据格式为：[00:00,01:00.....]
			resultList.add(columnList);
			// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
			resultList.add(d_list);
		} else { // 周报、月报、年报等情况
			List list = new ArrayList();
			list = (List) expExcelTimeList.get(0);
			List da_list = new ArrayList();
			da_list = (List) dataList.get(0);

			// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
			if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
				List list1 = (List) expExcelTimeList.get(0);
				List list2 = (List) expExcelTimeList.get(1);
				List daList1 = (List) dataList.get(0); // 第一个数据列表
				List daList2 = (List) dataList.get(1);// 第二个数据列表
				int row1 = daList1.size();
				int row2 = daList2.size();
				if ((row2 - row1) > 0) { // 如果对比的数据比选择的数据多
					for (int k = 0; k < (row2 - row1); k++) {
						list1.add("");
						daList1.add("");
					}
					da_list = daList1;
				}

				list = list1;
			}

			// 往list中添加第一列(如果是日报，此为第二列，否则为第一列)的值，expExcelTimeList.get(0)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
			resultList.add(list);
			// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
			resultList.add(da_list);
		}

		// 如果是对比图的话，列数要相应增加一倍，数据也要对应的增加
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
			String[] fdates = from_date.split(",");
			if (fdates.length > 1) {
				if ("day".equals(type)) {
					List d_list1 = (List) dataList.get(1);
					List tempList = new ArrayList();
					int hang = d_list1.size();
					for (int t = 0; t < hang; t++) {
						try {
							tempList.add(sdf.format(sf.parse(fdates[1] + "")));
						} catch (ParseException e) {
							logger.error("---导出excel时，转换时间格式出错了11---"
									+ fdates[1]);
							tempList.add(fdates[0]);
						}
					}

					List columnList = new ArrayList();
					// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
					if (isNotCompare != null
							&& "yes".equalsIgnoreCase(isNotCompare)) {
						int compareRows = ((List) dataList.get(0)).size();
						int cha = compareRows - hang;
						if (cha > 0) {
							columnList = (List) expExcelCataList.get(1);
							for (int k = 0; k < cha; k++) {
								tempList.add("");
								d_list1.add("");
								columnList.add("");
							}
						} else {
							columnList = (List) expExcelCataList.get(1);
						}
					} else {
						columnList = (List) expExcelCataList.get(1);
					}

					resultList.add(tempList);
					resultList.add(columnList);
					resultList.add(d_list1); // 将data数据添加到list中
				} else { // 周报、月报、年报等情况
					List list = new ArrayList();
					list = (List) expExcelTimeList.get(1);
					List da_list = new ArrayList();
					da_list = (List) dataList.get(1);

					// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
					if (isNotCompare != null
							&& "yes".equalsIgnoreCase(isNotCompare)) {
						List list1 = (List) expExcelTimeList.get(0);
						List list2 = (List) expExcelTimeList.get(1);
						List daList1 = (List) dataList.get(0); // 第一个数据列表
						List daList2 = (List) dataList.get(1);// 第二个数据列表
						int row1 = daList1.size();
						int row2 = daList2.size();
						if ((row1 - row2) > 0) { // 如果选择的数据比对比的数据多
							for (int k = 0; k < (row1 - row2); k++) {
								list2.add("");
								daList2.add("");
							}
							da_list = daList2;
						}
						list = list2;
					}

					// 往list中添加第四列(如果是日报，此为第四列，否则为第三列)的值，expExcelTimeList.get(1)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
					resultList.add(list);
					resultList.add(da_list); // 将data数据添加到list中
				}

			}
		}

		// 对应的导出的行数
		int rows = ((List) resultList.get(0)).size();
		// 对应的列数
		int cols = resultList.size();

		// map用的是和前台展示用的同一个源，并且前台展示是数据是纵向存储的
		// 首先将对应的数据横向存放在二维数组中，再循环二维数组导出到excel中
		String result[][] = new String[rows][cols];

		// 设置全局的行数和列数
		int r = 0;
		int c = 0;

		// 循环将数据添加到二维数组中
		for (int j = 0; j < resultList.size(); j++) {
			List list = (List) resultList.get(j);
			for (int k = 0; k < list.size(); k++) {
				//
				String valString = list.get(k) + "";
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet1.createRow((short) q + 1);

			for (int d = 0; d < result[q].length; d++) {
				Cell cell = row1.createCell(d);
				cell.setCellStyle(contentstyle);// 设置单元格样式
				try {
					cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
					cell.setCellValue(Double.parseDouble(result[q][d]));
				} catch (Exception e) {
					// 注意：此处错误可以忽略
					cell.setCellValue(result[q][d]);
				}
			}
		}

		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += excelName + ".xls";

		// logger.info("realPath----" + realPath);

		File file = new File(realPath);
		if (file.exists())
			file.delete();
		try {
			fileOut = new FileOutputStream(realPath);
			wb.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realPath;
	}

	// 输出图表数据到excel文件
	public String expPieChartDataToExcel(String from_date,
			String expColumnName, String isNotCompare, String type,
			PreferenceInfo preferenceinfo, Map<String, Object> map,
			ResourceRequest request, String excelName) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		Workbook wb = new HSSFWorkbook();// 创建一个EXCEL
		Sheet sheet1 = wb.createSheet(excelName);// 创建一个SHEET

		// 获取配置项中的共有的列头数据
		String str = "";
		// 循环导出列头名称，为了既适应单个的图表(只传递一个不带逗号的值)，又适应饼图(传递多个带逗号的值)，这种特殊的图表输出
		String[] expsStrings = expColumnName.split(",");
		for (int i = 0; i < expsStrings.length; i++) {
			str += expsStrings[i] + ((expsStrings.length - 1) == i ? "" : ",");
		}

		String columnTitle = ""; // 存储第一列的数据，确定列头的列数
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) { // 如果是对比图的话，列数要相应增加一倍
			columnTitle = str + "," + str;
		} else { // 默认列头为单个图表信息
			columnTitle = str;
		}

		String[] title = columnTitle.split(","); // 将列头的字符创切割成数组，确定列头的列数

		// 内容样式
		CellStyle contentstyle = wb.createCellStyle();
		contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);

		Row row = sheet1.createRow((short) 0);// 创建第一行标题
		// 创建列
		for (int column = 0; column < title.length; column++) {
			Cell cell = row.createCell(column);
			cell.setCellStyle(contentstyle);
			cell.setCellValue(title[column]);
			sheet1.setColumnWidth(column, 3000);
		}

		List resultList = new ArrayList(); // 存储最终的数据列表
		List datetime = (List) map.get("datetime");// 日期数据
		List dataList = (List) map.get("dataList");// 从map中获取数据
		List cataList = (List) map.get("cataList"); // 从map中取出对应的X轴的数据信息

		// 往list中添加第一列(如果是日报，此为第二列，否则为第一列)的值，expExcelTimeList.get(0)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
		resultList.add(datetime.get(0));
		resultList.add(cataList);
		// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
		resultList.add(dataList.get(0));
		resultList.add(dataList.get(1));

		// 如果是对比图的话，列数要相应增加一倍，数据也要对应的增加
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
			// 往list中添加第一列(如果是日报，此为第二列，否则为第一列)的值，expExcelTimeList.get(0)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
			resultList.add(datetime.get(1));
			resultList.add(cataList);
			// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
			resultList.add(dataList.get(2));
			resultList.add(dataList.get(3));
		}

		// 对应的导出的行数
		int rows = ((List) resultList.get(0)).size();
		// 对应的列数
		int cols = resultList.size();

		// map用的是和前台展示用的同一个源，并且前台展示是数据是纵向存储的
		// 首先将对应的数据横向存放在二维数组中，再循环二维数组导出到excel中
		String result[][] = new String[rows][cols];

		// 设置全局的行数和列数
		int r = 0;
		int c = 0;

		// 循环将数据添加到二维数组中
		for (int j = 0; j < resultList.size(); j++) {
			List list = (List) resultList.get(j);
			for (int k = 0; k < list.size(); k++) {
				//
				String valString = list.get(k) + "";
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet1.createRow((short) q + 1);

			for (int d = 0; d < result[q].length; d++) {
				Cell cell = row1.createCell(d);
				cell.setCellStyle(contentstyle);// 设置单元格样式
				try {
					cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
					cell.setCellValue(Double.parseDouble(result[q][d]));
				} catch (Exception e) {
					// 注意：此处错误可以忽略
					cell.setCellValue(result[q][d]);
				}
			}
		}

		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += excelName + ".xls";

		// logger.info("realPath----" + realPath);

		File file = new File(realPath);
		if (file.exists())
			file.delete();
		try {
			fileOut = new FileOutputStream(realPath);
			wb.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realPath;
	}

	// 返回多个charts对应的数据列表，数据格式如：[[1],[2],[3]]
	@Override
	public Map<String, Object> getPieChartsDataInfo(
			PreferenceInfo preferenceinfo, String type, String tfrom,
			String id, String name, String ispd, String decimals, String att,
			String mult, String itemName, String comparetime) {

		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

		String[] tfroms = tfrom.split(",");
		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");

		List<Object> dataList = new ArrayList<Object>();// 存储数据
		List<Object> datetime = new ArrayList<Object>();// 存储日期数据

		String[] atts = att.split(",");
		// 根据att属性循环处理相关的数据
		for (int g = 0; g < atts.length; g++) {
			// 循环处理name和id为多参数的情况
			List<Double> tempDataList = new ArrayList<Double>();// 存储数据
			for (int w = 0; w < names.length; w++) {

				List<Object> list = new ArrayList<Object>();
				URLConnection URLconnection = null;
				try {

					HttpURLConnection httpConnection = getHttpConnection(
							names[w], ids[w], type, tfroms[g],
							((atts[g] != null && !"".equals(atts[g]) && !"null"
									.equals(atts[g])) ? atts[g] : ""), "",
							ispds[w], "", "");
					int responseCode = httpConnection.getResponseCode();
					if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
						// 获取查询结果
						list = returnList(httpConnection, CommonModel.class);
						// 分别表示，格式化前的格式和格式化后的格式
						String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm";
						// 循环处理数据，组织成对应需要的数据
						int loop = list.size();
						if ("day".equals(type)) {
							beforeFormat = "yyyy-MM-dd HH:mm:ss";
							afterFormat = "HH:mm";
							loop = getLoopsOfDay(tfroms[g], list); // 获取当前需要循环的次数
						} else if ("week".equals(type)) {
							beforeFormat = "yyyy-MM-dd";
							afterFormat = "MM/dd";
							loop = getLoopsOfWeek(list); // 获取周需要循环的次数
						} else if ("month".equals(type)) {
							beforeFormat = "yyyy-MM-dd";
							afterFormat = "MM/dd";
							loop = list.size();
						} else if ("year".equals(type)) {
							beforeFormat = "yyyy-MM";
							afterFormat = "yyyy/MM";
							loop = list.size();
						}

						SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);
						SimpleDateFormat sformat = new SimpleDateFormat(
								afterFormat);

						String def = (decimals != null && decimals.length() > 0) ? decimals
								: "0.00";
						DecimalFormat df = new DecimalFormat(def);

						for (int i = 0; i < loop; i++) {
							CommonModel cm = (CommonModel) list.get(i);
							try {
								String datavalue = df.format(Double
										.parseDouble(cm.getValue()));

								if (mult != null && !"".equals(mult)
										&& mult.trim().length() > 0) {
									try {
										// 如果满足以上条件的话，则需特殊处理，在数据基础上*1000
										datavalue = df.format(Double
												.parseDouble(cm.getValue())
												* Double.parseDouble(mult));

									} catch (Exception e) {
										logger.info("getPieChartsDataInfo-----mult转换的时候报错了！");
									}
								}

								tempDataList.add(Double.parseDouble(datavalue));

							} catch (Exception e) {
								tempDataList.add(Double.parseDouble("0"));
								logger.error(e);
							}
						}

					}
				} catch (IOException e) {
					logger.error(e);
				}

			}
			dataList.add(tempDataList);
		}

		List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表
		// 循环处理name和id为多参数的情况
		String[] its = itemName.split(",");

		// 设置相应的第一列和对比列第一列的值
		String[] c_times = comparetime.split(",");
		for (int i = 0; i < c_times.length; i++) {
			List<String> tempDateTime = new ArrayList<String>();// 存储X轴的显示列表
			for (int w = 0; w < its.length; w++) {
				tempDateTime.add(c_times[i]);
			}
			datetime.add(tempDateTime);
		}

		// 设置第二列的值
		for (int w = 0; w < its.length; w++) {
			cataList.add(its[w]);
		}
		resultMap.put("cataList", cataList);
		resultMap.put("datetime", datetime);
		resultMap.put("dataList", dataList);

		return resultMap;

	}

	// 求室外状态导出excel的map集合
	@Override
	public Map<String, Object> getOutSideChartData(String type, String tfrom,
			String id, String name, String ispd, String att, String decimals,
			String mult) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Object> resultList = new ArrayList<Object>();
		List<Object> legendList = new ArrayList<Object>();
		List<Object> yearList = new ArrayList<Object>();
		List<Object> expExcelTimeList = new ArrayList<Object>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放
		List<Object> expExcelCataList = new ArrayList<Object>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放

		String[] names = name.split(",");
		String[] ids = id.split(",");
		String[] ispds = ispd.split(",");
		String[] tfroms = tfrom.split(",");
		// 格式话时间格式
		SimpleDateFormat yearSf = new SimpleDateFormat("MM");
		SimpleDateFormat legendSf = new SimpleDateFormat("yyyy/MM/dd");

		for (int k = 0; k < names.length; k++) {

			List list = new ArrayList();
			try {

				HttpURLConnection httpConnection = getHttpConnection(names[k],
						ids[k], type, tfroms[k], "", "", ispds[k], "", "");
				int responseCode = httpConnection.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) {// 200表示，url正常返回了值
					// 获取查询结果
					list = returnList(httpConnection, CommonModel.class);

					// 分别表示，格式化前的格式和格式化后的格式
					String beforeFormat = "yyyy-MM-dd HH:mm:ss", afterFormat = "HH:mm", expExcelFormat = "yyyy/MM/dd";

					List<String> cataList = new ArrayList<String>();// 存储X轴的显示列表
					List<Double> dataList = new ArrayList<Double>();// 表示图数据列表
					List<String> tempLegendList = new ArrayList<String>();// 表示对比图图例列表
					List<String> tempYearList = new ArrayList<String>();// 表示对比图年份图例列表

					List<String> tempExpExcelTimeList = new ArrayList<String>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放
					List<String> tempExpExcelCataList = new ArrayList<String>();// 存储导出excel时间列表,因后曾的需求，为避免影响以前写的逻辑，在此单独存放

					// 循环处理数据，组织成对应需要的数据
					int loop = list.size();

					if ("day".equals(type)) {
						beforeFormat = "yyyy-MM-dd HH:mm:ss";
						afterFormat = "HH:mm";
						loop = getLoopsOfDay(tfroms[k], list); // 获取当前需要循环的次数
					} else if ("week".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
						loop = getLoopsOfWeek(list); // 获取周需要循环的次数
					} else if ("month".equals(type)) {
						beforeFormat = "yyyy-MM-dd";
						afterFormat = "MM/dd";
					} else if ("year".equals(type)) {
						beforeFormat = "yyyy-MM";
						afterFormat = "yyyy/MM";
						expExcelFormat = "yyyy/MM"; // 导出到excel时，只需要导出年和月
						loop = list.size();
					}

					SimpleDateFormat sf = new SimpleDateFormat(beforeFormat);// 为了将返回的数据转换成Date类型
					SimpleDateFormat sformat = new SimpleDateFormat(afterFormat); // 将对应的Date类型转换成需要的格式
					SimpleDateFormat excelFormat = new SimpleDateFormat(
							expExcelFormat); // 导出excel的格式化工具

					// 保留小数位数
					String def = (decimals != null && decimals.length() > 0) ? decimals
							: "0.00";
					DecimalFormat df = new DecimalFormat(def);

					for (int i = 0; i < loop; i++) {
						CommonModel cm = (CommonModel) list.get(i);

						try {
							// 展示在图表上的数据
							double dvalue = Double.parseDouble(cm
									.getValue());

							if (mult != null && !"".equals(mult)
									&& mult.trim().length() > 0) {
								try {
									// 如果满足以上条件的话，则需特殊处理，在数据基础上*mult的值
									dvalue = Double
											.valueOf(df.format(dvalue
													* Double.parseDouble(mult)));
								} catch (Exception e) {
									logger.error("getOutSideChartData--multiplier转换的时候报错了！");
								}
							}

							String datavalue = df.format(dvalue);

							dataList.add(Double.parseDouble(datavalue));

						} catch (Exception e) {
							dataList.add(Double.parseDouble("0"));
							logger.error(e);
						}

						// 此处格式化时间格式，为的是将通过url返回的数据格式化成前台需要的X轴的数据，此处因多处调用，可能有极个别的模块调用时，会格式化错误，此时的错误可以忽略
						// 具体模块，不一一列出，请知悉
						try {
							Date nowtime = sf.parse(cm.getTime());
							String val = sformat.format(nowtime);
							cataList.add(val); // 添加X轴数据
							tempExpExcelCataList.add(val); // 添加X轴数据
						} catch (Exception e) {
							cataList.add("");
							tempExpExcelCataList.add("");
							logger.error("---getOutSideChartData此处有可能在格式化时报错，此处的错误可以忽略---");
						}

						// 此处格式化时间格式，为的是将通过url返回的数据格式化成前台需要的X轴的数据，此处因多处调用，可能有极个别的模块调用时，会格式化错误，此时的错误可以忽略
						// 具体模块，不一一列出，请知悉
						try {
							Date nowtime = sf.parse(cm.getTime());
							tempExpExcelTimeList.add(excelFormat
									.format(nowtime)); // 添加导出到excel中的X数据
						} catch (Exception e) {
							tempExpExcelTimeList.add("");
							logger.error("---tempExpExcelTimeList此处有可能在格式化时报错，此处的错误可以忽略---");
						}

						try {
							Date nowtime = sf.parse(cm.getTime());

							// 如果循环到第一个和最后一个的时候，将其存放在对应的list中，此处存是为了返回给前台设置对应的图表居中标题
							if (i == 0 || (i == (loop - 1))) {
								tempLegendList
										.add(legendSf.format(nowtime));
							}

							// 将对应的年份添加到list中，用于前台展示图例用
							tempYearList.add(yearSf.format(nowtime));
						} catch (Exception e) {
							tempLegendList.add("");
							tempYearList.add("");
							logger.error("tempLegendList转换的时候报错了！");
						}
					}

					// 保存对应的图例列表
					legendList.add(tempLegendList);
					yearList.add(tempYearList);

					// k等于0的时候才将其加入到list中，为了避免重复添加X轴数据到list中
					if (k == 0) {
						resultMap.put("cataList", cataList);
					}
					resultList.add(dataList);
					expExcelTimeList.add(tempExpExcelTimeList);
					expExcelCataList.add(tempExpExcelCataList);
				}

			} catch (IOException e) {
				logger.error(e);
			}

			resultMap.put("yearList", yearList);
			resultMap.put("legendList", legendList);
			resultMap.put("dataList", resultList);
			resultMap.put("expExcelCataList", expExcelCataList);
			resultMap.put("expExcelTimeList", expExcelTimeList);
		}

		return resultMap;

	}

	// 输出图表数据到excel文件
	public String expOutSideChartDataToExcel(String from_date,
			String expColumnName, String isNotCompare, String type,
			Map<String, Object> map, ResourceRequest request, String excelName) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		// String newdate = sf.format(new Date());

		Workbook wb = new HSSFWorkbook();// 创建一个EXCEL
		Sheet sheet1 = wb.createSheet(excelName);// 创建一个SHEET

		// 获取配置项中的共有的列头数据
		String str = "日期" + ",";

		// 如果类型为day的话，将day特有的列加入到列头数据中
		if ("day".equals(type)) {
			str += "时间,";
		}

		// 循环导出列头名称，为了既适应单个的图表(只传递一个不带逗号的值)，又适应饼图(传递多个带逗号的值)，这种特殊的图表输出
		String[] expsStrings = expColumnName.split(",");
		for (int i = 0; i < expsStrings.length; i++) {
			str += expsStrings[i] + ((expsStrings.length - 1) == i ? "" : ",");
		}

		String columnTitle = ""; // 存储第一列的数据，确定列头的列数
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) { // 如果是对比图的话，列数要相应增加一倍
			columnTitle = str + "," + str;
		} else { // 默认列头为单个图表信息
			columnTitle = str;
		}

		String[] title = columnTitle.split(","); // 将列头的字符创切割成数组，确定列头的列数

		// 内容样式
		CellStyle contentstyle = wb.createCellStyle();
		contentstyle.setAlignment(CellStyle.ALIGN_RIGHT);
		Row row = sheet1.createRow((short) 0);// 创建第一行标题
		for (int column = 0; column < title.length; column++) {// 创建列
			Cell cell = row.createCell(column);
			cell.setCellStyle(contentstyle);
			cell.setCellValue(title[column]);
			sheet1.setColumnWidth(column, 3000);
		}

		List resultList = new ArrayList(); // 存储最终的数据列表
		List dataList = (List) map.get("dataList");// 从map中获取数据
		List cataList = (List) map.get("cataList"); // 从map中取出对应的X轴的数据信息
		List expExcelCataList = (List) map.get("expExcelCataList"); // 从map中取出对应的导出到excel中X轴的数据信息
		List expExcelTimeList = (List) map.get("expExcelTimeList"); // 从map中取出对应的导出到excel中的数据信息

		// 创建列,type为day需要做特殊处理，因为day比week、month、year多一列
		if ("day".equals(type)) { // 因日报比较特殊，所以在此做特殊处理
			List d_list = (List) dataList.get(0);
			List d_list1 = (List) dataList.get(1);
			List list = new ArrayList();
			String[] fdates = from_date.split(",");
			List tempList = new ArrayList();
			// 根据dataList的条数循环添加第一行的数据到list中
			int hang = d_list.size();
			for (int t = 0; t < hang; t++) {
				try {
					tempList.add(sdf.format(sf.parse(fdates[0] + "")));
				} catch (ParseException e) {
					logger.error("---导出excel时，转换时间格式出错了00---" + fdates[0]);
					tempList.add(fdates[0]);
				}
			}

			List columnList = new ArrayList();
			// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
			if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
				// 后面的list大于前面的list
				int compareRows = ((List) dataList.get((expsStrings.length)))
						.size();
				int cha = compareRows - hang;
				if (cha > 0) {
					columnList = (List) expExcelCataList.get(0);
					for (int k = 0; k < cha; k++) {
						tempList.add("");
						columnList.add("");
						d_list.add("");
						d_list1.add("");
					}
				} else {
					columnList = (List) expExcelCataList.get(0);
				}
			} else {
				columnList = (List) expExcelCataList.get(0);
			}

			resultList.add(tempList);
			// 往list中添加第二列(如果是日报，此为第二列，否则为第一列)的值，日报因多一列“时间”列，所以此时添加cataList，cataList中此时存放的数据格式为：[00:00,01:00.....]
			resultList.add(columnList);
			// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
			resultList.add(d_list);
			// 根据配置的项，判断是否添加对应的数据列表
			resultList.add(d_list1);
		} else { // 周报、月报、年报等情况
			List list = new ArrayList();
			list = (List) expExcelTimeList.get(0);
			List da_list = (List) dataList.get(0);
			List da_list1 = (List) dataList.get(1);

			// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
			if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
				List list1 = (List) expExcelTimeList.get(0);
				List list2 = (List) expExcelTimeList.get(expsStrings.length);
				List daList1 = (List) dataList.get(0); // 第一个数据列表
				List daList1_2 = (List) dataList.get(1); // 第一个数据列表
				List daList2 = (List) dataList.get((dataList.size() - 1));// 第二个数据列表
				int row1 = daList1.size();
				int row2 = daList2.size();
				if ((row2 - row1) > 0) { // 如果对比的数据比选择的数据多
					for (int k = 0; k < (row2 - row1); k++) {
						list1.add("");
						daList1.add("");
						daList1_2.add("");
					}
					da_list = daList1;
					da_list1 = daList1_2;
				}

				list = list1;
			}

			// 往list中添加第一列(如果是日报，此为第二列，否则为第一列)的值，expExcelTimeList.get(0)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
			resultList.add(list);
			// 将data数据添加到list中第三列(如果是日报，此为第三列，否则为第二列)
			resultList.add(da_list);
			// 根据配置的项，判断是否添加对应的数据列表
			resultList.add(da_list1);
		}

		// 如果是对比图的话，列数要相应增加一倍，数据也要对应的增加
		if (isNotCompare != null && "yes".equalsIgnoreCase(isNotCompare)) {
			String[] fdates = from_date.split(",");
			if (fdates.length > 1) {
				if ("day".equals(type)) {
					List d_list1 = (List) dataList.get(expsStrings.length);
					List d_list1_2 = (List) dataList
							.get(expsStrings.length + 1);
					List tempList = new ArrayList();
					int hang = d_list1.size();
					for (int t = 0; t < hang; t++) {
						try {
							tempList.add(sdf.format(sf
									.parse(fdates[fdates.length - 1] + "")));
						} catch (ParseException e) {
							logger.error("---导出excel时，转换时间格式出错了11---"
									+ fdates[fdates.length - 1]);
							tempList.add(fdates[fdates.length - 1]);
						}
					}

					List columnList = new ArrayList();
					// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
					if (isNotCompare != null
							&& "yes".equalsIgnoreCase(isNotCompare)) {
						int compareRows = ((List) dataList.get(0)).size();
						int cha = compareRows - hang;
						if (cha > 0) {
							columnList = (List) expExcelCataList
									.get(expsStrings.length);
							for (int k = 0; k < cha; k++) {
								tempList.add("");
								d_list1.add("");
								d_list1_2.add("");
								columnList.add("");
							}
						} else {
							columnList = (List) expExcelCataList
									.get(expsStrings.length);
						}
					} else {
						columnList = (List) expExcelCataList
								.get(expsStrings.length);
					}

					resultList.add(tempList);
					resultList.add(columnList);
					resultList.add(d_list1); // 将data数据添加到list中
					// 根据配置的项，判断是否添加对应的数据列表
					resultList.add(d_list1_2);
				} else { // 周报、月报、年报等情况
					List list = new ArrayList();
					list = (List) expExcelTimeList.get(expsStrings.length);
					List da_list = (List) dataList.get(expsStrings.length);
					List da_list1 = (List) dataList.get(expsStrings.length + 1);

					// 如果是对比图的话，假设两个数据列表的值不一样，此时需要做特殊处理（比如：6月30天，8月31天）
					if (isNotCompare != null
							&& "yes".equalsIgnoreCase(isNotCompare)) {
						List list1 = (List) expExcelTimeList.get(0);
						List list2 = (List) expExcelTimeList
								.get(expsStrings.length);
						List daList1 = (List) dataList.get(0); // 第一个数据列表
						List daList2 = (List) dataList.get(expsStrings.length);// 第二个数据列表
						List daList2_2 = (List) dataList
								.get(dataList.size() - 1);// 第二个数据列表
						int row1 = daList1.size();
						int row2 = daList2.size();
						if ((row1 - row2) > 0) { // 如果选择的数据比对比的数据多
							for (int k = 0; k < (row1 - row2); k++) {
								list2.add("");
								daList2.add("");
								daList2_2.add("");
							}
							da_list = daList2;
							da_list1 = daList2_2;
						}
						list = list2;
					}

					// 往list中添加第四列(如果是日报，此为第四列，否则为第三列)的值，expExcelTimeList.get(1)中此时存放的数据格式为：[2013/09/12,2013/09/13.....]
					resultList.add(list);
					resultList.add(da_list); // 将data数据添加到list中
					// 根据配置的项，判断是否添加对应的数据列表
					resultList.add(da_list1);
				}

			}
		}

		// 对应的导出的行数
		int rows = ((List) resultList.get(0)).size();
		// 对应的列数
		int cols = resultList.size();

		// map用的是和前台展示用的同一个源，并且前台展示是数据是纵向存储的
		// 首先将对应的数据横向存放在二维数组中，再循环二维数组导出到excel中
		String result[][] = new String[rows][cols];

		// 设置全局的行数和列数
		int r = 0;
		int c = 0;

		// 循环将数据添加到二维数组中
		for (int j = 0; j < resultList.size(); j++) {
			List list = (List) resultList.get(j);
			for (int k = 0; k < list.size(); k++) {
				//
				String valString = list.get(k) + "";
				result[r][c] = valString;
				r++;
				r = r % rows;
			}
			c++;
		}

		// 循环从二维数组中取值存放到对应的excel中
		for (int q = 0; q < result.length; q++) {
			Row row1 = sheet1.createRow((short) q + 1);

			for (int d = 0; d < result[q].length; d++) {
				Cell cell = row1.createCell(d);
				cell.setCellStyle(contentstyle);// 设置单元格样式
				try {
					cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
					cell.setCellValue(Double.parseDouble(result[q][d]));
				} catch (Exception e) {
					cell.setCellValue(result[q][d]);
					// 注意：此处错误可以忽略
					// logger.info("---导出excel，循环往二维数组中添加数据出错,注意：此处错误可以忽略-Ignore This Error----"
					// + result[q][d]);
				}
			}
		}

		FileOutputStream fileOut = null;
		PortletContext portletContext = request.getPortletSession()
				.getPortletContext();
		String realPath = portletContext.getRealPath("");
		String addfilePath = "\\uploadfiles\\";
		realPath += addfilePath;
		realPath += excelName + ".xls";
		// logger.info("realPath----" + realPath);
		File file = new File(realPath);
		if (file.exists())
			file.delete();
		try {
			fileOut = new FileOutputStream(realPath);
			wb.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return realPath;
	}
}
