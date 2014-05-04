package com.managementsystem.energy.service;

import java.util.List;

import com.managementsystem.energy.domain.Buildinfo;

public interface EnergypublicityService {

	public List<Buildinfo> getBuildinfoListByBuildgroupId(String buildgroupId);
}
