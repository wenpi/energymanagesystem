// 全息图中全局变量，用于具体建筑中的处理
var dev_floor_text = '一层'; // 默认为一层

//设备监测首页图name、id、ispd——编号代表小图位置
//冷机,冷冻水泵,冷却水泵,冷却塔（原型设备顺序）--一级数组
//开启**（原型设备顺序）--二级数组
var s_name_0=[['electricity','electricity','electricity'],['electricity','electricity','electricity'],['electricity','electricity','electricity'],['electricity','electricity','electricity']];
var s_id_0=[['total','total','total'],['total','total','total'],['total','total','total'],['total','total','total']];
var s_ispd_0=[[0,0,0],[0,0,0],[0,0,0],[0,0,0]];

// 锅炉房
var s_name_1=[['electricity','electricity','electricity'],['electricity','electricity','electricity'],['electricity','electricity','electricity']];
var s_id_1=[['total','total','total'],['total','total','total'],['total','total','total']];
var s_ispd_1=[[0,0,0],[0,0,0],[0,0,0]];

// 新风机组
var s_name_2=[['number_on','electricity','electricity'],
              ['number_on','electricity','electricity'],
              ['number_on','electricity_unit','cooling_capacity'],
              ['number_on','EERr','cooling_capacity'],
              ['number_on','number_on','electricity'],
              ['number_on','electricity','electricity'],
              ['number_on','electricity_unit','cooling_capacity'],
              ['number_on','EERr','cooling_capacity'],
              ['number_on','S7_temp_display_OUTDOOR_HUMIDITY','electricity'],
              ['number_on','electricity','electricity'],
              ['number_on','electricity_unit','cooling_capacity'],
              ['number_on','EERr','cooling_capacity']];
var s_id_2=[['ahu_total','total','total'],
            ['ahu_total','chiller_ice','hvac_pump'],
            ['ahu_total','hvac','chiller'],
            ['ahu_total','hvac','chiller'],
            ['ahu_total','chiller','total'],
            ['ahu_total','chiller_ice','hvac_pump'],
            ['ahu_total','hvac','chiller'],
            ['ahu_total','hvac','chiller'],
            ['ahu_total','chiller','total'],
            ['ahu_total','chiller_ice','hvac_pump'],
            ['ahu_total','hvac','chiller'],
            ['ahu_total','hvac','chiller']];
var s_ispd_2=[[3,0,0],
              [3,0,0],
              [3,0,0],
              [3,3,0],
              [3,3,0],
              [3,0,0],
              [3,0,0],
              [3,3,0],
              [3,3,0],
              [3,0,0],
              [3,0,0],
              [3,3,0]];
var all_build_list = ['A1', 'P1', 'P2', 'T1', 'T2', 'T3', 'T4', 'T5']; // 建筑列表
var coldSite_t_name = 'number_on,number_on,number_on,number_on', coldSite_t_id = 'chiller,chwp,cwp,ct', coldSite_t_ispd = '2,2,2,2'; // 冷机相关的开启台数
var boiler_t_name = 'number_on,number_on', boiler_t_id = 'boiler,hwp', boiler_t_ispd = '2,2'; // 锅炉房相关的开启台数
var ahu_t_name = 'number_on', ahu_t_id = 'fau', ahu_t_ispd = '2'; // 下方的新风机组开启台数
var fcu_t_name = 'number_on', fcu_t_id = 'fcu', fcu_t_ispd = '2'; // 下方的风机盘管开启台数
var sendWind_t_name = 'number_on', sendWind_t_id = 'sf', sendWind_t_ispd = '2'; // 下方的新风机组开启台数
var exhaustWind_t_name = 'number_on', exhaustWind_t_id = 'pf', exhaustWind_t_ispd = '2'; // 下方的新风机组开启台数
var light_t_name = 'number_on', light_t_id = 'lighting', light_t_ispd = '2'; // 下方的风机盘管开启台数

var ahu_build_id = 'A1'; // 记录新风机组点击的建筑，默认是A1
var ahu_detail_build = 'A1'; // 记录新风机组详情中点击的建筑，默认是A1
var ahu_detail_floor = 'JF'; // 记录新风机组详情中点击的楼层，默认是JF
var detail_floor = '1F'; // 记录照明回路详情中点击的楼层，默认是1F

