package com.managementsystem.energy.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.DistrictDao;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.service.DistrictService;
import com.managementsystem.util.dao.Page;

@Service
public class DistrictServiceImpl implements DistrictService {

	@Autowired
	private DistrictDao districtDao;
	
	@Transactional
	public void addDistrictinfo(Districtinfo districtinfo) {
		if(!StringUtils.hasLength(districtinfo.getDistrictinfo().getDistrictId())) {
			districtinfo.setDistrictinfo(null);
		}
		districtDao.save(districtinfo);
	}

	@Transactional
	public void updateDistrictinfo(Districtinfo districtinfo) {
		if(!StringUtils.hasLength(districtinfo.getDistrictinfo().getDistrictId())) {
			districtinfo.setDistrictinfo(null);
		}
		districtDao.update(districtinfo);
	}

	@Transactional
	public void deleteDistrictinfo(String districtId) {
		Districtinfo districtinfo = getDistrictinfo(districtId);
		if(districtinfo!=null)
			districtDao.delete(districtinfo);
	}

	@Transactional(readOnly = true)
	public Districtinfo getDistrictinfo(String districtId) {
		return (Districtinfo)districtDao.get(Districtinfo.class, districtId);
	}

	@Transactional(readOnly = true)
	public Set<Districtinfo> getAllDistricts(int startResult, int maxRows) {
		return districtDao.getAllDistricts(startResult, maxRows);
	}


	@Transactional(readOnly = true)
	public Set<Districtinfo> getRootDistricts(int startResult, int maxRows) {
		return districtDao.getRootDistricts(startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Districtinfo> getDistrictsByParentId(String districtId,
			int startResult, int maxRows) {
		return districtDao.getDistrictsByParentId(districtId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Page getPagedDictgrouies(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return districtDao.getDistricts(pageIndex, pageSize, map);
	}
}
