package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Meterproinfo;

/**
 * 监测仪表产品信息验证类
 * */
public class MeterproinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param meterproinfo 监测仪表产品
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Meterproinfo meterproinfo, Errors errors) {

	}
}
