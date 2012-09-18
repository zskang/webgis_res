package com.cabletech.core.common;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.core.mapper.BaseMapper;
import com.cabletech.core.service.ResCommonTagService;
import com.cabletech.res.entity.basemgr.BaseEntity;
import com.opensymphony.xwork2.ActionContext;


/**
 * AOP 日志管理
 * @author LvRenzhao
 *
 */
@Aspect
@Component
public class AOPLogger {
	@Resource(name = "resCommonTagServiceImpl")
	private ResCommonTagService resCommonTagService;
	
	@Resource(name = "baseMapper")
	public BaseMapper mapper;
	
	/**
	 * 切入点为rest提交资源方法,进行日志记录;
	 * @param jp 切入点对象
	 */
	@After("execution(* com.cabletech.res.service..*.saveorupdate(..))")
	public void LogSaveOrUpdate(JoinPoint jp) {
		BaseEntity obj = null;
		try{
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("id", mapper.getXTBH());
			obj = (BaseEntity)jp.getArgs()[0];
			String zymc = obj.getZymc();
			params.put("zymc", zymc);
			String xtbh = obj.getXtbh();
			params.put("xtbh", xtbh);
			Map<String,Object> session =  (Map<String,Object>)ActionContext.getContext().getSession();
			String userid = ((UserInfo)session.get("user")).getUserId();
			params.put("userid", userid);
			int objectId = obj.getObjectid();
			String action= objectId>0 ? "ACT002":"ACT001";
			params.put("action", action);
			String zylx = getResTypeByClassName(jp.getThis().toString());
			params.put("zylx", zylx);
			if(StringUtils.isNotBlank(zylx)){
				mapper.log(params);
			}
		}catch(Exception ex){}
	}
	
	/**
	 * 切入点为资源批量删除方法,进行日志记录;
	 * @param jp 切入点对象
	 */
	@After("execution(* com.cabletech.res.service..*.batchDelete(..))")
	public void LogbatchDelete(JoinPoint jp){
		String xtbhs = "";
		try{
			String zylx = getResTypeByClassName(jp.getThis().toString());
			Map<String,Object> session =  (Map<String,Object>)ActionContext.getContext().getSession();
			String userid = ((UserInfo)session.get("user")).getUserId();
			xtbhs = (String)jp.getArgs()[0];
			String[] xtbh = xtbhs.split(",");
			Map<String, Object> querymap=null;
			Map<String, Object> paramsmap=null;
			for(int i=0; i<xtbh.length; i++){
				paramsmap = new HashMap<String, Object>();
				querymap = new HashMap<String, Object>();
				querymap.put("keyValue", xtbh[i]);
				querymap.put("keyColumn", "xtbh");
				querymap.put("displayName", "zymc");
				querymap.put("tableName",getTableNameByResType(zylx));
				String zymc = resCommonTagService.getKeyColumnDisplayName(querymap);
				paramsmap.put("id", mapper.getXTBH());
				paramsmap.put("zymc",zymc);
				paramsmap.put("xtbh",xtbh[i]);
				paramsmap.put("userid",userid);
				paramsmap.put("action","ACT003");
				paramsmap.put("zylx",zylx);
				mapper.log(paramsmap);
			}
		}catch(Exception ex){}
	}
	
	/**
	 * 
	 * @param className
	 * @return
	 */
	private String getResTypeByClassName(String className){
		String zylx = "";
		String cn = className.substring(className.lastIndexOf(".")+1,className.lastIndexOf("@"));
		String[] serviceName = {"GjxxServiceImpl","GddServiceImpl","GddxtServiceImpl","DgxxServiceImpl",
				"GldServiceImpl","GldxtServiceImpl","BsxxServiceImpl","BsdServiceImpl","BsdxtServiceImpl",
				"GqxxServiceImpl","GqdServiceImpl","GqdxtServiceImpl","YsServiceImpl","YsxtServiceImpl",
				"GfxxServiceImpl","GjjxServiceImpl","GjtServiceImpl","GzdhServiceImpl","GldlyServiceImpl",
				"GlxxServiceImpl","GlplServiceImpl","ZdxxServiceImpl","JfxxServiceImpl","OdfServiceImpl",
				"GroupCustomerServiceImpl","CampusServiceImpl","BroadBandServiceImpl","YytServiceImpl"};
		String[] codevalue = {"A21","AD601","AD606","A20","AD602","AD607","A22","AD603","AD608","A23",
				"AD604","AD609","AD605","AD6010","AA004","AA003","AA005","AA006","A33","AD6011","AD706",
				"A29","AD701","AA001","AA502","AA312","A35","A36"};
		for(int i=0; i<serviceName.length; i++){
			if(serviceName[i].equals(cn)){
				zylx = codevalue[i];break;
			}
		}
		return zylx;
	}
	
	/**
	 * 根据资源类型获取表名
	 * @param restype
	 * @return
	 */
	public String getTableNameByResType(String restype){
		String[] restypes = {"A21","AD601","AD606","A20","AD602","AD607","A22","AD603","AD608","A23",
				"AD604","AD609","AD605","AD6010","AA004","AA003","AA005","AA006","A33","AD6011","AD706",
				"A29","AD701","AA001","AA502","AA312","A35","A36"};
		String[] restables = {"RES_GJXX","RES_GDD","RES_GDD_XT","RES_DGXX",
				"RES_GLD","RES_GLD_XT","RES_BSXX","RES_BSD","RES_BSD_XT",
				"RES_GQXX","RES_GQD","RES_GQD_XT","RES_YS","RES_YS_XT",
				"RES_GFXX","RES_GJJX","RES_GJT","RES_GZDH","RES_GLD_LY",
				"RES_GLXX","RES_GLPL","RES_ZDXX","RES_JF","RES_ODF",
				"RES_GROUPCUSTOMER","RES_CAMPUS","RES_BROADCOMMUNTY","RES_YYT"};
		String temptablename="";
		for(int i=0; i<restypes.length; i++){
			if(restype.toUpperCase().equals(restypes[i])){
				temptablename = restables[i];break;
			}
		}
		return temptablename;
	}
}
