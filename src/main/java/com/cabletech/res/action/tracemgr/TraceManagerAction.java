package com.cabletech.res.action.tracemgr;

import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.boardfibermgr.DzConnEntity;
import com.cabletech.res.entity.boardfibermgr.JxgxllEntity;
import com.cabletech.res.entity.boardfibermgr.JxgxllzEntity;
import com.cabletech.res.entity.tracemgr.TraceEntity;
import com.cabletech.res.service.boardfibermgr.JxgxllService;
import com.cabletech.res.service.boardfibermgr.JxgxllzService;
import com.cabletech.res.service.tracemgr.TraceService;

/**
 * Trace管理
 * @author Administrator
 *
 */
@SuppressWarnings("serial")
@Namespace("/res/tracemgr")
@Results( {
	@Result(name = "input", location = "/res/tracemgr/trace/trace_input.jsp"),
	@Result(name = "list", location = "/res/tracemgr/trace/trace_list.jsp")})
@Action("trace")
public class TraceManagerAction extends BaseAction{
	
	@Resource(name="traceServiceImpl")
	private TraceService traceservice;
	
	@Resource(name="jxgxllzServiceImpl")
	private JxgxllzService jxgxllzservice;
	
	@Resource(name = "jxgxllServiceImpl")
	private JxgxllService jxgxllservice;
	
	private TraceEntity entity;
	
	@Override
	public String execute() {
		String id = request.getParameter("id");
	    JxgxllzEntity llz = jxgxllzservice.getbyid(id);
	    traceservice.traceBySB(llz);
		return "input";
	}
	
	/**
	 * 获取对应终止光交设备
	 * @return
	 * @throws Exception
	 */
	public String trace()throws Exception{
		DzConnEntity dzconn = new DzConnEntity();
		dzconn.setPortname(entity.getQssbdz());
		dzconn.setSssb(entity.getQssbid());
		dzconn.setSssblx(entity.getQssblx());
		dzconn.setSsodm(entity.getSsodm());
		List<JxgxllEntity> list = traceservice.traceByDz(dzconn);
		request.setAttribute("list", list);
		return "list";
	}
	
	/**
	 * 根据所属设备获取ODM系统编号
	 * @return
	 * @throws Exception
	 */
	public String getodmlist()throws Exception{
		String qssbid = request.getParameter("qssbid");
		String qssblx = request.getParameter("qssblx");
		super.convertlisttojson(jxgxllservice.getodmlistbysbid(qssbid, qssblx));
		return null;
	}
	
	/**
	 * 根据ODM获取端子
	 * @return
	 */
	public String getdzlist()throws Exception{
		String qssbid = request.getParameter("qssbid");
		String ssodm = request.getParameter("ssodm");
		String qssblx = request.getParameter("qssblx");
		super.convertlisttojson(jxgxllservice.getdzlistbyodmid(qssbid, ssodm, qssblx));
		return null;
	}	

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new TraceEntity();
		}
		return entity;
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new TraceEntity();
		}		
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("tipview", super.getParameterValue("tipview"));//tip 视图显示
		if (StringUtils.isNotBlank(xtbh)) {
			request.setAttribute("entity", entity);
		} else {
			entity = new TraceEntity();
		}
	}

}
