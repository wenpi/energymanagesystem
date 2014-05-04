package com.managementsystem.energy.validation;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.managementsystem.energy.domain.Buildregioninfo;

/**
 * 建筑区域信息验证类
 * */
public class BuildregioninfoValidator {
	/**
	 * 对象验证 ,使用如 {@link org.springframework.validation.ValidationUtils}或
	 * {@link org.springframework.util.StringUtils}类进行验证
	 * <p>
	 * for example:ValidationUtils.rejectIfEmptyOrWhitespace(errors, "code",
	 * "required","required");
	 * </p>
	 * 
	 * @param buildregioninfo
	 *            建筑区域信息
	 * @param errors
	 *            错误结果集
	 * 
	 * */
	public void validate(Buildregioninfo buildregioninfo, Errors errors) {
		if (buildregioninfo.getBuildinfo() == null
				|| !StringUtils.hasLength(buildregioninfo.getBuildinfo()
						.getBuildId())) {
			errors.rejectValue("buildinfo", "required", "获取建筑ID失败，建筑ID为空");
		}
	}
}
