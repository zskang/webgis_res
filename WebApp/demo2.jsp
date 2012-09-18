<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/header.jsp"%>
<title>Insert title here</title>
<link href="${ctx }/css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="${ctx }/css/dropdown/themes/flickr.com/default.css" media="screen" rel="stylesheet" type="text/css" />
<script type="text/javascript">
In.add('esrijs', {
		path : '${ctx}/js/jquery.esri.js',
		type : 'js',
		charset : 'utf-8'
	});
In.add('dropdowncss',{path:'${ctx }/css/dropdown/dropdown.css',rely:['flickrcss']});
In.add('flickrcss',{path:'${ctx }/css/dropdown/themes/flickr.com/default.css'});
In.ready('esrijs','dropdowncss', function() {
	});
var chk = function(){
	$("#chk2").checkAll();
}
var chk2 = function(){
	$("#ja2").checkAll("form");
}
var inverse1 = function(){
	$("form input[type=checkbox]").inverseAll();
}
var inverse2 = function(){
	$("input[type=checkbox]").inverseAll();
}
</script>
</head>
<body>
<input type="checkbox" name="checkbox" value="checkbox">
<form name="form1" id="form1" method="post" action="">
  <input name="ja" id="ja" type="checkbox" id="ja" value="checkbox" onclick="chk()">无范围checkall
    <input name="ja2"  type="checkbox" id="ja2" value="checkbox" onclick="chk2()">有范围checkall
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  <input type="checkbox" name="checkbox" value="checkbox">
  title:<input name="title" id="title" type="text" id="title"><p>
  <a href="javascript:void(0)" onclick="$.btnCheckAll({'flag':true,'scope':'form'})">有范围的全选</a> <p>
   <a href="javascript:void(0)" onclick="$.btnCheckAll({'flag':false,'scope':'form'})">有范围的全不选</a><p>
    <a href="javascript:void(0)" onclick="$.btnCheckAll({'flag':true})">无范围的全选</a><p>
   <a href="javascript:void(0)" onclick="$.btnCheckAll({'flag':false})">无范围的全不选</a><p>
    <a href="javascript:void(0)" onclick="inverse1()">有范围的反选测试</a><p>
    <a href="javascript:void(0)" onclick="inverse2()">无范围的反选测试</a>
</form>
<div style="width:80px">
<ul id="nav" class="dropdown dropdown-horizontal">
	<li>
	<span class="dir">
	选择
	</span>
		<ul>
			<li><a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':true,'scope':'form'})">全选</a></li>
			<li><a href="javascript:void(0);" onclick="$.btnCheckAll({'flag':false,'scope':'form'})">不选</a></li>
			<li><a href="javascript:void(0);" onclick="inverse1()">反选</a></li>
		</ul>
	</li>
</ul>
</div>
			


</body>
</html>