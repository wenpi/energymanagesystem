package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Buildexinfo;

/**
 * 建筑扩展信息验证类
 * 
 * @author CHENPING
 * */
public class BuildexinfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildexinfo 建筑扩展信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Buildexinfo buildexinfo, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "buildId", "requied", "建筑ID不能为空");
	}
}
