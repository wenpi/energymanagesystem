package com.managementsystem.energy.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;

import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.util.dao.Page;
/**
 * 行政区划信息操作服务接口
 * 
 * @author CHENPING 2012-06-04
 * */
public interface AuditreportService {
	
	public Auditreport getAuditreportList(String portletId);
	
	public void saveOrUpdate(Auditreport auditreport);
	
	public Page auditreportList(int pageIndex,int pageSize,Map<String,Object> mapCondition);
	
	public List<Auditreport>getAllAuditreportList();
	
	public List<Auditreport>auditreportListByBuild();
	
	public Auditreport getAuditreport(String reportid);
	
	public void delete(String reportid);
	
}
