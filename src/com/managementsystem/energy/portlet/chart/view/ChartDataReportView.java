
package com.managementsystem.energy.portlet.chart.view;

import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.managementsystem.energy.portlet.chart.model.Queryresult;

public class ChartDataReportView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		Map<String, List<Queryresult>> reportData = (Map<String, List<Queryresult>>)model.get("reportData");
		
		HSSFSheet sheet = workbook.createSheet("能耗数据");
		
		HSSFRow header = sheet.createRow(0);
		
		if(reportData==null || reportData.isEmpty())
			return;
		List<Queryresult> results = new LinkedList<Queryresult>();
		if(reportData.entrySet().iterator().hasNext()) {
			results = reportData.entrySet().iterator().next().getValue();
		}
		if(results==null)
			return;	
		//create the column
		header.createCell(0).setCellValue("设备名称");
		for(int index=0;index<results.size();index++) {
			header.createCell(index+1).setCellValue(results.get(index).getTime());
		}	
		int rowNum = 1;
		
		DecimalFormat nf = new DecimalFormat("#.##");
		String val = "";
		for(Iterator<Entry<String,List<Queryresult>>> it = reportData.entrySet().iterator();it.hasNext();) {
			Entry<String,List<Queryresult>> entry = it.next();
	
			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(entry.getKey());
			
			for(int index=0;index<results.size();index++) {
				for(Queryresult qr : entry.getValue()) {
					if(qr.getTime().equals(results.get(index).getTime())) {
						val = nf.format(Double.parseDouble(qr.getVal()));
						row.createCell(index+1).setCellValue(val);
						break;
					}
				}
			}
		}

	}

}
