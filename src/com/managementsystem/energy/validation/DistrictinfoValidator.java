package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Districtinfo;

/**
 * 行政区划验证类
 * */
public class DistrictinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param districtinfo 行政区划
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Districtinfo districtinfo, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "districtId", "districtinfo.districtId","行政区划代码不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "districtName", "districtinfo.districtName","行政区划名称不能为空");
	}
}
