package com.cabletech.res.service.index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.service.BaseServiceImpl;
import com.cabletech.res.entity.index.NoticeEntity;
import com.cabletech.res.mapper.index.LogMapper;
import com.cabletech.res.mapper.index.NoticeMapper;

/**
 * 日志操作
 * 
 * @author 吕仁钊 2012-08-11
 * 
 */
@Service
public class NoticeServiceImpl extends BaseServiceImpl implements NoticeService {

	@Resource(name = "noticeMapper")
	private NoticeMapper noticeMapper;

	/**
	 * 保存
	 * @param enitty 实体
	 */
	public boolean saveorupdate(NoticeEntity enitty){
		try
		{
			enitty.setId(super.getXTBH());
			noticeMapper.saveorupdate(enitty);
			return true;
		}catch(Exception ex){
			return false;
		}
	}
	
	/**
	 * 根据用户获取未读通告
	 * @param user 用户
	 * @return 未读通告 
	 */
	public int getUnReadNotices(UserInfo user){
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("userid", user.getUserId());
		params.put("regionid", user.getRegionId());
		return noticeMapper.getUnReadNotices(params);
	}
	
	/**
	 * 根据id获取通知
	 * @param id 主键
	 * @return 实体类
	 */
	public NoticeEntity getById(String id){
		return noticeMapper.getById(id);
	}
	
	/**
	 * 设置已读
	 * @param id 主键
	 * @return 实体类
	 */
	public void setRead(String id,String userid){
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("noticeid", id);
		params.put("userid", userid);
		noticeMapper.setRead(params);
	}
	
	/**
	 * 删除通告
	 * @param id 主键
	 * @return 实体类
	 */
	public void delNotice(String id){
		noticeMapper.delNotice(id);
	}
}
