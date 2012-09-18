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
import com.cabletech.core.action.BaseAction;
import com.cabletech.res.entity.publicmgr.WlanEntity;
import com.cabletech.res.entity.publicmgr.ZdxxEntity;
import com.cabletech.res.service.publicmgr.WlanService;
import com.cabletech.res.service.publicmgr.ZdxxService;

/**
 * 公共资源-Wlan信息管理
 * 
 * @author 周刚 2012-07-17
 */
@SuppressWarnings("serial")
@Namespace("/res/publicmgr")
@Results({
		@Result(name = "input", location = "/res/publicmgr/wlan/wlan_input.jsp"),
		@Result(name = "view", location = "/res/publicmgr/wlan/wlan_view.jsp"),
		@Result(name = "list", location = "/res/publicmgr/wlan/wlan_list_dwzh.jsp") })
@Action("wlan")
public class WlanAction extends BaseAction {

	/**
	 * 页面显示实体类
	 */
	private WlanEntity entity;
	private WlanEntity queryentity = new WlanEntity();
	private String toPage;
	private String Id;
	private String Ids;
	/**
	 * 业务类
	 */
	@Resource(name = "wlanServiceImpl")
	private WlanService wlanService;

	public String getToPage() {
		return toPage;
	}

	public void setToPage(String toPage) {
		this.toPage = toPage;
	}

	public String getId() {
		return Id;
	}

	/**
	 * 业务类
	 */
	@Resource(name = "zdxxServiceImpl")
	private ZdxxService zdxxService;

	@Override
	public String execute() {
		return "frame";
	}

	@Override
	public String view() throws Exception {
		prepareViewModel();
		return VIEW;
	}

	/**
	 * 进入表单页面
	 * @throws Exception 
	 */
	@Override
	public String input() throws Exception {
		prepareViewModel();
		return INPUT;
	}

	/**
	 * 资源保存
	 * 
	 * @return toPage 返回页面
	 */
	public String save() {
		String url = "/res/publicmgr/wlan!list.action?"; 
		if (wlanService.save(entity)) {
			super.addMessage("保存成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("保存失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	/**
	 * 列表数据
	 */
	public void listData() {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");// 获取当前用户
		String condition = queryentity.getSerializeQueryCondition();
		condition = request.getQueryString();
		Map<String, Object> conditionMap = new HashMap<String, Object>();
		try {
			conditionMap = super.getDecodeCondtionMap(condition, user);
			Map<String, Object> map = wlanService.queryPageMap("queryWlanList",
					conditionMap, super.getPage(), super.getLimit());
			wlanService.setExportconditionmap(conditionMap);
			convertpagemaptojson(map);
		} catch (Exception e) {
		}
		request.setAttribute("condition", condition);
	}

	/**
	 * 列表
	 * 
	 * @return LIST
	 */
	public String list() {
		return LIST;
	}

	/**
	 * 删除信息
	 * 
	 * @return String
	 */
	public String delete() throws Exception {
		String url = "/res/publicmgr/wlan!list.action?";
		String Id = entity.getId();
		if (wlanService.delete(Id)) {
			super.addMessage("删除成功!", url, INFO_SUCCESS_LEVEL);
		} else {
			super.addMessage("删除失败!", url, INFO_ERROR_LEVEL);
		}
		return SUCCESS;
	}

	@Override
	protected void prepareViewModel() throws Exception {
		Id = request.getParameter("id");
		if (StringUtils.isNotBlank(Id)) {
			entity = wlanService.view(Id);
			request.setAttribute("entity", entity);
		} else {
			entity = new WlanEntity();
		}
	}

	/**
	 * 站点的批量逻辑删除
	 * 
	 * @return null
	 */
	public String batchDelete() {
		Ids = request.getParameter("Ids");
		if (wlanService.batchDelete(Ids))
			super.outmessage("删除成功！");
		super.outmessage("删除失败！");
		return null;
	}

	/**
	 * 转向批量编辑页面
	 * 
	 * @return
	 */
	public String toBatchEditPage() {
		String ids = request.getParameter("Ids");
		request.setAttribute("ids", ids);
		return "edit";
	}

	@Override
	protected void prepareSaveModel() throws Exception {
		if (entity == null) {
			entity = new WlanEntity();
		}
	}

	@Override
	public WlanEntity getModel() {
		if (entity == null) {
			entity = new WlanEntity();
		}
		return entity;
	}

	/**
	 * 设置提示信息
	 * 
	 * @param info
	 *            提示信息
	 * @param toPage
	 *            页面
	 */
	public void setInfoMessage(String info, String toPage) {
		if (toPage.equals("input")) {
			entity = new WlanEntity();
		}
		entity.setActionMessage(info);
	}
}
