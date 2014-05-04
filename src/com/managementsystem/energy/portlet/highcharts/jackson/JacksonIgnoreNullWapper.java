package com.managementsystem.energy.portlet.highcharts.jackson;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig.Feature;
import org.codehaus.jackson.map.DeserializationConfig;
public class JacksonIgnoreNullWapper {
	private static ObjectMapper om=null;
	/**
	 简单的jackson包装，写出json时，忽略null字段
	 @author allchin
	 modified@2013年8月1日 下午4:34:13
	 * @return
	 */
	public static ObjectMapper getJacksonObjectmapper(){
		if(om==null){
			om=new ObjectMapper();
			//config
			om.configure(Feature.FAIL_ON_EMPTY_BEANS, false);
			om.configure(Feature.WRITE_NULL_PROPERTIES,false);
			om.configure(Feature.WRITE_EMPTY_JSON_ARRAYS,false);
			om.configure(Feature.WRITE_NULL_MAP_VALUES,false);
			
			om.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		}
		 
		 
		return om;
	}
	
	/**
	 将对象序列化到json文本
	 @author allchin
	 modified@2013年8月1日 下午4:34:38
	 * @param obj
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static String writeValueAsString(Object obj) throws JsonGenerationException, JsonMappingException, IOException{
		return getJacksonObjectmapper().writeValueAsString(obj);
	}
	
	public static   <T> T jsonToBean(String json, Class<T> valueType) throws JsonParseException, JsonMappingException, IOException{
		return getJacksonObjectmapper().readValue(json, valueType);
	}
}
