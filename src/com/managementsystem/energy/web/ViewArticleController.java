package com.managementsystem.energy.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Article;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.service.ArticleService;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.util.dao.Page;

@Controller
@RequestMapping("VIEW")
public class ViewArticleController extends BaseController {

	@Autowired
	private ArticleService articleService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {
		List<Articlecategory> categories = new ArrayList<Articlecategory>();
		categories = articleService.getArticlecategoryList();
		model.addAttribute("categories", categories);
		return PORTLETFOLDER + "article/articleView";
	}

	/**
	 * 获取文章列表
	 * @param page 当前页
	 * @param rows	每页显示条数
	 * */
	@ResourceMapping(value = "getArticleList")
	public Page getArticleList(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();
		String catId = "";
		if (request.getParameter("catId") != null) {
			catId = request.getParameter("catId");
			mapCondition.put("cat_id", catId);
		}
		Page articlePaged = articleService.getPagedarticle(page, rows,
				mapCondition);
		return articlePaged;
	}

	/**
	 * 文章查找
	 * */
	@ResourceMapping(value = "getArticleListByContent")
	public Page getArticleListByContent(@RequestParam("page") Integer page,
			@RequestParam("rows") Integer rows, ResourceRequest request,
			ResourceResponse response) {
		Map<String, Object> mapCondition = new HashMap<String, Object>();
		String content = "";
		if (request.getParameter("content") != null
				&& !request.getParameter("content").equals("")) {
			content = request.getParameter("content");
			mapCondition.put("content", content);
		}
		Page articlePaged = articleService.getArticleListByContent(page, rows,
				mapCondition);
		return articlePaged;
	}

	
	@ResourceMapping(value = "getArticlecategoryTree")
	public JsonResult getArticlecategoryTree() {
		JsonResult jsonData = new JsonResult();
		List list = articleService.getArticlecategoryTree();
		jsonData.setData(list);
		return jsonData;
	}

	/**
	 * 返回指定明细ID的明细参数列表
	 * 
	 * @param detailid
	 *            明细ID
	 * */
	@ResourceMapping(value = "getArticlecategoryList")
	public JsonResult getArticlecategoryList(
			@RequestParam("catType") String catType) {
		JsonResult result = new JsonResult();
		if (catType.equals("1")) {
			catType = "能源领域";
		}
		if (catType.equals("2")) {
			catType = "能源业务";
		}
		if (catType.equals("3")) {
			catType = "国别分类";
		}
		List<Articlecategory> list = articleService
				.getArticlecategoryList(catType);
		result.setData(list);
		return result;
	}

	@ResourceMapping(value = "getArticle")
	public JsonResult getArticle(@RequestParam("articleId") String articleId) {
		JsonResult result = new JsonResult();
		List<Article> list = articleService.getArt(articleId);
		result.setData(list);
		return result;
	}

	@RenderMapping(params = "action=showArticle")
	public ModelAndView showArticle(@RequestParam("articleId") String articleId) {
		ModelAndView mav = new ModelAndView();
		List<Article> articleList = articleService.getArt(articleId);
		Article article = new Article();
		article = articleList.get(0);
		mav.addObject("article", article);
		mav.setView(PORTLETFOLDER + "article/showArticle");
		return mav;
	}
}
