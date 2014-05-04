package com.managementsystem.energy.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.managementsystem.energy.dao.ArticleDao;
import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Auditreport;
import com.managementsystem.energy.domain.CategoryGridTree;
import com.managementsystem.energy.portlet.alarm.service.AlarmServiceImpl;
import com.managementsystem.energy.service.ArticleService;
import com.managementsystem.ui.State;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.ui.easyui.TreeUtil;
import com.managementsystem.util.dao.Page;
import java.util.Calendar;

@Service
public class ArticleServiceImpl implements ArticleService {

	private final Log logger = LogFactory.getLog(ArticleServiceImpl.class);
	private Calendar calendar = Calendar.getInstance();

	@Autowired
	public ArticleDao articleDao;

	@Transactional
	public void saveOrUpdateArticlecategory(Articlecategory articlecategory) {
		if (articlecategory.getCatId() != null && articlecategory.getCatId() != "") {
			if (getArticlecategory(articlecategory.getCatId()) != null) {
				updateArticlecategory(articlecategory);
			}
		}
		else {
			saveArticlecategory(articlecategory);
		}
	}
	
	@Transactional
	public void updateArticlecategory(Articlecategory articlecategory) {
		try{
		logger.info("ArticleServiceImpl updateArticlecategory");
		articlecategory.setCreatedondate(calendar.getTime());
		articlecategory.setLastmodifiedondate(calendar.getTime());
		articleDao.store(articlecategory);
		articleDao.flush();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void saveArticlecategory(Articlecategory articlecategory) {
		logger.info("ArticleServiceImpl saveArticlecategory");
		articlecategory.setCreatedondate(calendar.getTime());
		articleDao.save(articlecategory);
		articleDao.flush();
	}
	
	
	@SuppressWarnings("rawtypes")
	@Transactional
	public void deleteArticlecategory(String catId) {
		Articlecategory articlecategory = getArticlecategory(catId);
		if (articlecategory != null) {
			articleDao.delete(articlecategory);
			articleDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Articlecategory getArticlecategory(String catId) {

		return articleDao.getArticlecategory(catId);
	}

	@Transactional(readOnly = true)
	public Set<Articlecategory> getArticlecategories() {

		return null;
	}

	@Transactional(readOnly = true)
	public Set<Articlecategory> getArticlecategoriesByModelid(int modelId) {

		return null;
	}

	@Transactional(readOnly = true)
	public Set<Articlecategory> getArticlecategoriesByCattype(int modelId,
			String catType) {

		return null;
	}

	@Transactional
	public void saveOrUpdateArticle(Article article) {
		if (article.getArticleId() != null && article.getArticleId() != "") {
			if (getArticle(article.getArticleId()) != null) {
				UpdateArticle(article);
			}
		}
		else {
			   saveArticle(article);
		}  
	}
	
	@Transactional
	public void UpdateArticle(Article article) {
		try{
		logger.info("ArticleServiceImpl updateArticle");
		article.setCreatedondate(calendar.getTime());
		article.setLastmodifiedondate(calendar.getTime());
		articleDao.store(article);
		articleDao.flush();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void saveArticle(Article article) {
		logger.info("ArticleServiceImpl saveArticle");
		article.setCreatedondate(calendar.getTime());
		articleDao.save(article);
		articleDao.flush();
	}
	
	@SuppressWarnings("rawtypes")
	@Transactional
	public void deleteArticle(String articleId) {
		Article article = getArticle(articleId);
		if (article != null) {
			articleDao.delete(article);
			articleDao.flush();
		}
	}

	@Transactional(readOnly = true)
	public Article getArticle(String articleId) {
   
		return articleDao.getArticle(articleId);
	}

	@Transactional(readOnly = true)
	public Page getArticles(int pageIndex, int pageSize,
			Map<String, Object> mapParams) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapParams.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapParams.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return articleDao.getArticles(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public List<Articlecategory> getArticlecategoryList() {
		return articleDao.getArticlecategoryList();
	}
	
	@Transactional(readOnly = true)
	public List<Articlecategory> getArticlecategoryList(String catType) {
		return articleDao.getArticlecategoryList(catType);
	}
	
	@Transactional(readOnly = true)
	public List<Article> getArt(String articleId) {
		return articleDao.getArt(articleId);
	}

	@Transactional(readOnly = true)
	public Page getArticlesByCategoryId(int pageIndex, int pageSize,
			String catId, Map<String, Object> mapParams) {

		return null;
	}
	
	@Transactional(readOnly = true)
	public Page getPagedarticlecategory(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return articleDao.getPagedarticlecategory(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public Page getPagedarticle(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return articleDao.getPagedarticle(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public Page getArticleListByContent(int pageIndex, int pageSize,
			Map<String, Object> mapCondition) {
		Map<String, Object> map = new HashMap<String,Object>();
		for(Iterator<String> iterator = mapCondition.keySet().iterator();iterator.hasNext();) {
			String key = iterator.next();
			Object value = mapCondition.get(key);
			if(StringUtils.hasLength(value.toString())) {
				map.put(key, value);
			}
		}
		return articleDao.getArticleListByContent(pageIndex, pageSize, map);
	}
	
	@Transactional(readOnly = true)
	public List<Tree> getArticlecategoryTree() {
		List<Articlecategory> parentCategorys = articleDao.findCategoryByParent();
		List list = new ArrayList();
		for (Articlecategory articlecategory : parentCategorys) {
			CategoryGridTree tree = new CategoryGridTree();
			tree.setCatId(articlecategory.getCatId());
			tree.setCatName(articlecategory.getCatName());
			if (articlecategory.getArticlecategories() != null) {
				tree.setChildren(new ArrayList<Articlecategory>(articlecategory.getArticlecategories()));
			}
			list.add(tree);
		}
		return list;
	}
	
	
	/**
	 * 返回组织机构ComboTree Data
	 * 
	 * */
	@Transactional(readOnly = true)
	public List<Tree> getCategoryTree() {
		List<Tree> treelist = new ArrayList<Tree>();
		for (Articlecategory articlecategory : getArticlecategorys()) {
			Tree tree = transform(articlecategory);
			treelist.add(tree);
		}
		return TreeUtil.build(treelist);
	}
	
	private Tree transform(Articlecategory articlecategory) {
		Tree tree = new Tree();
		tree.setId(articlecategory.getCatId());
		tree.setText(articlecategory.getCatName());
		tree.setParentid(articlecategory.getArticlecategory()!=null?articlecategory.getArticlecategory().getCatId():"");
		tree.setIconCls(articlecategory.getCatType());
		tree.setState(State.open);
		return tree;
	}
	
	@Transactional(readOnly = true)
	public List<Articlecategory> getArticlecategorys() {
		return getArticlecategorys(-1, -1);
	}
	
	@Transactional(readOnly = true)
	public List<Articlecategory> getArticlecategorys(Integer startResult, Integer maxRows) {
		return new ArrayList<Articlecategory>(articleDao.findAllArticlecategorys(startResult,
				maxRows));
	}
}
