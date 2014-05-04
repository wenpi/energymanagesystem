package com.managementsystem.energy.validation;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Strategy;

public class StrategyValidator {

	public void validate(Strategy strategy, Errors errors) {
		if (!StringUtils.hasLength(strategy.getBuildinfo().getBuildId())) {
			errors.rejectValue("buildinfo.buildId", "required", "所属建筑不能为空");
		}
		if (!StringUtils.hasLength(strategy.getStrategyname())) {
			errors.rejectValue("strategyname", "required", "策略名称不能为空");
		}
	}
}
