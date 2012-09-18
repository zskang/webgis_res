/**
 * ActionScript 和 JavaScript 直接互调用帮助类
 * @param appName
 * @return
 */
function getFlexApp(appName){
  if (navigator.appName.indexOf ("Microsoft") !=-1){
    return window[appName];
  }else {
    return document[appName];
  }
}