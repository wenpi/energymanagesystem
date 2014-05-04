package com.managementsystem.energy.service;

import java.util.List;

import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Meteruseinfo;

/**
 * 建筑信息服务接口类
 * 
 * @author CHENPING 2012-06-14
 * */
public interface ComfortService {
	public  List<Buildinfo>  getBuildinfo ();
	
	public  List<Meteruseinfo>  getMeteruseinfos (String regionId) ;
}
