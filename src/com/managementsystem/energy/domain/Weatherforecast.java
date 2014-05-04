package com.managementsystem.energy.domain;


import java.math.BigDecimal;
import java.util.Date;

/**
 * 天气预报实体类
 */
public class Weatherforecast implements java.io.Serializable {

	private static final long serialVersionUID = -5275925016683433613L;
	private String id;
	private String districtcode;
	private String worid;
	private String lastbuilddate;
	private String locationCity;
	private String locationRegion;
	private String locationCountry;
	private String unitTemperature;
	private String unitDistance;
	private String unitPressure;
	private String unitSpeed;
	private Integer windChill;
	private Integer windDirection;
	private Float windSpeed;
	private Integer atmosphereHumidity;
	private Float atmosphereVisibility;
	private Float atmospherePressure;
	private Integer atmosphereRising;
	private String astronomySunrise;
	private String astronomySunset;
	private BigDecimal geoLat;
	private BigDecimal geoLong;
	private String conditionText;
	private String conditionCode;
	private Float conditionTemp;
	private String conditionDate;
	private String description;
	private Date createdondate;

	public Weatherforecast() {
	}

	public Weatherforecast(String id, String districtcode, String lastbuilddate) {
		this.id = id;
		this.districtcode = districtcode;
		this.lastbuilddate = lastbuilddate;
	}

	public Weatherforecast(String id, String districtcode, String worid,
			String lastbuilddate, String locationCity, String locationRegion,
			String locationCountry, String unitTemperature,
			String unitDistance, String unitPressure, String unitSpeed,
			Integer windChill, Integer windDirection, Float windSpeed,
			Integer atmosphereHumidity, Float atmosphereVisibility,
			Float atmospherePressure, Integer atmosphereRising,
			String astronomySunrise, String astronomySunset, BigDecimal geoLat,
			BigDecimal geoLong, String conditionText, String conditionCode,
			Float conditionTemp, String conditionDate, String description,
			Date createdondate) {
		this.id = id;
		this.districtcode = districtcode;
		this.worid = worid;
		this.lastbuilddate = lastbuilddate;
		this.locationCity = locationCity;
		this.locationRegion = locationRegion;
		this.locationCountry = locationCountry;
		this.unitTemperature = unitTemperature;
		this.unitDistance = unitDistance;
		this.unitPressure = unitPressure;
		this.unitSpeed = unitSpeed;
		this.windChill = windChill;
		this.windDirection = windDirection;
		this.windSpeed = windSpeed;
		this.atmosphereHumidity = atmosphereHumidity;
		this.atmosphereVisibility = atmosphereVisibility;
		this.atmospherePressure = atmospherePressure;
		this.atmosphereRising = atmosphereRising;
		this.astronomySunrise = astronomySunrise;
		this.astronomySunset = astronomySunset;
		this.geoLat = geoLat;
		this.geoLong = geoLong;
		this.conditionText = conditionText;
		this.conditionCode = conditionCode;
		this.conditionTemp = conditionTemp;
		this.conditionDate = conditionDate;
		this.description = description;
		this.createdondate = createdondate;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDistrictcode() {
		return this.districtcode;
	}

	public void setDistrictcode(String districtcode) {
		this.districtcode = districtcode;
	}

	public String getWorid() {
		return this.worid;
	}

	public void setWorid(String worid) {
		this.worid = worid;
	}

	public String getLastbuilddate() {
		return this.lastbuilddate;
	}

	public void setLastbuilddate(String lastbuilddate) {
		this.lastbuilddate = lastbuilddate;
	}

	public String getLocationCity() {
		return this.locationCity;
	}

	public void setLocationCity(String locationCity) {
		this.locationCity = locationCity;
	}

	public String getLocationRegion() {
		return this.locationRegion;
	}

	public void setLocationRegion(String locationRegion) {
		this.locationRegion = locationRegion;
	}

	public String getLocationCountry() {
		return this.locationCountry;
	}

	public void setLocationCountry(String locationCountry) {
		this.locationCountry = locationCountry;
	}

	public String getUnitTemperature() {
		return this.unitTemperature;
	}

	public void setUnitTemperature(String unitTemperature) {
		this.unitTemperature = unitTemperature;
	}

	public String getUnitDistance() {
		return this.unitDistance;
	}

	public void setUnitDistance(String unitDistance) {
		this.unitDistance = unitDistance;
	}

	public String getUnitPressure() {
		return this.unitPressure;
	}

	public void setUnitPressure(String unitPressure) {
		this.unitPressure = unitPressure;
	}

	public String getUnitSpeed() {
		return this.unitSpeed;
	}

	public void setUnitSpeed(String unitSpeed) {
		this.unitSpeed = unitSpeed;
	}

	public Integer getWindChill() {
		return this.windChill;
	}

	public void setWindChill(Integer windChill) {
		this.windChill = windChill;
	}

	public Integer getWindDirection() {
		return this.windDirection;
	}

	public void setWindDirection(Integer windDirection) {
		this.windDirection = windDirection;
	}

	public Float getWindSpeed() {
		return this.windSpeed;
	}

	public void setWindSpeed(Float windSpeed) {
		this.windSpeed = windSpeed;
	}

	public Integer getAtmosphereHumidity() {
		return this.atmosphereHumidity;
	}

	public void setAtmosphereHumidity(Integer atmosphereHumidity) {
		this.atmosphereHumidity = atmosphereHumidity;
	}

	public Float getAtmosphereVisibility() {
		return this.atmosphereVisibility;
	}

	public void setAtmosphereVisibility(Float atmosphereVisibility) {
		this.atmosphereVisibility = atmosphereVisibility;
	}

	public Float getAtmospherePressure() {
		return this.atmospherePressure;
	}

	public void setAtmospherePressure(Float atmospherePressure) {
		this.atmospherePressure = atmospherePressure;
	}

	public Integer getAtmosphereRising() {
		return this.atmosphereRising;
	}

	public void setAtmosphereRising(Integer atmosphereRising) {
		this.atmosphereRising = atmosphereRising;
	}

	public String getAstronomySunrise() {
		return this.astronomySunrise;
	}

	public void setAstronomySunrise(String astronomySunrise) {
		this.astronomySunrise = astronomySunrise;
	}

	public String getAstronomySunset() {
		return this.astronomySunset;
	}

	public void setAstronomySunset(String astronomySunset) {
		this.astronomySunset = astronomySunset;
	}

	public BigDecimal getGeoLat() {
		return this.geoLat;
	}

	public void setGeoLat(BigDecimal geoLat) {
		this.geoLat = geoLat;
	}

	public BigDecimal getGeoLong() {
		return this.geoLong;
	}

	public void setGeoLong(BigDecimal geoLong) {
		this.geoLong = geoLong;
	}

	public String getConditionText() {
		return this.conditionText;
	}

	public void setConditionText(String conditionText) {
		this.conditionText = conditionText;
	}

	public String getConditionCode() {
		return this.conditionCode;
	}

	public void setConditionCode(String conditionCode) {
		this.conditionCode = conditionCode;
	}

	public Float getConditionTemp() {
		return this.conditionTemp;
	}

	public void setConditionTemp(Float conditionTemp) {
		this.conditionTemp = conditionTemp;
	}

	public String getConditionDate() {
		return this.conditionDate;
	}

	public void setConditionDate(String conditionDate) {
		this.conditionDate = conditionDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedondate() {
		return this.createdondate;
	}

	public void setCreatedondate(Date createdondate) {
		this.createdondate = createdondate;
	}

}
