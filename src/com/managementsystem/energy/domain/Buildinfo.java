package com.managementsystem.energy.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonBackReference;

/**
 * 建筑信息
 */
public class Buildinfo implements java.io.Serializable {

	private static final long serialVersionUID = 8496470601354542965L;
	private String buildId;
	private Datacenterinfo datacenterinfo;
	private Long organizationid;
	private String buildName;
	private String buildAliasname;
	private String buildOwner;
	private Integer buildState;
	private String buildDistrictid;
	private String buildAddress;
	private String description;
	private String buildLong;
	private String buildLat;
	private String buildClimaticregion;
	private Short buildYear;
	private Integer buildUpfloor;
	private Integer buildDownfloor;
	private Integer buildFunction;
	private BigDecimal buildTotalarea;
	private BigDecimal buildAirarea;
	private BigDecimal buildHeatarea;
	private Integer buildAirtype;
	private Integer buildHeattype;
	private BigDecimal buildBodycoef;
	private Integer buildStrutype;
	private Integer buildWallmattype;
	private Integer buildWallwarmtype;
	private Integer buildWallwintype;
	private Integer buildGlasstype;
	private Integer buildWinframetype;
	private Boolean buildStandard;
	private String buildDesigndept;
	private String buildWorkdept;
	private Date buildCreatedondate;
	private String buildCreatedbyuserid;
	private Date buildMonitordate;
	private Date buildAcceptdate;
	@JsonBackReference
	private Buildexinfo buildexinfo;
	@JsonBackReference
	private Buildsettinginfo buildsettinginfo;
	@JsonBackReference
	private Set buildaddfiles = new HashSet(0);
	@JsonBackReference
	private Set circuitinfos = new HashSet(0);
	@JsonBackReference
	private Set calcformulas = new HashSet(0);
	@JsonBackReference
	private Set buildregioninfos = new HashSet(0);
	@JsonBackReference
	private Set buildgrouprelainfos = new HashSet(0);

	@JsonBackReference
	private Set strategies = new HashSet(0);

	private String buildCover;
	private Map<String, Object> buildEnergy = new HashMap<String, Object>();

	public Buildinfo() {
	}

	public Buildinfo(String buildId) {
		this.buildId = buildId;
	}

	public Buildinfo(String buildId, Datacenterinfo datacenterinfo,
			String buildName, String buildAliasname, String buildOwner,
			Integer buildState, String buildDistrictid, String buildAddress,
			String buildLong, String buildLat, String buildClimaticregion,
			Short buildYear, Integer buildUpfloor, Integer buildDownfloor,
			Integer buildFunction, BigDecimal buildTotalarea,
			BigDecimal buildAirarea, BigDecimal buildHeatarea,
			Integer buildAirtype, Integer buildHeattype,
			BigDecimal buildBodycoef, Integer buildStrutype,
			Integer buildWallmattype, Integer buildWallwarmtype,
			Integer buildWallwintype, Integer buildGlasstype,
			Integer buildWinframetype, Boolean buildStandard,
			String buildDesigndept, String buildWorkdept,
			Date buildCreatedondate, String buildCreatedbyuserid,
			Date buildMonitordate, Date buildAcceptdate,
			Buildexinfo buildexinfo, Buildsettinginfo buildsettinginfo,
			Set buildaddfiles, Set circuitinfos, Set calcformulas,
			Set buildregioninfos, Set buildgrouprelainfos) {
		this.buildId = buildId;
		this.datacenterinfo = datacenterinfo;
		this.buildName = buildName;
		this.buildAliasname = buildAliasname;
		this.buildOwner = buildOwner;
		this.buildState = buildState;
		this.buildDistrictid = buildDistrictid;
		this.buildAddress = buildAddress;
		this.buildLong = buildLong;
		this.buildLat = buildLat;
		this.buildClimaticregion = buildClimaticregion;
		this.buildYear = buildYear;
		this.buildUpfloor = buildUpfloor;
		this.buildDownfloor = buildDownfloor;
		this.buildFunction = buildFunction;
		this.buildTotalarea = buildTotalarea;
		this.buildAirarea = buildAirarea;
		this.buildHeatarea = buildHeatarea;
		this.buildAirtype = buildAirtype;
		this.buildHeattype = buildHeattype;
		this.buildBodycoef = buildBodycoef;
		this.buildStrutype = buildStrutype;
		this.buildWallmattype = buildWallmattype;
		this.buildWallwarmtype = buildWallwarmtype;
		this.buildWallwintype = buildWallwintype;
		this.buildGlasstype = buildGlasstype;
		this.buildWinframetype = buildWinframetype;
		this.buildStandard = buildStandard;
		this.buildDesigndept = buildDesigndept;
		this.buildWorkdept = buildWorkdept;
		this.buildCreatedondate = buildCreatedondate;
		this.buildCreatedbyuserid = buildCreatedbyuserid;
		this.buildMonitordate = buildMonitordate;
		this.buildAcceptdate = buildAcceptdate;
		this.buildexinfo = buildexinfo;
		this.buildsettinginfo = buildsettinginfo;
		this.buildaddfiles = buildaddfiles;
		this.circuitinfos = circuitinfos;
		this.calcformulas = calcformulas;
		this.buildregioninfos = buildregioninfos;
		this.buildgrouprelainfos = buildgrouprelainfos;
	}

