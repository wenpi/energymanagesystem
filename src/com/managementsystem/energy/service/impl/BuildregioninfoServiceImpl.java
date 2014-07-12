package com.managementsystem.energy.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.BuildregioninfoDao;
import com.managementsystem.energy.domain.Buildinfo;
import com.managementsystem.energy.domain.Buildregioninfo;
import com.managementsystem.energy.service.BuildregioninfoService;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.ui.easyui.TreeUtil;
import com.managementsystem.util.dao.Page;

@Service
public class BuildregioninfoServiceImpl implements BuildregioninfoService {

	@Autowired
	private BuildregioninfoDao buildregioninfoDao;
	
	@Transactional
	public void addBuildregioninfo(Buildregioninfo buildregioninfo) {
		String buildId = "";
		if(buildregioninfo.getBuildinfo()!=null) {
			buildId = buildregioninfo.getBuildinfo().getBuildId();
		}
		//判断区域所属建筑是否为空
		if(!StringUtils.hasLength(buildId)) {
			throw new NullPointerException("建筑ID为空");
		}
		
		if(buildregioninfo.getBuildregioninfo()!=null) {
		
			//设置上级区域为null
			if(!StringUtils.hasLength(buildregioninfo.getBuildregioninfo().getRegionId())) {
				buildregioninfo.setBuildregioninfo(null);
			}
		}
		//定义主建
		String mainKeyValue = buildId;
		Buildregioninfo maxBuildregioninfo = buildregioninfoDao.getMaxBuildregioninfoByBuildId(buildId);
		if(maxBuildregioninfo==null) {
			mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,1);
		} else {
			long maxNo = com.managementsystem.util.StringUtils.parseSubstring(maxBuildregioninfo.getRegionId(),4);
			mainKeyValue+=com.managementsystem.util.StringUtils.fillString(4,maxNo+1);	
		}
		buildregioninfo.setRegionId(mainKeyValue);
		buildregioninfoDao.save(buildregioninfo);
		buildregioninfoDao.flush();
	}

	@Transactional
	public void updateBuildregioninfo(Buildregioninfo buildregioninfo) {
		buildregioninfoDao.update(buildregioninfo);
		buildregioninfoDao.flush();
	}

	@Transactional
	public void saveOrUpdateBuildregioninfo(Buildregioninfo buildregioninfo) {
		String regionId = buildregioninfo.getRegionId();
		if(StringUtils.hasLength(regionId)) {
			Buildregioninfo existBuildregioninfo = getBuildregioninfo(regionId);
			if(existBuildregioninfo!=null) {
				existBuildregioninfo.setRegionName(buildregioninfo.getRegionName());
				existBuildregioninfo.setRegionImage(buildregioninfo.getRegionImage());
				existBuildregioninfo.setRegionRemark(buildregioninfo.getRegionRemark());
				String parentId = buildregioninfo.getBuildregioninfo().getRegionId();
				if(StringUtils.hasLength(parentId)) {
					existBuildregioninfo.setBuildregioninfo(buildregioninfo.getBuildregioninfo());
				}
				buildregioninfoDao.update(existBuildregioninfo);
				buildregioninfoDao.flush();
			} else {
				addBuildregioninfo(buildregioninfo);
			}			
		} else {
			addBuildregioninfo(buildregioninfo);
		}
		
	}

	@Transactional
	public void deleteBuildregioninfo(String regionId) {
		Buildregioninfo buildregioninfo = getBuildregioninfo(regionId);
		if(buildregioninfo!=null) {
			buildregioninfoDao.delete(buildregioninfo);
		}
	}

	@Transactional(readOnly = true)
	@Override
	public Buildregioninfo getBuildregioninfo(String regionId) {
		return (Buildregioninfo)buildregioninfoDao.get(Buildregioninfo.class, regionId);
	}

	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getBuildregioninfos(String buildId) {
		return getBuildregioninfos(buildId,0,-1);
	}

	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getBuildregioninfos(String buildId,
			int startResult, int maxRows) {
		return buildregioninfoDao.getBuildregioninfos(buildId, startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId) {	
		 Set<Buildregioninfo> parents = getParentBuildregioninfos(buildId,0,-1);
		 for(Buildregioninfo region : parents) {
			 Set<Buildregioninfo> childs = getBuildregioninfosByParentId(region.getRegionId());
			 region.setBuildregioninfos(childs);
		 }
		return parents;	
	}

	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getParentBuildregioninfos(String buildId,
			int startResult, int maxRows) {
		 Set<Buildregioninfo> parents = buildregioninfoDao.getParentBuildregioninfos(buildId, startResult, maxRows);
		 for(Buildregioninfo region : parents) {
			 Set<Buildregioninfo> childs = getBuildregioninfosByParentId(region.getRegionId());
			 region.setBuildregioninfos(childs);
		 }
		return parents;	
	}
	
	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getBuildregioninfosByParentId(String parentId) {
		return buildregioninfoDao.getBuildregioninfosByParentId(parentId);
	}
	
	@Transactional(readOnly = true)
	public Set<Buildregioninfo> getParentAndChilrenBuildregioninfo(
			String buildId) {	
		 Set<Buildregioninfo> parents = getParentBuildregioninfos(buildId);
		 for(Buildregioninfo region : parents) {
			 Set<Buildregioninfo> childs = getBuildregioninfosByParentId(region.getRegionId());
			 region.setBuildregioninfos(childs);
		 }
		return parents;
	}

	@Transactional(readOnly = true)
	public List<Tree> getBuildregionComboTree(String buildId) {
		List<Tree> treelist = new ArrayList<Tree>();
		Set<Buildregioninfo>  buildregioninfos= getBuildregioninfos(buildId);
		for(Iterator<Buildregioninfo> iterator = buildregioninfos.iterator();iterator.hasNext();) {
			Buildregioninfo buildregioninfo = (Buildregioninfo)iterator.next();
			Tree tree = transform(buildregioninfo);
			treelist.add(tree);
		} 
		return TreeUtil.build(treelist);
	}
	
	private Tree transform(Buildregioninfo buildregioninfo) {
		Tree tree = new Tree();
		tree.setId(buildregioninfo.getRegionId());
		tree.setText(buildregioninfo.getRegionName());
		tree.setParentid(buildregioninfo.get_parentId());
		return tree;
	}

	@Transactional(readOnly = true)
	public Page getBuildregioninfos(String buildId,int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return buildregioninfoDao.getBuildregioninfos(buildId,pageIndex, pageSize, mapParams);
	}

	@Transactional(readOnly = true)
	public List<Buildregioninfo> getAllBuildregioninfos() {
		return buildregioninfoDao.getAllBuildregioninfos();
	}
	
	@Transactional(readOnly = true)
	public List<Tree> getBuildregionComboTree(List<Buildinfo>buildinfosList){
		List<Tree> treelist = new ArrayList<Tree>();
		for(int i=0; i<buildinfosList.size();i++){
			Buildinfo	buildinfo = buildinfosList.get(i);
			treelist = transformBuildinfo(buildinfo,treelist);
		    }
		return TreeUtil.build(treelist);
		}
		
		
		public List<Tree> transformBuildinfo(Buildinfo buildinfo, List<Tree>treelist){
			Tree tree = new Tree();
			tree.setId(buildinfo.getBuildId());
			tree.setText(buildinfo.getBuildName());
			tree.setParentid("");
			treelist.add(tree);
			Set<Buildregioninfo>  buildregioninfos= getBuildregioninfos(buildinfo.getBuildId());
			   for(Iterator<Buildregioninfo> iterator = buildregioninfos.iterator();iterator.hasNext();) {
					Buildregioninfo buildregioninfo = (Buildregioninfo)iterator.next();
					Tree tree1 = new Tree();
					tree1.setId(buildregioninfo.getRegionId());
					tree1.setText(buildregioninfo.getRegionName());
					if((buildregioninfo.get_parentId()).equals("")||(buildregioninfo.get_parentId()).equals("null"))
					    tree1.setParentid(buildinfo.getBuildId());
					else 
						tree1.setParentid(buildregioninfo.get_parentId());
					treelist.add(tree1);
				  }
			return treelist;
		}
}
