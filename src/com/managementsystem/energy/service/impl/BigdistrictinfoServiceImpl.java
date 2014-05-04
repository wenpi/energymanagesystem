package com.managementsystem.energy.service.impl;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.BigdistrictinfoDao;
import com.managementsystem.energy.domain.Bigdistrictinfo;
import com.managementsystem.energy.domain.Bigdistrictrelainfo;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.service.BigdistrictinfoService;
import com.managementsystem.util.dao.Page;

@Service
public class BigdistrictinfoServiceImpl implements BigdistrictinfoService {

	@Autowired
	private BigdistrictinfoDao bigdistrictinfoDao;

	@Transactional
	public void saveOrUpdateBigdistrictinfo(Bigdistrictinfo bigdistrictinfo) {
		String bigdistrictId = bigdistrictinfo.getBigdistrictId();
		if(!StringUtils.hasLength(bigdistrictinfo.getBigdistrictinfo().getBigdistrictId()))
			bigdistrictinfo.setBigdistrictinfo(null);
		if(StringUtils.hasLength(bigdistrictId)) {
			Bigdistrictinfo existBigdistrictinfo = getBigdistrictinfo(bigdistrictId);
			if(existBigdistrictinfo!=null) {
				bigdistrictinfoDao.merge(bigdistrictinfo);
			} else {
				bigdistrictinfoDao.save(bigdistrictinfo);	
			}		
		} else {
			bigdistrictinfoDao.save(bigdistrictinfo);
		}
		bigdistrictinfoDao.flush();
	}

	@Transactional
	public void deleteBigdistrictinfo(String bigdistrictId)
			throws NullPointerException {
		if (StringUtils.hasLength(bigdistrictId)) {
			Bigdistrictinfo bigdistrictinfo = getBigdistrictinfo(bigdistrictId);
			if (bigdistrictinfo != null) {
				bigdistrictinfoDao.delete(bigdistrictinfo);
				bigdistrictinfoDao.flush();
			}
		} else {
			throw new NullPointerException("删除失败,bigdistrictId未赋值");
		}
	}

	@Transactional(readOnly = true)
	public Bigdistrictinfo getBigdistrictinfo(String bigdistrictId) {
		return (Bigdistrictinfo) bigdistrictinfoDao.get(Bigdistrictinfo.class,
				bigdistrictId);
	}

	@Transactional(readOnly = true)
	public Set<Bigdistrictinfo> getBigdistrictinfos() {
		return bigdistrictinfoDao.getBigdistrictinfos(0, -1);
	}
	@Transactional(readOnly = true)
	public Set<Bigdistrictinfo> getBigdistrictinfos(int startResult, int maxRows) {
		return bigdistrictinfoDao.getBigdistrictinfos(startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Page getBigdistrictinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return bigdistrictinfoDao.getBigdistrictinfos(pageIndex, pageSize, mapParams);
	}

	@Transactional(readOnly = true)
	public Set<Bigdistrictinfo> getRootBigdistrictinfos(int startResult,
			int maxRows) {
		return bigdistrictinfoDao.getRootBigdistrictinfos(startResult, maxRows);
	}
	
	@Transactional(readOnly = true)
	public Set<Bigdistrictinfo> getRootBigdistrictinfos() {
		return bigdistrictinfoDao.getRootBigdistrictinfos(0, -1);
	}

	@Transactional(readOnly = true)
	public Page getDistrictinfosByBigdistrictId(int pageIndex, int pageSize,
			String bigdistrictId) {
		return bigdistrictinfoDao.getDistrictinfosByBigdistrictId(pageIndex, pageSize, bigdistrictId);
	}

	@Transactional
	public void saveOrUpdateBigdistrictrelainfo(
			Bigdistrictrelainfo bigdistrictrelainfo) {
		String relationId = bigdistrictrelainfo.getRelationId();
		if(StringUtils.hasLength(relationId)) {
			Bigdistrictrelainfo existBigdistrictrelainfo = getBigdistrictrelainfo(relationId);
			if(existBigdistrictrelainfo!=null) {
				bigdistrictinfoDao.merge(bigdistrictrelainfo);				
			} else {
				bigdistrictinfoDao.save(bigdistrictrelainfo);
			}
		} else {
			bigdistrictinfoDao.save(bigdistrictrelainfo);
		}
		bigdistrictinfoDao.flush();
	}

	@Transactional
	public void deleteBigdistrictrelainfo(String relationId)
			throws NullPointerException {
		if (StringUtils.hasLength(relationId)) {
			Bigdistrictrelainfo existBigdistrictrelainfo = getBigdistrictrelainfo(relationId);
			if(existBigdistrictrelainfo!=null) {
				bigdistrictinfoDao.delete(existBigdistrictrelainfo);
			}
		}else {
			throw new NullPointerException("删除失败,relationId未赋值");
		}
	}
	
	@Transactional
	public Bigdistrictinfo getBigdistrictinfo(Districtinfo districtinfo) {
		return (Bigdistrictinfo)bigdistrictinfoDao.getBigdistrictinfo(districtinfo);
	}

	@Transactional(readOnly = true)
	public Bigdistrictrelainfo getBigdistrictrelainfo(String relationId) {
		return (Bigdistrictrelainfo)bigdistrictinfoDao.get(Bigdistrictrelainfo.class, relationId);
	}
	
	
}
