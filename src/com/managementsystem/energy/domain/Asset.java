package com.managementsystem.energy.domain;


import java.math.BigDecimal;
import java.util.Date;


public class Asset implements java.io.Serializable {

	private static final long serialVersionUID = -7545926207045506208L;
	private Long assetuid;
	private String ancestor;
	private long assetid;
	private String assetnum;
	private String assettag;
	private String assettype;
	private String specclass;
	private String calnum;
	private String changeby;
	private Date changedate;
	private String classstructureid;
	private String description;
	private Boolean disabled;
	private String externalrefid;
	private String failurecode;
	private String groupname;
	private Boolean haschildren;
	private Boolean hasmoredesc;
	private Date installdate;
	private Boolean isrunning;
	private String langcode;
	private String location;
	private Boolean mainthierchy;
	private String manufacturer;
	private Boolean moved;
	private String orgid;
	private String ownersysid;
	private String parent;
	private Integer priority;
	private String sendersysid;
	private String serialnum;
	private String shiftnum;
	private String siteid;
	private String sourcesysid;
	private String status;
	private Date statusdate;
	private String usage;
	private String vendor;
	private Date warrantyexpdate;
	private String ec1;
	private String ec2;
	private String ec3;
	private String ec4;
	private BigDecimal ec5;
	private Date ec6;
	private BigDecimal ec7;
	private String ec8;
	private String ec9;
	private String ec10;
	private String ec11;
	private BigDecimal ec12;
	private Date ec13;
	private String ec14;
	private BigDecimal ec15;

	public Asset() {
	}

	public Asset(long assetid, String assetnum) {
		this.assetid = assetid;
		this.assetnum = assetnum;
	}

	public Asset(String ancestor, long assetid, String assetnum,
			String assettag, String assettype, String specclass, String calnum,
			String changeby, Date changedate, String classstructureid,
			String description, Boolean disabled, String externalrefid,
			String failurecode, String groupname, Boolean haschildren,
			Boolean hasmoredesc, Date installdate, Boolean isrunning,
			String langcode, String location, Boolean mainthierchy,
			String manufacturer, Boolean moved, String orgid,
			String ownersysid, String parent, Integer priority,
			String sendersysid, String serialnum, String shiftnum,
			String siteid, String sourcesysid, String status, Date statusdate,
			String usage, String vendor, Date warrantyexpdate, String ec1,
			String ec2, String ec3, String ec4, BigDecimal ec5, Date ec6,
			BigDecimal ec7, String ec8, String ec9, String ec10, String ec11,
			BigDecimal ec12, Date ec13, String ec14, BigDecimal ec15) {
		this.ancestor = ancestor;
		this.assetid = assetid;
		this.assetnum = assetnum;
		this.assettag = assettag;
		this.assettype = assettype;
		this.specclass = specclass;
		this.calnum = calnum;
		this.changeby = changeby;
		this.changedate = changedate;
		this.classstructureid = classstructureid;
		this.description = description;
		this.disabled = disabled;
		this.externalrefid = externalrefid;
		this.failurecode = failurecode;
		this.groupname = groupname;
		this.haschildren = haschildren;
		this.hasmoredesc = hasmoredesc;
		this.installdate = installdate;
		this.isrunning = isrunning;
		this.langcode = langcode;
		this.location = location;
		this.mainthierchy = mainthierchy;
		this.manufacturer = manufacturer;
		this.moved = moved;
		this.orgid = orgid;
		this.ownersysid = ownersysid;
		this.parent = parent;
		this.priority = priority;
		this.sendersysid = sendersysid;
		this.serialnum = serialnum;
		this.shiftnum = shiftnum;
		this.siteid = siteid;
		this.sourcesysid = sourcesysid;
		this.status = status;
		this.statusdate = statusdate;
		this.usage = usage;
		this.vendor = vendor;
		this.warrantyexpdate = warrantyexpdate;
		this.ec1 = ec1;
		this.ec2 = ec2;
		this.ec3 = ec3;
		this.ec4 = ec4;
		this.ec5 = ec5;
		this.ec6 = ec6;
		this.ec7 = ec7;
		this.ec8 = ec8;
		this.ec9 = ec9;
		this.ec10 = ec10;
		this.ec11 = ec11;
		this.ec12 = ec12;
		this.ec13 = ec13;
		this.ec14 = ec14;
		this.ec15 = ec15;
	}

	public Long getAssetuid() {
		return this.assetuid;
	}

	public void setAssetuid(Long assetuid) {
		this.assetuid = assetuid;
	}

	public String getAncestor() {
		return this.ancestor;
	}

	public void setAncestor(String ancestor) {
		this.ancestor = ancestor;
	}

	public long getAssetid() {
		return this.assetid;
	}

	public void setAssetid(long assetid) {
		this.assetid = assetid;
	}

	public String getAssetnum() {
		return this.assetnum;
	}

	public void setAssetnum(String assetnum) {
		this.assetnum = assetnum;
	}

	public String getAssettag() {
		return this.assettag;
	}

	public void setAssettag(String assettag) {
		this.assettag = assettag;
	}

	public String getAssettype() {
		return this.assettype;
	}

	public void setAssettype(String assettype) {
		this.assettype = assettype;
	}

	public String getSpecclass() {
		return this.specclass;
	}

	public void setSpecclass(String specclass) {
		this.specclass = specclass;
	}

	public String getCalnum() {
		return this.calnum;
	}

	public void setCalnum(String calnum) {
		this.calnum = calnum;
	}

	public String getChangeby() {
		return this.changeby;
	}

