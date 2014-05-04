package com.managementsystem.energy.portlet.holographic.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**  
服务器响应结果的包装类,
  格式积极响应服务结果格式变更
 @author allchin
 modified@2013年8月7日  上午10:22:39
 */
public class ServiceRtn {
	//服务结果原生属性
	private String name;
	private String type;
	private String time;
	private String value;
	
	
	//辅助属性，方便取用
	private Date date;
	private Double doubleVal;
	private Integer intVal;
	
	private String cate;
	
	
	
	
	/**
	   通过日期类型转换日期格式，得到cate
	 @author allchin
	 modified@2013年8月17日 下午5:31:09
	 * @param md
	 * @return
	 * @deprecated
	 * 
	 */
	public String getCate(ServiceReqParam md) {
		try{
			SimpleDateFormat sdf=null;
			if("day".equals(md.getType())){
				sdf=new SimpleDateFormat("HH"); 
				cate =sdf.format(getDate()) ;
			}
			else if("week".equals(md.getType())){
				sdf=new SimpleDateFormat("dd");
				cate =sdf.format(getDate());
			}
			else if("month".equals(md.getType())){
				sdf=new SimpleDateFormat("dd");
				cate =sdf.format(getDate());
			}
		}
		catch(Exception e){
			//e.printStackTrace();
		}
		
		
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Date getDate() {
		
		if(date==null){
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			try {
				date=sdf.parse(time);
			} catch (ParseException e) {
				//System.out.println("time:"+time+"日期解析失败："+e);
				sdf=new SimpleDateFormat("yyyy-MM-dd");
				try {
					date=sdf.parse(time);
				} catch (ParseException e1) {
					 //e1.printStackTrace();
				}
				 
			}
			
			  
		}
		
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Double getDoubleVal() {
		try{
			doubleVal=Double.parseDouble(value);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return doubleVal;
	}
	public void setDoubleVal(Double doubleVal) {
		this.doubleVal = doubleVal;
	}
	public Integer getIntVal() {
		try{
			intVal=Integer.parseInt(value);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return intVal;
	}
	public void setIntVal(Integer intVal) {
		this.intVal = intVal;
	}
	
	
}
