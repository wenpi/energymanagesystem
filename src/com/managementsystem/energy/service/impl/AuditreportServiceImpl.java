package com.managementsystem.energy.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.AuditreportDao;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.portlet.alarm.service.AlarmServiceImpl;
import com.managementsystem.energy.service.AuditreportService;
import com.managementsystem.util.dao.Page;

@Service
public class AuditreportServiceImpl implements AuditreportService {
	
	private final Log logger = LogFactory.getLog(AlarmServiceImpl.class);
	private Calendar calendar = Calendar.getInstance();

	@Autowired
	private AuditreportDao auditreportDao;

	@Transactional(readOnly = true)
	public Auditreport getAuditreportList(String portletId) {
		return (Auditreport)auditreportDao.getAuditreportList(portletId);
	}
	
	@Transactional(readOnly=true)
	public Auditreport getAuditreport(String reportid) {	
		return auditreportDao.getAuditreport(reportid);
	}
	
	@Transactional
	public void saveOrUpdate(Auditreport auditreport){
		if (auditreport.getReportid() != null && auditreport.getReportid() != "") {
			if (getAuditreport(auditreport.getReportid()) != null) {
				updateAuditreport(auditreport);
			}
		}
		else {
			saveAuditreport(auditreport);
		}
	}
	
	@Transactional
	public void saveAuditreport(Auditreport auditreport) {
		logger.info("AuditreportServiceImpl saveAuditreport");
		auditreport.setCreatedondate(calendar.getTime());
		int a = 1;
		BigDecimal b = new BigDecimal(a);
		auditreport.setVersion(b);
		auditreportDao.save(auditreport);
		auditreportDao.flush();
	}
	
	@Transactional
	public void updateAuditreport(Auditreport auditreport) {
		try{
		logger.info("AuditreportServiceImpl update");
		auditreport.setCreatedondate(calendar.getTime());
		auditreport.setStatusdate(calendar.getTime());
		auditreport.setModifiedondate(calendar.getTime());
		double a = 0.1;
		BigDecimal b = new BigDecimal(a);
		BigDecimal version = auditreport.getVersion();
		version = b.add(auditreport.getVersion());
		auditreport.setVersion(version);
		auditreportDao.store(auditreport);
		auditreportDao.flush();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional(readOnly = true)
	public Page auditreportList(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return auditreportDao.auditreportList(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public List<Auditreport>getAllAuditreportList(){
		return auditreportDao.getAllAuditreportList();
	}
	
	@Transactional(readOnly = true)
	public List<Auditreport>auditreportListByBuild(){
		return auditreportDao.auditreportListByBuild();
	}
	
	@SuppressWarnings("rawtypes")
	@Transactional
	public void delete(String reportid) {
		Auditreport auditreport = getAuditreport(reportid);
		if (auditreport != null) {
			auditreportDao.delete(auditreport);
			auditreportDao.flush();
		}
	}
}
