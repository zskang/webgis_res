package com.cabletech.contractor.entity.gisextend;

/**
 * 实体基类
 * @author Administrator
 *
 */
public class BasicEntity {
	/**
	 * 检查是否为空
	 * @param string 字符串
	 * @return
	 */
	public String getStrNotNull(String string){
		if(string==null){
			return "";
		}else{
			return string;
		}
	}

}
