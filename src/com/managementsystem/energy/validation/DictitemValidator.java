package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Dictitem;

/**
 * 系统数据字典项验证类
 * 
 * @author CHENPING 2012-6-15
 * */
public class DictitemValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param dictitem 数据字典项
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Dictitem  dictitem, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemCode", "required", "数据字典项代码不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dictgroup.groupCode", "required", "数据字典项分组代码不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemName", "required", "数据字典项名称不能为空");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id.itemCode", "dictitem.id.itemCode","数据字典项代码不能为空");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id.groupCode", "dictitem.id.groupCode","数据字典项分组代码不能为空");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "itemName", "dictitem.itemName","数据字典项名称不能为空");
	}
}
