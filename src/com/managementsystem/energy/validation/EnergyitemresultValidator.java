package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Energyitemresult;

/**
 * 分类分项及装表关系验证类
 * */
public class EnergyitemresultValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param energyitemresult 分类分项及装表关系
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Energyitemresult energyitemresult, Errors errors) {

	}
}
