package com.managementsystem.energy.dao;

import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.util.dao.DaoSupport;

/**
 * 针对水表、气表专用的类
 * */
public interface OtherDao extends DaoSupport {
	
	/**
	 * 添加report数据
	 * @param reportinfo
	 */
	public void addReportinfo(Reportinfo reportinfo) throws Exception;

}
