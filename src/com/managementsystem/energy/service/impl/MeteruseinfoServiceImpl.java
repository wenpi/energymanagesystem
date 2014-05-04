package com.managementsystem.energy.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.MeteruseinfoDao;
import com.managementsystem.energy.domain.Energyitemdict;
import com.managementsystem.energy.domain.Energyitemresult;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.MeteruseattributeId;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.service.EnergyitemdictService;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

@Service
public class MeteruseinfoServiceImpl implements MeteruseinfoService {

	@Autowired
	private MeteruseinfoDao meteruseinfoDao;
	
	@Autowired
	private EnergyitemdictService energyitemdictService;

	@Transactional
	public void addMeteruseinfo(Meteruseinfo meteruseinfo) throws Exception {
		String meterId = "";
		if(meteruseinfo.getCircuitinfo()==null || meteruseinfo.getCircuitinfo().getBuildinfo()==null) {
			throw new Exception("Circuitinfo is null or Circuitinfo.Buildinfo is null");
		}
			
		meterId = meteruseinfo.getCircuitinfo().getBuildinfo().getBuildId();
		Meteruseinfo maxMeteruseinfo = meteruseinfoDao
				.getMaxMeteruseinfoForMeterId(meteruseinfo);
		if (maxMeteruseinfo == null) {
			meterId += com.managementsystem.util.StringUtils.fillString(4, 1);
		} else {
			long maxNo = com.managementsystem.util.StringUtils.parseSubstring(
					maxMeteruseinfo.getMeterId(), 4);
			meterId += com.managementsystem.util.StringUtils.fillString(4,
					maxNo + 1);
		}
		meteruseinfo.setMeterId(meterId);
		meteruseinfoDao.save(meteruseinfo);
		meteruseinfoDao.flush();
	}

	@Transactional
	public void updateMeteruseinfo(Meteruseinfo meteruseinfo) throws Exception {
		meteruseinfoDao.update(meteruseinfo);
		meteruseinfoDao.flush();
	}

	@Transactional
	public void saveOrUpdateMeteruseinfo(Meteruseinfo meteruseinfo) throws Exception {
		if (StringUtils.hasLength(meteruseinfo.getMeterId())) {
			Meteruseinfo existMeteruseinfo = getMeteruseinfo(meteruseinfo
					.getMeterId());
			if (existMeteruseinfo != null) {
				meteruseinfoDao.merge(meteruseinfo);
				meteruseinfoDao.flush();
			} else {
				addMeteruseinfo(meteruseinfo);
			}
		} else {
			addMeteruseinfo(meteruseinfo);
		}
	}

	@Transactional
	public void deleteMeteruseinfo(String meterId) {
		Meteruseinfo meteruseinfo = getMeteruseinfo(meterId);
		if (meteruseinfo != null)
			meteruseinfoDao.delete(meteruseinfo);
	}

	@Transactional(readOnly = true)
	public Meteruseinfo getMeteruseinfo(String meterId) {
		return (Meteruseinfo) meteruseinfoDao.get(Meteruseinfo.class, meterId);
	}

	@Transactional
	public void addMeteruseattribute(Meteruseattribute meteruseattribute) {
		meteruseinfoDao.save(meteruseattribute);
		meteruseinfoDao.flush();
	}

	@Transactional
	public void updateMeteruseattribute(Meteruseattribute meteruseattribute) {
		meteruseinfoDao.update(meteruseattribute);
		meteruseinfoDao.flush();
	}


	
	@Transactional
	public void updateMeteruseattributeDatarevise(
			Meteruseattribute meteruseattribute) {
		
		String meterId = meteruseattribute.getId().getMeterId();
		String meterattrName = meteruseattribute.getId().getMeterattrName();
		if (StringUtils.hasLength(meterId)
				&& StringUtils.hasLength(meterattrName)) {
			
			Meteruseattribute existMeteruseattribute = getMeteruseattribute(
					meterattrName, meterId);
			if (existMeteruseattribute != null) {
				
				BigDecimal meterattrCurrentvalue = meteruseattribute.getMeterattrCurrentvalue();
				BigDecimal meterattrReadvalue = meteruseattribute.getMeterattrReadvalue();
				BigDecimal meterattrDiffvalue = null;
				
				existMeteruseattribute.setMeterattrCurrentvalue(meterattrCurrentvalue);
				existMeteruseattribute.setMeterattrReadvalue(meterattrReadvalue);

				if (meterattrCurrentvalue != null && meterattrReadvalue != null) {
					meterattrDiffvalue = meterattrCurrentvalue.subtract(meterattrReadvalue);
				}

				existMeteruseattribute.setMeterattrDiffvalue(meterattrDiffvalue);
				existMeteruseattribute.setMeterattrUpdateddate(Calendar.getInstance().getTime());

				meteruseinfoDao.update(existMeteruseattribute);
			}
		}
		
	}

