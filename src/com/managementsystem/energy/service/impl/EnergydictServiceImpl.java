package com.managementsystem.energy.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.EnergydictDao;
import com.managementsystem.energy.domain.Energydict;
import com.managementsystem.energy.service.EnergydictService;
import com.managementsystem.util.dao.Page;

@Service
public class EnergydictServiceImpl implements EnergydictService {

	@Autowired
	private EnergydictDao energydictDao;
	
	@Transactional
	public void addEnergydict(Energydict energydict) {
		energydictDao.save(energydict);
	}

	@Transactional
	public void updateEnergydict(Energydict energydict) {
		energydictDao.update(energydict);
	}

	@Transactional
	public void deleteEnergydict(String energydictId) {
		Energydict energydict = getEnergydict(energydictId);
		if(energydict!=null)
			energydictDao.delete(energydict);
	}

	@Transactional(readOnly = true)
	public Energydict getEnergydict(String energydictId) {
		return (Energydict)energydictDao.get(Energydict.class, energydictId);
	}

	@Transactional(readOnly = true)
	public Page getEnergydicts(int pageIndex, int pageSize,Map<String,Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(key) && StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return energydictDao.getEnergydicts(pageIndex, pageSize,map);
	}

	@Transactional(readOnly = true)
	public Set<Energydict> getEnergydicts() {
		return energydictDao.getEnergydicts();
	}

}
