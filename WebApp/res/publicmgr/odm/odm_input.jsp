<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib uri="http://www.cabletech.com.cn/resinfo" prefix="resinfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
	 	In.add('validatejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.validate.min.js',type:'js',charset:'utf-8'});
	 	In.add('autocompleteJs',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.min.js',type:'js',charset:'utf-8',rely:['autocompleteCss']});
	    In.add('autocompleteCss',{path:'http://${config.webliburl}/cabletech/autocomplete/jquery.autocomplete.css'});
        In.add('ctcss',{path:'http://${config.webliburl}/cabletech/ui/css/jquery-ct-ui-custom.css'});
        In.add('ztreejs',{path:'http://${config.webliburl}/cabletech/ui/js/jquery.ztree.all-3.1.min.js',type:'js',charset:'utf-8',rely:['ztreecss']});
        In.add('ztreecss',{path:'http://${config.webliburl}/cabletech/ui/css/zTreeStyle.css'});
        In.add('commonjs', {path : 'http://${config.webliburl}/cabletech/ui/js/jquery.ct.common.js',type : 'js',charset : 'utf-8'});
        In.ready('ztreejs','validatejs','autocompleteJs','ctcss','commonjs',function(){
	        	In.css('#formname label.error {margin-left: 10px;width: auto;display: inline;}');
	        	In.css('.ui-form-input {width:210px} .ui-form-input-title{width:100px}');
         		$("#formname").validate({});
         		var xtbh = $('#xtbh').val();
				if(!xtbh){
					$('.ui-form-container .ui-form-input-box INPUT:last').css('display','none');
					}
         		 //初始化RegionTree
         		initRegionTree_001();
         		var actionMessage = $('#actionMessage').val();
         		if(actionMessage == "保存成功!"){
					$.fn.Alert(actionMessage,2);
             	}else{
					$.fn.Alert(actionMessage,3);
                }
         		$('#actionMessage').val('');
         		var zylx = $('#sssblx').val();
				if(zylx == "AA001"){
					getAutoCompleteValue(true,'Qdmcinput','sssb','res_odf');
				}
				else if (zylx == "AA003"){
					getAutoCompleteValue(true,'Qdmcinput','sssb','res_gjjx');
				}else{
					getAutoCompleteValue(true,'Qdmcinput','sssb','');
				}
		});


			var regionCallBackId = function(id) {
				$('#regionid').val(id);
			}
			var type = "odm";
			function doSubmit(act){
				var url ="${ctx}/res/publicmgr/{type}!{act}.action";
				document.forms[0].action=url.replace('{type}',type).replace('{act}',act);
				if(act == 'view'){
					window.location.href=url.replace('{type}',type).replace('{act}',act)+"?xtbh="+$('#xtbh').val();
				}
			}

			function ChangeDevType(){
			    $("#Qdmcinput").val("");
			    $("#sssb").val("");
				var zylx = $('#sssblx').val();
				if(zylx == "AA001"){
					getAutoCompleteValue(true,'Qdmcinput','sssb','res_odf');
				}
				else if (zylx == "AA003"){
					getAutoCompleteValue(true,'Qdmcinput','sssb','res_gjjx');
				}else{
					getAutoCompleteValue(true,'Qdmcinput','sssb','');
				}
			}
			function checkGh()
			{
			    if($('#sssblx').val()&&$('#sssb').val()&&$('#sssbm').val()&&
			       $('#gh').val())
			    {
			         $.ajax({
							   type: "POST",
							   dataType: "json",
							   url: "${ctx}/res/publicmgr/odm!checkGh.action",
							   data: "sssblx="+$('#sssblx').val()+"&sssb="+$('#sssb').val()+"&sssbm="+$('#sssbm').val()+"&gh="+$('#gh').val(),
							   success: function(msg){
							       
							        if(parseInt($("#gh").val())>parseInt(msg.num))
							        {
							            $('#gh').val('');
							    	    $.fn.Alert("框号不能大于"+msg.num,1);
							        } 
							        if(msg.ispass=="fail")
								     {
										    	 $('#gh').val('');
										    	 $.fn.Alert("此类型的框号已存在",1);
								     }
 							        
							     
							   }
							 });  
			    }
			}
			
		</script>
	</head>
	<body>
		<div class="ui-form-container">
			<form id="formname" name="formname" method="post" action="">
				<input type="hidden" id="actmsg" name="actmsg"
					value="${entity.actionMessage}" />
				<input type="hidden" id="xtbh" name="xtbh" value="${entity.xtbh}">

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM名称:</span>
					<input type="text" class="required ui-form-input" name="zymc"
						id="zymc" value="${entity.zymc}" />
						</span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">ODM编号:</span>
					<input type="text" class="ui-form-input" name="odmbm"
						id="odmbm" value="${entity.odmbm}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属区域:</span>
					<baseinfo:regiontree defaultValue="${entity.regionid}" cls="required ui-form-input"  
					widgetId="001" callBackId="regionCallBackId"
						regionId="${user.regionId}"></baseinfo:regiontree>
					<input type="hidden" id="regionid" name="regionid"
						value="${entity.regionid}">
						</span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属设备类型:</span>
					<baseinfo:dicselector id="sssblx" name="sssblx" columntype="CSSBLX" exclude="AA002,AA004,AA005,AA006"
						type="select"   cssClass="required ui-form-input" isQuery="query"
						keyValue="${entity.sssblx}" onChange="ChangeDevType();"></baseinfo:dicselector>
						<span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属设备：</span>
					
					<input id="Qdmcinput" name="Qdmcinput" class="required ui-form-input" type="text" onblur="judgeHiddenValue(this,'sssb')" 
					    value='<resinfo:resCommon  keyValue="${entity.sssb}" resType="${entity.sssblx}"></resinfo:resCommon>'/><span class="ui-form-symbol-icon"></span><span class="ui-form-symbol-color">*</span>
					<input size="30" type="hidden" readonly name="sssb" id="sssb" value="${entity.sssb}"/>
					
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">所属设备面:</span>
					<baseinfo:dicselector name="sssbm" id="sssbm" columntype="SBM" type="select"
						  cssClass="required ui-form-input"
						keyValue="${entity.sssbm}"  isQuery="query"></baseinfo:dicselector>
						</span><span class="ui-form-symbol-color">*</span>
				</div>


				<div class="ui-form-input-box">
					<span class="ui-form-input-title">框号:</span>
					<input type="text" class="required ui-form-input" name="gh" id="gh"
						value="${entity.gh}"  onblur="checkGh()"/>
						</span><span class="ui-form-symbol-color">*</span>
				</div>

					<div class="ui-form-input-box">
					<span class="ui-form-input-title">单元板数:</span>
					<input type="text" class="required ui-form-input number" name="dybs" id="dybs"
						value="${entity.dybs}" /><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">板排列方式：</span>
					<baseinfo:dicselector name="bplfs" columntype="PLFS" type="select"
						  cssClass="required ui-form-input" exclude="AD002,AD003"
						keyValue="${entity.bplfs}"  isQuery="query"></baseinfo:dicselector><span class="ui-form-symbol-color">*</span>
					
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">板端子数:</span>
					<input type="text" class="required ui-form-input number" name="bdzs" id="bdzs"
						value="${entity.bdzs}" /><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子排列方式：</span>

					<baseinfo:dicselector name="dzplfs" columntype="PLFS" type="select"
						  cssClass="required ui-form-input" exclude="AD002,AD003"
						keyValue="${entity.dzplfs}"  isQuery="query"></baseinfo:dicselector><span class="ui-form-symbol-color">*</span>
					
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">端子起始编号:</span>
					<input type="text" class="required ui-form-input number" name="dzqsbh" id="dzqsbh"
						value="${entity.dzqsbh}" /><span class="ui-form-symbol-color">*</span>
				</div>
				
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">适配类型：</span>
					<baseinfo:dicselector name="splx" columntype="SPLX" type="select"
						  cssClass="ui-form-input"
						keyValue="${entity.splx}"></baseinfo:dicselector>
					
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">被熔接盘占的框序号:</span>
					<input type="text" class="ui-form-input" name="kxh" id="kxh"
						value="${entity.kxh}" />
				</div>


				<div class="ui-form-input-box">
					<span class="ui-form-input-title">生产厂家:</span>
					<input type="text" class="ui-form-input" name="sccj" id="sccj"
						value="${entity.sccj}" />
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">产权性质：</span>
					<baseinfo:dicselector name="cqxz" columntype="property_right"
						type="select"   cssClass="ui-form-input"
						keyValue="${entity.cqxz}"></baseinfo:dicselector>
						</span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">维护方式：</span>
					<baseinfo:dicselector name="whfs" columntype="WHFS" type="select"
						  cssClass="ui-form-input"
						keyValue="${entity.whfs}"></baseinfo:dicselector>
						</span><span class="ui-form-symbol-color">*</span>
				</div>

				<div class="ui-form-input-box">
					<span class="ui-form-input-title">网元状态：</span>
					<baseinfo:dicselector name="wyzt" columntype="WYZT" type="select"
						  cssClass="ui-form-input"
						keyValue="${entity.wyzt}"></baseinfo:dicselector>
				</div>
               <input type="hidden" id="orgid" name="orgid" value="${entity.orgid}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">备注：</span>
					<textarea class="input textarea" name="bz" id="bz"
						style="width:210px">${entity.bz}</textarea>
				</div>
				<input type="hidden" id="actionMessage" name="actionMessage" value="${entity.actionMessage}" />
				<div class="ui-form-input-box">
					<span class="ui-form-input-title">&nbsp;</span>
					<input type="submit" value="保存" onclick="doSubmit('save')"
						style="width: 80px;">
					<input type="button" value="取消" onclick="doSubmit('view')"
						style="width: 80px;">
				</div>
			</form>
		</div>
	</body>
</html>