package com.managementsystem.energy.service.impl;

import java.util.Calendar;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.EnergypublicityDao;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.service.EnergypublicityService;

@Service
public class EnergypublicityServiceImpl implements EnergypublicityService {

	private final Log logger = LogFactory.getLog(EnergypublicityServiceImpl.class);
	private Calendar calendar = Calendar.getInstance();

	@Autowired
	public EnergypublicityDao energypublicityDao;

	
	@Transactional(readOnly = true)
	public List<Buildinfo> getBuildinfoListByBuildgroupId(String buildgroupId) {
		return energypublicityDao.getBuildinfoListByBuildgroupId(buildgroupId);
	}
}
