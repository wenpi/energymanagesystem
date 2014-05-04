var RiseTime;
var SetTime;

function  runSun(riseTime,setTime) {
	
	RiseTime=riseTime;
	SetTime=setTime;
	var canvas = document.getElementById("myCanvasTag");
	var context = canvas.getContext("2d"); 

	context.clearRect(0, 0, 330, 200)  ;// 清除圆弧区域，重新绘制

	var centerX = 150;
	var centerY = 80;
	var radius = 70;
	var lineWidth = 2;

	context.beginPath();
	var begin=RiseTime.split(":")[0];
	var end=SetTime.split(":")[0];
	if(end<12){
		end=end+12;
		console.log(end);
	}

	var num_ = Math.floor(Math.random()*12);
	var list_ = [];
	for(var i=begin;i<=end;i++){
		list_.push({hours:i,min:20,second:30});
	}
	
	var date=new Date();
	
	
	var nowMin=(date.getHours()-6)*60+date.getMinutes();
	
	var nowLength=centerX-radius+(2*radius)/(12*60)*nowMin;
	
	var ds=180*Math.asin((nowLength-centerX)/radius)/ Math.PI+90;
	
	if(nowLength<centerX){
		ds=90-180*Math.asin((centerX-nowLength)/radius)/ Math.PI;
	}
	
	context.arc(centerX, centerY, radius,Math.PI, Math.PI+Math.PI/180*ds, false);//
	context.lineTo(nowLength,centerY);
	context.lineWidth = lineWidth;
	context.fillStyle = "#534425";
	context.fill();
	
	context.beginPath();
	context.arc(centerX, centerY, radius,Math.PI+Math.PI/180*ds, 2*Math.PI, false);//
	context.lineWidth = lineWidth;
	context.fillStyle = "#373739";
	context.fill();
	
	for(var i=0; i<40; i++){
		context.beginPath();
		context.arc(centerX, centerY, radius,Math.PI+Math.PI/40*i, Math.PI+Math.PI/40*(i+1), false);
		context.lineWidth = lineWidth;
		if(i%2==0){
			context.strokeStyle = "#FFFFFF";
			context.stroke();
		}else{
			context.strokeStyle = "#373739";
			context.stroke();
		}
	}
	
	//水平线
	context.beginPath();
	context.moveTo(5,centerY); //指定一条线段的起点
	context.lineTo(295,centerY);
	context.lineWidth = lineWidth;
	context.strokeStyle = "#7B7A7F";
	context.stroke();
	
	// 太阳的位置
	var img = document.getElementById("sun_pic");
	if(nowLength<centerX){
		context.drawImage(img,nowLength-15,centerY-Math.sqrt(radius*radius-(centerX-nowLength)*(centerX-nowLength))-15);
	}else if(nowLength==centerX){
		context.drawImage(img,nowLength-15,centerY-radius-15);
	}else{
		context.drawImage(img,nowLength-15,centerY-Math.sqrt(radius*radius-(nowLength-centerX)*(nowLength-centerX))-15);
	}
	img.style.display = 'none';
	
	//左圆
	context.beginPath();
	context.arc(centerX-radius, centerY, 6, 0, 2*Math.PI, false);
	context.fillStyle = "#F9B51D";
	context.fill();
	
	//右圆
	context.beginPath();
	context.arc(centerX+radius, centerY, 6, 0, 2*Math.PI, false);
	context.fillStyle = "#F9B51D";
	context.fill();
	
	context.beginPath();
	context.font = "12px Arial";
	context.fillStyle = "#FFFFFF";
    context.fillText(RiseTime, centerX-radius-17, centerY+17);
	
	context.beginPath();
	context.font = "12px Arial";
	context.fillStyle = "#FFFFFF";
    context.fillText(SetTime, centerX+radius-17, centerY+17);
};
window.setInterval(function(){
	runSun(RiseTime,SetTime);
},1000); // 每隔一小时刷新一次

//初始化
function getWRIndex(WRIndex) {
	if (parseInt(WRIndex) <= 10) {
		WRIndex = WRIndex / 50 * 39 + 3;
	} else if (parseInt(WRIndex) <= 200 && parseInt(WRIndex) > 10) {
		WRIndex = WRIndex / 50 * 39;
	} else if (parseInt(WRIndex) <= 300 && parseInt(WRIndex) > 200) {
		WRIndex = WRIndex / 100 * 39 + 85 - 6;
	} else { // (WRIndex<500&&WRIndex>=200)
		WRIndex = WRIndex / 100 * 39 + 85 - 7;
	}
	$(".arrow").css("left", WRIndex);  
}