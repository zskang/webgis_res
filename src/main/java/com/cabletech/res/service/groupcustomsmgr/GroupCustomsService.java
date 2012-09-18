package com.cabletech.res.service.groupcustomsmgr;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.groupcustomsmgr.GroupCustomsEntity;

/**
 * 集团客户信息管理
 * @author wangt 2011-05-11
 *
 */
public interface GroupCustomsService  extends BaseService{

	/**
	 * 保存
	 * @param entity 集团客户实体
	 * @return 
	 */
	public boolean saveorupdate(GroupCustomsEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 集团客户实体
	 */
	public GroupCustomsEntity getbyid(String xtbh);

	/**
	 * 删除
	 * @param entity 集团客户实体
	 * @return
	 */
	public boolean delete(GroupCustomsEntity entity);
	
	
	/**
	 * 批量删除
	 * @param xtbhs
	 * @return
	 */
	public boolean batchDelete(String xtbhs);	
}
