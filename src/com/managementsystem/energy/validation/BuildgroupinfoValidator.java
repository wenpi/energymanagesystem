package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Buildgroupinfo;

/**
 * 建筑群对象验证类
 * */
public class BuildgroupinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildgroupinfo 建筑群信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Buildgroupinfo buildgroupinfo, Errors errors) {

	}
}