	@Transactional
	public void saveOrUpdateMeteruseattribute(
			Meteruseattribute meteruseattribute) {
		String meterId = meteruseattribute.getId().getMeterId();
		String meterattrName = meteruseattribute.getId().getMeterattrName();
		if (StringUtils.hasLength(meterId)
				&& StringUtils.hasLength(meterattrName)) {
			Meteruseattribute existMeteruseattribute = getMeteruseattribute(
					meterattrName, meterId);
			if(existMeteruseattribute!=null) {
				existMeteruseattribute.setMeterattrType(meteruseattribute.getMeterattrType());
				existMeteruseattribute.setMeterattrValue(meteruseattribute.getMeterattrValue());
				existMeteruseattribute.setMeterattrDesc(meteruseattribute.getMeterattrDesc());
				
				
				BigDecimal meterattrCurrentvalue = meteruseattribute.getMeterattrCurrentvalue();
				BigDecimal meterattrReadvalue = meteruseattribute.getMeterattrReadvalue();
				BigDecimal meterattrDiffvalue = null;
				
				existMeteruseattribute.setMeterattrCurrentvalue(meterattrCurrentvalue);
				existMeteruseattribute.setMeterattrReadvalue(meterattrReadvalue);

				if (meterattrCurrentvalue != null && meterattrReadvalue != null) {
					meterattrDiffvalue = meterattrCurrentvalue.subtract(meterattrReadvalue);
				}

				existMeteruseattribute.setMeterattrDiffvalue(meterattrDiffvalue);
				existMeteruseattribute.setMeterattrUpdateddate(Calendar.getInstance().getTime());

				meteruseinfoDao.merge(existMeteruseattribute);
				meteruseinfoDao.flush();
			} else {
				addMeteruseattribute(meteruseattribute);
			}
		} else {
			addMeteruseattribute(meteruseattribute);
		}

	}

	@Transactional
	public void deleteMeteruseattribute(String meterattrName, String meterId) {
		Meteruseattribute meteruseattribute = getMeteruseattribute(
				meterattrName, meterId);
		if (meteruseattribute != null)
			meteruseinfoDao.delete(meteruseattribute);

	}