// 冷站1_小图
var s_name_coldSite_one = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_coldSite_one = [['chiller_total_P1','total','total'],['chwp','total','total'],['cwp','total','total'],['ct','total','total']];
var s_ispd_coldSite_one = [[2,0,0],[0,0,0],[2,0,0],[2,0,0]];
// 冷站2_小图
var s_name_coldSite_two = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_coldSite_two = [['chiller_total_P2','total','total'],['chwp','total','total'],['cwp','total','total'],['ct','total','total']];
var s_ispd_coldSite_two = [[2,0,0],[0,0,0],[2,0,0],[2,0,0]];
// 冷站3_小图
var s_name_coldSite_three = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_coldSite_three = [['chiller_total_A1','total','total'],['chwp','total','total'],['cwp','total','total'],['ct','total','total']];
var s_ispd_coldSite_three = [[2,0,0],[0,0,0],[2,0,0],[2,0,0]];
// p1锅炉房_小图
var s_name_boiler_room_P1 = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_boiler_room_P1 = [['boiler','total','total'],['hwp','total','total'],['heat_exchanger','total','total']];
var s_ispd_boiler_room_P1 = [[2,0,0],[2,0,0],[2,0,0]];
// p2锅炉房_小图
var s_name_boiler_room_P2 = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_boiler_room_P2 = [['boiler','total','total'],['hwp','total','total'],['heat_exchanger','total','total']];
var s_ispd_boiler_room_P2 = [[2,0,0],[2,0,0],[2,0,0]];
// a1锅炉房_小图
var s_name_boiler_room_A1 = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_boiler_room_A1 = [['boiler','total','total'],['hwp','total','total'],['heat_exchanger','total','total']];
var s_ispd_boiler_room_A1 = [[2,0,0],[2,0,0],[2,0,0]];
// 新风机组_小图
var s_name_ahu = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_ahu = [['fau','total','total'],['fau','total','total'],['fau','total','total'],['fau','total','total'],['fau','total','total'],['fau','total','total'],['fau','total','total'],['fau','total','total']];
var s_ispd_ahu = [[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0]];
// 风机盘管_小图
var s_name_fcu = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_fcu = [['fcu','total','total'],['fcu','total','total'],['fcu','total','total'],['fcu','total','total'],['fcu','total','total'],['fcu','total','total'],['fcu','total','total'],['fcu','total','total']];
var s_ispd_fcu = [[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0]];
// 送风机_小图
var s_name_sendWind = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity_unit','cooling_capacity'],['number_on','EERr','cooling_capacity'],['number_on','S7_temp_display_OUTDOOR_HUMIDITY','electricity'],['number_on','electricity','electricity'],['number_on','electricity_unit','cooling_capacity'],['number_on','EERr','cooling_capacity']];
var s_id_sendWind = [['sf','total','total'],['sf','total','total'],['sf','hvac','chiller'],['sf','hvac','chiller'],['sf','chiller','total'],['sf','chiller_ice','hvac_pump'],['sf','hvac','chiller'],['sf','hvac','chiller']];
var s_ispd_sendWind = [[2,0,0],[2,0,0],[2,0,0],[2,3,0],[2,3,0],[2,0,0],[2,0,0],[2,3,0]];
// 排风机_小图
var s_name_exhaustWind = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity_unit','cooling_capacity'],['number_on','EERr','cooling_capacity'],['number_on','S7_temp_display_OUTDOOR_HUMIDITY','electricity'],['number_on','electricity','electricity'],['number_on','electricity_unit','cooling_capacity'],['number_on','EERr','cooling_capacity']];
var s_id_exhaustWind = [['pf','total','total'],['pf','total','total'],['pf','hvac','chiller'],['pf','hvac','chiller'],['pf','chiller','total'],['pf','chiller_ice','hvac_pump'],['pf','hvac','chiller'],['pf','hvac','chiller']];
var s_ispd_exhaustWind = [[2,0,0],[2,0,0],[2,0,0],[2,3,0],[2,3,0],[2,0,0],[2,0,0],[2,3,0]];
// 照明回路_小图
var s_name_light = [['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity'],['number_on','electricity','electricity']];
var s_id_light = [['lighting','total','total'],['lighting','total','total'],['lighting','total','total'],['lighting','total','total'],['lighting','total','total'],['lighting','total','total'],['lighting','total','total'],['lighting','total','total']];
var s_ispd_light = [[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0],[2,0,0]];

