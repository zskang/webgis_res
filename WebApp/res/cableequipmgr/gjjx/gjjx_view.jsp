<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>光交接箱信息查看</title>
<script type="text/javascript">
	In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
	In.add('commonjs', {path:'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
	In.ready('ctcss','commonjs',function(){
		In.css('.ui-form-input-title {width: 100px;} .ui-form-input-box {width:100%}');
		if('${tipview}'){
			$('.ui-form-input-box:last').css('display','none');
		}
       	jQuery(function(){
       		if($('#actmsg').val()){
       			$.fn.Alert($('#actmsg').val(), 4);
				parent.loadTree('tree','${ctx}/res/cableequipmgr/gjjx!getTreeNodes.action?xtbh='+$("#xtbh").val());			
       		}
       	});				
	});
</script>
	</head>
	<body style="overflow: auto">
		<div class="ui-form-container">
			<form name="formname" id="formname" method="post" action="${ctx}/res/cableequipmgr/gjjx!input.action">
				<input type="hidden" id="actmsg" name="actmsg" value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光交接箱名称：</span>
					<span class="ui-form-value">${entity.zymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">光交接箱编号：</span>
					<span class="ui-form-value">${entity.gjjxbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">原名称：</span>
					<span class="ui-form-value">${entity.ymc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">固定资产编号：</span>
					<span class="ui-form-value">${entity.gdzcbh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家：</span>
					<span class="ui-form-value">${entity.sccj}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">规格型号：</span>
					<span class="ui-form-value">${entity.ggxh}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">标称容量：</span>
					<span class="ui-form-value">${entity.bcrl}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">一体化标志：</span>
					<span class="ui-form-value">${entity.ythbz}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">适配类型：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.splx}"
							columntype="SPLX"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">业务级别：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.ywjb}"
							columntype="CABLETYPE"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">具体位置：</span>
					<span class="ui-form-value">${entity.jtwz}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">道路名称：</span>
					<span class="ui-form-value">${entity.dlmc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">门牌：</span>
					<span class="ui-form-value">${entity.mp}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">安装方式 ：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.azfs}"
							columntype="AZFS"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框行数：</span>
					<span class="ui-form-value">${entity.odmkhs}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM框列数：</span>
					<span class="ui-form-value">${entity.odmkls}</span>
				</div>				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框行排列方式 :</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.khplfs}"
							columntype="PLFS"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框列排列方式 :</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.klplfs}"
							columntype="PLFS"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框排列规则 :</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.kphgz}"
							columntype="KPHGZ"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元状态：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.wyzt}"
							columntype="WYZT"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.cqxz}"
							columntype="property_right"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">设施状态：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.sszt}"
							columntype="SSZT"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.whfs}"
							columntype="WHFS"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">用途：</span>
					<span class="ui-form-value"><baseinfo:dic
							displayProperty="LABLE" codevalue="${entity.yt}"
							columntype="SSYT"></baseinfo:dic> </span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属工程：</span>
					<span class="ui-form-value">${entity.ssgc}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">主建单位：</span>
					<span class="ui-form-value">${entity.zjdw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">参建单位：</span>
					<span class="ui-form-value">${entity.cjdw}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属管理区：</span>
					<span class="ui-form-value">${entity.ssglq}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">经度：</span>
					<span class="ui-form-value">${entity.lon}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">纬度：</span>
					<span class="ui-form-value">${entity.lat}</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域：</span>
					<span class="ui-form-value"><baseinfo:region
							displayProperty="regionname" id="${entity.regionid}"></baseinfo:region>
					</span>
				</div>
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">二维码：</span>
					<span class="ui-form-value">${entity.ewm}</span>
				</div>
					<div class="ui-form-input-box">
					<span class="ui-form-input-title">组织单位：</span>
					<span class="ui-form-value">
						<baseinfo:org displayProperty="organizename" id="${entity.orgid}"></baseinfo:org>
					</span>
				</div>			
				<div class="ui-form-input-box">
					<span class="ui-form-input-title"></span><span class="ui-form-value" style="float:right;margin-right:50px">
						<a href="${ctx}/res/cableequipmgr/gjjx!input.action?xtbh=${entity.xtbh}">编辑</a>
					</span>	
				</div>
			</form>
		</div>
	</body>
</html>