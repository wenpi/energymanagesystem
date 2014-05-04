package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

public interface AuditreportDao extends DaoSupport {

	/**
	 * 获取指定建筑的所有报告
	 * 
	 * @param buildId
	 *            建筑ID
	 * @param startResult
	 *            开始行号
	 * @param maxRows
	 *            结束行
	 * */
	public Set<Auditreport> getAuditreportsByBuildid(String buildId,
			int startResult, int maxRows) throws DataAccessException;

	/**
	 * 获取指定用户生成的报告
	 * 
	 * @param userid
	 *            用户ID
	 * @param startResult
	 *            开始行号
	 * @param maxRows
	 *            结束行
	 * */
	public Set<Auditreport> getAuditreportsByUserid(String userid,
			int startResult, int maxRows) throws DataAccessException;
	
	public Auditreport getAuditreportList(String portletId) throws DataAccessException;
	
	public Auditreport getAuditreport(String reportid) throws DataAccessException;
	
	public Page auditreportList(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	public List<Auditreport>getAllAuditreportList() throws DataAccessException;
	
	public List<Auditreport>auditreportListByBuild() throws DataAccessException;

}
