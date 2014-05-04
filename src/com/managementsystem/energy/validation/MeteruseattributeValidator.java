package com.managementsystem.energy.validation;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Meteruseattribute;

/**
 * 监测仪表使用信息属性验证类
 * */
public class MeteruseattributeValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param meteruseattribute 仪表使用信息属性
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Meteruseattribute meteruseattribute, Errors errors) {
		if(!StringUtils.hasLength(meteruseattribute.getId().getMeterId())) {
			errors.rejectValue("Id", "required", "仪表ID不能为空！");
		}
		if(!StringUtils.hasLength(meteruseattribute.getId().getMeterattrName())) {
			errors.rejectValue("Id", "required", "属性名称不能为空！");
		}
	}
}
