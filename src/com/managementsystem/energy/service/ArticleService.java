package com.managementsystem.energy.service;

import java.util.Map;
import java.util.Set;
import java.util.List;

import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

public interface ArticleService {

	/**
	 * 保存或更新文章类别信息
	 * 
	 * @param articlecategory
	 *            文章类别对象
	 * */
	public void saveOrUpdateArticlecategory(Articlecategory articlecategory);

	/**
	 * 删除指定的文章类别
	 * 
	 * @param catId
	 *            文章类别ID
	 * */
	public void deleteArticlecategory(String catId);

	/**
	 * 获取指定的文章类别对象
	 * 
	 * @param catId
	 *            文章类别ID
	 * @return 文章类别对象
	 * */
	public Articlecategory getArticlecategory(String catId);

	/**
	 * 获取文章类别列表
	 * 
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategories();

	/**
	 * 获取文章类别列表
	 * 
	 * @param modelId
	 *            模型ID
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategoriesByModelid(int modelId);

	/**
	 * 获取文章类别列表
	 * 
	 * @param modelId
	 *            模型ID
	 * @param catType
	 *            类别类型 ,例如:能源领域、能源业务、国别分类
	 * @return 文章类别列表
	 * */
	public Set<Articlecategory> getArticlecategoriesByCattype(int modelId,
			String catType);

	/**
	 * 保存或更新文章对象
	 * 
	 * @param article
	 *            文章对象
	 * */
	public void saveOrUpdateArticle(Article article);

	/**
	 * 删除指定的文章对象
	 * 
	 * @param articleId
	 *            文章对象ID
	 * */
	public void deleteArticle(String articleId);

	/**
	 * 获取指定的文章对象
	 * 
	 * @param articleId
	 *            文章对象ID
	 * 
	 * @return 指定的文章对象
	 * */
	public Article getArticle(String articleId);

	/**
	 * 获取文章分页列表
	 * 
	 * @param pageIndex
	 *            当前页
	 * @param pageSize
	 *            每页显示数
	 * @param mapParams
	 *            查询map
	 * @return 文章分页列表
	 * */
	public Page getArticles(int pageIndex, int pageSize,
			Map<String, Object> mapParams);

	/**
	 * 获取指定类别ID的文章分页列表
	 * 
	 * @param pageIndex
	 *            当前页
	 * @param pageSize
	 *            每页显示数
	 * @param catId
	 *            文章类别ID
	 * @param mapParams
	 *            查询map
	 * @return 文章分页列表
	 * */
	public Page getArticlesByCategoryId(int pageIndex, int pageSize,
			String catId, Map<String, Object> mapParams);

	public List<Articlecategory> getArticlecategoryList(String catType);

	public List<Article> getArt(String articleId);

	public List<Articlecategory> getArticlecategoryList();

	public Page getPagedarticlecategory(int pageIndex, int pageSize,
			Map<String, Object> mapCondition);

	public Page getPagedarticle(int pageIndex, int pageSize,
			Map<String, Object> mapCondition);

	public List<Tree> getCategoryTree();

	public List getArticlecategoryTree();

	public Page getArticleListByContent(int pageIndex, int pageSize,
			Map<String, Object> mapCondition);
}
