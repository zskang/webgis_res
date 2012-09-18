/**
 * wlan_common.js
 * 
 * @creator zg 2012-07-12
 * @used for wlan all jsp files
 */
var contextPath;
/**
 * set context path
 */
function setContextPath(path) {
	contextPath = path;
}

// 待办工作操作列转换
function WaitHandWlanFmatter(cellvalue, options, rowObjec) {
	var view = "<a style='color: blue;text-decoration: underline;' href=javascript:viewThis('"
			+ rowObjec.ID + "')>查看</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:deleteThis('"
			+ rowObjec.ID + "')>删除</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:editThis('"
			+ rowObjec.ID + "')>编辑</a>";
	return view;
}
function viewThis(id) {
	location = contextPath + '/res/publicmgr/wlan!view.action?id=' + id;
}

function deleteThis(id) {
	var url = contextPath + '/res/publicmgr/wlan!delete.action?id=' + id;
	var r = confirm("删除的数据不能够恢复   请确认是否删除");
	if (!!r) {
		location.href = url;
	}
}
function editThis(id) {
	location = contextPath + '/res/publicmgr/wlan!input.action?id=' + id;
}