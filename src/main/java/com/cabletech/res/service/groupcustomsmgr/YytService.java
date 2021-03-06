package com.cabletech.res.service.groupcustomsmgr;

import com.cabletech.core.service.BaseService;
import com.cabletech.res.entity.groupcustomsmgr.YytEntity;

/**
 * 营业厅管理
 * @author zhanglei 2011-05-11
 *
 */
public interface YytService  extends BaseService{

	/**
	 * 保存
	 * @param entity 营业厅实体
	 * @return 
	 */
	public boolean saveorupdate(YytEntity entity);
	
	/**
	 * 查看
	 * @param xtbh 系统编号
	 * @return 营业厅实体
	 */
	public YytEntity getbyid(String xtbh);

	/**
	 * 删除
	 * @param xtbh 系统编号
	 * @return
	 */
	public boolean delete(String xtbh);
	
	/**
	 * 批量删除
	 * @param xtbhs 系统编号
	 * @return
	 */
	public boolean batchDelete(String xtbhs);	
}
