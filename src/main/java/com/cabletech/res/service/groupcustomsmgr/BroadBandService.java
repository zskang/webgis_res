package com.cabletech.res.service.groupcustomsmgr;

import org.springframework.transaction.annotation.Transactional;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.groupcustomsmgr.BroadBandEntity;

/**
 * 宽带小区业务处理接口
 * @author wangt
 *
 */
public interface BroadBandService extends BaseService {

	/**
	 * 保存
	 * @param entity 宽带小区实体
	 * @return 
	 */
	public boolean saveorupdate(BroadBandEntity entity);
	 
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 宽带小区实体
	 */
	public BroadBandEntity getbyid(String xtbh);

	/**
	 * 删除
	 * @param entity 宽带小区实体
	 * @return
	 */
	public boolean delete(BroadBandEntity entity);
	
	
	/**
	 * 批量删除
	 * @param xtbhs
	 * @return
	 */
	public boolean batchDelete(String xtbhs);
}
