package com.managementsystem.energy.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.BuildDao;
import com.managementsystem.energy.domain.Buildaddfile;
import com.managementsystem.energy.domain.Buildexinfo;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildsettinginfo;
import com.managementsystem.energy.service.BuildService;
import com.managementsystem.util.dao.Page;

@Service
public class BuildServiceImpl implements BuildService {

	@Autowired
	private BuildDao buildDao;
	
	@Transactional
	@CacheEvict(value="builds",key="#buildinfo.buildId + 'info'")
	public void addBuildinfo(Buildinfo buildinfo) {
		String mainKeyValue = "";
		String datacenterId = buildinfo.getDatacenterinfo().getDatacenterId();
		mainKeyValue=datacenterId;
		mainKeyValue+=String.format("%02d", buildinfo.getBuildFunction());
		Buildinfo maxIdBuildinfo = buildDao.getMaxBuildIdByDatecenterId(datacenterId);
		if(maxIdBuildinfo!=null) {
			long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxIdBuildinfo.getBuildId(),4);
			mainKeyValue += String.format("%04d", maxNo+1);
		} else {
			mainKeyValue += String.format("%04d", 1);
		}
		buildinfo.setBuildId(mainKeyValue);
		buildDao.save(buildinfo);	
		buildDao.flush();
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildinfo.buildId + 'info'")
	public void updateBuildinfo(Buildinfo buildinfo) {
		buildDao.update(buildinfo);
		buildDao.flush();
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildId + 'info'")
	public void deleteBuildinfo(String buildId) {
		Buildinfo buildinfo = getBuildinfo(buildId);
		if(buildinfo!=null) {
			buildDao.delete(buildinfo);
			buildDao.flush();
		}
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#buildId + 'info'")  
	public Buildinfo getBuildinfo(String buildId) {
		return (Buildinfo)buildDao.get(Buildinfo.class, buildId);
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildexinfo.buildId + 'exinfo'")
	public void saveOrUpdateBuildexinfo(Buildexinfo buildexinfo) {
		if(buildexinfo.getBuildId().length()>0) {
			Buildinfo buildinfo = getBuildinfo(buildexinfo.getBuildId());
			buildexinfo.setBuildinfo(buildinfo);
			Buildexinfo existBuildexinfo = getBuildexinfo(buildexinfo.getBuildId());
			if(existBuildexinfo==null) {	
				buildDao.save(buildexinfo);
				buildDao.flush();
			}else {
				buildDao.merge(buildexinfo);
				buildDao.flush();
			}
		} else {
			throw new NullPointerException("buildId为空");
		}
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildId + 'exinfo'")
	public void deleteBuildexinfo(String buildId) {
		Buildexinfo buildexinfo = getBuildexinfo(buildId);
		if(buildexinfo!=null)
			buildDao.delete(buildexinfo);
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#buildId + 'exinfo'")  
	public Buildexinfo getBuildexinfo(String buildId) {
		return (Buildexinfo)buildDao.get(Buildexinfo.class, buildId);
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildaddfile.addfileId + 'addfile'")
	public void addBuildaddfile(Buildaddfile buildaddfile) {
		buildDao.save(buildaddfile);
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildaddfile.addfileId + 'addfile'")
	public void updateBuildaddfile(Buildaddfile buildaddfile) {
		buildDao.update(buildaddfile);
	}
	
	@Transactional
	public void setBuildcover(Buildaddfile buildaddfile) {
		buildDao.setBuildcover(buildaddfile);
		buildDao.flush();
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public Buildinfo getBuildcover(String buildId) {
		Buildinfo buildinfo = (Buildinfo)buildDao.get(Buildinfo.class, buildId);
		if(buildinfo!=null) {
			Buildaddfile buildaddfile = buildDao.getBuildcover(buildId);
			buildinfo.getBuildaddfiles().add(buildaddfile);
			buildinfo.setBuildCover(buildaddfile.getAddfilePath());
		}
		return buildinfo;
	}

	@Transactional
	@CacheEvict(value="builds",key="#addfileId + 'addfile'")
	public void deleteBuildaddfile(String addfileId) {
		Buildaddfile buildaddfile = getBuildaddfile(addfileId);
		if(buildaddfile!=null)
			buildDao.delete(buildaddfile);
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#addfileId + 'addfile'")  
	public Buildaddfile getBuildaddfile(String addfileId) {
		return (Buildaddfile)buildDao.get(Buildaddfile.class, addfileId);
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildsettinginfo.buildId + 'setting'")
	public void saveOrUpdateBuildsettinginfo(Buildsettinginfo buildsettinginfo) {
		if(buildsettinginfo.getBuildId().length()>0) {
			Buildsettinginfo existBuildsettinginfo = 
				getBuildsettinginfo(buildsettinginfo.getBuildId());
			if(existBuildsettinginfo==null) {
				buildDao.save(buildsettinginfo);
				buildDao.flush();
			} else {
				buildDao.merge(buildsettinginfo);
				buildDao.flush();
			}
		} else {
			throw new NullPointerException("buildId为空");
		}
	}

	@Transactional
	@CacheEvict(value="builds",key="#buildId + 'setting'")
	public void deleteBuildsettinginfo(String buildId) {
		Buildsettinginfo buildsettinginfo = getBuildsettinginfo(buildId);
		if(buildsettinginfo!=null) {
			buildDao.delete(buildsettinginfo);
			buildDao.flush();
		}
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#buildId + 'setting'")  
	public Buildsettinginfo getBuildsettinginfo(String buildId) {
		return (Buildsettinginfo)buildDao.get(Buildsettinginfo.class, buildId);
	}

	@Transactional(readOnly = true)
	public Set<Buildinfo> getAllBuilds(int startResult, int maxRows) {
		return buildDao.getAllBuilds(startResult, maxRows);
	}


	@Transactional(readOnly = true)
	public Set<Buildinfo> getBuildinfosByBigdistrictId(String bigdistrictId) {
		if(!StringUtils.hasLength(bigdistrictId)) {
			throw new NullPointerException("区域ID不能为空");
		}
		Set<Buildinfo> buildinfos = buildDao.getBuildinfosByBigdistrictId(bigdistrictId);
		for(Iterator<Buildinfo> it = buildinfos.iterator();it.hasNext();) {
			Buildinfo buildinfo = it.next();
			if(buildinfo!=null && buildinfo.getBuildsettinginfo()==null) {
				Buildsettinginfo buildsettinginfo = (Buildsettinginfo)buildDao.get(Buildsettinginfo.class, buildinfo.getBuildId());
				if(buildsettinginfo!=null && StringUtils.hasLength(buildsettinginfo.getSettingWsurl())) {
					buildinfo.setBuildsettinginfo(buildinfo.getBuildsettinginfo());
				}
			}
		}
		return buildinfos;
	}

	@Transactional(readOnly = true)
	public Set<Buildinfo> getBuildFullinfos() {
		Set<Buildinfo> buildinfos = buildDao.getAllBuilds(0, -1);
		for(Iterator<Buildinfo> it = buildinfos.iterator();it.hasNext();) {
			Buildinfo buildinfo = it.next();
			if(buildinfo!=null) {
				Buildaddfile buildaddfile = buildDao.getBuildcover(buildinfo.getBuildId());
				if(buildaddfile!=null) {
					buildinfo.setBuildCover(buildaddfile.getAddfilePath());
				}
			}
		}
		return buildinfos;
	}

	@Transactional(readOnly = true)
	public Page getBuildsByDatacenterId(String datecenterId, int pageIndex,
			int pageSize) {
		return buildDao.getBuildinfosByDatacenterId(datecenterId, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getBuildinfos(int pageIndex, int pageSize) {
		return buildDao.getBuildinfos(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getBuildaddfiles(String buildId, int pageIndex, int pageSize) {
		return buildDao.getBuildaddfiles(buildId, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Set<Buildaddfile> getBuildaddfilesByBuildid(String buildId) {
		return buildDao.getBuildaddfilesByBuildid(0, -1, buildId);
	}

	@Transactional(readOnly = true)
	public Page getBuildaddfilesByFunctype(String buildId, int functype,
			int pageIndex, int pageSize) {
		return buildDao.getBuildaddfilesByFunctype(buildId, functype, pageIndex, pageSize);
	}
	
	@Transactional(readOnly = true)
	public Page getBuildinfos(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return buildDao.getBuildinfos(pageIndex, pageSize, map);
	}

	
	@Transactional(readOnly = true)
	public Set<Buildinfo> findBuildinfosByBuildfunc(int buildfunc,int topnum) {
		return buildDao.findBuildinfosByBuildfunc(buildfunc, topnum);
	}

}