	public String getBuildId() {
		return this.buildId;
	}

	public void setBuildId(String buildId) {
		this.buildId = buildId;
	}

	public Datacenterinfo getDatacenterinfo() {
		return this.datacenterinfo;
	}

	public void setDatacenterinfo(Datacenterinfo datacenterinfo) {
		this.datacenterinfo = datacenterinfo;
	}

	public String getBuildName() {
		return this.buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public String getBuildAliasname() {
		return this.buildAliasname;
	}

	public void setBuildAliasname(String buildAliasname) {
		this.buildAliasname = buildAliasname;
	}

	public String getBuildOwner() {
		return this.buildOwner;
	}

	public void setBuildOwner(String buildOwner) {
		this.buildOwner = buildOwner;
	}

	public Integer getBuildState() {
		return this.buildState;
	}

	public void setBuildState(Integer buildState) {
		this.buildState = buildState;
	}

	public String getBuildDistrictid() {
		return this.buildDistrictid;
	}

	public void setBuildDistrictid(String buildDistrictid) {
		this.buildDistrictid = buildDistrictid;
	}

	public String getBuildAddress() {
		return this.buildAddress;
	}

	public void setBuildAddress(String buildAddress) {
		this.buildAddress = buildAddress;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBuildLong() {
		return this.buildLong;
	}

	public void setBuildLong(String buildLong) {
		this.buildLong = buildLong;
	}

	public String getBuildLat() {
		return this.buildLat;
	}

	public void setBuildLat(String buildLat) {
		this.buildLat = buildLat;
	}

	public String getBuildClimaticregion() {
		return this.buildClimaticregion;
	}

	public void setBuildClimaticregion(String buildClimaticregion) {
		this.buildClimaticregion = buildClimaticregion;
	}

	public Short getBuildYear() {
		return this.buildYear;
	}

	public void setBuildYear(Short buildYear) {
		this.buildYear = buildYear;
	}

	public Integer getBuildUpfloor() {
		return this.buildUpfloor;
	}

	public void setBuildUpfloor(Integer buildUpfloor) {
		this.buildUpfloor = buildUpfloor;
	}

	public Integer getBuildDownfloor() {
		return this.buildDownfloor;
	}

	public void setBuildDownfloor(Integer buildDownfloor) {
		this.buildDownfloor = buildDownfloor;
	}

	public Integer getBuildFunction() {
		return this.buildFunction;
	}

	public void setBuildFunction(Integer buildFunction) {
		this.buildFunction = buildFunction;
	}

	public BigDecimal getBuildTotalarea() {
		return this.buildTotalarea;
	}

	public void setBuildTotalarea(BigDecimal buildTotalarea) {
		this.buildTotalarea = buildTotalarea;
	}

	public BigDecimal getBuildAirarea() {
		return this.buildAirarea;
	}

	public void setBuildAirarea(BigDecimal buildAirarea) {
		this.buildAirarea = buildAirarea;
	}

	public BigDecimal getBuildHeatarea() {
		return this.buildHeatarea;
	}

	public void setBuildHeatarea(BigDecimal buildHeatarea) {
		this.buildHeatarea = buildHeatarea;
	}

	public Integer getBuildAirtype() {
		return this.buildAirtype;
	}

	public void setBuildAirtype(Integer buildAirtype) {
		this.buildAirtype = buildAirtype;
	}

	public Integer getBuildHeattype() {
		return this.buildHeattype;
	}

	public void setBuildHeattype(Integer buildHeattype) {
		this.buildHeattype = buildHeattype;
	}

	public BigDecimal getBuildBodycoef() {
		return this.buildBodycoef;
	}

	public void setBuildBodycoef(BigDecimal buildBodycoef) {
		this.buildBodycoef = buildBodycoef;
	}

	public Integer getBuildStrutype() {
		return this.buildStrutype;
	}

	public void setBuildStrutype(Integer buildStrutype) {
		this.buildStrutype = buildStrutype;
	}

	public Integer getBuildWallmattype() {
		return this.buildWallmattype;
	}

	public void setBuildWallmattype(Integer buildWallmattype) {
		this.buildWallmattype = buildWallmattype;
	}

	public Integer getBuildWallwarmtype() {
		return this.buildWallwarmtype;
	}

	public void setBuildWallwarmtype(Integer buildWallwarmtype) {
		this.buildWallwarmtype = buildWallwarmtype;
	}

	public Integer getBuildWallwintype() {
		return this.buildWallwintype;
	}

	public void setBuildWallwintype(Integer buildWallwintype) {
		this.buildWallwintype = buildWallwintype;
	}

	public Integer getBuildGlasstype() {
		return this.buildGlasstype;
	}

	public void setBuildGlasstype(Integer buildGlasstype) {
		this.buildGlasstype = buildGlasstype;
	}

	public Integer getBuildWinframetype() {
		return this.buildWinframetype;
	}

	public void setBuildWinframetype(Integer buildWinframetype) {
		this.buildWinframetype = buildWinframetype;
	}

	public Boolean getBuildStandard() {
		return this.buildStandard;
	}

	public void setBuildStandard(Boolean buildStandard) {
		this.buildStandard = buildStandard;
	}

	public String getBuildDesigndept() {
		return this.buildDesigndept;
	}

	public void setBuildDesigndept(String buildDesigndept) {
		this.buildDesigndept = buildDesigndept;
	}

	public String getBuildWorkdept() {
		return this.buildWorkdept;
	}

	public void setBuildWorkdept(String buildWorkdept) {
		this.buildWorkdept = buildWorkdept;
	}

	public Date getBuildCreatedondate() {
		return this.buildCreatedondate;
	}

	public void setBuildCreatedondate(Date buildCreatedondate) {
		this.buildCreatedondate = buildCreatedondate;
	}

	public String getBuildCreatedbyuserid() {
		return this.buildCreatedbyuserid;
	}

	public void setBuildCreatedbyuserid(String buildCreatedbyuserid) {
		this.buildCreatedbyuserid = buildCreatedbyuserid;
	}

	public Date getBuildMonitordate() {
		return this.buildMonitordate;
	}

	public void setBuildMonitordate(Date buildMonitordate) {
		this.buildMonitordate = buildMonitordate;
	}

	public Date getBuildAcceptdate() {
		return this.buildAcceptdate;
	}

	public void setBuildAcceptdate(Date buildAcceptdate) {
		this.buildAcceptdate = buildAcceptdate;
	}

	public Buildexinfo getBuildexinfo() {
		return this.buildexinfo;
	}

	public void setBuildexinfo(Buildexinfo buildexinfo) {
		this.buildexinfo = buildexinfo;
	}

	public Buildsettinginfo getBuildsettinginfo() {
		return this.buildsettinginfo;
	}

	public void setBuildsettinginfo(Buildsettinginfo buildsettinginfo) {
		this.buildsettinginfo = buildsettinginfo;
	}

	public Set getBuildaddfiles() {
		return this.buildaddfiles;
	}

	public void setBuildaddfiles(Set buildaddfiles) {
		this.buildaddfiles = buildaddfiles;
	}

	public Set getCircuitinfos() {
		return this.circuitinfos;
	}

	public void setCircuitinfos(Set circuitinfos) {
		this.circuitinfos = circuitinfos;
	}

	public Set getCalcformulas() {
		return this.calcformulas;
	}

	public void setCalcformulas(Set calcformulas) {
		this.calcformulas = calcformulas;
	}

	public Set getBuildregioninfos() {
		return this.buildregioninfos;
	}

	public void setBuildregioninfos(Set buildregioninfos) {
		this.buildregioninfos = buildregioninfos;
	}

	public Set getBuildgrouprelainfos() {
		return this.buildgrouprelainfos;
	}

	public void setBuildgrouprelainfos(Set buildgrouprelainfos) {
		this.buildgrouprelainfos = buildgrouprelainfos;
	}

	public Set getStrategies() {
		return strategies;
	}

	public void setStrategies(Set strategies) {
		this.strategies = strategies;
	}

	public String getBuildCover() {
		return buildCover;
	}

	public void setBuildCover(String buildCover) {
		this.buildCover = buildCover;
	}

	public Map<String, Object> getBuildEnergy() {
		return buildEnergy;
	}

	public void setBuildEnergy(Map<String, Object> buildEnergy) {
		this.buildEnergy = buildEnergy;
	}

	public Long getOrganizationid() {
		return organizationid;
	}

	public void setOrganizationid(Long organizationid) {
		this.organizationid = organizationid;
	}

}
