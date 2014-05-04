package com.managementsystem.energy.service.impl;

import java.util.Calendar;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.BuildgroupDao;
import com.managementsystem.energy.domain.Buildgroupinfo;
import com.managementsystem.energy.domain.Buildgrouprelainfo;
import com.managementsystem.energy.domain.BuildgrouprelainfoId;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.BuildgroupService;
import com.managementsystem.util.dao.Page;

@Service
public class BuildgroupServiceImpl implements BuildgroupService {

	@Autowired
	private BuildgroupDao buildgroupDao;
	
	@Transactional
	public void addBuildgroupinfo(Buildgroupinfo buildgroupinfo) {
		String mainKeyValue = "";
		String districtId = "";
		districtId = buildgroupinfo.getBuildDistrictid();
		if(!StringUtils.hasLength(districtId)) {
			throw new NullPointerException("所属地区为空");
		}
		mainKeyValue = districtId;
		Buildgroupinfo maxBuildgroupinfo = buildgroupDao.maxBuildgroupinfoByBuildDistrictid(districtId);
		if(maxBuildgroupinfo==null) {
			mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,1);
		} else {
			long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxBuildgroupinfo.getBuildgroupId(),6);
			mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,maxNo+1);	
		}
		buildgroupinfo.setBuildgroupId(mainKeyValue);
		buildgroupDao.save(buildgroupinfo);
		buildgroupDao.flush();
	}

	@Transactional
	public void updateBuildgroupinfo(Buildgroupinfo buildgroupinfo) {
		buildgroupDao.update(buildgroupinfo);	
		buildgroupDao.flush();
	}

	@Transactional
	public void deleteBuildgroupinfo(String buildgroupId) {
		Buildgroupinfo buildgroupinfo = getBuildgroupinfo(buildgroupId);
		if(buildgroupinfo!=null) {
			buildgroupDao.delete(buildgroupinfo);
			buildgroupDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Buildgroupinfo getBuildgroupinfo(String buildgroupId) {
		return (Buildgroupinfo)buildgroupDao.get(Buildgroupinfo.class, buildgroupId);
	}
	
	@Transactional
	public void addBuildgrouprelainfo(Buildgrouprelainfo buildgrouprelainfo) {
		buildgrouprelainfo.setCreatedondate(Calendar.getInstance().getTime());
		buildgroupDao.save(buildgrouprelainfo);
		buildgroupDao.flush();
	}
	
	@Transactional
	public void deleteBuildgrouprelainfo(BuildgrouprelainfoId id) {
		Buildgrouprelainfo buildgrouprelainfo = (Buildgrouprelainfo)buildgroupDao.get(Buildgrouprelainfo.class, id);
		if(buildgrouprelainfo!=null) {
			buildgroupDao.delete(buildgrouprelainfo);
			buildgroupDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Set<Buildgroupinfo> getBuildgroups() {
		return getBuildgroups(0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Buildgroupinfo> getBuildgroups(int startResult, int maxRows) {
		return buildgroupDao.getBuildgroups(startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(String datacenterId) {
		return getBuildgrouiesByDatacenterId(datacenterId, 0, -1);
	}

	@Transactional(readOnly = true)
	public Set<Buildgroupinfo> getBuildgrouiesByDatacenterId(
			String datacenterId, int startResult, int maxRows) {
		return buildgroupDao.getBuildgrouiesByDatacenterId(datacenterId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Buildinfo> getBuildinfosByBuildgroupId(int startResult, int maxRows,String buildgroupId) {
		return buildgroupDao.getBuildinfosByBuildgroupId(startResult, maxRows, buildgroupId);
	}

	@Transactional(readOnly = true)
	public Page getBuildgroups(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return buildgroupDao.getBuildgroups(pageIndex, pageSize, mapParams);
	}
	
}
