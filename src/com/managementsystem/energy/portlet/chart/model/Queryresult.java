package com.managementsystem.energy.portlet.chart.model;

/**
 * 数据查询结果对象
 *	<p>列如{@code {time:'2011-01-17 00:00:00',val:15776429.000000}</p>
 * */
public class Queryresult {

	private String tagid;
	private String time;
	private String val;

	public Queryresult() {
		
	}
	
	public Queryresult(String tagid,String time,String val) {
		this.tagid = tagid;
		this.time = time;
		this.val = val;
	}
	
	
	public String getTagid() {
		return tagid;
	}

	public void setTagid(String tagid) {
		this.tagid = tagid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}
	
	@Override
	public String toString() {
		return "[" + tagid + "," + time + "," + val +"]";
	}
}
