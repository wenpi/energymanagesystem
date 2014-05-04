// 全息图中全局变量，用于具体建筑中的处理
var holo_cur_build = 'A1'; // 默认为A1楼
var holo_cur_floor = '1F'; // 默认为1F楼
var holo_floor_text = '一层'; // 默认为一层
// 全息图全景图鼠标悬浮的取值参数，分别是人数(暂时不要)、当日耗电量、当日耗冷量
var hologram_name = 'electricity,cooling_capacity', hologram_id = '', hologram_ispd = '0,0';

// 运行监测-全息图-园区全息图-建筑总体部分
var ect_name = 'electricity,t_oa'; // 建筑总体用电量name
var ect_id = 'total,outdoor_A1'; // 建筑总体用电量id
var ect_ispd = '0,0'; // 建筑总体用电量ispd
var ect_title = '建筑总体用电量'; // 建筑总体用电量图表标题
var ref_name = 'cooling_capacity'; // 建筑总体制冷量name
var ref_id = 'chiller'; // 建筑总体制冷量id
var ref_ispd = '0'; // 建筑总体制冷量ispd
var ref_title = '建筑总体制冷量'; // 建筑总体制冷量图表标题
var pas_name = 'passenger_flow_main_enter_number_of_people'; // 建筑总体客流量name
var pas_id = 'passenger_flow'; // 建筑总体客流量id
var pas_ispd = '0'; // 建筑总体客流量ispd
var pas_title = '建筑总体客流量'; // 建筑总体客流量图表标题

var a1_ect_name = 'electricity,t_oa'; // A1楼总体用电量name
var a1_ect_id = 'total_A1,outdoor_A1'; // A1楼总体用电量id
var a1_ect_ispd = '0,3'; // A1楼总体用电量ispd
var a1_ect_title = 'A1楼用电量'; // A1楼总体用电量图表标题
var a1_ref_name = 'cooling_capacity'; //A1楼总体制冷量name
var a1_ref_id = 'total_T1'; // A1楼总体制冷量id
var a1_ref_ispd = '0'; // A1楼总体制冷量ispd
var a1_ref_title = 'A1楼总体制冷量'; //A1楼总体制冷量图表标题
var a1_pas_name = 'passenger_flow_main_enter_number_of_people'; //A1楼总体客流量name
var a1_pas_id = 'passenger_flow'; // A1楼总体客流量id
var a1_pas_ispd = '0'; // A1楼总体客流量ispd
var a1_pas_title = 'A1楼总体客流量'; //A1楼总体客流量图表标题

var p1_ect_name = 'electricity,t_oa'; // p1楼总体用电量name
var p1_ect_id = 'total,outdoor_A1'; // p1楼总体用电量id
var p1_ect_ispd = '0,3'; // p1楼总体用电量ispd
var p1_ect_title = 'P1楼用电量'; // p1楼总体用电量图表标题
var p1_ref_name = 'cooling_capacity'; //p1楼总体制冷量name
var p1_ref_id = 'total_T1'; // p1楼总体制冷量id
var p1_ref_ispd = '0'; // p1楼总体制冷量ispd
var p1_ref_title = 'P1楼总体制冷量'; //p1楼总体制冷量图表标题
var p1_pas_name = 'passenger_flow_main_enter_number_of_people'; //p1楼总体客流量name
var p1_pas_id = 'passenger_flow'; // p1楼总体客流量id
var p1_pas_ispd = '0'; // p1楼总体客流量ispd
var p1_pas_title = 'P1楼总体客流量'; //p1楼总体客流量图表标题
	
var p2_ect_name = 'electricity,t_oa'; // p2楼总体用电量name
var p2_ect_id = 'total,outdoor_T1'; // p2楼总体用电量id
var p2_ect_ispd = '0,3'; // p2楼总体用电量ispd
var p2_ect_title = 'P2楼用电量'; // p2楼总体用电量图表标题
var p2_ref_name = 'cooling_capacity'; //p2楼总体制冷量name
var p2_ref_id = 'total_T1'; // p2楼总体制冷量id
var p2_ref_ispd = '0'; // p2楼总体制冷量ispd
var p2_ref_title = 'P2楼制冷量'; //p2楼总体制冷量图表标题
var p2_pas_name = 'passenger_flow_main_enter_number_of_people'; //p2楼总体客流量name
var p2_pas_id = 'passenger_flow'; // p2楼总体客流量id
var p2_pas_ispd = '0'; // p2楼总体客流量ispd
var p2_pas_title = 'P2楼客流量'; //p2楼总体客流量图表标题
	
var t1_ect_name = 'electricity,t_oa'; // T1楼总体用电量name
var t1_ect_id = 'total,outdoor_T1'; // T1楼总体用电量id
var t1_ect_ispd = '0,3'; // T1楼总体用电量ispd
var t1_ect_title = 'T1楼用电量'; // T1楼总体用电量图表标题
var t1_ref_name = 'cooling_capacity'; //T1楼总体制冷量name
var t1_ref_id = 'total_T1'; // T1楼总体制冷量id
var t1_ref_ispd = '0'; // T1楼总体制冷量ispd
var t1_ref_title = 'T1楼制冷量'; //T1楼总体制冷量图表标题
var t1_pas_name = 'passenger_flow_main_enter_number_of_people'; //T1楼总体客流量name
var t1_pas_id = 'passenger_flow'; // T1楼总体客流量id
var t1_pas_ispd = '0'; // T1楼总体客流量ispd
var t1_pas_title = 'T1楼客流量'; //T1楼总体客流量图表标题

