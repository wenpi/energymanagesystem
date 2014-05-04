package com.managementsystem.energy.domain;

/**
 * 数据查询结果对象
 *	<p>列如{@code {time:'2011-01-17 00:00:00',val:15776429.000000}</p>
 * */
public class QueryTotalresult {
	private String time;
	private String val;
	private String price;
	private String total;
	

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
}
