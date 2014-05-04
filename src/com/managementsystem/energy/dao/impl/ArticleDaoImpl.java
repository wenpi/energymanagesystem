package com.managementsystem.energy.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.managementsystem.energy.dao.ArticleDao;
import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.util.dao.AbstractDaoSupport;
import com.managementsystem.util.dao.Page;

@Repository
public class ArticleDaoImpl extends AbstractDaoSupport implements ArticleDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] { Article.class, Articlecategory.class }));
	
	private final String GET_ARTICLECATEGORY="from Articlecategory  order by catId desc";
	
	private final String GET_ARTICLE="from Article  order by articleId desc";
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Page getArticles(int pageIndex, int pageSize,
			Map<String, Object> mapParams) throws DataAccessException {
		return pagedQuery(GET_ARTICLE ,pageIndex,pageSize,mapParams);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Articlecategory getArticlecategory(String catId)throws DataAccessException{
		Query query = createQuery("from Articlecategory where catId=? ",catId);
		Articlecategory  articlecategory = new Articlecategory();
		articlecategory = new ArrayList<Articlecategory>(query.list()).get(0);
		return  articlecategory;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Article getArticle(String articleId) throws DataAccessException{
		Query query = createQuery("from Article where articleId=? ",articleId);
		Article  article= new Article();
		article = new ArrayList<Article>(query.list()).get(0);
		return  article;
	}

	@Override
	public Page getArticlesByCategoryId(int pageIndex, int pageSize,
			String catId, Map<String, Object> mapParams)
			throws DataAccessException {

		return null;
	}

	@Override
	public Set<Articlecategory> getArticlecategories(int startResult,
			int maxRows) throws DataAccessException {

		return null;
	}

	@Override
	public Set<Articlecategory> getArticlecategoriesByModelid(int startResult,
			int maxRows, int modelId) throws DataAccessException {

		return null;
	}

	@Override
	public Set<Articlecategory> getArticlecategoriesByCattype(int startResult,
			int maxRows, int modelId, String catType)
			throws DataAccessException {

		return null;
	}

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Set<Class<?>> getTypes() {
		return dataTypes;
	}

	@Override
	public boolean canBeMerged(Object o) {
		return true;
	}
	
	@Override
	public List<Articlecategory>getArticlecategoryList(String catType) throws DataAccessException{
		Query query = createQuery("from Articlecategory where catType=? order by catId desc",catType);
		return  new ArrayList<Articlecategory>(query.list());
	}
	
	@Override
	public List<Articlecategory>getArticlecategoryList() throws DataAccessException{
		Query query = createQuery("from Articlecategory  order by catId desc");
		return  new ArrayList<Articlecategory>(query.list());
	}
	
	@Override
	public List<Article>getArt(String articleId) throws DataAccessException{
		Query query = createQuery("from Article where articleId=?  order by articleId desc",articleId);
		return  new ArrayList<Article>(query.list());
	}
	
	
	@Override
	public Page getPagedarticlecategory(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_ARTICLECATEGORY ,pageIndex,pageSize,mapParams);
	}
	
	@Override
	public Page getPagedarticle(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery("from Article order by articleId desc",pageIndex,pageSize,mapParams);
	}
	
	@Override
	public Page getArticleListByContent(int pageIndex, int pageSize,Map<String,Object> mapParams)
			throws DataAccessException {
		return pagedQuery(GET_ARTICLE ,pageIndex,pageSize,mapParams);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Articlecategory> findCategoryByParent() {
		Query query = createQuery("from Articlecategory where (articlecategory=null or articlecategory.catId='')");
		return new ArrayList<Articlecategory>(query.list());
	}
	
	@SuppressWarnings("unchecked")
	public Set<Articlecategory> findAllArticlecategorys(int startResult, int maxRows)
			throws DataAccessException {
		Query query = createQuery("from Articlecategory",startResult,maxRows);
		return new LinkedHashSet<Articlecategory>(query.list());
	}
}
