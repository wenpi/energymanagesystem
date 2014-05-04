package com.managementsystem.energy.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.managementsystem.energy.domain.Article;

/**
 * 文章对象验证
 * @author CHENPING 2012-8-28
 * */
public class ArticleValidator {

	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>for example: ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code", "required","required");</p>
	 * 
	 * @param buildaddfile 建筑附加信息
	 * @param errors 错误结果集
	 * 
	 * */
	public void validate(Article article,Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "title","文章标题不能为空");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "articlecategoryByCatId", "article.articlecategoryByCatId","文章所属类别不能为空");
	}
}
