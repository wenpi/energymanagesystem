package com.managementsystem.energy.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.DeviceDao;
import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.energy.service.DeviceService;
import com.managementsystem.util.dao.Page;


@Service
public class DeviceServiceImpl implements DeviceService {

	@Autowired
	private DeviceDao deviceDao;

	private static long tmpID = 0;
	private static boolean tmpIDlocked = false;

	@Transactional(readOnly = true)
	public Page getPagedChis(int pageIndex, int pageSize) {
		return deviceDao.getPagedChis(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedChisBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedChisBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}

	@Transactional(readOnly = true)
	public List<Chi> getChiList(String no, String buildId, String regionId) {
		List<Chi> list = deviceDao.getChiList(no, buildId, regionId);
		return list;
	}

	@Transactional(readOnly = true)
	public Chi getChi(long id) {
		return (Chi) deviceDao.get(Chi.class, id);
	}

	@Transactional
	public void addChi(Chi chi) {
		long id = this.getUniqueId();
		chi.setId(id);
		deviceDao.save(chi);
		deviceDao.flush();
	}

	@Transactional
	public void updateChi(Chi chi) {
		deviceDao.update(chi);
		deviceDao.flush();
	}

	@Transactional
	public void deleteChi(long id) {
		Chi chi = getChi(id);
		if (chi != null) {
			deviceDao.delete(chi);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedBois(int pageIndex, int pageSize) {
		return deviceDao.getPagedBois(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedBoisBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedBoisBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Boi> getBoiList (String no,String buildId,String regionId){
	List<Boi> list = deviceDao.getBoiList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Boi getBoi(long id) {
		return (Boi) deviceDao.get(Boi.class, id);
	}

	@Transactional
	public void addBoi(Boi boi) {
		long id = this.getUniqueId();
		boi.setId(id);
		deviceDao.save(boi);
		deviceDao.flush();
	}

	@Transactional
	public void updateBoi(Boi boi) {
		deviceDao.update(boi);
		deviceDao.flush();
	}

	@Transactional
	public void deleteBoi(long id) {
		Boi boi = getBoi(id);
		if (boi != null) {
			deviceDao.delete(boi);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedPumps(int pageIndex, int pageSize) {
		return deviceDao.getPagedPumps(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedPumpsBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedPumpsBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Pump> getPumpList (String no,String buildId,String regionId){
	List<Pump> list = deviceDao.getPumpList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Pump getPump(long id) {
		return (Pump) deviceDao.get(Pump.class, id);
	}

	@Transactional
	public void addPump(Pump pump) {
		long id = this.getUniqueId();
		pump.setId(id);
		deviceDao.save(pump);
		deviceDao.flush();
	}

	@Transactional
	public void updatePump(Pump pump) {
		deviceDao.update(pump);
		deviceDao.flush();
	}

	@Transactional
	public void deletePump(long id) {
		Pump pump = getPump(id);
		if (pump != null) {
			deviceDao.delete(pump);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedCts(int pageIndex, int pageSize) {
		return deviceDao.getPagedCts(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedCtsBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedCtsBySearch(hqlCondition, pageIndex, pageSize,
				condition);
	}
	
	@Transactional(readOnly = true)
	public List<Ct> getCtList (String no,String buildId,String regionId){
	List<Ct> list = deviceDao.getCtList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Ct getCt(long id) {
		return (Ct) deviceDao.get(Ct.class, id);
	}

	@Transactional
	public void addCt(Ct ct) {
		long id = this.getUniqueId();
		ct.setId(id);
		deviceDao.save(ct);
		deviceDao.flush();
	}

	@Transactional
	public void updateCt(Ct ct) {
		deviceDao.update(ct);
		deviceDao.flush();
	}

	@Transactional
	public void deleteCt(long id) {
		Ct ct = getCt(id);
		if (ct != null) {
			deviceDao.delete(ct);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedAhus(int pageIndex, int pageSize) {
		return deviceDao.getPagedAhus(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedAhusBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedAhusBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Ahu> getAhuList (String no,String buildId,String regionId){
	List<Ahu> list = deviceDao.getAhuList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Ahu getAhu(long id) {
		return (Ahu) deviceDao.get(Ahu.class, id);
	}

	@Transactional
	public void addAhu(Ahu ahu) {
		long id = this.getUniqueId();
		ahu.setId(id);
		deviceDao.save(ahu);
		deviceDao.flush();
	}

	@Transactional
	public void updateAhu(Ahu ahu) {
		deviceDao.update(ahu);
		deviceDao.flush();
	}

	@Transactional
	public void deleteAhu(long id) {
		Ahu ahu = getAhu(id);
		if (ahu != null) {
			deviceDao.delete(ahu);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedFcus(int pageIndex, int pageSize) {
		return deviceDao.getPagedFcus(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedFcusBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedFcusBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Fcu> getFcuList (String no,String buildId,String regionId){
	List<Fcu> list = deviceDao.getFcuList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Fcu getFcu(long id) {
		return (Fcu) deviceDao.get(Fcu.class, id);
	}

	@Transactional
	public void addFcu(Fcu fcu) {
		long id = this.getUniqueId();
		fcu.setId(id);
		deviceDao.save(fcu);
		deviceDao.flush();
	}

	@Transactional
	public void updateFcu(Fcu fcu) {
		deviceDao.update(fcu);
		deviceDao.flush();
	}

	@Transactional
	public void deleteFcu(long id) {
		Fcu fcu = getFcu(id);
		if (fcu != null) {
			deviceDao.delete(fcu);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedVavs(int pageIndex, int pageSize) {
		return deviceDao.getPagedVavs(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedVavsBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedVavsBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Vav> getVavList (String no,String buildId,String regionId){
	List<Vav> list = deviceDao.getVavList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Vav getVav(long id) {
		return (Vav) deviceDao.get(Vav.class, id);
	}

	@Transactional
	public void addVav(Vav vav) {
		long id = this.getUniqueId();
		vav.setId(id);
		deviceDao.save(vav);
		deviceDao.flush();
	}

	@Transactional
	public void updateVav(Vav vav) {
		deviceDao.update(vav);
		deviceDao.flush();
	}

	@Transactional
	public void deleteVav(long id) {
		Vav vav = getVav(id);
		if (vav != null) {
			deviceDao.delete(vav);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedLightings(int pageIndex, int pageSize) {
		return deviceDao.getPagedLightings(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedLightingsBySearch(int pageIndex, int pageSize,
			String no, String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedLightingsBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Lighting> getLightingList (String no,String buildId,String regionId){
	List<Lighting> list = deviceDao.getLightingList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Lighting getLighting(long id) {
		return (Lighting) deviceDao.get(Lighting.class, id);
	}

	@Transactional
	public void addLighting(Lighting lighting) {
		long id = this.getUniqueId();
		lighting.setId(id);
		deviceDao.save(lighting);
		deviceDao.flush();
	}

	@Transactional
	public void updateLighting(Lighting lighting) {
		deviceDao.update(lighting);
		deviceDao.flush();
	}

	@Transactional
	public void deleteLighting(long id) {
		Lighting lighting = getLighting(id);
		if (lighting != null) {
			deviceDao.delete(lighting);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedLifts(int pageIndex, int pageSize) {
		return deviceDao.getPagedLifts(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedLiftsBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedLiftsBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Lift> getLiftList (String no,String buildId,String regionId){
	List<Lift> list = deviceDao.getLiftList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Lift getLift(long id) {
		return (Lift) deviceDao.get(Lift.class, id);
	}

	@Transactional
	public void addLift(Lift lift) {
		long id = this.getUniqueId();
		lift.setId(id);
		deviceDao.save(lift);
		deviceDao.flush();
	}

	@Transactional
	public void updateLift(Lift lift) {
		deviceDao.update(lift);
		deviceDao.flush();
	}

	@Transactional
	public void deleteLift(long id) {
		Lift lift = getLift(id);
		if (lift != null) {
			deviceDao.delete(lift);
			deviceDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Page getPagedHeaters(int pageIndex, int pageSize) {
		return deviceDao.getPagedHeaters(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public Page getPagedHeatersBySearch(int pageIndex, int pageSize, String no,
			String buildId, String regionId) {
		Map<String, Object> condition = new HashMap<String, Object>();
		StringBuffer hql = new StringBuffer();
		if (StringUtils.hasLength(no)) {
			condition.put("deviceNo", "%" + no + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(buildId)) {
			condition.put("buildId", "%" + buildId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		if (StringUtils.hasLength(regionId)) {
			condition.put("regionId", "%" + regionId + "%");
			// hql.append(" and datacenterId like :datacenterId");
		}
		String hqlCondition = hql.toString();
		return deviceDao.getPagedHeatersBySearch(hqlCondition, pageIndex,
				pageSize, condition);
	}
	
	@Transactional(readOnly = true)
	public List<Heater> getHeaterList (String no,String buildId,String regionId){
	List<Heater> list = deviceDao.getHeaterList(no, buildId, regionId);
	return list;
	}

	@Transactional(readOnly = true)
	public Heater getHeater(long id) {
		return (Heater) deviceDao.get(Heater.class, id);
	}

	@Transactional
	public void addHeater(Heater heater) {
		long id = this.getUniqueId();
		heater.setId(id);
		deviceDao.save(heater);
		deviceDao.flush();
	}

	@Transactional
	public void updateHeater(Heater heater) {
		deviceDao.update(heater);
		deviceDao.flush();
	}

	@Transactional
	public void deleteHeater(long id) {
		Heater heater = getHeater(id);
		if (heater != null) {
			deviceDao.delete(heater);
			deviceDao.flush();
		}
	}

	private long getUniqueId() {
		long ltime = 0;
		while (true) {
			if (tmpIDlocked == false) {
				tmpIDlocked = true;
				ltime = Long.valueOf(new SimpleDateFormat("yyMMddhhmmssSSS")
						.format(new Date()).toString()) * 10000;
				if (tmpID < ltime) {
					tmpID = ltime;
				} else {
					tmpID = tmpID + 1;
					ltime = tmpID;
				}
				tmpIDlocked = false;
				return ltime;
			}
		}
	}
}
