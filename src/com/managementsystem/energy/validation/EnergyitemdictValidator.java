package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Energyitemdict;

/**
 * 能耗分项计量验证类
 * 
 * @author CHENPING 2012-6-15
 * */
public class EnergyitemdictValidator {
	
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param energyitemdict 能耗分项
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Energyitemdict energyitemdict, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "energyItemcode", "energyitemdict.energyItemcode","分类分项名称不能为空");
	}
}
