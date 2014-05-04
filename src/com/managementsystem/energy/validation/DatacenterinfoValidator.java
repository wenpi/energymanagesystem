package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Datacenterinfo;

/**
 * 数据中心信息验证类
 * 
 * @author CHENPING 2012-6-15
 * */
public class DatacenterinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param datacenterinfo 数据中心
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Datacenterinfo datacenterinfo, Errors errors) {

	}
}
