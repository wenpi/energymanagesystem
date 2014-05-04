package com.managementsystem.energy.portlet.datarevise;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.portlet.PortletPreferences;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.managementsystem.energy.domain.Dictitem;
import com.managementsystem.energy.domain.Meterproinfo;
import com.managementsystem.energy.domain.Meteruseattribute;
import com.managementsystem.energy.domain.Meteruseinfo;
import com.managementsystem.energy.service.MeteruseinfoService;
import com.managementsystem.energy.web.BaseController;
import com.managementsystem.ui.easyui.JsonResult;
import com.managementsystem.ui.easyui.Resultmsg;

@Controller
@RequestMapping("VIEW")
public class DatareviseViewController extends BaseController {
	private final Log logger = LogFactory.getLog(getClass());

	@Autowired
	private MeteruseinfoService meteruseinfoService;

	@RenderMapping
	public String setup(PortletPreferences prefs, Model model) {

		Set<Meteruseinfo> meteruseinfos = meteruseinfoService
				.getMeteruseinfos();

		List<Dictitem> metertypes = new ArrayList<Dictitem>();
		if (meteruseinfos.size() > 0) {
			List<Integer> types = new ArrayList<Integer>();
			for (Iterator<Meteruseinfo> it = meteruseinfos.iterator(); it.hasNext();) {
				Meteruseinfo meteruseinfo = (Meteruseinfo)it.next();
				Meterproinfo meterproinfo = meteruseinfo.getMeterproinfo();
				if(meterproinfo!=null && meterproinfo.getMeterType()!=null) {
					Integer meterType = meterproinfo.getMeterType();
					if(!types.contains(meterType)) {
						types.add(meterType);
					}
				}
			}
			
			Set<Dictitem> dictMeterTypes = dictionaryService.getDictitemBygroupCode("meter_type");
			
			for(Integer type : types) {
				for (Iterator<Dictitem> iterator = dictMeterTypes.iterator(); iterator.hasNext();) {
					Dictitem dictitem = (Dictitem) iterator.next();
					if(type.toString().equals(dictitem.getItemCode())) {
						if(!metertypes.contains(dictitem)) {
							metertypes.add(dictitem);
						}
					}
				}
			}
			
		}

		model.addAttribute("meteruseinfos", meteruseinfos);
		model.addAttribute("metertypes", metertypes);
		return PORTLETFOLDER + "datarevise/datareviseView";
	}

	/**
	 * 返回指定明细ID的明细参数列表
	 * 
	 * @param detailid
	 *            明细ID
	 * */
	@ResourceMapping(value = "getMeteruseattributes")
	public JsonResult getMeteruseattribute(
			@RequestParam("meterId") String meterId) {
		JsonResult result = new JsonResult();
		List<Meteruseattribute> meteruseattributeList = meteruseinfoService
				.getMeteruseattributesByMeterId(meterId, 0);
		result.setData(meteruseattributeList);
		return result;
	}

	@ResourceMapping(value = "submitForm")
	public Resultmsg submitForm(
			@ModelAttribute("meteruseinfo") Meteruseinfo meteruseinfo,
			BindingResult result, ResourceRequest resourceRequest,
			ResourceResponse resourceResponse, SessionStatus status) {
		Resultmsg msg = new Resultmsg();
		try {

			for (Meteruseattribute meteruseattribute : meteruseinfo
					.getMeteruseattributeslist()) {
				meteruseinfoService
						.updateMeteruseattributeDatarevise(meteruseattribute);
			}
			status.setComplete();
			msg.setSuccess("true");
		} catch (Exception e) {
			logger.error(e);
			msg.setMsg(e.getMessage());
		}
		return msg;
	}
}