	public void setChangeby(String changeby) {
		this.changeby = changeby;
	}

	public Date getChangedate() {
		return this.changedate;
	}

	public void setChangedate(Date changedate) {
		this.changedate = changedate;
	}

	public String getClassstructureid() {
		return this.classstructureid;
	}

	public void setClassstructureid(String classstructureid) {
		this.classstructureid = classstructureid;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getDisabled() {
		return this.disabled;
	}

	public void setDisabled(Boolean disabled) {
		this.disabled = disabled;
	}

	public String getExternalrefid() {
		return this.externalrefid;
	}

	public void setExternalrefid(String externalrefid) {
		this.externalrefid = externalrefid;
	}

	public String getFailurecode() {
		return this.failurecode;
	}

	public void setFailurecode(String failurecode) {
		this.failurecode = failurecode;
	}

	public String getGroupname() {
		return this.groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public Boolean getHaschildren() {
		return this.haschildren;
	}

	public void setHaschildren(Boolean haschildren) {
		this.haschildren = haschildren;
	}

	public Boolean getHasmoredesc() {
		return this.hasmoredesc;
	}

	public void setHasmoredesc(Boolean hasmoredesc) {
		this.hasmoredesc = hasmoredesc;
	}

	public Date getInstalldate() {
		return this.installdate;
	}

	public void setInstalldate(Date installdate) {
		this.installdate = installdate;
	}

	public Boolean getIsrunning() {
		return this.isrunning;
	}

	public void setIsrunning(Boolean isrunning) {
		this.isrunning = isrunning;
	}

	public String getLangcode() {
		return this.langcode;
	}

	public void setLangcode(String langcode) {
		this.langcode = langcode;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Boolean getMainthierchy() {
		return this.mainthierchy;
	}

	public void setMainthierchy(Boolean mainthierchy) {
		this.mainthierchy = mainthierchy;
	}

	public String getManufacturer() {
		return this.manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Boolean getMoved() {
		return this.moved;
	}

	public void setMoved(Boolean moved) {
		this.moved = moved;
	}

	public String getOrgid() {
		return this.orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOwnersysid() {
		return this.ownersysid;
	}

	public void setOwnersysid(String ownersysid) {
		this.ownersysid = ownersysid;
	}

	public String getParent() {
		return this.parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getSendersysid() {
		return this.sendersysid;
	}

	public void setSendersysid(String sendersysid) {
		this.sendersysid = sendersysid;
	}

	public String getSerialnum() {
		return this.serialnum;
	}

	public void setSerialnum(String serialnum) {
		this.serialnum = serialnum;
	}

	public String getShiftnum() {
		return this.shiftnum;
	}

	public void setShiftnum(String shiftnum) {
		this.shiftnum = shiftnum;
	}

	public String getSiteid() {
		return this.siteid;
	}

	public void setSiteid(String siteid) {
		this.siteid = siteid;
	}

	public String getSourcesysid() {
		return this.sourcesysid;
	}

	public void setSourcesysid(String sourcesysid) {
		this.sourcesysid = sourcesysid;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStatusdate() {
		return this.statusdate;
	}

	public void setStatusdate(Date statusdate) {
		this.statusdate = statusdate;
	}

	public String getUsage() {
		return this.usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getVendor() {
		return this.vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	public Date getWarrantyexpdate() {
		return this.warrantyexpdate;
	}

	public void setWarrantyexpdate(Date warrantyexpdate) {
		this.warrantyexpdate = warrantyexpdate;
	}

	public String getEc1() {
		return this.ec1;
	}

	public void setEc1(String ec1) {
		this.ec1 = ec1;
	}

	public String getEc2() {
		return this.ec2;
	}

	public void setEc2(String ec2) {
		this.ec2 = ec2;
	}

	public String getEc3() {
		return this.ec3;
	}

	public void setEc3(String ec3) {
		this.ec3 = ec3;
	}

	public String getEc4() {
		return this.ec4;
	}

	public void setEc4(String ec4) {
		this.ec4 = ec4;
	}

	public BigDecimal getEc5() {
		return this.ec5;
	}

	public void setEc5(BigDecimal ec5) {
		this.ec5 = ec5;
	}

	public Date getEc6() {
		return this.ec6;
	}

	public void setEc6(Date ec6) {
		this.ec6 = ec6;
	}

	public BigDecimal getEc7() {
		return this.ec7;
	}

	public void setEc7(BigDecimal ec7) {
		this.ec7 = ec7;
	}

	public String getEc8() {
		return this.ec8;
	}

	public void setEc8(String ec8) {
		this.ec8 = ec8;
	}

	public String getEc9() {
		return this.ec9;
	}

	public void setEc9(String ec9) {
		this.ec9 = ec9;
	}

	public String getEc10() {
		return this.ec10;
	}

	public void setEc10(String ec10) {
		this.ec10 = ec10;
	}

	public String getEc11() {
		return this.ec11;
	}

	public void setEc11(String ec11) {
		this.ec11 = ec11;
	}

	public BigDecimal getEc12() {
		return this.ec12;
	}

	public void setEc12(BigDecimal ec12) {
		this.ec12 = ec12;
	}

	public Date getEc13() {
		return this.ec13;
	}

	public void setEc13(Date ec13) {
		this.ec13 = ec13;
	}

	public String getEc14() {
		return this.ec14;
	}

	public void setEc14(String ec14) {
		this.ec14 = ec14;
	}

	public BigDecimal getEc15() {
		return this.ec15;
	}

	public void setEc15(BigDecimal ec15) {
		this.ec15 = ec15;
	}

}
