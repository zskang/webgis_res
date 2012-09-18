<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
       	jQuery(function(){
       		if($('#actmsg').val()){
       			$.fn.Alert($('#actmsg').val(), 4);
       			parent.loadTree('tree',$('#rooturl', parent.document).val());
       			top.refreshPoint('AD605');
       		}
       	});		
	});
</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post"
				action="${ctx}/res/publicmgr/odm!input.action">
			<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
			<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
			<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM名称:</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM编号:</span>
					<span class="ui-form-value">${entity.odmbm}</span>
				</div>


				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<span class="ui-form-value"> <baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>
				<div class="ui-form-input-box">
						<span class="ui-form-input-title">所属设备类型:</span>
							<baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.sssblx}"
							columntype="CSSBLX"></baseinfo:dic></span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属设备：</span>
					<c:if test="${entity.sssblx == 'AA001'}">
					<resinfo:resCommon displayName="zymc" keyColumn="xtbh" keyValue="${entity.sssb}" tableName="res_odf"/>
					</c:if>
					<c:if test="${entity.sssblx == 'AA003'}">
					<resinfo:resCommon displayName="zymc" keyColumn="xtbh" keyValue="${entity.sssb}" tableName="res_gjjx"/>
					</c:if>
				</div>

				
				
				<div class="ui-form-input-box">
						<span class="ui-form-input-title">所属设备面:</span>
						<span class="ui-form-value">
						<baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.sssbm}"
							columntype="SBM"></baseinfo:dic></span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框号:</span>
					<span class="ui-form-value">${entity.gh}</span>
				</div>

					<div class="ui-form-input-box">
					<span class="ui-form-input-title">单元板数:</span>
						<span class="ui-form-value">${entity.dybs}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">板排列方式：</span>
						<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.bplfs}"
							columntype="PLFS"></baseinfo:dic></span>
				</div>


				<div class="ui-form-input-box">
					<span class="ui-form-input-title">板端子数:</span>
					<span class="ui-form-value">${entity.bdzs}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子排列方式：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.dzplfs}"
							columntype="PLFS"></baseinfo:dic></span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子起始编号:</span>
					<span class="ui-form-value">${entity.dzqsbh}</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">适配类型：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.splx}"
							columntype="SPLX"></baseinfo:dic></span>
					
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">被熔接盘占的框序号:</span>
					<span class="ui-form-value">${entity.kxh}</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家:</span>
					<span class="ui-form-value"> ${entity.sccj}	</span>
				</div>

			<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.cqxz}"
							columntype="property_right"></baseinfo:dic> </span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.whfs}"
							columntype="WHFS"></baseinfo:dic> </span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元状态：</span>
					<span class="ui-form-value"> <baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.wyzt}"
							columntype="WYZT"></baseinfo:dic> </span>
				</div>

 				
 				<div class="ui-form-input-box">
					<span class="ui-form-input-title">组织单位：</span>
					<span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				</div>		
 				
 				<div class="ui-form-input-box">
				    <span class="ui-form-input-title">备注：</span>
				    <span class="ui-form-value">${entity.bz}</span>
				 </div>	

				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/publicmgr/odm!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>