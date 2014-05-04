package com.managementsystem.energy.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletPreferences;
import javax.portlet.ReadOnlyException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;
import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.service.ArticleService;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;
import com.managementsystem.ui.easyui.Tree;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("EDIT")
public class EditArticleController extends BaseController {
	private final Log logger = LogFactory
			.getLog(EditArticleController.class);

	@Autowired
	private ArticleService articleService;
	
	/**
	 * 设置
	 * */
	@RenderMapping
	public ModelAndView setup(RenderRequest request, RenderResponse response,
			PortletPreferences prefs) {
		ModelAndView mav = new ModelAndView();
		Articlecategory articlecategory = new Articlecategory();
		mav.addObject("articlecategory", articlecategory);
		mav.setViewName(PORTLETFOLDER + "article/articleEdit");
		return mav;
	}
	
	/**
	 * 保存知识类别
	 * */
	@ActionMapping(params = "action=saveArticlecategory")
	public void saveArticlecategory(
			@ModelAttribute("articlecategory") Articlecategory articlecategory,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		try {
			if(articlecategory.getArticlecategory().getCatId().equals("")){
				articlecategory.setArticlecategory(null);
			}
			else{
			   Articlecategory p_Articlecategory = articleService.getArticlecategory(articlecategory.getArticlecategory().getCatId());
			   articlecategory.setCatType(p_Articlecategory.getCatType());
			}
			articleService.saveOrUpdateArticlecategory(articlecategory);
			response.setRenderParameter("", "");
			request.setAttribute("successMessages", "操作成功");
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		}

	}
	
	/**
	 * 保存知识类别
	 * */
	@ActionMapping(params ="action=saveArticle")
	public void saveArticle(
			@ModelAttribute("article") Article article,
			PortletPreferences prefs, ActionRequest request,
			ActionResponse response) throws PortletException,
			ReadOnlyException, IOException {
		try {
			if(article.getArticlecategoryByCatId().getCatId().equals("")){
				article.setArticlecategoryByCatId(null);
			}
			if(article.getArticlecategoryByCatField().getCatId().equals("")){
				article.setArticlecategoryByCatField(null);
			}
			if(article.getArticlecategoryByCatBusiness().getCatId().equals("")){
				article.setArticlecategoryByCatBusiness(null);
			}
			String content = article.getContent();
			if(!content.equals("")){
				content = content.replace("<p>","").replace("</p>",""); 
				article.setContent(content);
			}
			articleService.saveOrUpdateArticle(article);
			response.setRenderParameter("", "");
			request.setAttribute("successMessages", "操作成功");
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("errorMessages", e.getMessage());
		}

	}
	
	/**
	 * 编辑知识库
	 * 
	 *
	 * */
	@RenderMapping(params = "action=article")
	public ModelAndView setupBuildexinfo() {
		ModelAndView mav = new ModelAndView();
		Article article = new Article();
		mav.addObject("article", article);
		mav.setViewName(PORTLETFOLDER + "article/articleEditTab");
		return mav;
	}
	

	
	@ResourceMapping(value = "getCategoryTree")
	public JsonResult getCategoryTree() {
		JsonResult jsonData = new JsonResult();
		List<Tree> list = articleService.getCategoryTree();
		jsonData.setData(list);
		return jsonData;
	}
	
	
	@ResourceMapping(value = "getArticlecategoryList")
	public Page  getArticlecategoryList(
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows,
			ResourceRequest request,
			ResourceResponse response)
			{
		 Map<String,Object> mapCondition = new HashMap<String,Object>();
		 Page articlecategoryPaged = articleService.getPagedarticlecategory(page, rows, mapCondition);
		 return articlecategoryPaged;
	}
	
	@ResourceMapping(value = "removeArticlecategory")
	public Resultmsg removeArticlecategory(@RequestParam("catId") String catId) {
		Resultmsg msg = new Resultmsg();
			try {
					articleService.deleteArticlecategory(catId);
					msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		return msg;
	}
	
	@ResourceMapping(value = "removeArticle")
	public Resultmsg removeArticle(@RequestParam("articleId") String articleId) {
		Resultmsg msg = new Resultmsg();
			try {
					articleService.deleteArticle(articleId);
					msg.setSuccess("true");
			} catch (Exception e) {
				msg.setMsg(e.getMessage());
				logger.error(e);
			}
		return msg;
	}
	
	@ResourceMapping(value = "getArticlePageList")
	public Page  getArticlePageList(
			@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows,
			ResourceRequest request,
			ResourceResponse response)
			{
		 Map<String,Object> mapCondition = new HashMap<String,Object>();
		 Page articlePaged = articleService.getArticles(page, rows, mapCondition);
		 return articlePaged;
	}
	
	@RenderMapping(params = "action=addArticleForm")
	public ModelAndView setAddRepairForm() {
		ModelAndView mav = new ModelAndView();
		Article article = new Article();
		mav.addObject("article", article);
		mav.setViewName(PORTLETFOLDER + "article/editArticleForm");
		return mav;
	}
	
	@RenderMapping(params = "action=editArticleForm")
	public ModelAndView setEditFaultForm(
			@RequestParam("articleId") String articleId) {
		ModelAndView mav = new ModelAndView();
		Article article = articleService.getArticle(articleId);
		mav.addObject("article", article);
		mav.setViewName(PORTLETFOLDER + "article/editArticleForm");
		return mav;
	}
}
