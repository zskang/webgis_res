/**
 * zdxx_common.js
 * 
 * @creator zg 2012-07-12
 * @used for zdxx all jsp files
 */
var contextPath;
/**
 * set context path
 */
function setContextPath(path) {
	contextPath = path;
}

// 待办工作操作列转换
function WaitHandzdxxFmatter(cellvalue, options, rowObjec) {
	var view = "<a style='color: blue;text-decoration: underline;' href=javascript:viewThis('"
			+ rowObjec.XTBH + "')>查看</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:deleteThis('"
			+ rowObjec.XTBH + "')>删除</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:editThis('"
			+ rowObjec.XTBH + "')>编辑</a>";
	return view;
}
function viewThis(xtbh) {
	location = contextPath + '/res/publicmgr/zdxx!view.action?xtbh=' + xtbh;
}

function deleteThis(xtbh) {
	var url = contextPath + '/res/publicmgr/zdxx!deleteDwzh.action?xtbh=' + xtbh;
	var r = confirm("删除的数据不能够恢复   请确认是否删除");
	if (!!r) {
		location.href = url;
	}
}
function editThis(xtbh) {
	location = contextPath + '/res/publicmgr/zdxx!inputDwzh.action?xtbh=' + xtbh;
}