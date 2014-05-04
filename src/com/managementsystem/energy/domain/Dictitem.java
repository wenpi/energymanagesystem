package com.managementsystem.energy.domain;

import java.math.BigDecimal;


/**
 * 数据字典项
 */
public class Dictitem implements java.io.Serializable {

	private static final long serialVersionUID = -1056282575663950159L;
	private String itemId;
	private Dictgroup dictgroup;
	private String itemCode;
	private String itemName;
	private String itemShortname;
	private String itemRemark;
	private Integer itemOrder;
	private BigDecimal itemBeginValue;
	private BigDecimal itemEndValue;

	public Dictitem() {
	}

	public Dictitem(String itemId, Dictgroup dictgroup, String itemCode,
			String itemName) {
		this.itemId = itemId;
		this.dictgroup = dictgroup;
		this.itemCode = itemCode;
		this.itemName = itemName;
	}

	public Dictitem(String itemId, Dictgroup dictgroup, String itemCode,
			String itemName, Integer itemOrder) {
		this.itemId = itemId;
		this.dictgroup = dictgroup;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.itemOrder = itemOrder;
	}

	public String getItemId() {
		return this.itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public Dictgroup getDictgroup() {
		return this.dictgroup;
	}

	public void setDictgroup(Dictgroup dictgroup) {
		this.dictgroup = dictgroup;
	}

	public String getItemCode() {
		return this.itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemShortname() {
		return itemShortname;
	}

	public void setItemShortname(String itemShortname) {
		this.itemShortname = itemShortname;
	}

	public String getItemRemark() {
		return itemRemark;
	}

	public void setItemRemark(String itemRemark) {
		this.itemRemark = itemRemark;
	}

	public Integer getItemOrder() {
		return this.itemOrder;
	}

	public void setItemOrder(Integer itemOrder) {
		this.itemOrder = itemOrder;
	}

	public BigDecimal getItemBeginValue() {
		return itemBeginValue;
	}

	public void setItemBeginValue(BigDecimal itemBeginValue) {
		this.itemBeginValue = itemBeginValue;
	}

	public BigDecimal getItemEndValue() {
		return itemEndValue;
	}

	public void setItemEndValue(BigDecimal itemEndValue) {
		this.itemEndValue = itemEndValue;
	}
	
}
