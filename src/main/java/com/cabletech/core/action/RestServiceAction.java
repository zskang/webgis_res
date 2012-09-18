package com.cabletech.core.action;

import java.util.Map;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
 

/**
 * 
 * @author cqp 基于arcgis Rest Service服务的封装
 */
public class RestServiceAction extends BaseAction {

	/**
	 * 默认执行方法
	 */
	@Override
	public String execute() {
		//RestTemplate restTemplate = new RestTemplate();
		//restTemplate.postForEntity(url, restTemplate, responseType, uriVariables)
		return SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

 
	@Override
	protected void prepareViewModel() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	protected void prepareSaveModel() throws Exception {
		// TODO Auto-generated method stub

	}
	
	/**
	 * 主函数入口
	 * @param args 参数
	 */
	public static void main(String[] args){
		String str = "{\"addResults\": [{\"objectId\": 39219,\"globalId\": null,\"success\": true}]}";
		Gson gson = new GsonBuilder().create();
		Map<String, List> a = gson.fromJson(str,new TypeToken<Map<String, List<Map<String,String>>>>(){}.getType());
		
		String str2 = "{\"error\": {\"code\": 400,\"message\": \"Cannot add features. Invalid parameters.\"," +
				"\"details\": [\"'features' param not specified\"]}}";
		Map<String, Map> b = gson.fromJson(str2,new TypeToken<Map<String, Map<String,String>>>(){}.getType());
	}

}
