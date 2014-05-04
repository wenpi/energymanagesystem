package com.managementsystem.energy.service.impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.EnergyitemresultDao;
import com.managementsystem.energy.domain.Energyitemresult;
import com.managementsystem.energy.service.EnergyitemresultService;

@Service
public class EnergyitemresultServiceImpl implements EnergyitemresultService {

	@Autowired
	private EnergyitemresultDao energyitemresultDao;

	@Transactional(readOnly = true)
	public Energyitemresult getEnergyitemresult(String resultId) {
		return (Energyitemresult) energyitemresultDao.get(
				Energyitemresult.class, resultId);
	}

	@Transactional(readOnly = true)
	public Set<Energyitemresult> getEnergyitemresultsByMeterId(String meterId) {
		return energyitemresultDao.getEnergyitemresultByMeterId(meterId);
	}

	@Transactional(readOnly = true)
	public Energyitemresult getEnergyitemresultByMeterId(String meterId) {
		List<Energyitemresult> results = new LinkedList<Energyitemresult>(
				energyitemresultDao.getEnergyitemresultByMeterId(meterId));
		if (results.size() > 0) {
			return results.get(0);
		}
		return null;
	}

	@Transactional
	public void saveOrUpdateEnergyitemresult(Energyitemresult energyitemresult) {
		if (energyitemresult == null)
			throw new NullPointerException("energyitemresult is null");
		String resultId = energyitemresult.getResultId();
		if (StringUtils.hasLength(resultId)) {
			Energyitemresult existEnergyitemresult = getEnergyitemresult(resultId);
			if (existEnergyitemresult != null) {
				if (existEnergyitemresult
						.getMeteruseinfo()
						.getMeterId()
						.equals(energyitemresult.getMeteruseinfo().getMeterId())
						&& existEnergyitemresult
								.getEnergyitemdict()
								.getEnergyItemcode()
								.equals(energyitemresult.getEnergyitemdict()
										.getEnergyItemcode())) {
					return;
				} else {
					energyitemresultDao.merge(energyitemresult);
				}
			} else {
				energyitemresultDao.save(energyitemresult);
			}
		} else {
			energyitemresultDao.save(energyitemresult);
		}
		energyitemresultDao.flush();
	}
}
