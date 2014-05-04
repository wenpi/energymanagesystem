package com.managementsystem.energy.portlet.weather;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.managementsystem.energy.portlet.weather.model.Weather;

public class JsonToList {
    public List xmlElements(String json) {
      
        
        List<Weather> listWeather = new ArrayList<Weather>();
        
        List<String> list = new ArrayList<String>();

        String JSON = json.substring(1, json.length() - 1);
       
        JSON = JSON.replaceAll("},", "}^");
       
        StringTokenizer strTokenizer = new StringTokenizer(JSON, "^");
       
        while (strTokenizer.hasMoreTokens()) {
           
            String token = strTokenizer.nextToken();
           
            list.add(token);
           
        }

        int start = 0;
       
        int end = 0;
       
        int start2 = 0;
       
        int end2 = 0;
        Weather weather = new Weather();
        Weather weather1 = new Weather();
        Weather weather2 = new Weather();
        Weather weather3 = new Weather();
        Weather weather4 = new Weather();
        Weather weather5 = new Weather();
        String icon  = "";
        String icon1 = "";		
        String icon2 = "";
        String icon3 = "";
        String icon4 = "";
        String icon5 = "";
        String week1 = "";		
        String week2 = "";
        String week3 = "";
        String week4 = "";
        String week5 = "";
        for (int i = 0; i < list.size(); i++) {

            String str = (String) list.get(i);
       
            String key = "";
           
            String value = "";

            for (int j = 0; j < str.length(); j++) {

                String sub = str.substring(j, j + 1);

                if (sub.equals("{")) {
           
                    start = j + 1;
                }
               

                if (sub.equals(",")) {
       
                    start = j + 1;
                }

                if (sub.equals(":")) {
           
                    end = j;
               
                    key = str.substring(start, end);
                   
                    key = key.substring(1, key.length()-1);
                }

                if (sub.equals(":")) {
           
                    start2 = j + 1;
                }

                if (sub.equals(",") || sub.equals("}")) {
           
                    end2 = j;
               
                    value = str.substring(start2, end2);
               
                    if(value.substring(0, 1).equals("\"") && value.substring(value.length()-1,value.length()).equals("\"")){
                        value = value.substring(1, value.length()-1);
                    }
                    if(key.equals("week")){
                    	weather.setWeek(value);
                    	if(value.equals("星期一")){
                         week1 = "星期二"; 
                         week2 = "星期三"; 
                         week3 = "星期四"; 
                         week4 = "星期五"; 
                         week5 = "星期六"; 
                    	}
                    	if(value.equals("星期二")){
                    		week1 = "星期三"; 
                            week2 = "星期四"; 
                            week3 = "星期五"; 
                            week4 = "星期六"; 
                            week5 = "星期日"; 
                   	}
                    	if(value.equals("星期三")){
                    		week1 = "星期四"; 
                            week2 = "星期五"; 
                            week3 = "星期六"; 
                            week4 = "星期日"; 
                            week5 = "星期一"; 
                   	}
                    	if(value.equals("星期四")){
                    		week1 = "星期五"; 
                            week2 = "星期六"; 
                            week3 = "星期日"; 
                            week4 = "星期一"; 
                            week5 = "星期二"; 
                   	}
                    	if(value.equals("星期五")){
                    		week1 = "星期六"; 
                            week2 = "星期日"; 
                            week3 = "星期一"; 
                            week4 = "星期二"; 
                            week5 = "星期三";  
                   	}
                    	if(value.equals("星期六")){
                    		week1 = "星期日"; 
                            week2 = "星期一"; 
                            week3 = "星期二"; 
                            week4 = "星期三"; 
                            week5 = "星期四"; 
                   	}
                    	if(value.equals("星期日")){
                    		week1 = "星期一"; 
                            week2 = "星期二"; 
                            week3 = "星期三"; 
                            week4 = "星期四"; 
                            week5 = "星期五"; 
                   	}
                    }
                    if(key.equals("temp1")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather.setConditionTemp_l(new Float(l));
                    	weather.setConditionTemp_h(new Float(h));
                    }
                    if(key.equals("weather1")){
                    	weather.setHumidity(value);
                    }
                    if(key.equals("wind1")){
                    	weather.setWind_condition(value);
                    }
                    if(key.equals("img1")){
                    	icon ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img2")){
                    	icon = icon+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather.setIcon(icon);
                    }
                    
                    if(key.equals("temp2")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather1.setConditionTemp_l(new Float(l));
                    	weather1.setConditionTemp_h(new Float(h));
                    	weather1.setWeek(week1);
                    }
                    if(key.equals("weather2")){
                    	weather1.setHumidity(value);
                    }
                    if(key.equals("wind2")){
                    	weather1.setWind_condition(value);
                    }
                    if(key.equals("img3")){
                    	icon1 ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img4")){
                    	icon1 = icon1+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather1.setIcon(icon1);
                    }  
                    
                    if(key.equals("temp3")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather2.setConditionTemp_l(new Float(l));
                    	weather2.setConditionTemp_h(new Float(h));
                    	weather2.setWeek(week2);
                    }
                    if(key.equals("weather3")){
                    	weather2.setHumidity(value);
                    }
                    if(key.equals("wind3")){
                    	weather2.setWind_condition(value);
                    }
                    
                    if(key.equals("img5")){
                    	icon2 ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img6")){
                    	icon2 = icon2+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather2.setIcon(icon2);
                    }
                    if(key.equals("temp4")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather3.setConditionTemp_l(new Float(l));
                    	weather3.setConditionTemp_h(new Float(h));
                    	weather3.setWeek(week3);
                    }
                    if(key.equals("weather4")){
                    	weather3.setHumidity(value);
                    }
                    if(key.equals("wind4")){
                    	weather3.setWind_condition(value);
                    }
                    
                    if(key.equals("img7")){
                    	icon3 ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img8")){
                    	icon3 = icon3+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather3.setIcon(icon3);
                    }
                    if(key.equals("temp5")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather4.setConditionTemp_l(new Float(l));
                    	weather4.setConditionTemp_h(new Float(h));
                    	weather4.setWeek(week4);
                    }
                    if(key.equals("weather5")){
                    	weather4.setHumidity(value);
                    }
                    if(key.equals("wind5")){
                    	weather4.setWind_condition(value);
                    }
                    
                    if(key.equals("img9")){
                    	icon4 ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img10")){
                    	icon4 = icon4+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather4.setIcon(icon4);
                    }
                    if(key.equals("temp6")){
                    	String [] strs = value.split("~");
                    	String l = strs[0].replace("℃", "");
                    	String h = strs[1].replace("℃", "");
                    	weather5.setConditionTemp_l(new Float(l));
                    	weather5.setConditionTemp_h(new Float(h));
                    	weather5.setWeek(week5);
                    }
                    if(key.equals("weather6")){
                    	weather5.setHumidity(value);
                    }
                    if(key.equals("wind6")){
                    	weather5.setWind_condition(value);
                    }
                    
                    if(key.equals("img11")){
                    	icon5 ="/energymanagesystem/images/weather/"+"b"+value+".gif";
                    }
                    if(key.equals("img12")){
                    	icon5 = icon5+"_"+"/energymanagesystem/images/weather/"+"b"+value+".gif";
                    	weather5.setIcon(icon5);
                    }
                }
            }
            listWeather.add(weather);
            listWeather.add(weather1);
            listWeather.add(weather2);
            listWeather.add(weather3);
            listWeather.add(weather4);
            listWeather.add(weather5);
        }
        return listWeather;
    }
}