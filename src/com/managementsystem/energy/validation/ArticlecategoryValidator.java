package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Articlecategory;

/**
 * 文章类别信息验证
 * 
 * @author CHENPING 2012/8/28
 * */
public class ArticlecategoryValidator {

	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example: ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildaddfile 建筑附加信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Articlecategory articlecategory, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "catName", "catName","类别名称不能为空");
	}

}
