package com.managementsystem.energy.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.DatacenterDao;
import com.managementsystem.energy.domain.Datacenterinfo;
import com.managementsystem.energy.service.DatacenterService;
import com.managementsystem.util.dao.Page;

@Service
public class DatacenterServiceImpl implements DatacenterService {

	@Autowired
	private DatacenterDao datacenterDao;
	
	@Transactional
	public void addDatacenterinfo(Datacenterinfo datacenterinfo) {
		datacenterDao.save(datacenterinfo);
	}

	@Transactional
	@CacheEvict(value="builds",key="#datacenterinfo.datacenterId + 'datacenter'")
	public void updateDatacenterinfo(Datacenterinfo datacenterinfo) {
		datacenterDao.update(datacenterinfo);
	}

	@Transactional
	@CacheEvict(value="builds",key="#datacenterId + 'datacenter'")
	public void deleteDatacenterinfo(String datacenterId) {
		Datacenterinfo datacenterinfo = getDatacenterinfo(datacenterId);
		if(datacenterinfo!=null)
			datacenterDao.delete(datacenterinfo);
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#datacenterId + 'datacenter'")  
	public Datacenterinfo getDatacenterinfo(String datacenterId) {
		return (Datacenterinfo)datacenterDao.get(Datacenterinfo.class, datacenterId);
	}

	@Transactional(readOnly = true)
	public Set<Datacenterinfo> getDatacenters() {
		return getDatacenters(0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Datacenterinfo> getDatacenters(int startResult, int maxRows) {
		return datacenterDao.getDatacenters(startResult, maxRows);
	}

	@Override
	public Set<Datacenterinfo> getDatacentersByType(int type) {
		return getDatacentersByType(type,0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Datacenterinfo> getDatacentersByType(int type, int startResult,
			int maxRows) {
		return datacenterDao.getDatacentersByType(type, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Page getPagedDatacenters(int pageIndex, int pageSize) {
		return datacenterDao.getPagedDatacenters(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedDatacentersByType(int type, int pageIndex, int pageSize) {
		return datacenterDao.getPagedDatacentersByType(type, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedDatacentersBySearch(int pageIndex, int pageSize,String id,String name,String type) {
		Map<String,Object> condition = new HashMap<String,Object>();
		StringBuffer hql = new StringBuffer();  
		if(StringUtils.hasLength(id)) {
		    condition.put("datacenterId", "%"+ id +"%");
	//		hql.append(" and datacenterId like :datacenterId");
		}
		if(StringUtils.hasLength(name)) {
		    condition.put("datacenterName",  "%"+ name +"%");
	//		hql.append(" and datacenterName like :datacenterName");
		}

		if(StringUtils.hasLength(type)) {
		    condition.put("datacenterType", Integer.parseInt(type));
	//		hql.append(" and datacenterType=:datacenterType");
		}
		String hqlCondition=hql.toString();
		
		return datacenterDao.getPagedDatacentersBySearch(hqlCondition, pageIndex, pageSize, condition);
	}

	
}
