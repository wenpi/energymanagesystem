package com.managementsystem.energy.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.EnergypriceDao;
import com.managementsystem.energy.domain.Districtinfo;
import com.managementsystem.energy.domain.Energyprice;
import com.managementsystem.energy.service.EnergypriceService;
import com.managementsystem.util.dao.Page;

@Service
public class EnergypriceServiceImpl implements EnergypriceService {

	@Autowired
	private EnergypriceDao energypriceDao;

	@Transactional(readOnly = true)
	public Page getListEnergyprice(int pageIndex, int pageSize,Map<String,Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(key) && StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return energypriceDao.getListEnergyprice(pageIndex, pageSize,map);
	}
	
	@Transactional
	public void addEnergyprice(Energyprice energyprice) {
		energypriceDao.save(energyprice);
	}

	@Transactional
	public void updateEnergyprice(Energyprice energyprice) {
		energypriceDao.update(energyprice);
	}
	
	@Transactional(readOnly = true)
	public Energyprice getEnergyprice(String priceid) {
		return (Energyprice)energypriceDao.get(Energyprice.class, priceid);
	}
	
	@Transactional(readOnly = true)
	public Energyprice getEnergypriceByenergydictId(String energydictId){
		return (Energyprice)energypriceDao.getEnergypriceByenergydictId(energydictId);
	}
	
	@Transactional
	public void deleteEnergyprice(String priceid) {
		Energyprice energyprice = getEnergyprice(priceid);
		if(energyprice!=null)
			energypriceDao.delete(energyprice);
	}
}