// 冷机总台数
var coldSite_oneTemp = [{name : '冷机',total : 6,current : 3}, 
			              {name : '冷冻水泵',total : 7,current : 3}, 
			              {name : '冷却水泵',total : 7,current : 3},
			              {name : '冷却塔',total : 10,current : 3}];
// 冷站2 | 常规制冷系统
var coldSite_twoTemp = [{name : '冷机',total : 4,current : 3}, 
			              {name : '冷冻水泵',total : 5,current : 3}, 
			              {name : '冷却水泵',total : 5,current : 3}, 
			              {name : '冷却塔',total : 10,current : 3}];
// 冷站3 | 常规制冷系统
var coldSite_threeTemp = [{name : '冷机',total : 3,current : 3}, 
			                {name : '冷冻水泵',total : 4,current : 3}, 
			                {name : '冷却水泵',total : 4,current : 3}, 
			                {name : '冷却塔',total : 5,current : 3}];

// 锅炉房			                
var boiler_room_P1Temp = [{name : '锅炉',total : 2,current : 1}, 
			                 {name : '热水泵',total : 3,current : 3}];
var boiler_room_P2Temp = [{name : '锅炉',total : 2,current : 1}, 
			                 {name : '热水泵',total : 3,current : 3}];
var boiler_room_A1Temp = [{name : '锅炉',total : 2,current : 1}, 
			                 {name : '热水泵',total : 3,current : 3}];
// 新风机组总台数
var ahuTemp =  [{name : 'A1号楼',total : 7}, 
			    {name : 'P1号楼',total : 0}, 
			    {name : 'P2号楼',total : 0}, 
			    {name : 'T1号楼',total : 6}, 
			    {name : 'T2号楼',total : 6}, 
			    {name : 'T3号楼',total : 10}, 
			    {name : 'T4号楼',total : 6}, 
			    {name : 'T5号楼',total : 6}];
// 送风机总台数
var sendWindTemp = [{name : 'A1号楼', total : 7},
	    		  {name : 'P1号楼', total : 3},
	    		  {name : 'P2号楼', total : 3},
	    		  {name : 'T1号楼', total : 0},
	    		  {name : 'T2号楼', total : 4},
	    		  {name : 'T3号楼', total : 0},
	    		  {name : 'T4号楼', total : 0},
	    		  {name : 'T5号楼', total : 4}];
// 排风机总台数
var exhaustWindTemp = [{name : 'A1号楼', total : 12},
						 {name : 'P1号楼', total : 8},
						 {name : 'P2号楼', total : 8},
						 {name : 'T1号楼', total : 2},
						 {name : 'T2号楼', total : 0},
						 {name : 'T3号楼', total : 5},
						 {name : 'T4号楼', total : 6}, 
						 {name : 'T5号楼', total : 0}];

var lightTemp = [{name : 'A1号楼',total : 7, current : 4}, 
				 {name : 'P1号楼',total : 0, current : 0}, 
				 {name : 'P2号楼',total : 0, current : 0}, 
				 {name : 'T1号楼',total : 6, current : 3}, 
				 {name : 'T2号楼',total : 6, current : 2}, 
				 {name : 'T3号楼',total : 10, current : 6}, 
				 {name : 'T4号楼',total : 6, current : 1}, 
				 {name : 'T5号楼',total : 6, current : 5}];

var fcuTemp = [{name : 'A1号楼',total : 7, current : 4}, 
				 {name : 'P1号楼',total : 0, current : 0}, 
				 {name : 'P2号楼',total : 0, current : 0}, 
				 {name : 'T1号楼',total : 6, current : 3}, 
				 {name : 'T2号楼',total : 6, current : 2}, 
				 {name : 'T3号楼',total : 10, current : 6}, 
				 {name : 'T4号楼',total : 6, current : 1}, 
				 {name : 'T5号楼',total : 6, current : 5}];


