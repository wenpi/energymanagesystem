package com.managementsystem.energy.validation;


import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Energydict;


/**
 * 能耗字典验证类
 * */
public class EnergydictValidator {
	
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param energydict 能耗字典
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Energydict energydict, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "energydictName", "energydict.energydictName","能源名称不能为空");
	}
}
