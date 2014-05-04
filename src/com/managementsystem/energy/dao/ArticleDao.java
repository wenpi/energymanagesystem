package com.managementsystem.energy.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.util.dao.DaoSupport;
import com.managementsystem.util.dao.Page;

public interface ArticleDao extends DaoSupport {

	/**
	 * 获取文章分页列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示数
	 * @param mapParams 查询map
	 * @return 文章分页列表
	 * */
	public Page getArticles(int pageIndex, int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	/**
	 * 获取指定类别ID的文章分页列表
	 * @param pageIndex 当前页
	 * @param pageSize  每页显示数
	 * @param catId 	文章类别ID
	 * @param mapParams 查询map
	 * @return 文章分页列表
	 * */
	public Page getArticlesByCategoryId(int pageIndex, int pageSize,String catId,Map<String,Object> mapParams) throws DataAccessException;
	
	
	/**
	 * 获取文章类别列表
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategories(int startResult, int maxRows) throws DataAccessException;
	
	
	/**
	 * 获取文章类别列表
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * @param modelId   模型ID
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategoriesByModelid(int startResult, int maxRows,int modelId) throws DataAccessException;
	
	/**
	 * 获取文章类别列表
	 * @param startResult 开始行号 
	 * @param maxRows	显示行数	 -1为显示全部
	 * @param modelId   模型ID
	 * @param catType   类别类型 ,例如:能源领域、能源业务、国别分类
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategoriesByCattype(int startResult, int maxRows,int modelId,String catType) throws DataAccessException;
	
	public List<Articlecategory>getArticlecategoryList(String catType)throws DataAccessException;
	
	public List<Article>getArt(String articleId)throws DataAccessException;
	
	public List<Articlecategory>getArticlecategoryList()throws DataAccessException;
	
	public Page getPagedarticlecategory(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	public Page getPagedarticle(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
	public List<Articlecategory> findCategoryByParent()throws DataAccessException;
	
	public Set<Articlecategory> findAllArticlecategorys(int startResult, int maxRows) throws DataAccessException;
	
	public Articlecategory getArticlecategory(String catId) throws DataAccessException;
	
	public Article getArticle(String articleId) throws DataAccessException;
	
	public Page getArticleListByContent(int pageIndex,int pageSize,Map<String,Object> mapParams) throws DataAccessException;
	
}
