package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Dictgroup;

/**
 * 系统数据字典分组验证类
 * 
 * @author CHENPING 2012-6-15
 * */
public class DictgroupValidator {

	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param dictgroup 字典分组
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Dictgroup dictgroup, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "groupCode", "dictgroup.groupCode","数据字典分组代码不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "groupName", "dictgroup.groupName","数据字典分组名称不能为空");
	}	
	
}
