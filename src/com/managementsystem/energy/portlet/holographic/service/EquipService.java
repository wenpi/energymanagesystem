package com.managementsystem.energy.portlet.holographic.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.BuildregioninfoDao;
import com.managementsystem.energy.dao.QuerySchemeDao;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.domain.QueryScheme;

@Service
@Transactional
public class EquipService {
	@Autowired
	private QuerySchemeDao querySchemeDao;

	@Autowired
	private HoloMainPageService HoloMainPageService;

	/**
	 * 得到相应区域的设备信息
	 * 
	 * @param defaultRegionId
	 * @return
	 */
	public HashMap<String, Map<String, List<QueryScheme>>> getEquipRegionMapFix(
			String defaultRegionId) {
		HashMap<String, Map<String, List<QueryScheme>>> result = HoloMainPageService
				.getEquipRegionMap(defaultRegionId);
		//
		for (String key : result.keySet()) {

			if ("fau".equals(key) || "ahu".equals(key) || "acu".equals(key)) {
				Map<String, List<QueryScheme>> region = result.get(key);
				//
				for (String regionId : region.keySet()) {
					if (regionId.equals("")) {
						continue;
					}

					//
					List<QueryScheme> oldList = region.get(regionId);
					// System.out.println("oldList:"+oldList.size());
					List<QueryScheme> newList = new LinkedList();
					//
					HashMap<String, QueryScheme> hm = new HashMap();
					for (QueryScheme qs : oldList) {
						hm.put(qs.getId(), qs);
						// System.out.println("append:"+qs.getId());
					}
					//
					for (String rid : hm.keySet()) {
						newList.add(hm.get(rid));

					}
					// System.out.println("newList:"+newList.size());

					//
					region.put(regionId, newList);

				}
			}
		}

		return result;
	}

	/**
	 * 得到相应区域的设备信息
	 * 
	 * @param defaultRegionId
	 * @return
	 */
	public HashMap<String, Map<String, List<QueryScheme>>> getEquipRegionMapFixForTaoBao(
			String buildId, String defaultRegionId) {
		HashMap<String, Map<String, List<QueryScheme>>> result = HoloMainPageService
				.getEquipRegionMapForTaoBao(buildId, defaultRegionId);
		for (String key : result.keySet()) {
			if ("fau".equals(key) || "ahu".equals(key) || "acu".equals(key)) {
				Map<String, List<QueryScheme>> region = result.get(key);
				//
				for (String regionId : region.keySet()) {
					if (regionId.equals("")) {
						continue;
					}
					List<QueryScheme> oldList = region.get(regionId);
					List<QueryScheme> newList = new LinkedList();
					HashMap<String, QueryScheme> hm = new HashMap();
					for (QueryScheme qs : oldList) {
						hm.put(qs.getId(), qs);
					}
					//
					for (String rid : hm.keySet()) {
						newList.add(hm.get(rid));
					}
					region.put(regionId, newList);
				}
			}
		}
		return result;
	}

	/**
	 * 获取某区域的某类型设备
	 * 
	 * @author allchin modified@2013年8月19日 下午2:02:41
	 * @param region
	 * @param equipType
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<QueryScheme> getEquipments(String buildId, String region,
			String equipType) {
		List<QueryScheme> returnList = new ArrayList<QueryScheme>();
		Criteria ct = querySchemeDao.createCriteria(QueryScheme.class);

		ct.add(Restrictions.eq("buildId", buildId));
		if (region != null && region.trim().length() > 0) {
			ct.add(Restrictions.eq("regionId", region));
		}

		if ("cwp".equalsIgnoreCase(equipType) || "chwp".equalsIgnoreCase(equipType) || "ct".equalsIgnoreCase(equipType)) { // 冷却泵、冷冻泵、冷却塔 特殊处理
			ct.add(Restrictions.eq("id", "chiller")); 
			
			if("ct".equalsIgnoreCase(equipType)) // 冷却塔 特殊处理
				ct.add(Restrictions.sqlRestriction(" name not like '%_VSD_FB'"));
		}
		ct.add(Restrictions.eq("categoryId", equipType));
		ct.addOrder(Order.asc("regionId"));// 根据区域id升序排列
		returnList.addAll(ct.list());

		return returnList;
	}

	/**
	 * Use for get QueryScheme info via sql
	 * 
	 * @param regionId
	 * @param categoryId
	 *            just support ahu,fau,acu
	 * @return
	 */
	public List<QueryScheme> getByRegionId(String regionId, String categoryId) {
		String sql = "SELECT * FROM zhysg_energymsdb.queryscheme where category_id ='"
				+ categoryId
				+ "' and region_id='"
				+ regionId
				+ "' and name='t_sa' ";
		List result = querySchemeDao.createSQLQuery(sql).list();
		return result;
	}
}
