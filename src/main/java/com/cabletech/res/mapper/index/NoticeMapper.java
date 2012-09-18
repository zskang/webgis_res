package com.cabletech.res.mapper.index;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.cabletech.res.entity.analyse.AnalyseEntity;
import com.cabletech.res.entity.basemgr.BsdEntity;
import com.cabletech.res.entity.index.NoticeEntity;

/**
 * 通告管理
 * @author 吕仁钊 2012-08-11
 *
 */
public interface NoticeMapper {

	/**
	 * 保存
	 * @param enitty 实体
	 */
	public void saveorupdate(NoticeEntity enitty);
	
	public List<Map<String,Object>> getNotices(Map<String,Object> params);
	
	public int getUnReadNotices(Map<String,Object> params);
	
	public NoticeEntity getById(String id);
	
	public void setRead(Map<String,Object> params);
	
	/**
	 * 删除通告
	 * @param id 主键
	 * @return 实体类
	 */
	public void delNotice(String id);
}
