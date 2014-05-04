package com.managementsystem.energy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.EnergyitemdictDao;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.ui.easyui.TreeUtil;
import com.managementsystem.util.dao.Page;

@Service
public class EnergyitemdictServiceImpl implements EnergyitemdictService {

	@Autowired
	private EnergyitemdictDao energyitemdictDao;
	
	@Transactional
	public void addEnergyitemdict(Energyitemdict energyitemdict) {
		if(!StringUtils.hasLength(energyitemdict.getEnergyitemdict().getEnergyItemcode())){
			energyitemdict.setEnergyitemdict(null);
		}
		energyitemdictDao.save(energyitemdict);
	}

	@Transactional
	public void updateEnergyitemdict(Energyitemdict energyitemdict) {
		if(!StringUtils.hasLength(energyitemdict.getEnergyitemdict().getEnergyItemcode())){
			energyitemdict.setEnergyitemdict(null);
		}
		energyitemdictDao.update(energyitemdict);
	}

	@Transactional
	public void deleteEnergyitemdict(String energyItemcode) {
		Energyitemdict energyitemdict = getEnergyitemdict(energyItemcode);
		if(energyitemdict!=null)
			energyitemdictDao.delete(energyitemdict);
	}

	@Transactional(readOnly = true)
	public Energyitemdict getEnergyitemdict(String energyItemcode) {
		return (Energyitemdict)energyitemdictDao.get(Energyitemdict.class, energyItemcode);
	}

	@Transactional(readOnly = true)
	public Set<Energyitemdict> getEnergyitemdicts() {
		return getEnergyitemdicts(0,-1);
	}
	
	@Transactional(readOnly = true)
	public Set<Energyitemdict> getEnergyitemdicts(int startResult, int maxRows) {
		return energyitemdictDao.getEnergyitemdicts(startResult, maxRows);
	}
	
	@Transactional(readOnly = true)
	public Set<Energyitemdict> getEnergyitemdictsByType() {
		return energyitemdictDao.getEnergyitemdictsByType();
	}
	

	@Transactional(readOnly = true)
	public Set<Energyitemdict> getEnergyitemdictsAndChilds(String energyItemcode) {
		 Set<Energyitemdict> result = new HashSet<Energyitemdict>();
		Energyitemdict energyitemdict = getEnergyitemdict(energyItemcode);
		if(energyitemdict!=null) {
			result.add(energyitemdict);	
			Energyitemdict dict = null; 
			for(Iterator<Energyitemdict> it =  energyitemdict.getEnergyitemdicts().iterator();it.hasNext();) {
				dict = (Energyitemdict)it.next();
				result.add(dict);
				addChildEnergyitemdict(dict,result);
			}
		}
		return result;
	}
	
	/**
	 * 递归添加能耗分类分项到结果集合
	 * @param childs
	 * @param result 结果集合
	 * */
	private Energyitemdict dict = null; 
	private void addChildEnergyitemdict(Energyitemdict energyitemdict,Set<Energyitemdict> result) {
		if(energyitemdict!=null && energyitemdict.getEnergyitemdicts().size()>0) {
			for(Iterator<Energyitemdict> it =  energyitemdict.getEnergyitemdicts().iterator();it.hasNext();) {
				dict = (Energyitemdict)it.next();
				result.add(dict);
				if(dict.getEnergyitemdicts().size()>0) {
					addChildEnergyitemdict(dict,result);
				}
			}
		}		
	}
	

	@Transactional(readOnly = true)
	public Page getPagedEnergyitemdicts(int pageIndex, int pageSize) {
		return energyitemdictDao.getPagedEnergyitemdicts(pageIndex, pageSize);
	}

	@Transactional(readOnly = true)
	public List<Tree> getEnergyitemdictComboTree() {
		List<Tree> treelist = new ArrayList<Tree>();
		Set<Energyitemdict> energyitemdicts = getEnergyitemdicts();
		for(Iterator<Energyitemdict> iterator = energyitemdicts.iterator();iterator.hasNext();){
			Energyitemdict energyitemdict = (Energyitemdict)iterator.next();
			Tree tree = transform(energyitemdict);
			treelist.add(tree);
		}
		return TreeUtil.build(treelist);
	}
	
	private Tree transform(Energyitemdict energyitemdict) {
		Tree tree = new Tree();
		tree.setId(energyitemdict.getEnergyItemcode());
		tree.setText(energyitemdict.getEnergyItemname());
		tree.setParentid(energyitemdict.getEnergyitemdict()==null?"":energyitemdict.getEnergyitemdict().getEnergyItemcode());
		return tree;
	}
	
	@Transactional(readOnly = true)
	public Page getPagedEnergyitemdict(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return energyitemdictDao.getPagedEnergyitemdict(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public Page getPagedEnergyitemdictsByType(int pageIndex, int pageSize) {
		return energyitemdictDao.getPagedEnergyitemdictsByType(pageIndex, pageSize);
	}
}
