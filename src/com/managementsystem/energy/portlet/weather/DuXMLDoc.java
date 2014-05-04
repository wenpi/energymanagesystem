package com.managementsystem.energy.portlet.weather;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.managementsystem.energy.portlet.weather.model.Weather;

public class DuXMLDoc {
    public List xmlElements(String xmlDoc) {
        //创建一个新的字符串
        StringReader read = new StringReader(xmlDoc);
        //创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
        InputSource source = new InputSource(read);
        //创建一个新的SAXBuilder
        SAXBuilder sb = new SAXBuilder();
        
        List<Weather> list = new ArrayList<Weather>();
        
        try {
            //通过输入源构造一个Document
            Document doc = sb.build(source);
            //取的根元素
            Element root = doc.getRootElement();
            List jiedian = root.getChildren();
            Element et = null;
            et = (Element) jiedian.get(0);
            Element et1 = null;
            List jiedian1 = et.getChildren();
            String city = "";
            String forecast_date = "";
            
            
            for(int i=0;i<jiedian1.size();i++){
            	et1 = (Element) jiedian1.get(i);//循环依次得到子元素
            if(et1.getName().equals("forecast_information")){
            	Element et11 = null;
            	List jiedian11 = et1.getChildren();
            	for(int j=0;j<jiedian1.size();j++){
                 	et11 = (Element) jiedian11.get(j);//循环依次得到子元素
               if(et11.getName().equals("city")){
            	   city = et11.getAttributeValue("data");
               }
               if(et11.getName().equals("forecast_date")){
            	   forecast_date = et11.getAttributeValue("data");
               }
              }
            }
            
            if(et1.getName().equals("current_conditions")){
            	Weather weather = new Weather();
            	Element et12 = null; 
            	List jiedian12 = et1.getChildren();
            	for(int j=0;j<jiedian12.size();j++){
            		et12 = (Element) jiedian12.get(j);//循环依次得到子元素
            		if(et12.getName().equals("condition")){
            			weather.setConditionText(et12.getAttributeValue("data"));	
                    }
            		if(et12.getName().equals("temp_f")){
            			String conditionTemp_f = et12.getAttributeValue("data");
            			weather.setConditionTemp_f(Float.parseFloat(conditionTemp_f));	
                    }
            		if(et12.getName().equals("temp_c")){
            			String conditionTemp_c = et12.getAttributeValue("data");
            			weather.setConditionTemp_c(Float.parseFloat(conditionTemp_c));	
                    }
            		if(et12.getName().equals("humidity")){
            			weather.setHumidity(et12.getAttributeValue("data"));
            		}
            		if(et12.getName().equals("icon")){
            			String icon = et12.getAttributeValue("data");
            			String re = "/ig";
            			String reIcon = icon.replace(re, "");
            			reIcon="/energymanagesystem"+reIcon;
            			weather.setIcon(reIcon);
            		}
            		if(et12.getName().equals("wind_condition")){
            			weather.setWind_condition(et12.getAttributeValue("data"));
            		}
                }
            weather.setLocationCity(city);
            weather.setConditionDate(forecast_date);
            list.add(weather);
            }
            
            if(et1.getName().equals("forecast_conditions")){
            	Weather weather = new Weather();
            	Element et12 = null; 
            	List jiedian12 = et1.getChildren();
            	for(int j=0;j<jiedian12.size();j++){
            		et12 = (Element) jiedian12.get(j);//循环依次得到子元素
            		if(et12.getName().equals("day_of_week")){
            			weather.setWeek(et12.getAttributeValue("data"));	
                    }
            		if(et12.getName().equals("low")){
            			String low = et12.getAttributeValue("data");
            			weather.setConditionTemp_l(Float.parseFloat(low));	
                    }
            		if(et12.getName().equals("high")){
            			String high = et12.getAttributeValue("data");
            			weather.setConditionTemp_h(Float.parseFloat(high));	
                    }
            		if(et12.getName().equals("condition")){
            			weather.setConditionText(et12.getAttributeValue("data"));
            		}
            		if(et12.getName().equals("icon")){
            			String icon = et12.getAttributeValue("data");
            			String re = "/ig";
            			String reIcon = icon.replace(re, "");
            			reIcon="/energymanagesystem"+reIcon;
            			weather.setIcon(reIcon);
            		}
                }
            list.add(weather);
            }
          }
        } catch (JDOMException e) {
            // TODO 自动生成 catch 块
            e.printStackTrace();
        } catch (IOException e) {
            // TODO 自动生成 catch 块
            e.printStackTrace();
        }
        return list;
    }
}