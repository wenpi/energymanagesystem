package com.managementsystem.energy.service.impl;

import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.CircuitinfoDao;
import com.managementsystem.energy.dao.MeteruseinfoDao;
import com.managementsystem.energy.domain.Circuitinfo;
import com.managementsystem.energy.domain.CircuitinfoTree;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.domain.Reportinfo;
import com.managementsystem.energy.service.CircuitinfoService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.ui.State;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.ui.easyui.TreeUtil;
import com.managementsystem.util.dao.Page;

@Service
public class CircuitinfoServiceImpl implements CircuitinfoService {

	@Autowired
	private CircuitinfoDao circuitinfoDao;
	
	@Autowired
	private MeteruseinfoService meteruseinfoService;
	
	@Transactional
	public void addCircuitinfoForEnergy(Circuitinfo circuitinfo) {
		if(circuitinfo.getCircuitinfo()==null || !StringUtils.hasLength(circuitinfo.getCircuitinfo().getCircuitId())) {
			circuitinfo.setCircuitinfo(null);
		}
		String mainKeyValue = "";
		if(StringUtils.hasLength(circuitinfo.getBuildinfo().getBuildId())) {
			String buildId = circuitinfo.getBuildinfo().getBuildId();
			mainKeyValue = buildId;
			Circuitinfo maxCircuitinfo = circuitinfoDao.getMaxCircuitinfoByBuildId(buildId);
			if(maxCircuitinfo==null) {
				mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,1);
			} else {
				long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxCircuitinfo.getCircuitId(),4);
				mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,maxNo+1);	
			}
		}
		circuitinfo.setCircuitId(mainKeyValue);
		circuitinfoDao.save(circuitinfo);
		circuitinfoDao.flush();
	}
	
	@Transactional
	public void addReportinfo(Reportinfo reportinfo) {
		circuitinfoDao.save(reportinfo);
		circuitinfoDao.flush();
	}

	@Transactional
	public void delCircuitinfoForWaterAndGas(String text, int year, int month) {
		circuitinfoDao.delCircuitinfoForWaterAndGas(text, year, month);
		circuitinfoDao.flush();
	}

	@Transactional
	public void addCircuitinfo(Circuitinfo circuitinfo) {
		if(circuitinfo.getCircuitinfo()==null || !StringUtils.hasLength(circuitinfo.getCircuitinfo().getCircuitId())) {
			circuitinfo.setCircuitinfo(null);
		}
		String mainKeyValue = "";
		if(StringUtils.hasLength(circuitinfo.getBuildinfo().getBuildId())) {
			String buildId = circuitinfo.getBuildinfo().getBuildId();
			mainKeyValue = buildId;
			Circuitinfo maxCircuitinfo = circuitinfoDao.getMaxCircuitinfoByBuildId(buildId);
			if(maxCircuitinfo==null) {
				mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,1);
			} else {
				long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxCircuitinfo.getCircuitId(),4);
				mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,maxNo+1);	
			}
		}
		circuitinfo.setCircuitId(mainKeyValue);
		circuitinfoDao.save(circuitinfo);
		circuitinfoDao.flush();
	}

	@Transactional
	public void updateCircuitinfo(Circuitinfo circuitinfo) {
		if(!StringUtils.hasLength(circuitinfo.getCircuitinfo().getCircuitId())) {
			circuitinfo.setCircuitinfo(null);
		}
		circuitinfoDao.update(circuitinfo);
		circuitinfoDao.flush();
	}

	@Transactional
	public void deleteCircuitinfo(String circuitId) {
		Circuitinfo circuitinfo = getCircuitinfo(circuitId);
		if(circuitinfo!=null) {
			circuitinfoDao.delete(circuitinfo);
			circuitinfoDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Circuitinfo getCircuitinfo(String circuitId) {
		return (Circuitinfo)circuitinfoDao.get(Circuitinfo.class, circuitId);
	}

	@Transactional(readOnly = true)
	public Set<Circuitinfo> getCircuitinfos(String buildId, int startResult,
			int maxRows) {
		return circuitinfoDao.getCircuitinfos(buildId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Circuitinfo> getCircuitinfos(String buildId) {
		return getCircuitinfos(buildId,0,-1);
	}
	
	@Transactional(readOnly = true)
	public Set<Circuitinfo> getCircuitinfosByText(String buildId, String text) {
		return getCircuitinfosByText(buildId, text, 0, -1);
	}
	
	@Transactional(readOnly = true)
	public Set<Circuitinfo> getCircuitinfosByText(String buildId, String text, int startResult,
			int maxRows) {
		return circuitinfoDao.getCircuitinfosByText(buildId, text, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Circuitinfo> getParentCircuitinfos(String buildId,
			int startResult, int maxRows) {		
		return circuitinfoDao.getParentCircuitinfos(buildId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Circuitinfo> getParentCircuitinfos(String buildId) {
		return getParentCircuitinfos(buildId,0,-1);
	}

	@Transactional(readOnly = true)
	public List<Tree> getCircuitComboTree(String buildId) {
		List<Tree> treelist = new ArrayList<Tree>();
		Set<Circuitinfo> circuitinfos = getCircuitinfos(buildId);
		for(Iterator<Circuitinfo> iterator=circuitinfos.iterator();iterator.hasNext();) {
			Circuitinfo circuitinfo = (Circuitinfo)iterator.next();
			Tree tree = transform(circuitinfo);
			treelist.add(tree);
		}	
		return TreeUtil.build(treelist);
	}

	private Tree transform(Circuitinfo circuitinfo) {
		Tree tree = new Tree();
		tree.setId(circuitinfo.getCircuitId());
		tree.setText(circuitinfo.getCircuitName());
		tree.setParentid(circuitinfo.get_parentId());

		return tree;
	}
	
	/**
	 * 填充form
	 * 
	 * @author zouzhixiang create 2013-12-05 
	 * @comments 创建于2013-12-05，用于在circuitinfo表增加字段后
	 * @param circuitinfo
	 * @return
	 */
	private CircuitinfoTree fillform(Circuitinfo circuitinfo) {
		CircuitinfoTree tree = new CircuitinfoTree();
		tree.setId(circuitinfo.getCircuitId());
		tree.setText(circuitinfo.getCircuitName()); // 对应tree控件上显示的名称
		tree.setParentid(circuitinfo.get_parentId());
		tree.setCode(circuitinfo.getCircuitCode()); // code == URL中的id
		tree.setName(circuitinfo.getCircuitText()); // name == URL中的name
		tree.setIspd(circuitinfo.getCircuitIspd()); // ispd == URL中的ispd
		return tree;
	}
	
	/**
	 * 根据buildid返回对应的支线结构tree
	 * @author zouzhixiang
	 */
	@Transactional(readOnly = true)
	public List<CircuitinfoTree> getCircuitTreeByBuildId(String buildId, String text) {
		List<CircuitinfoTree> treelist = new ArrayList<CircuitinfoTree>();
		Set<Circuitinfo> circuitinfos = getCircuitinfosByText(buildId, text);
		for(Iterator<Circuitinfo> iterator=circuitinfos.iterator();iterator.hasNext();) {
			Circuitinfo circuitinfo = (Circuitinfo)iterator.next();
			CircuitinfoTree tree = fillform(circuitinfo);
			treelist.add(tree);
		}	
		
		List<CircuitinfoTree> parents = new ArrayList<CircuitinfoTree>();
		List<CircuitinfoTree> childs = new ArrayList<CircuitinfoTree>();
		for (CircuitinfoTree entry : treelist) {
			if ("".equals(entry.getParentid())) {
				CircuitinfoTree result = entry;
				result.setChildren(new ArrayList<CircuitinfoTree>());
				parents.add(result);
			} else {
				childs.add(entry);
			}
		}
		
		buildTree(parents, childs);		
		
		return parents;
	}
	
	private static void buildTree(List<CircuitinfoTree> parents, List<CircuitinfoTree> others) {
		List<CircuitinfoTree> record = new ArrayList<CircuitinfoTree>();
		for (Iterator<CircuitinfoTree> iterator = parents.iterator(); iterator.hasNext();) {
			CircuitinfoTree vi = iterator.next();
			if (vi.getId() != null) {
				for (Iterator<CircuitinfoTree> childIt = others.iterator(); childIt
						.hasNext();) {
					CircuitinfoTree inVi = childIt.next();
					if (vi.getId().equals(inVi.getParentid())) {
						if (null == vi.getChildren()) {
							vi.setChildren(new ArrayList<CircuitinfoTree>());
						}
						vi.getChildren().add(inVi);
						record.add(inVi);
						childIt.remove();
					}
				}
			}
		}
		if (others.size() == 0) {
			return;
		} else {
			buildTree(record, others);
		}
	}
	
	@Transactional(readOnly = true)
	public List<Tree> getCircuitMeteruseinfosToComboTree(String buildId) {
		List<Tree> treelist = new ArrayList<Tree>();
		Set<Circuitinfo> circuitinfos = getCircuitinfos(buildId);
		for(Iterator<Circuitinfo> iterator=circuitinfos.iterator();iterator.hasNext();) {
			Circuitinfo circuitinfo = (Circuitinfo)iterator.next();
			Tree tree = transform(circuitinfo);
			List<Tree> list = getCircuitMeteruseinfos(circuitinfo.getCircuitId());
			tree.setChildren(list);
			treelist.add(tree);
		}	
		return TreeUtil.build(treelist);
	}

	/**
	 * 获取支路用表信息
	 * 
	 * @param circuitId 支路ID
	 * 
	 * @return 支路用表信息
	 * */
	private List<Tree> getCircuitMeteruseinfos(String circuitId) {
		 Set<Meteruseinfo> meteruseinfos = meteruseinfoService.getMeteruseinfosByCircuitId(circuitId,0, -1);
		 List<Tree> ret = new ArrayList<Tree>();
		 for(Iterator<Meteruseinfo> it = meteruseinfos.iterator();it.hasNext();) {
			 Meteruseinfo meteruseinfo = it.next();
			 Tree tree = new Tree();
			 tree.setId(meteruseinfo.getMeterId());
			 tree.setText(meteruseinfo.getMeterName());
			 tree.setParentid(circuitId);
			 tree.setIconCls("icon-meter");
			 tree.setState(State.open);
			 ret.add(tree);
		 }
		 return ret;
	}
	
	@Transactional(readOnly = true)
	public Page getCircuitinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return circuitinfoDao.getCircuitinfos(pageIndex, pageSize, mapParams);
	}
	
	@Transactional(readOnly = true)
	public List<Circuitinfo> getCircuitTimeList(String year, String text)
			throws Exception {
		return circuitinfoDao.getCircuitTimeList(year, text);
	}
	
	@Transactional(readOnly = true)
	public Map<String, Object> getCircuitDataList(String time, String text, String treeIds)
			throws Exception {
		return circuitinfoDao.getCircuitDataList(time, text, treeIds);
	}
	
}
