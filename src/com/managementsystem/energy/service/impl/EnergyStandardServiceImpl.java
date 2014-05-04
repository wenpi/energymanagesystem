package com.managementsystem.energy.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.EnergyStandardDao;
import com.managementsystem.energy.domain.EnergyItemStandardDetail;
import com.managementsystem.energy.domain.EnergyRegionalStandardDetail;
import com.managementsystem.energy.domain.EnergyStandard;
import com.managementsystem.energy.service.EnergyStandardService;
import com.managementsystem.util.dao.Page;

@Service
public class EnergyStandardServiceImpl implements EnergyStandardService {

	private EnergyStandardDao energyStandardDao;

	@Autowired
	public void setEnergyStandardDao(EnergyStandardDao energyStandardDao) {
		this.energyStandardDao = energyStandardDao;
	}

	@Override
	@Transactional
	public void addEnergyStandard(EnergyStandard energyStandard)
			throws DataAccessException {
		energyStandardDao.save(energyStandard);
	}

	@Override
	@Transactional
	public void updateEnergyStandard(EnergyStandard energyStandard)
			throws DataAccessException {
		energyStandardDao.update(energyStandard);
	}

	@Override
	@Transactional
	public void deleteEnergyStandard(String standardId)
			throws DataAccessException {
		EnergyStandard energyStandard = getEnergyStandard(standardId);
		if(energyStandard!=null) {
			energyStandardDao.delete(energyStandard);	
		}
	}

	@Override
	@Transactional(readOnly=true)
	public EnergyStandard getEnergyStandard(String standardId)
			throws DataAccessException {
		return (EnergyStandard)energyStandardDao.get(EnergyStandard.class, standardId);
	}

	@Override
	@Transactional(readOnly=true)
	public Page findEnergyStandards(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) throws DataAccessException {
		return energyStandardDao.findEnergyStandards(pageIndex, pageSize, mapCondition);
	}

	@Override
	@Transactional(readOnly=true)
	public Set<EnergyStandard> findDefaultEnergyStandards(int startResult,
			int maxRows) throws DataAccessException {
		return energyStandardDao.findDefaultEnergyStandards(startResult, maxRows);
	}

	@Override
	@Transactional(readOnly=true)
	public Set<EnergyStandard> findDefaultEnergyStandards()
			throws DataAccessException {
		return energyStandardDao.findDefaultEnergyStandards();
	}

	@Override
	@Transactional
	public void addEnergyItemStandardDetail(
			EnergyItemStandardDetail energyItemStandardDetail)
			throws DataAccessException {
		energyStandardDao.save(energyItemStandardDetail);
	}

	@Override
	@Transactional
	public void updateEnergyItemStandardDetail(
			EnergyItemStandardDetail energyItemStandardDetail)
			throws DataAccessException {
		energyStandardDao.update(energyItemStandardDetail);
	}

	@Override
	@Transactional
	public void deleteEnergyItemStandardDetail(String detailId)
			throws DataAccessException {
		EnergyItemStandardDetail energyItemStandardDetail = getEnergyItemStandardDetail(detailId);
		if(energyItemStandardDetail!=null) {
			energyStandardDao.delete(energyItemStandardDetail);
		}
	}

	@Override
	@Transactional(readOnly=true)
	public EnergyItemStandardDetail getEnergyItemStandardDetail(String detailId)
			throws DataAccessException {
		return (EnergyItemStandardDetail)energyStandardDao.get(EnergyItemStandardDetail.class, detailId);
	}

	@Override
	@Transactional(readOnly=true)
	public Set<EnergyItemStandardDetail> findEnergyItemStandardDetails(
			String standardId) throws DataAccessException {
		return energyStandardDao.findEnergyItemStandardDetails(standardId);
	}

	@Override
	@Transactional
	public void addEnergyRegionalStandardDetail(
			EnergyRegionalStandardDetail energyRegionalStandardDetail)
			throws DataAccessException {
		energyStandardDao.save(energyRegionalStandardDetail);
	}

	@Override
	@Transactional
	public void updateEnergyRegionalStandardDetail(
			EnergyRegionalStandardDetail energyRegionalStandardDetail)
			throws DataAccessException {
		energyStandardDao.update(energyRegionalStandardDetail);		
	}

	@Override
	@Transactional
	public void deleteEnergyRegionalStandardDetail(String detailId)
			throws DataAccessException {
		EnergyRegionalStandardDetail energyRegionalStandardDetail = null;
		energyRegionalStandardDetail = getEnergyRegionalStandardDetail(detailId);
		if(energyRegionalStandardDetail!=null) {
			energyStandardDao.delete(energyRegionalStandardDetail);
		}
	}

	@Override
	@Transactional(readOnly=true)
	public EnergyRegionalStandardDetail getEnergyRegionalStandardDetail(
			String detailId) throws DataAccessException {
		return (EnergyRegionalStandardDetail)energyStandardDao.get(EnergyRegionalStandardDetail.class, detailId);
	}

	@Override
	@Transactional(readOnly=true)
	public Set<EnergyRegionalStandardDetail> findEnergyRegionalStandardDetails(
			String standardId) throws DataAccessException {
		return energyStandardDao.findEnergyRegionalStandardDetails(standardId);
	}
	
	@Override
	@Transactional(readOnly=true)
	public List<EnergyStandard> energyStandardList(String standardType)  throws DataAccessException {
		return energyStandardDao.energyStandardList(standardType);
	}

	

}
