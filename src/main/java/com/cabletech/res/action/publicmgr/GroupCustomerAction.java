package com.cabletech.res.action.publicmgr;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.cabletech.baseinfo.business.entity.UserInfo;
import com.cabletech.baseinfo.business.util.CoordinateTransformer;
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.publicmgr.GroupCustomerEntity;
import com.cabletech.res.entity.publicmgr.ZdxxEntity;
import com.cabletech.res.service.publicmgr.GroupCustomerService;
import com.cabletech.res.service.publicmgr.ZdxxService;

/**
 * 集客
 * 
 * @author zg
 * 
 */
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/groupcustomer/groupcustomer_input.jsp"),
		@Result(name = "inputdwzh", location = "/res/publicmgr/groupcustomer/groupcustomer_input_dwzh.jsp"),
		@Result(name = "frame", location = "/res/publicmgr/groupcustomer/groupcustomer_frame.jsp"),
		@Result(name = "view", location = "/res/publicmgr/groupcustomer/groupcustomer_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/groupcustomer/groupcustomer_list.jsp"), })
@Action("groupcustomer")
public class GroupCustomerAction extends BaseAction {

	/**
	 * 序列
	 */
	private static final long serialVersionUID = 1L;

	private ZdxxEntity zdentity = new ZdxxEntity();
	private GroupCustomerEntity entity;

	/**
	 * 站点信息服务类
	 */
	@Resource(name = "zdxxServiceImpl")
	private ZdxxService zdxxService;
	/**
	 * 业务类
	 */
	@Resource(name = "groupCustomerServiceImpl")
	private GroupCustomerService service;

	/**
	 * NodeB保存信息
	 * 
	 */
	public String save() {
		String toPage;
		if (StringUtils.isNotBlank(entity.getXtbh())) {
			toPage = "view";
		} else {
			toPage = "input";
		}
		if (service.saveorupdate(entity)) {
			if (toPage.equals("input")) {
				entity = new GroupCustomerEntity();
				entity.setActionMessage("新增成功!");
			}
		} else {
			entity = new GroupCustomerEntity();
			entity.setActionMessage("新增失败!");
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	public String savedwzh() {
		String toPage;
		if (StringUtils.isNotBlank(entity.getXtbh())) {
			toPage = "view";
		} else {
			toPage = "inputdwzh";
		}
		Map<String, Double> map=new HashMap<String,Double>();
		String siteid = request.getParameter("siteid");
		if (StringUtils.isNotBlank(siteid)) {
			zdentity = zdxxService.getbyid(siteid);
			if (StringUtils.isNotBlank(zdentity.getLat())
					&& StringUtils.isNotBlank(zdentity.getLon())) {
				map = CoordinateTransformer
						.transformForMap(Double.valueOf(zdentity.getLon()),
								Double.valueOf(zdentity.getLat()),
								CoordinateTransformer.XIAN80_AH_WTK,
								CoordinateTransformer.WGS84_WTK);
			}
			if(map!=null){
			Double pointx = Double.valueOf(map.get("x"));
			Double pointy = Double.valueOf(map.get("y"));
			entity.setPointX(pointx.toString());
			entity.setPointY(pointy.toString());
			}
			entity.setProjectx(zdentity.getLon());
			entity.setProjecty(zdentity.getLat());
		}
		if (service.saveorupdate(entity)) {
			if (toPage.equals("input")) {
				entity = new GroupCustomerEntity();
				entity.setActionMessage("新增成功!");
			}
		} else {
			entity = new GroupCustomerEntity();
			entity.setActionMessage("新增失败!");
		}
		request.setAttribute("entity", entity);
		return toPage;
	}

	@Override
	public String execute() {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		request.setAttribute("xtbh", xtbh);
		return "frame";
	}

	/**
	 * 删除
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		String xtbh = request.getParameter("xtbh");
		if (service.delete(xtbh)) {
			super.outmessage("删除成功！");
		} else {
			super.outmessage("删除失败！");
		}
		return null;
	}

	/**
	 * 列表页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		return LIST;
	}

	/**
	 * @return
	 * @throws Exception
	 */
	@Override
	public String input() throws Exception {
		prepareViewModel();
		return INPUT;
	}

	/**
	 * 代维综合系统使用
	 * 
	 * @return
	 * @throws Exception
	 */
	public String inputdwzh() throws Exception {
		prepareViewModel();
		return "inputdwzh";
	}

	/**
	 * 查询列表的数据
	 * 
	 * @throws Exception
	 */
	public void listdata() throws Exception {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String condition = entity.getSerializeQueryCondition();
		if (StringUtils.isBlank(condition)) {
			condition = request.getQueryString();
		}
		Map<String, Object> conditionMap = super.getDecodeCondtionMap(
				condition, user);
		service.setExportconditionmap(conditionMap);
		Map<String, Object> map = null;
		map = service.queryPageMap("queryGroupCustomerList", conditionMap,
				super.getPage(), super.getLimit());
		super.convertpagemaptojson(map);
	}

	@Override
	public Object getModel() {
		if (entity == null) {
			entity = new GroupCustomerEntity();
		}
		return entity;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		String xtbh = request.getParameter("xtbh");// 获取资源id
		if (StringUtils.isNotBlank(xtbh)) {
			GroupCustomerEntity entity = service.getbyid(xtbh);
			request.setAttribute("entity", entity);
		} else {
			entity = new GroupCustomerEntity();
		}
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new GroupCustomerEntity();
		}

	}

}