// 图一详细
// 运行状态--设备顺序 冷机,水系统,冷冻水泵,冷却水泵,冷却塔
var detail_0_up_name=[['electricity','electricity,electricity,electricity','cop,EERs_unit,EERr_unit,WTFcw_unit','S_output_base_cooling_pump_1_run,S_output_base_cooling_pump_2_run,S_output_base_cooling_pump_3_run,S_output_base_cooling_pump_4_run',''],
                      ['electricity','electricity,electricity,electricity','cop,EERs_unit,EERr_unit,WTFcw_unit',''],
                      ['electricity','electricity,electricity,electricity','cop,EERs_unit,EERr_unit,WTFcw_unit',''],
                      ['electricity','electricity,electricity,electricity','cop,EERs_unit,EERr_unit,WTFcw_unit','']];
var detail_0_up_id=[['hvac','hvac,lighting,datacenter','chiller,hvac,hvac,cwp','chiller,chiller,chiller,chiller',''],
                    ['hvac','hvac,lighting,datacenter','chiller,hvac,hvac,cwp',''],
                    ['hvac','hvac,lighting,datacenter','chiller,hvac,hvac,cwp',''],
                    ['hvac','hvac,lighting,datacenter','chiller,hvac,hvac,cwp','']];
var detail_0_up_ispd=[['0','0,0,0','3,3,3,3','2,2,2,2',''],
                      ['0','0,0,0','3,3,3,3',''],
                      ['0','0,0,0','3,3,3,3',''],
                      ['0','0,0,0','3,3,3,3','']];
var detail_0_up_yTtile=[['开启台数','开启台数','负载率（%）,COP','冷机1#,冷机2#,冷机3#,冷机4#',''],
                        ['开启台数','开启台数','冷机1#,冷机2#,冷机3#,冷机4#',''],
                        ['开启台数','开启台数','冷机1#,冷机2#,冷机3#,冷机4#',''],
                        ['开启台数','开启台数','冷机1#,冷机2#,冷机3#,冷机4#','']];//y轴标题
var detail_0_up_expColumnName=[[],
                               [],
                               [],
                               []];//导出Excel文件头列名
var detail_0_up_legendList=[['开启台数','最大开启台数,最小开启台数,平均开启台数','冷机1#,冷机2#,冷机3#,冷机4#,COP','',''],
                            ['开启台数','最大开启台数,最小开启台数,平均开启台数','',''],
                            ['开启台数','最大开启台数,最小开启台数,平均开启台数','',''],
                            ['开启台数','最大开启台数,最小开启台数,平均开启台数','','']];//图例列表
//设备详情
var detail_0_down_name=['energy,electricity,electricity,electricity'];
var detail_0_down_id=['total,total,total,hvac'];
var detail_0_down_ispd=['0,0,0,0'];
var detail_0_down_yTtile=['参数1,参数2,参数3,参数4'];//y轴标题
var detail_0_down_description=[[],[],[],[],[]];//图例列表
var detail_0_down_title=[[],[],[],[],[]];//导出文件名称
var detail_0_down_expColumnName=[[],[],[],[],[]];//导出Excel文件头列名
var detail_0_down_legendList=[[],[],[],[],[]];//图例列表

