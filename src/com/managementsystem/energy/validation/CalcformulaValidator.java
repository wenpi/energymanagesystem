package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Calcformula;

/**
 * 计量公式验证类
 * */
public class CalcformulaValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param calcformula 计量公式信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Calcformula calcformula, Errors errors) {

	}
}
