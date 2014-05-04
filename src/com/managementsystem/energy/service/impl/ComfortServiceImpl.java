package com.managementsystem.energy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.BuildDao;
import com.managementsystem.energy.dao.ComfortDao;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.service.ComfortService;

@Service
public class ComfortServiceImpl implements ComfortService {

	@Autowired
	private BuildDao buildDao;
	
	@Autowired
	private ComfortDao comfortDao;
	
    @Transactional(readOnly = true)
    public  List<Buildinfo>  getBuildinfo () {
    	List<Buildinfo> list=  buildDao.getBuildinfo ();
    	return list;
	}
    
    @Transactional(readOnly = true)
    public  List<Meteruseinfo>  getMeteruseinfos (String regionId) {
    	List<Meteruseinfo> list=  comfortDao.getMeteruseinfos (regionId);
    	return list;
	}
}
