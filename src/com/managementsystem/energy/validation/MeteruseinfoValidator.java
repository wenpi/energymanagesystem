package com.managementsystem.energy.validation;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Meteruseinfo;

/**
 * 监测仪表使用信息验证类
 * */
public class MeteruseinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param meteruseinfo 监测仪表使用信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Meteruseinfo meteruseinfo, Errors errors) {
		if(!StringUtils.hasLength(meteruseinfo.getCircuitinfo().getCircuitId())) {
			errors.rejectValue("circuitinfo", "required", "支路ID不能为空");
		}
	}
}
