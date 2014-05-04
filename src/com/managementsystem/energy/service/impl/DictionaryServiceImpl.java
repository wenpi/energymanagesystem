package com.managementsystem.energy.service.impl;

import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.DictionaryDao;
import com.managementsystem.energy.domain.Dictgroup;
import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.service.DictionaryService;

@Service
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired
	private DictionaryDao dictionaryDao;
	
	@Transactional
	public void addDictgroup(Dictgroup dictgroup) {
		dictionaryDao.save(dictgroup);
	}

	@Transactional
	public void updateDictgroup(Dictgroup dictgroup) {
		dictionaryDao.update(dictgroup);
	}

	@Transactional
	@CacheEvict(value="dictionary",key="#dictitem.dictgroup.groupCode + 'dictgroup'")
	public void deleteDictgroup(String groupCode) {
		Dictgroup dictgroup = getDictgroup(groupCode);
		if(dictgroup!=null)
			dictionaryDao.delete(dictgroup);
	}

	@Transactional(readOnly = true)
	public Dictgroup getDictgroup(String groupCode) {
		return (Dictgroup)dictionaryDao.get(Dictgroup.class, groupCode);
	}

	@Transactional
	@CacheEvict(value="dictionary",key="#dictitem.dictgroup.groupCode + 'dictgroup'")
	public void addDictitem(Dictitem dictitem) {
		dictionaryDao.save(dictitem);
	}

	@Transactional
	@CacheEvict(value="dictionary",key="#dictitem.dictgroup.groupCode + 'dictgroup'")
	public void updateDictitem(Dictitem dictitem) {
		dictionaryDao.update(dictitem);
	}

	@Transactional
	public void deleteDictitem(String itemid) {
		Dictitem dictitem = getDictitem(itemid);
		if(dictitem!=null)
			dictionaryDao.delete(dictitem);
	}


	@Transactional(readOnly = true)
	public Dictitem getDictitem(String itemid) {
		return (Dictitem)dictionaryDao.get(Dictitem.class, itemid);
	}

	@Transactional(readOnly = true)
	public Set<Dictgroup> getDictgroups() {
		return dictionaryDao.getDictgroups();
	}

	@Transactional(readOnly = true)
	@Cacheable(value="dictionary",key="#groupCode + 'dictgroup'")  
	public Set<Dictitem> getDictitemBygroupCode(String groupCode) {
		return dictionaryDao.getDictitemBygroupCode(groupCode);
	}

	@Transactional(readOnly = true)
	public Dictitem getDictitemByItemcode(String groupCode, String itemCode) {
		if(!StringUtils.hasLength(groupCode)) {
			throw new NullPointerException("请填写字典分组代码");
		}
		if(!StringUtils.hasLength(itemCode)) {
			throw new NullPointerException("请填写字典项代码");
		}
		Set<Dictitem> dictitems = dictionaryDao.getDictitemBygroupCode(groupCode);
		for(Iterator<Dictitem> it = dictitems.iterator();it.hasNext();) {
			Dictitem item = it.next();
			if(itemCode.equals(item.getItemCode())) {
				return item;
			}
		} 
		return null;
	}

	@Transactional(readOnly = true)
	public Set<Dictitem> getAllDictitems() {
		return dictionaryDao.getAllDictitems();
	}

	
}
