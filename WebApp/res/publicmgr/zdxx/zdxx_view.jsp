<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>站点信息查看</title>
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
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="${ctx}/res/publicmgr/zdxx!input.action">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">站点名称:</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">站点编号:</span>
					<span class="ui-form-value">${entity.zdbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">原名称:</span>
					<span class="ui-form-value">${entity.ymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">集团规范名称:</span>
					<span class="ui-form-value">${entity.jtgfmc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">缩写:</span>
					<span class="ui-form-value">${entity.sx}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">地址:</span>
					<span class="ui-form-value">${entity.dz}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">道路名称:</span>
					<span class="ui-form-value">${entity.dlmc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">站点类型:</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.zdlx}"
							columntype="ZDLX"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别:</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.ywjb}"
							columntype="CABLETYPE"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质:</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.cqxz}"
							columntype="property_right"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">门牌号码:</span>
					<span class="ui-form-value">${entity.mphm}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">房屋结构:</span>
					<span class="ui-form-value">${entity.fwjg}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">租用单位:</span>
					<span class="ui-form-value">${entity.zydw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">承重:</span>
					<span class="ui-form-value">${entity.cz}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区:</span>
					<span class="ui-form-value">${entity.ssglq}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">经度:</span>
					<span class="ui-form-value">${entity.lon}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纬度:</span>
					<span class="ui-form-value">${entity.lat}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<span class="ui-form-value"><baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注:</span>
					<span class="ui-form-value">${entity.bz}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码:</span>
					<span class="ui-form-value">${entity.ewm}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/publicmgr/zdxx!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>