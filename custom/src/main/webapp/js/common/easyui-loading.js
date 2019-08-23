var maskWidth = $(window).width();  
var maskHeight = $(window).height();  
var maskHtml = "<div id='maskLoading' class='panel-body' style='z-index:1000;position:absolute;left:0;width:100%;";  
maskHtml += "height:" + maskHeight + "px;top:0'>";  
maskHtml += "<div class='panel-header panel=loading' style='position:absolute;cursor:wait;left:" + ((maskWidth / 2) - 100) + "px;top:" + (maskHeight / 2 - 50) + "px;width:150px;height:50px;";  
maskHtml += "padding:10px 5px 10px 30px;font-size:12px;border:1px solid #ccc;background-color:white;'>";  
maskHtml += "页面加载中，请等待...";  
maskHtml += "</div>";  
maskHtml += "</div>";  
document.write(maskHtml);  
function CloseMask() {  
    $('#maskLoading').fadeOut('fast', function () {  
        $(this).remove();  
    });  
}  
var loadComplete;  
$.parser.onComplete = function () {  
    if (loadComplete)  
        clearTimeout(loadComplete);  
    loadComplete = setTimeout(CloseMask, 500); 
}