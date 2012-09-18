/**
 * prepeater_common.js
 * 
 * @creator zg 2012-07-12
 * @used for prepeater all jsp files
 */
var contextPath;
/**
 * set context path
 */
function setContextPath(path) {
	contextPath = path;
}

// 待办工作操作列转换
function WaitHandprepeaterFmatter(cellvalue, options, rowObjec) {
	var view = "<a style='color: blue;text-decoration: underline;' href=javascript:viewThis('"
			+ rowObjec.REPEATER_ID + "')>查看</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:deleteThis('"
			+ rowObjec.REPEATER_ID + "')>删除</a> ";
	view += "<a style='color: blue;text-decoration: underline;' href=javascript:editThis('"
			+ rowObjec.REPEATER_ID + "')>编辑</a>";
	return view;
}
function viewThis(id) {
	location = contextPath + '/res/publicmgr/prepeater!view.action?prepeaterId=' + id;
}

function deleteThis(id) {
	var url = contextPath + '/res/publicmgr/prepeater!delete.action?prepeaterId=' + id;
	var r = confirm("删除的数据不能够恢复   请确认是否删除");
	if (!!r) {
		location.href = url;
	}
}
function editThis(id) {
	location = contextPath + '/res/publicmgr/prepeater!input.action?prepeaterId=' + id;
}