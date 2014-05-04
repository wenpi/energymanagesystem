package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Bigdistrictrelainfo;

public class BigdistrictrelainfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example: ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildaddfile 建筑附加信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Bigdistrictrelainfo bigdistrictrelainfo,Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "districtinfo.districtId", "districtinfo.districtId","行政区域不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "bigdistrictinfo.bigdistrictId", "bigdistrictinfo.bigdistrictId","气候区不能为空");
	}
}
