package com.managementsystem.energy.portlet.holographic.constants;

/**  
对应接口的name字段
 @author allchin
 modified@2013年8月19日  上午9:49:39
 */
public interface ServiceNames {
	 
	
	/**
	 * ACU启停状态
	 */
	String acuState="status_sf";
	String acuSupplyWindTemp="t_sa";
	String acuRtnWindTemp="t_ra";
	String acuSupplyHumidity="rh_sa";
	/**
	 * 送风机启停状态
	 */ 
	String  fanState="status_sf";
	/**
	 * 排风机启停状态
	 */
	String exhuastFan="status_ef";
	
	/**
	 * 冷却塔启停状态
	 */
	String towerState="status_fan_ct";
	 
	/**
	 * 冷却塔供水温度
	 */
	String towerSupplyWaterTemp="t_cw_supply_ct";
	/**
	 * 冷却塔回水温度
	 */
	String towerRtnWaterTemp="t_cw_return_ct";
	
	/**
	 * 冷冻泵启停频率
	 */
	String sealmPumpRate="frequency_chwp";
	/**
	 * 冷冻泵开关状态
	 */
	String sealmState="status_chwp";
	
	
	
	
	/**
	 * 水系统冷冻水流量 
	 */
	String waterSysSupplyWaterVolumn="q_chw";
	/**
	 * 水系统冷冻水供水温度
	 */
	String waterSysSupplyWaterTemp="t_chw_supply";
	/**
	 * 水系统冷冻水回水温度
	 */
	String waterSysRtnWaterTemp="t_chw_return";
	/**
	 * 水系统冷却水供水温度
	 */
	String waterSysCoolingSupplyWaterTemp="t_cw_supply";
	/**
	 * 水系统冷却水回水温度
	 */
	String waterSysCoolingRtnWaterTemp="t_cw_return";
	
	
	/**
	 * 冷机启停状态 
	 */
	String coolMachineState="status_chiller";
	/**
	 *冷机冷却水供水温度 
	 */
	String coolMachineCoolSplWaterTemp="LJYK_DDC_2_CWP_CWS_T";
	/**
	 * 冷机冷却水回水温度
	 */
	String coolMachineCoolRtnWaterTemp="LJYK_DDC_2_CWP_CWR_T";
	/**
	 * 冷机冷冻水供水温度
	 */
	String coolMachineSealmSplWaterTemp="LJYK_DDC_2_CHWP_CCHWS_T";
	/**
	 * 冷机 冻水回水温度
	 */
	String coolMachineSealmRtnWaterTemp="LJYK_DDC_2_CHWP_CCHWR_T";
	 
	
	/**
	 * ahu启停状态
	 */
	String ahuState="status_sf";
	/**
	 * ahu供风温度
	 */
	String ahuSplWindTemp="t_sa";
	/**
	 * ahu回风温度
	 */
	String ahuRtnWindTemp="t_ra";
	/**
	 * ahu回风湿度
	 */
	String ahuRtnHumility="rh_ra";
	
	
	/**
	 * 室内平均温度
	 */
	String indoorTemp="t_indoor";
	/**
	 * 室外平均温度
	 */
	String outdoorTemp="t_outdoor";
	
	/**
	 * 耗冷量
	 */
	String coolingCapacity="cooling_capacity";
	/**
	 * 耗电量
	 */
	String elecCapacity="electricity_total";
	 
	/**
	 *  空调机组 -FAU启停状态,新风箱
	 */
	String fauState="status_sf";
	/**
	 * fau送风温度
	 */
	String fauSplWindTemp="t_sa";
	/**
	 * fau送风湿度
	 */
	String fauSplWindHumidity="humidity_supply_fahu";
	
	/**
	 *  空调机组 -FcU启停状态
	 */
	String fcuState="status_fcu";
	/**
	 * fcu送风温度
	 */
	String fcuSplWindTemp="t_supply_fcu";
	/**
	 * fcu回风温度
	 */
	String fcuRtnWindTemp="t_return_fcu";
	 
	
	/**
	 *  空调机组 -vav启停状态
	 */
	String vavState="status_vav";
	/**
	 * vav 送风温度
	 */
	String vavSplWindTemp="t_supply_vav";
	/**
	 * vav 回风温度
	 */
	String vavRtnWindTemp="t_return_vav";
	
	
	
}
