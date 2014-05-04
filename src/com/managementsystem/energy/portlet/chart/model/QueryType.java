package com.managementsystem.energy.portlet.chart.model;

public enum QueryType {
	USAGE("usage"), DAYREPORT("dayreport"), WEEKREPORT("weekreport"), MONTHREPORT(
			"monthreport"), YEARREPORT("yearreport"), QUERY("query");

	String querytype = "";

	private QueryType(String querytype) {
		this.querytype = querytype;
	}

	public String getQueryType() {
		return querytype;
	}
	
	public static QueryType findCode(String s) {
		if(s==null)
			return null;
		for(QueryType type : QueryType.values()) {
			if(type.equals(s.toLowerCase())) {
				return type;
			}
		}
		throw new IllegalArgumentException(s.toUpperCase());
	}
	
	public boolean equals(String s) {
		if(querytype!=null) {
			return this.querytype.equals(s);
		}
		return false;
	}
	

	@Override
	public String toString() {
		return querytype.toString();
	}

}