var t2_ect_name = 'electricity,t_oa'; // T2楼总体用电量name
var t2_ect_id = 'total,outdoor_T2'; // T2楼总体用电量id
var t2_ect_ispd = '0,3'; // T2楼总体用电量ispd
var t2_ect_title = 'T2楼用电量'; // T2楼总体用电量图表标题
var t2_ref_name = 'cooling_capacity'; //T2楼总体制冷量name
var t2_ref_id = 'total_T2'; // T2楼总体制冷量id
var t2_ref_ispd = '0'; // T2楼总体制冷量ispd
var t2_ref_title = 'T2楼制冷量'; //T2楼总体制冷量图表标题
var t2_pas_name = 'passenger_flow_main_enter_number_of_people'; //T2楼总体客流量name
var t2_pas_id = 'passenger_flow'; // T2楼总体客流量id
var t2_pas_ispd = '0'; // T2楼总体客流量ispd
var t2_pas_title = 'T2楼客流量'; //T2楼总体客流量图表标题

var t3_ect_name = 'electricity,t_oa'; // T3楼总体用电量name
var t3_ect_id = 'total,outdoor_T3'; // T3楼总体用电量id
var t3_ect_ispd = '0,3'; // T3楼总体用电量ispd
var t3_ect_title = 'T3楼用电量'; // T3楼总体用电量图表标题
var t3_ref_name = 'cooling_capacity'; //T3楼总体制冷量name
var t3_ref_id = 'total_T1'; // T3楼总体制冷量id
var t3_ref_ispd = '0'; // T3楼总体制冷量ispd
var t3_ref_title = 'T3楼制冷量'; //T3楼总体制冷量图表标题
var t3_pas_name = 'passenger_flow_main_enter_number_of_people'; //T3楼总体客流量name
var t3_pas_id = 'passenger_flow'; // T3楼总体客流量id
var t3_pas_ispd = '0'; // T3楼总体客流量ispd
var t3_pas_title = 'T3楼客流量'; //T3楼总体客流量图表标题	
	
var t4_ect_name = 'electricity,t_oa'; // T4楼总体用电量name
var t4_ect_id = 'total,outdoor_T4'; // T4楼总体用电量id
var t4_ect_ispd = '0,3'; // T4楼总体用电量ispd
var t4_ect_title = 'T4楼用电量'; // T4楼总体用电量图表标题
var t4_ref_name = 'cooling_capacity'; //T4楼总体制冷量name
var t4_ref_id = 'total_T1'; // T4楼总体制冷量id
var t4_ref_ispd = '0'; // T4楼总体制冷量ispd
var t4_ref_title = 'T4楼制冷量'; //T4楼总体制冷量图表标题
var t4_pas_name = 'passenger_flow_main_enter_number_of_people'; //T4楼总体客流量name
var t4_pas_id = 'passenger_flow'; // T4楼总体客流量id
var t4_pas_ispd = '0'; // T4楼总体客流量ispd
var t4_pas_title = 'T4楼客流量'; //T4楼总体客流量图表标题
	
var t5_ect_name = 'electricity,t_oa'; // T5楼总体用电量name
var t5_ect_id = 'total,outdoor_T5'; // T5楼总体用电量id
var t5_ect_ispd = '0,3'; // T5楼总体用电量ispd
var t5_ect_title = 'T5楼用电量'; // T5楼总体用电量图表标题
var t5_ref_name = 'cooling_capacity'; //T5楼总体制冷量name
var t5_ref_id = 'total_T1'; // T5楼总体制冷量id
var t5_ref_ispd = '0'; // T5楼总体制冷量ispd
var t5_ref_title = 'T5楼制冷量'; //T5楼总体制冷量图表标题
var t5_pas_name = 'passenger_flow_main_enter_number_of_people'; //T5楼总体客流量name
var t5_pas_id = 'passenger_flow'; // T5楼总体客流量id
var t5_pas_ispd = '0'; // T5楼总体客流量ispd
var t5_pas_title = 'T5楼客流量'; //T5楼总体客流量图表标题

// 运行监测-全息图-建筑详情-全息图-层参数部分
var f_ele_name = 'electricity', f_ele_id = '1F', f_ele_ispd = '0'; // 层用电量相关属性
var f_temp_name = 't', f_temp_id = '1F', f_temp_ispd = '1'; // 层温度相关属性
var f_co2_name = 'electricity', f_co2_id = '1F', f_co2_ispd = '0'; // 层co2相关属性
var f_eqt_name = 'energy', f_eqt_id = 'total', f_eqt_ispd = '0'; // 楼层设备相关属性

//运行监测-全息图-建筑详情-全息图-区域参数部分
var r_region_id = '1_2_21';
var r_ele_name = 'electricity', r_ele_id = '1F', r_ele_ispd = '0'; // 建筑区域用电量相关属性
var r_temp_name = 'electricity', r_temp_id = '1F', r_temp_ispd = '0'; // 建筑区域平均温度相关属性
var r_co2_name = 'co2', r_co2_id = '1_2_21_A1', r_co2_ispd = '1'; // 区域co2浓度相关属性
