package com.cabletech.res.service.index;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import oracle.net.aso.b;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.analyse.AnalyseEntity;
import com.cabletech.res.entity.index.NoticeEntity;

/**
 * 日志操作
 * @author 吕仁钊 2012-08-11
 *
 */
public interface NoticeService  extends BaseService{
	
	/**
	 * 根据用户获取未读通告
	 * @param user 用户
	 * @return 未读通告 
	 */
	public int getUnReadNotices(UserInfo user);
	
	/**
	 * 根据id获取通知
	 * @param id 主键
	 * @return 实体类
	 */
	public NoticeEntity getById(String id);
	
	/**
	 * 设置已读
	 * @param id 主键
	 * @return 实体类
	 */
	public void setRead(String id,String userid);
	

	/**
	 * 删除通告
	 * @param id 主键
	 * @return 实体类
	 */
	public void delNotice(String id);
	

	/**
	 * 保存
	 * @param enitty 实体
	 */
	public boolean saveorupdate(NoticeEntity enitty);
	
}