	@Transactional(readOnly = true)
	public Meteruseattribute getMeteruseattribute(String meterattrName,
			String meterId) {
		MeteruseattributeId id = new MeteruseattributeId();
		id.setMeterattrName(meterattrName);
		id.setMeterId(meterId);
		return (Meteruseattribute) meteruseinfoDao.get(Meteruseattribute.class,
				id);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfos(int startResult, int maxRows) {
		return meteruseinfoDao.getMeteruseinfos(startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfos() {
		return getMeteruseinfos(0, -1);
	}

	@Transactional(readOnly = true)
	@Override
	public Page getMeteruseinfos(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return meteruseinfoDao.getMeteruseinfos(pageIndex, pageSize, mapParams);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId,
			int startResult, int maxRows) {
		return meteruseinfoDao.getMeteruseinfosByCircuitId(circuitId,
				startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByCircuitId(String circuitId) {
		return getMeteruseinfosByCircuitId(circuitId, 0, -1);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId,
			int startResult, int maxRows) {
		return meteruseinfoDao.getMeteruseinfosByRegionId(regionId,
				startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByRegionId(String regionId) {
		return getMeteruseinfosByRegionId(regionId, 0, -1);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(
			String meterProductid, int startResult, int maxRows) {
		return meteruseinfoDao.getMeteruseinfosByMeterProductid(meterProductid,
				startResult, maxRows);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseinfo> getMeteruseinfosByMeterProductid(
			String meterProductid) {
		return getMeteruseinfosByMeterProductid(meterProductid, 0, -1);
	}

	@Transactional(readOnly = true)
	public Set<Meteruseattribute> getMeteruseattributeByMeterId(String meterId) {
		return meteruseinfoDao.getMeteruseattributeByMeterId(meterId);
	}
	
	@Transactional(readOnly = true)
	public List<Meteruseattribute> getMeteruseattributesByMeterId(
			String meterId, int type) {
		Set<Meteruseattribute> meteruseattributes = getMeteruseattributeByMeterId(meterId);
		List<Meteruseattribute> attrs = new ArrayList<Meteruseattribute>();
		for (Iterator<Meteruseattribute> iterator = meteruseattributes
				.iterator(); iterator.hasNext();) {
			Meteruseattribute attr = (Meteruseattribute) iterator.next();
			if (attr.getMeterattrType().intValue() == type)
				attrs.add(attr);
		}
		return attrs;
	}

	@Transactional(readOnly = true)
	public List<Meteruseattribute> getMeteruseattributeByCircuitId(
			String circuitId) {
		List<Meteruseattribute> result = new ArrayList<Meteruseattribute>();
		Set<Meteruseinfo> meteruseinfos = meteruseinfoDao.getMeteruseinfosByCircuitId(circuitId, 0, -1);
		for(Iterator<Meteruseinfo> it = meteruseinfos.iterator();it.hasNext();) {
			Meteruseinfo meteruseinfo = (Meteruseinfo)it.next();
			List<Meteruseattribute> attrs = getMeteruseattributesByMeterId(meteruseinfo.getMeterId(),0);
			if(attrs!=null){
				result.addAll(attrs);
			}
		}
		return result;
	}

	@Transactional(readOnly = true)
	public String getMeteruseattributeValueByMeterId(String meterId, int type) {
		Set<String> attrIds = getMeteruseattrValuesByMeterId(meterId, type);
		return attrIds.toString();
	}

	@Transactional(readOnly = true)
	public String getMeteruseattributeValueByMeterId(String meterId) {
		return getMeteruseattributeValueByMeterId(meterId, 0);
	}

	@Transactional(readOnly = true)
	public String[] getMeteruseattributeValuesByMeterId(String meterId, int type) {
		Set<String> attrIds = getMeteruseattrValuesByMeterId(meterId, type);
		return (String[]) attrIds.toArray();
	}

	private Set<String> getMeteruseattrValuesByMeterId(String meterId, int type) {
		Set<Meteruseattribute> meteruseattributes = getMeteruseattributeByMeterId(meterId);
		Set<String> attrIds = new LinkedHashSet<String>();
		for (Iterator<Meteruseattribute> iterator = meteruseattributes
				.iterator(); iterator.hasNext();) {
			Meteruseattribute attr = (Meteruseattribute) iterator.next();
			if (attr.getMeterattrType().intValue() == type)
				attrIds.add(attr.getMeterattrValue());
		}
		return attrIds;
	}

	@Transactional(readOnly = true)
	public List<Tree> getMeteruseinfoAttributesToTree(String buildId,
			int attrType) {
		Set<Meteruseinfo> meteruseinfos = meteruseinfoDao.getMeteruseinfosByMeterBuildid(buildId, 0, -1);
		List<Tree> list = new ArrayList<Tree> ();
		for(Iterator<Meteruseinfo> it = meteruseinfos.iterator();it.hasNext();) {
			Meteruseinfo meteruseinfo = (Meteruseinfo)it.next();
			Tree tree = new Tree();
			tree.setId(meteruseinfo.getMeterId());
			tree.setText(meteruseinfo.getMeterName());
			
			Set<Meteruseattribute> attrs = getMeteruseattributeByMeterId(meteruseinfo.getMeterId());
			
			
			
			list.add(tree);
		}
		
		return list;
	}

	
	
	@Transactional(readOnly = true)
	public List<Meteruseattribute> getMeteruseattributesByEnergyitemcode(
			String buildId, String energyitemCode) {
		
		Set<Meteruseattribute> attributes = meteruseinfoDao.getMeteruseattributesByBuildId(buildId);
		//如果没有指定分类分项代码,则返回指定建筑的所有设备项
		if(!StringUtils.hasLength(energyitemCode)) {
			return new ArrayList<Meteruseattribute>(attributes);
		}
		//指定的分类分项代码如果具有下级分项,则取包括下级分项在内的所有数据
		Set<Energyitemdict> energyitemdicts = energyitemdictService.getEnergyitemdictsAndChilds(energyitemCode);
		
		Meteruseattribute attribute = null;
		List<Meteruseattribute> returnResult = new ArrayList<Meteruseattribute>();
		//迭代所有属性
		for(Iterator<Meteruseattribute> it = attributes.iterator();it.hasNext();) {
			//获取当前属性值对应的仪表信息并获取仪表所属能耗分类分项列表
			attribute = (Meteruseattribute)it.next();
			for(Iterator<Energyitemresult> itresult = attribute.getMeteruseinfo().getEnergyitemresults().iterator();itresult.hasNext();) {
				if(energyitemdicts.contains(((Energyitemresult)itresult.next()).getEnergyitemdict())) {
					returnResult.add(attribute);
				}
			}
		}
		return returnResult;
	}

	@Transactional(readOnly = true)
	public String getMeteruseattributesByEnergyitemcodeToString(String buildId,
			String energyitemCode) {
		List<Meteruseattribute> attributelist = getMeteruseattributesByEnergyitemcode(buildId,energyitemCode);
		return getMeteruseattributesByEnergyitemcodeToString(attributelist);
	}

	@Transactional(readOnly = true)
	public String getMeteruseattributesByEnergyitemcodeToString(
			List<Meteruseattribute> listMeteruseattribute) {
		StringBuilder sb = new StringBuilder();
		for(Meteruseattribute attribute : listMeteruseattribute) {
			if(sb.length()>0)
				sb.append(",");
			sb.append(attribute.getMeterattrValue());
		}
		return sb.toString();
	}

	

}
