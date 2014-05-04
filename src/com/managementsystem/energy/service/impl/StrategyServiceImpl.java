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

import com.managementsystem.energy.dao.StrategyDao;
import com.managementsystem.energy.domain.Strategy;
import com.managementsystem.energy.domain.Strategydetail;
import com.managementsystem.energy.domain.Strategydetailparam;
import com.managementsystem.energy.service.StrategyService;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

@Service
public class StrategyServiceImpl implements StrategyService {
	
	@Autowired
	private StrategyDao strategyDao;
	
	@Transactional
	public void addStrategy(Strategy strategy) {
		strategyDao.save(strategy);
		strategyDao.flush();
	}

	@Transactional
	public void updateStrategy(Strategy strategy) {
		strategyDao.update(strategy);
	}

	@Transactional
	public void saveOrUpdate(Strategy strategy) {
		if(strategy.getStrategyid().length()>0) {
			Strategy existStrategy = getStrategy(strategy.getStrategyid());
			if(existStrategy==null) {
				addStrategy(strategy);
			} else {
				strategyDao.merge(strategy);
			}		
		} else {
			addStrategy(strategy);
		}
	}

	@Transactional
	public void deleteStrategy(String strategyid) {
		Strategy strategy = getStrategy(strategyid);
		if(strategy!=null) {
			strategyDao.delete(strategy);
		}
	}

	@Transactional(readOnly = true)
	public Strategy getStrategy(String strategyid) {
		return (Strategy)strategyDao.get(Strategy.class, strategyid);
	}

	@Transactional(readOnly = true)
	public Page getStrategies(String buildId, int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		return strategyDao.getStrategies(buildId, pageIndex, pageSize, mapParams);
	}

	@Transactional(readOnly = true)
	public Set<Strategy> getStrategies(String buildId) {
		return strategyDao.getStrategies(buildId, -1, -1);
	}

	@Transactional(readOnly = true)
	public List<Strategy> getParentStrategies(String buildId) {
		return new ArrayList<Strategy>(strategyDao.getParentStrategies(buildId, -1, -1));
	}

	@Transactional(readOnly = true)
	public List<Tree> getStrategiesComboTree(String buildId) {
		List<Tree> treelist = new ArrayList<Tree>();
		 Set<Strategy> strategies = getStrategies(buildId);
		for(Iterator<Strategy> iterator = strategies.iterator();iterator.hasNext();) {
			Strategy strategy = iterator.next();
			Tree tree = transform(strategy);
			treelist.add(tree);
		}
		return treelist;
	}

	private Tree transform(Strategy strategy) {
		Tree tree = new Tree();
		tree.setId(strategy.getStrategyid());
		tree.setText(strategy.getStrategyname());
		tree.setParentid(strategy.get_parentId());
		return tree;
	}
	
	
	
	@Transactional
	public void addStrategydetail(Strategydetail strategydetail) {
		strategyDao.save(strategydetail);
		if(strategydetail.getStrategydetailparams().size()>0) {
			Set<Strategydetailparam> detailparams = strategydetail.getStrategydetailparams();
			for(Strategydetailparam strategydetailparam : detailparams) {
				strategydetailparam.setStrategydetail(strategydetail);
				if(StringUtils.hasLength(strategydetailparam.getParamname())) {
					strategyDao.save(strategydetailparam);
				}
			}
		}
		strategyDao.flush();
	}

	@Transactional
	public void updateStrategydetail(Strategydetail strategydetail) {
		strategyDao.update(strategydetail);
		if(strategydetail.getStrategydetailparams().size()>0) {
			Set<Strategydetailparam> detailparams = strategydetail.getStrategydetailparams();
			for(Strategydetailparam strategydetailparam : detailparams) {
				strategydetailparam.setStrategydetail(strategydetail);
				saveOrUpdate(strategydetailparam);
			}
		}
		strategyDao.flush();
	}

	@Transactional
	public void saveOrUpdate(Strategydetail strategydetail) {
		if(strategydetail.getDetailid().length()>0) {
			//Strategydetail existStrategydetail = getStrategydetail(strategydetail.getDetailid());
			//if(existStrategydetail==null) {
			//	addStrategydetail(strategydetail);
			//} else {
				updateStrategydetail(strategydetail);
			//}
		} else {
			addStrategydetail(strategydetail);
		}
	}

	@Transactional
	public void deleteStrategydetail(String detailid) {
		Strategydetail strategydetail = getStrategydetail(detailid);
		if(strategydetail!=null) {
			for(Strategydetailparam param : strategydetail.getStrategydetailparams()) {
				strategyDao.delete(param);
			}
			strategyDao.delete(strategydetail);
		}
	}

	@Transactional
	public Strategydetail getStrategydetail(String detailid) {
		return (Strategydetail)strategyDao.get(Strategydetail.class, detailid);
	}

	@Transactional(readOnly = true)
	public List<Strategydetail> getStrategydetails(String strategyid) {
		return new ArrayList<Strategydetail>(strategyDao.getStrategydetails(strategyid));
	}

	@Transactional
	public void addStrategydetailparam(Strategydetailparam strategydetailparam) {
		if(StringUtils.hasLength(strategydetailparam.getParamname())) {
			strategyDao.save(strategydetailparam);
		}
	}

	@Transactional
	public void updateStrategydetailparam(
			Strategydetailparam strategydetailparam) {
		if(StringUtils.hasLength(strategydetailparam.getParamname())) {
			strategyDao.update(strategydetailparam);
		}
	}

	@Transactional
	public void saveOrUpdate(Strategydetailparam strategydetailparam) {
		if(strategydetailparam.getParamid().length()>0) {
			strategyDao.update(strategydetailparam);
		} else {
			addStrategydetailparam(strategydetailparam);
		}

	}

	@Transactional
	public void deleteStrategydetailparam(String paramid) {
		Strategydetailparam strategydetailparam = getStrategydetailparam(paramid);
		if(strategydetailparam!=null) {
			strategyDao.delete(strategydetailparam);
			strategyDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Strategydetailparam getStrategydetailparam(String paramid) {
		return (Strategydetailparam)strategyDao.get(Strategydetailparam.class, paramid);
	}

	@Transactional(readOnly = true)
	public List<Strategydetailparam> getStrategydetailparams(String detailid,
			Integer paramtypeid) {
		return new ArrayList<Strategydetailparam>(strategyDao.getStrategydetailparams(detailid, paramtypeid));
	}

	@Transactional(readOnly = true)
	public List<Strategydetailparam> getStrategydetailparamsBydetailid(String detailid) {
		return new ArrayList<Strategydetailparam>(strategyDao.getStrategydetailparamsBydetailid(detailid));
	}

	@Transactional(readOnly = true)
	public void clearBlank(List<Strategydetailparam> detialparamslist) {
		if(detialparamslist.size()==0)
			return;
		for(Strategydetailparam detailparam : detialparamslist)  {
			if(!StringUtils.hasLength(detailparam.getParamname()) || detailparam.getParamtypeid()==null) {
				detialparamslist.remove(detailparam);
			}
		}
	}

	
}
