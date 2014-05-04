package com.managementsystem.energy.service.impl;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.MeterproDao;
import com.managementsystem.energy.domain.Meterparaminfo;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.energy.service.MeterproService;
import com.managementsystem.util.dao.Page;

@Service
public class MeterproServiceImpl implements MeterproService {

	@Autowired
	private MeterproDao meterproDao;
	
	@Transactional
	@CacheEvict(value="builds",key="#meterproinfo.meterProductid + 'meterproinfo'")
	public void addMeterproinfo(Meterproinfo meterproinfo) {
		String meterProductid = "";
		Meterproinfo maxMeterproinfo = meterproDao.getMaxMeterproinfoByProductidId();
		if(maxMeterproinfo==null) {
			meterProductid=com.managementsystem.util.StringUtils.fillString(6,1);
		}else {
			long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxMeterproinfo.getMeterProductid(),6);
			meterProductid =com.managementsystem.util.StringUtils.fillString(6,maxNo+1);
		}
		meterproinfo.setMeterProductid(meterProductid);
		meterproDao.save(meterproinfo);
		meterproDao.flush();
	}

	@Transactional
	@CacheEvict(value="builds",key="#meterproinfo.meterProductid + 'meterproinfo'")
	public void updateMeterproinfo(Meterproinfo meterproinfo) {
		meterproDao.update(meterproinfo);
		meterproDao.flush();
	}

	@Transactional
	@CacheEvict(value="builds",key="#meterProductid + 'meterproinfo'")
	public void deleteMeterproinfo(String meterProductid) {
		Meterproinfo meterproinfo = getMeterproinfo(meterProductid);
		if(meterproinfo!=null){
			Set<Meterparaminfo> params = meterproDao.getMeterparaminfosByProductid(meterProductid);
			for(Iterator<Meterparaminfo> iterator = params.iterator();iterator.hasNext();) {
				Meterparaminfo paraminfo = (Meterparaminfo)iterator.next();
				meterproDao.delete(paraminfo);
			}
			meterproDao.delete(meterproinfo);
			meterproDao.flush();
		}
	}

	@Transactional(readOnly = true)
	@Cacheable(value="builds",key="#meterProductid + 'meterproinfo'")  
	public Meterproinfo getMeterproinfo(String meterProductid) {
		return (Meterproinfo)meterproDao.get(Meterproinfo.class, meterProductid);
	}

	@Transactional
	@CacheEvict(value="builds",key="#meterparaminfo.meterParamid + 'meterparaminfo'")
	public void saveOrUpdateMeterparaminfo(Meterparaminfo meterparaminfo) {
		if(StringUtils.hasLength(meterparaminfo.getMeterParamid())) {
			Meterparaminfo existMeterparaminfo = getMeterparaminfo(meterparaminfo.getMeterParamid());
			if(existMeterparaminfo!=null) {
				meterproDao.merge(meterparaminfo);	
				meterproDao.flush();
			}else {
				addMeterparaminfo(meterparaminfo);	
			}
		} else {
			addMeterparaminfo(meterparaminfo);	
		}
	}
	
	@CacheEvict(value="builds",key="#meterparaminfo.meterParamid + 'meterparaminfo'")
	private void addMeterparaminfo(Meterparaminfo meterparaminfo) {
		if(meterparaminfo.getMeterproinfo()!=null) {
			Meterproinfo meterproinfo = meterparaminfo.getMeterproinfo();
			String meterProductid = meterproinfo.getMeterProductid();
			String paramId = meterProductid;
			Meterparaminfo lastMeterparaminfo = meterproDao.maxMeterParamidByProductid(meterProductid);
			if(lastMeterparaminfo==null) {
				paramId+=com.managementsystem.util.StringUtils.fillString(2,1);
				
			}else {
				long maxNo = com.managementsystem.util.StringUtils.parseSubstring(lastMeterparaminfo.getMeterParamid(),2);
				paramId+=com.managementsystem.util.StringUtils.fillString(2,maxNo+1);
			}
			meterparaminfo.setMeterParamid(paramId);
			meterproDao.save(meterparaminfo);
			meterproDao.flush();
		}
	}
	
	
	@Transactional
	@CacheEvict(value="builds",key="#meterParamid + 'meterparaminfo'")
	public void deleteMeterparaminfo(String meterParamid) {
		Meterparaminfo meterparaminfo = getMeterparaminfo(meterParamid);
		if(meterparaminfo!=null){
			meterproDao.delete(meterparaminfo);
			meterproDao.flush();
		}
	}

	@Transactional(readOnly = true)
	@CacheEvict(value="builds",key="#meterParamid + 'meterparaminfo'")
	public Meterparaminfo getMeterparaminfo(String meterParamid) {
		return (Meterparaminfo)meterproDao.get(Meterparaminfo.class, meterParamid);
	}

	@Transactional(readOnly = true)
	public Page getMeterproinfos(int pageIndex, int pageSize,Map<String, Object> mapParams) {
		return meterproDao.getMeterproinfos(pageIndex, pageSize,mapParams);
	}

	@Transactional(readOnly = true)
	public Page getMeterproinfosByType(int type, int pageIndex, int pageSize) {
		return meterproDao.getMeterproinfosByType(type, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getMeterproinfosByName(String productname, int pageIndex,
			int pageSize) {
		return meterproDao.getMeterproinfosByName(productname, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getMeterproinfosByProducter(String producter, int pageIndex,
			int pageSize) {
		return meterproDao.getMeterproinfosByProducter(producter, pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Set<Meterparaminfo> getMeterparaminfosByProductid(
			String meterProductid) {
		return meterproDao.getMeterparaminfosByProductid(meterProductid);
	}

}
