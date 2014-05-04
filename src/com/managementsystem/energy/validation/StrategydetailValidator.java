package com.managementsystem.energy.validation;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Strategydetail;

public class StrategydetailValidator {
	public void validate(Strategydetail strategydetail, Errors errors) {
		if (!StringUtils.hasLength(strategydetail.getDevicename())) {
			errors.rejectValue("devicename", "required", "设置名称不能为空");
		}

	}
}
