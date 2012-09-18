<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.ready('ctcss',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
	});
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/publicmgr/groupcustomer!input.action">
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />

			<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属站点:</span>
					<span class="ui-form-value"><resinfo:resCommon keyValue="${entity.siteid}" 
					tableName="res_zdxx"></resinfo:resCommon></span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户编号：</span>
					<span class="ui-form-value">${entity.groupid}</span>
				</div>

				<div class="ui-form-input-box">
						<span class="ui-form-input-title">客户名称:</span>
						<span class="ui-form-value">${entity.groupname}</span>
				</div>
				
				<div class="ui-form-input-box">
						<span class="ui-form-input-title">原名称:</span>
						<span class="ui-form-value">${entity.ymc}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">地址:</span>
					<span class="ui-form-value">${entity.groupaddr}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户级别:</span>
						<span class="ui-form-value">
						<baseinfo:dicselector name="" columntype="GROUP_LEVEL" type="view" keyValue="${entity.grouptype }"></baseinfo:dicselector>
						</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属地市:</span>
						<span class="ui-form-value"><baseinfo:region displayProperty="regionname" id="${entity.regionid}"></baseinfo:region> </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">经度:</span>
						<span class="ui-form-value">${entity.lon } </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纬度:</span>
						<span class="ui-form-value">${entity.lat } </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">集客部联系人：</span>
					<span class="ui-form-value">
					${entity.jkblxr}</span>
				</div>
				
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">集客部联系电话：</span>
					<span class="ui-form-value"> 
					${entity.jkblxdh}</span>
					
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户经理：</span>
					<span class="ui-form-value">
					${entity.khjl}</span>
				</div>
				
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户经理电话：</span>
					<span class="ui-form-value"> 
					${entity.khjldh}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">入网时间：</span><!-- 不知道是什么时间，暂定入网时间-->
					<span class="ui-form-value">
					${entity.createtime}</span>
				</div>
				
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">接入方式：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="jrfs" columntype="JRFS" type="view" keyValue="${entity.jrfs }"></baseinfo:dicselector>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">承载业务信息：</span>
					<span class="ui-form-value">
					${entity.czywxx}</span>
				</div>
				
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">归属接入点名称：</span>
					<span class="ui-form-value"> 
					${entity.gsjrdmc}</span>
				</div>
				
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设备归属：</span>
					<span class="ui-form-value"> 
					${entity.sbgs}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">重要级别：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="zyjb" columntype="ZYJB" type="view" keyValue="${entity.zyjb }"></baseinfo:dicselector>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户类别：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="khlb" columntype="KHLB" type="view" keyValue="${entity.khlb}"></baseinfo:dicselector>
					${entity.khlb}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户联系人：</span>
					<span class="ui-form-value"> 
					${entity.linkman}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户联系电话：</span>
					<span class="ui-form-value"> 
					${entity.phone}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户级别：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="khjb" columntype="GROUP_LEVEL" type="view" keyValue="${entity.khjb}"></baseinfo:dicselector>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户服务等级：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="gradeofservice" columntype="JTKHJB" type="view" keyValue="${entity.gradeofservice}"></baseinfo:dicselector>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">客户行业：</span>
					<span class="ui-form-value"> 
					<baseinfo:dicselector name="industry" columntype="INDUSTRY" type="view" keyValue="${entity.industry}"></baseinfo:dicselector>
					</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注:</span>
				<span class="ui-form-value">${entity.remark}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/publicmgr/groupcustomer!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>