// 冷站详情-冷水机组-冷冻水参数
var detail_coldSiteColdParam_name = 't_chw_s,t_chw_r,t_evap'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_coldSiteColdParam_id = 'K_1_01_YL,K_1_01_YL,K_1_02_YL'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_coldSiteColdParam_ispd = '1,1,1'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
// 冷站详情-冷水机组-冷却水参数
var detail_coldSiteCoolParam_name = 't_cw_s,t_cw_r,t_cond'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_coldSiteCoolParam_id = 'K_1_01_YL,K_1_01_YL,K_1_02_YL'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_coldSiteCoolParam_ispd = '1,1,1'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
// 冷站详情-水流量-水流量
var detail_waterFlow_name = 'flow_chw,flow_chw,flow_chw,flow_chw'; // 分别是冷冻水流量
var detail_waterFlow_id = 'total_T1,total_T2,total_T3,total_T4'; // 分别是冷冻水流量
var detail_waterFlow_ispd = '1,1,1,1'; // 分别是冷冻水流量
// 冷站详情-水流量-压力
var detail_waterPressure_name = 't_ra'; // 分别是水系统压力
var detail_waterPressure_id = 'K_1_01_YL'; // 分别是水系统压力
var detail_waterPressure_ispd = '1'; // 分别是水系统压力
// 冷站详情-水流量-冷冻水参数(目前只有冷冻水回水温度)
var detail_waterColdParam_name = 't_chw_r,t_chw_r,t_chw_r,t_chw_r'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_waterColdParam_id = 'total_T1,total_T2,total_T3,total_T4'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
var detail_waterColdParam_ispd = '1,1,1,1'; // 分别是冷冻水供水温度、冷冻水回水温度、蒸发温度
// 冷站详情-水流量-冷却水参数
var detail_waterCoolParam_name = 't_ra,t_ra,t_sa_sp'; // 分别是冷却水供水温度、冷却水回水温度、冷凝温度
var detail_waterCoolParam_id = 'K_1_01_YL,K_1_02_YL,K_1_01_YL'; // 分别是冷却水供水温度、冷却水回水温度、冷凝温度
var detail_waterCoolParam_ispd = '1,1,1'; // 分别是冷却水供水温度、冷却水回水温度、冷凝温度
// 冷站详情-冷却塔-风机频率
var detail_towerWindFrequency_name = 't_ra'; 
var detail_towerWindFrequency_id = 'K_1_01_YL'; 
var detail_towerWindFrequency_ispd = '1'; 
// 冷站详情-冷却塔-冷却水参数
var detail_towerCoolParam_name = 't_ra,t_ra'; // 分别是冷却水供水温度、冷却水回水温度
var detail_towerCoolParam_id = 'K_1_01_YL,K_1_02_YL'; // 分别是冷却水供水温度、冷却水回水温度
var detail_towerCoolParam_ispd = '1,1'; // 分别是冷却水供水温度、冷却水回水温度

// 锅炉房-冷冻水参数
var detail_hotWaterParam_name = 't_hw_s,t_hw_r'; // 分别是热水供水温度、热水回水温度
var detail_hotWaterParam_id = 'boiler_P1_1,boiler_P1_2'; // 分别是热水供水温度、热水回水温度
var detail_hotWaterParam_ispd = '1,1'; // 分别是热水供水温度、热水回水温度

// 照明系统-照明回路
var detail_lightOpenNum_name = 'number_on'; // 分别是开启台数
var lightOpenNum_id = 'lighting'; // 分别是开启台数
var detail_lightOpenNum_id = lightOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build; // 分别是开启台数
var detail_lightOpenNum_ispd = '2'; // 分别是开启台数
// 照明灯具个数 
var lightHash = new HashMap();
lightHash.put("A1", 3169);
lightHash.put("P1", 0);
lightHash.put("P2", 0);
lightHash.put("T1", 2624);
lightHash.put("T2", 3008);
lightHash.put("T3", 3217);
lightHash.put("T4", 3152);
lightHash.put("T5", 3088);

var light_A1 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 465}, 
				 {name : '3F', total : 528}, 
				 {name : '4F', total : 656}, 
				 {name : '5F', total : 720}, 
				 {name : '6F', total : 720}, 
				 {name : '7F', total : 80}];
				 
var light_T1 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 0}, 
				 {name : '3F', total : 592}, 
				 {name : '4F', total : 656}, 
				 {name : '5F', total : 720}, 
				 {name : '6F', total : 656}];
				 
var light_T2 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 0}, 
				 {name : '3F', total : 784}, 
				 {name : '4F', total : 784}, 
				 {name : '5F', total : 720}, 
				 {name : '6F', total : 720}];
				 
var light_T3 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 209}, 
				 {name : '3F', total : 528}, 
				 {name : '4F', total : 784}, 
				 {name : '5F', total : 848}, 
				 {name : '6F', total : 848}];
				 
