var begin=7/12;
var end=29/12;
var lang=11/6;
var width=12;
var canB1;
var canM1;
var canT1;
var Olddata1;
var Newdata1;
var base1;
var colB1;
var cole1;
var incre1;
var canB2;
var canM2;
var canT2;
var Olddata2;
var Newdata2;
var base2;
var colB2;
var cole2;
var incre2;
var canB3;
var canM3;
var canT3;
var Olddata3;
var Newdata3;
var base3;
var colB3;
var cole3;
var incre3;
var count;//全局计数

//底层id 初始化id 自增id 累计数距 初始化数据 左上角颜色 右下角颜色
//1-3用电量；4-6用水量；7-9用气量
function getCircles(
	can1,can2,can3,data10,data11,color10,color11,
	can4,can5,can6,data20,data21,color20,color21,
	can7,can8,can9,data30,data31,color30,color31){
canB1=can1;
canM1=can2;
canT1=can3;
Olddata1=data10;
Newdata1=data11;
base1=data11;
colB1=color10;
colE1=color11;

canB2=can4;
canM2=can5;
canT2=can6;
Olddata2=data20;
Newdata2=data21;
base2=data21;
colB2=color20;
colE2=color21;

canB3=can7;
canM3=can8;
canT3=can9;
Olddata3=data30;
Newdata3=data31;
base3=data31;
colB3=color30;
colE3=color31;
count=0;
drawBottom();
}
function drawBottom(){
	var canvas=document.getElementById(canB1);//底环
	var e=(2+5/12);//底环结束弧度
	//画底层环1
	var context1=canvas.getContext("2d");
	context1.clearRect(0,0,200,200);
	context1.beginPath();
	context1.arc(100,90,70,begin*Math.PI,e*Math.PI,false);
	context1.lineWidth=width;//环宽
	context1.strokeStyle = "#C0C0C0";//环色
	context1.stroke();
	canvas=document.getElementById(canB2);//底环
	//画底层环2
	var context2=canvas.getContext("2d");
	context2.clearRect(0,0,200,200);
	context2.beginPath();
	context2.arc(100,90,70,begin*Math.PI,e*Math.PI,false);
	context2.lineWidth=width;//环宽
	context2.strokeStyle = "#C0C0C0";//环色
	context2.stroke();
	canvas=document.getElementById(canB3);//底环
	//画底层环3
	var context3=canvas.getContext("2d");
	context3.clearRect(0,0,200,200);
	context3.beginPath();
	context3.arc(100,90,70,begin*Math.PI,e*Math.PI,false);
	context3.lineWidth=width;//环宽
	context3.strokeStyle = "#C0C0C0";//环色
	context3.stroke();
	circleInit();
}

function circleInit(){
	count=count+1;//全局计数+1
	
	var canvas1=document.getElementById(canM1);//表层环
	var e1=Newdata1/Olddata1*lang/200;//把应画的圆环（r*L）分为200份
	var context1=canvas1.getContext("2d");
	context1.clearRect(0,0,200,200);//清理背景
	context1.beginPath();
	context1.arc(100,90,70,begin*Math.PI,(begin+e1*count)*Math.PI,false);
	context1.lineWidth=width;//环宽
	var grd1=context1.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd1.addColorStop(0,colB1);//起始颜色
	grd1.addColorStop(1,colE1);//结束颜色
	context1.strokeStyle = grd1;//环色
	context1.stroke();
	
	canvas1=document.getElementById(canM2);//表层环
	var e2=Newdata2/Olddata2*lang/200;//把应画的圆环（r*L）分为200份
	var context2=canvas1.getContext("2d");
	context2.clearRect(0,0,200,200);//清理背景
	context2.beginPath();
	context2.arc(100,90,70,begin*Math.PI,(begin+e2*count)*Math.PI,false);
	context2.lineWidth=width;//环宽
	var grd2=context1.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd2.addColorStop(0,colB2);//起始颜色
	grd2.addColorStop(1,colE2);//结束颜色
	context2.strokeStyle = grd2;//环色
	context2.stroke();
	
	canvas1=document.getElementById(canM3);//表层环
	var e3=Newdata3/Olddata3*lang/200;//把应画的圆环（r*L）分为200份
	var context3=canvas1.getContext("2d");
	context3.clearRect(0,0,200,200);//清理背景
	context3.beginPath();
	context3.arc(100,90,70,begin*Math.PI,(begin+e3*count)*Math.PI,false);
	context3.lineWidth=width;//环宽
	var grd3=context1.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd3.addColorStop(0,colB3);//起始颜色
	grd3.addColorStop(1,colE3);//结束颜色
	context3.strokeStyle = grd3;//环色
	context3.stroke();
	if(count<200){//递归调用画表层圆环的方法，直到完整画出表层园环
		t=setTimeout("circleInit()",5);//每1ms调用一次
	}else{
		clearTimeout(t);
		//画表层环
	}	
}

function dataIncre(data1,data2,data3){
	incre1=data1;
	incre2=data2;
	incre3=data3;
	if(base1+data1<=Olddata1){
		increc1();
	}else{
		incre1=Olddata1-base1;
		increc1();
	}
	if(base2+data2<=Olddata2){
		increc2();
	}else{
		incre2=Olddata2-base2;
		increc2();
	}
	if(base3+data3<=Olddata3){
		increc3();
	}else{
		incre3=Olddata3-base3;
		increc3();
	}
}

function increc3(){
	canvas1=document.getElementById(canT3);//表层环
	var begin3=begin+(Newdata3/Olddata3-0.1)*lang;
	var end3=begin+(base3+incre3)/Olddata3*lang;
	var context3=canvas1.getContext("2d");
	context3.clearRect(0,0,200,200);//清理背景
	context3.beginPath();
	context3.arc(100,90,70,begin3*Math.PI,end3*Math.PI,false);
	context3.lineWidth=width;//环宽
	var grd3=context3.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd3.addColorStop(0,colB3);//起始颜色
	grd3.addColorStop(1,colE3);//结束颜色
	context3.strokeStyle = grd3;//环色
	context3.stroke();
	base3=base3+incre3;
}
function increc2(){
	canvas1=document.getElementById(canT2);//表层环
	var begin2=begin+(Newdata2/Olddata2-0.1)*lang;
	var end2=begin+(base2+incre2)/Olddata2*lang;
	var context2=canvas1.getContext("2d");
	context2.clearRect(0,0,200,200);//清理背景
	context2.beginPath();
	context2.arc(100,90,70,begin2*Math.PI,end2*Math.PI,false);
	context2.lineWidth=width;//环宽
	var grd2=context2.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd2.addColorStop(0,colB2);//起始颜色
	grd2.addColorStop(1,colE2);//结束颜色
	context2.strokeStyle = grd2;//环色
	context2.stroke();
	base2=base2+incre2;
}
function increc1(){
	canvas1=document.getElementById(canT1);//表层环
	var begin1=begin+(Newdata1/Olddata1-0.1)*lang;
	var end1=begin+(base1+incre1)/Olddata1*lang;
	var context1=canvas1.getContext("2d");
	context1.clearRect(0,0,200,200);//清理背景
	context1.beginPath();
	context1.arc(100,90,70,begin1*Math.PI,end1*Math.PI,false);
	context1.lineWidth=width;//环宽
	var grd1=context1.createLinearGradient(0,0,150,150);//颜色渲染（x0,y0,x1,y1）
	grd1.addColorStop(0,colB1);//起始颜色
	grd1.addColorStop(1,colE1);//结束颜色
	context1.strokeStyle = grd1;//环色
	context1.stroke();
	base1=base1+incre1;
}