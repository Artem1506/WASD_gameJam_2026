//---------------------------------------------------------
//Подписываемся на ресайз окна в вебе
evalJS(@'
window.addEventListener("resize", function(event) {
    gml_Script_gmcallback_on_browser_resize(null,null);
}, true);
')
//---------------------------------------------------------
//Отключаем импутлаг
evalJS("document.addEventListener('touchstart', e => { e.preventDefault(); }, { passive: false })")