var light_T4 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 592}, 
				 {name : '3F', total : 592}, 
				 {name : '4F', total : 656}, 
				 {name : '5F', total : 656}, 
				 {name : '6F', total : 656}];
				 
var light_T5 =  [{name : '1F', total : 0}, 
				 {name : '2F', total : 592}, 
				 {name : '3F', total : 528}, 
				 {name : '4F', total : 656}, 
				 {name : '5F', total : 656}, 
				 {name : '6F', total : 656}];
				 

// 空调系统-风机盘管
var detail_fcuOpenNum_name = 'number_on'; // 分别是开启台数
var fcuOpenNum_id = 'fcu'; // 分别是开启台数
var detail_fcuOpenNum_id = fcuOpenNum_id + "_" + detail_floor + "_" + ahu_detail_build; // 分别是开启台数
var detail_fcuOpenNum_ispd = '2'; // 分别是开启台数
// 风机盘管灯具个数
var fcuHash = new HashMap();
fcuHash.put("A1", 695);
fcuHash.put("P1", 0);
fcuHash.put("P2", 0);
fcuHash.put("T1", 609);
fcuHash.put("T2", 545);
fcuHash.put("T3", 726);
fcuHash.put("T4", 701);
fcuHash.put("T5", 704);

var fcu_A1 =  [{name : '1F', total : 34}, 
				 {name : '2F', total : 60}, 
				 {name : '3F', total : 113}, 
				 {name : '4F', total : 126}, 
				 {name : '5F', total : 122}, 
				 {name : '6F', total : 125}, 
				 {name : '7F', total : 115}];
				 
var fcu_T1 =  [{name : '1F', total : 10}, 
				 {name : '2F', total : 116}, 
				 {name : '3F', total : 108}, 
				 {name : '4F', total : 124}, 
				 {name : '5F', total : 132}, 
				 {name : '6F', total : 119}];
				 
var fcu_T2 =  [{name : '1F', total : 73}, 
				 {name : '2F', total : 28}, 
				 {name : '3F', total : 152}, 
				 {name : '4F', total : 12}, 
				 {name : '5F', total : 147}, 
				 {name : '6F', total : 133}];
				 
var fcu_T3 =  [{name : '1F', total : 61}, 
				 {name : '2F', total : 86}, 
				 {name : '3F', total : 112}, 
				 {name : '4F', total : 157}, 
				 {name : '5F', total : 154}, 
				 {name : '6F', total : 156}];
				 
var fcu_T4 =  [{name : '1F', total : 44}, 
				 {name : '2F', total : 123}, 
				 {name : '3F', total : 126}, 
				 {name : '4F', total : 134}, 
				 {name : '5F', total : 134}, 
				 {name : '6F', total : 140}];
				 
var fcu_T5 =  [{name : '1F', total : 47}, 
				 {name : '2F', total : 123}, 
				 {name : '3F', total : 126}, 
				 {name : '4F', total : 134}, 
				 {name : '5F', total : 134}, 
				 {name : '6F', total : 140}];
				 
//图二详细
//运行状态--设备顺序 锅炉、热水泵、换热器
var detail_1_up_name=[[],[],[]];
var detail_1_up_id=[[],[],[]];
var detail_1_up_ispd=[[],[],[]];
var detail_1_up_yTtile=[[],[],[]];//y轴标题
var detail_1_up_title=[[],[],[]];//导出文件名称
var detail_1_up_expColumnName=[[],[],[]];//导出Excel文件头列名
var detail_1_up_legendList=[[],[],[]];//图例列表
//设备详情
var detail_1_down_name=[[],[],[]];
var detail_1_down_id=[[],[],[]];
var detail_1_down_ispd=[[],[],[]];
var detail_1_down_yTtile=[[],[],[]];//y轴标题
var detail_1_down_description=[[],[],[]];//图例列表
var detail_1_down_title=[[],[],[]];//导出文件名称
var detail_1_down_expColumnName=[[],[],[]];//导出Excel文件头列名
var detail_1_down_legendList=[[],[],[]];//图例列表

