package com.managementsystem.energy.portlet.chart.model;

/**
 * 报表设置
 * */
public class ReportSetting extends BaseEntity {

	private static final long serialVersionUID = 8457953217784747679L;
	/**
	 * 导出类型
	 * */
	private String exportType;

	public String getExportType() {
		return exportType;
	}

	public void setExportType(String exportType) {
		this.exportType = exportType;
	}

	@Override
	public String getFormula() {
		if (this.formula == null || "".equals(this.formula)) {
			StringBuilder sb = new StringBuilder();
			for (int no = 1; no <= 100; no++) {
				if (sb.length() > 0)
					sb.append(",");
				sb.append(" : "); // 注意这里必须有空格
			}
			formula = sb.toString();
		}
		return formula;
	}
	
	
	
	
	

}
