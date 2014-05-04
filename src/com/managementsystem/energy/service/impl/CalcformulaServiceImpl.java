package com.managementsystem.energy.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.dao.CalcformulaDao;
import com.managementsystem.energy.domain.Calcformula;
import com.managementsystem.energy.service.CalcformulaService;

@Service
public class CalcformulaServiceImpl implements CalcformulaService {

	@Autowired
	private CalcformulaDao calcformulaDao;
	
	@Transactional
	public void addCalcformula(Calcformula calcformula) {
		calcformulaDao.save(calcformula);
	}

	@Transactional
	public void updateCalcformula(Calcformula calcformula) {
		calcformulaDao.update(calcformula);
	}

	@Transactional
	public void deleteCalcformula(String formulaId) {
		Calcformula calcformula = getCalcformula(formulaId);
		if(calcformula!=null) {
			calcformulaDao.delete(calcformula);
		}
	}

	@Transactional(readOnly = true)
	public Calcformula getCalcformula(String formulaId) {
		return (Calcformula)calcformulaDao.get(Calcformula.class, formulaId);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulas(int startResult, int maxRows) {
		return calcformulaDao.getCalcformulas(startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulas() {
		return getCalcformulas(0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulasByBuildId(String buildId,
			int startResult, int maxRows) {
		return calcformulaDao.getCalcformulasByBuildId(buildId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulasByBuildId(String buildId) {
		return getCalcformulasByBuildId(buildId,0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,
			String energyItemcode, int startResult, int maxRows) {
		return calcformulaDao.getCalcformulasByEnergyItemcode(buildId, energyItemcode, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Calcformula> getCalcformulasByEnergyItemcode(String buildId,
			String energyItemcode) {
		return getCalcformulasByEnergyItemcode(buildId, energyItemcode,0,-1);
	}

}
