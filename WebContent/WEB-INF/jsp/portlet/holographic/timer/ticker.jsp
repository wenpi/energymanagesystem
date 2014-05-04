<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<script type="text/javascript">
 
var activeFunction="";
function setActiveFunction(func){
	//alert(func);
	activeFunction=func;
};
function doRefresh(){
	//alert(activeFunction);
	switch(activeFunction){
		
		case "cm" :
			coolerMachineClick();
			break;
			
		case "ws" :
			waterSysClick();
			break;
		case "cp" :
			coolingPumpClick();
			break;
		case "sp" :
			sealPumpClick();
			break;
		case "ct" :
			coolingTowerClick();
			break;
		case "ahu" :
			queryAHUData();
			break;
		case "fau" :
			queryFAUData();
			break;
		case "acu" :
			queryACUData();
			break;
		case "holoOverView" :
			
			break;
		case "holoDetail" :
			initHoloDetailGraphic();
			break;
		case "main" :
			equipmentDetectionDataInit() ;
			break;
		default: break; 
	};
};

window.setInterval(doRefresh(),50000);
 
</script>