//图三详细
//运行状态--设备顺序 A1、P1、P2、T1、T2、T3、T4、T5
var detail_yxts_name = 'number_on'; // 运行台数
var detail_yxts_id_fau = 'fau'; // 新风机组运行台数
var detail_yxts_id_chiller = 'chiller'; // 冷机运行台数
var detail_yxts_id_sendWind = 'sf'; // 送风机运行台数
var detail_yxts_id_exhaustWind = 'pf'; // 排风机运行台数
var detail_yxts_ispd = '2'; // 运行台数
var detail_yxts_type = 'day'; // 运行台数类型
var detail_yxts_starttime = ''; // 运行台数开始时间

// 送回风温度参数
var detail_wind_type = 'day'; // 运行台数类型
var detail_wind_starttime = ''; // 运行台数开始时间
//var detail_wind_name = 't_sa,t_ra,t_ra,t_sa_sp'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
//var detail_wind_id = 'K_1_01_YL,K_1_01_YL,K_1_02_YL,K_1_01_YL'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
//var detail_wind_ispd = '1,1,1,1'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
// 送风温度参数
var detail_windTempParam_name = 't_sa,t_ra'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
var detail_windTempParam_id = 'K_1_01_YL,K_1_01_YL'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
var detail_windTempParam_ispd = '1,1'; // 分别是送风温度、回风温度、新风温度、送风温度设定值
// 回风湿度参数
var detail_windHumpParam_name = 'rh_ra,rh_sa'; // 分别是送风湿度、回风湿度
var detail_windHumpParam_id = 'K_1_01_YL,K_1_04_YL'; // 分别是送风湿度、回风湿度 zzx?
var detail_windHumpParam_ispd = '1,1'; // 分别是送风湿度、回风湿度
// 水阀开度
var detail_waterOpen_name = 'u_valve_cc_sp,u_valve_hc'; // 分别是冷水阀开度、热水阀开度
var detail_waterOpen_id = 'K_1_01_YL,K_1_01_YL'; // 分别是送风湿度、回风湿度 zzx?
var detail_waterOpen_ispd = '1,1'; // 分别是送风湿度、回风湿度
// 风机频率
var detail_fanFrequency_name = 'frequency_sf,frequency_sf'; // 分别是送风机频率、回风机频率
var detail_fanFrequency_id = 'X_3_01_YL,X_3_02_YL'; // 分别是送风机频率、回风机频率
var detail_fanFrequency_ispd = '1,1'; // 分别是送风湿度、回风湿度

// 送排风机
var detail_runFrequency_name = 'frequency_sf'; // 分别是运行频率
var detail_runFrequency_id = 'X_3_04_BJ'; // 分别是运行频率
var detail_runFrequency_ispd = '1'; // 分别是运行频率

var detail_runningWind_name = 'rh_ra,rh_ra'; // 分别是扬尘、流量
var detail_runningWind_id = 'K_1_01_YL,K_1_04_YL'; // 分别是扬尘、流量 zzx?
var detail_runningWind_ispd = '1,1'; // 分别是扬尘、流量

