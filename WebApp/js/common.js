var contextPath;
/**
 * set context path
 */
setContextPath = function(path) {
	contextPath = path;
}
/**
 * 刷新页面
 */
function breakPage() {
	window.location.href=window.location.href;
 	window.location.reload; 
}

// jqgrid resize
function grid_resize(grid) {
	// var grid = jQuery("#"+gridid);
	var h = jQuery(window).height() - grid.offset().top - 28;
	var w = jQuery(window).width() - 5;
	grid.setGridWidth(w).setGridHeight(h);
}