var detail_2_up_name=[[''],[],[],[],[],[],[],[]]; // 运行台数
var detail_2_up_id=[['total'],[],[],[],[],[],[],[]];
var detail_2_up_ispd=[['0'],[],[],[],[],[],[],[]];
var detail_2_up_yTtile=[['开启台数'],[],[],[],[],[],[],[]];//y轴标题
var detail_2_up_title=[['开启台数'],[],[],[],[],[],[],[]];//导出文件名称
var detail_2_up_expColumnName=[['开启台数'],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_2_up_legendList=[['开启台数'],[],[],[],[],[],[],[]];//图例列表
//设备详情
var detail_2_down_name=[[],[],[],[],[],[],[],[]];
var detail_2_down_id=[[],[],[],[],[],[],[],[]];
var detail_2_down_ispd=[[],[],[],[],[],[],[],[]];
var detail_2_down_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_2_down_description=[[],[],[],[],[],[],[],[]];//图例列表
var detail_2_down_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_2_down_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_2_down_legendList=[[],[],[],[],[],[],[],[]];//图例列表


//图四详细
//运行状态--设备顺序 冷机,水系统,冷冻水泵,冷却水泵,冷却塔
var detail_3_up_name=[[],[],[],[],[]];
var detail_3_up_id=[[],[],[],[],[]];
var detail_3_up_ispd=[[],[],[],[],[]];
var detail_3_up_yTtile=[[],[],[],[],[]];//y轴标题
var detail_3_up_title=[[],[],[],[],[]];//导出文件名称
var detail_3_up_expColumnName=[[],[],[],[],[]];//导出Excel文件头列名
var detail_3_up_legendList=[[],[],[],[],[]];//图例列表
//设备详情
var detail_3_down_name=[[],[],[],[],[]];
var detail_3_down_id=[[],[],[],[],[]];
var detail_3_down_ispd=[[],[],[],[],[]];
var detail_3_down_yTtile=[[],[],[],[],[]];//y轴标题
var detail_3_down_description=[[],[],[],[],[]];//图例列表
var detail_3_down_title=[[],[],[],[],[]];//导出文件名称
var detail_3_down_expColumnName=[[],[],[],[],[]];//导出Excel文件头列名
var detail_3_down_legendList=[[],[],[],[],[]];//图例列表

//图五详细
//运行状态--设备顺序 A1、P1、P2、T1、T2、T3、T4、T5
var detail_4_up_name=[[],[],[],[],[],[],[],[]];
var detail_4_up_id=[[],[],[],[],[],[],[],[]];
var detail_4_up_ispd=[[],[],[],[],[],[],[],[]];
var detail_4_up_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_4_up_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_4_up_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_4_up_legendList=[[],[],[],[],[],[],[],[]];//图例列表
//设备详情
var detail_4_down_name=[[],[],[],[],[],[],[],[]];
var detail_4_down_id=[[],[],[],[],[],[],[],[]];
var detail_4_down_ispd=[[],[],[],[],[],[],[],[]];
var detail_4_down_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_4_down_description=[[],[],[],[],[],[],[],[]];//图例列表
var detail_4_down_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_4_down_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_4_down_legendList=[[],[],[],[],[],[],[],[]];//图例列表

//图六详细
//运行状态--设备顺序 A1、P1、P2、T1、T2、T3、T4、T5
var detail_5_up_name=[[],[],[],[],[],[],[],[]];
var detail_5_up_id=[[],[],[],[],[],[],[],[]];
var detail_5_up_ispd=[[],[],[],[],[],[],[],[]];
var detail_5_up_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_5_up_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_5_up_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_5_up_legendList=[[],[],[],[],[],[],[],[]];//图例列表
//设备详情
var detail_5_down_name=[[],[],[],[],[],[],[],[]];
var detail_5_down_id=[[],[],[],[],[],[],[],[]];
var detail_5_down_ispd=[[],[],[],[],[],[],[],[]];
var detail_5_down_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_5_down_description=[[],[],[],[],[],[],[],[]];//图例列表
var detail_5_down_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_5_down_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_5_down_legendList=[[],[],[],[],[],[],[],[]];//图例列表

//图七详细
//运行状态--设备顺序 A1、P1、P2、T1、T2、T3、T4、T5
var detail_6_up_name=[[],[],[],[],[],[],[],[]];
var detail_6_up_id=[[],[],[],[],[],[],[],[]];
var detail_6_up_ispd=[[],[],[],[],[],[],[],[]];
var detail_6_up_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_6_up_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_6_up_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_6_up_legendList=[[],[],[],[],[],[],[],[]];//图例列表
//设备详情
var detail_6_down_name=[[],[],[],[],[],[],[],[]];
var detail_6_down_id=[[],[],[],[],[],[],[],[]];
var detail_6_down_ispd=[[],[],[],[],[],[],[],[]];
var detail_6_down_yTtile=[[],[],[],[],[],[],[],[]];//y轴标题
var detail_6_down_description=[[],[],[],[],[],[],[],[]];//图例列表
var detail_6_down_title=[[],[],[],[],[],[],[],[]];//导出文件名称
var detail_6_down_expColumnName=[[],[],[],[],[],[],[],[]];//导出Excel文件头列名
var detail_6_down_legendList=[[],[],[],[],[],[],[],[]];//图例列表