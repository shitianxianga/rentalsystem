$(function () {
    setInterval("setTime()", 1000);
});

/**
 * 动态加载时间
 */
function setTime() {
    // 动态加载时间
    var now = new Date();
    var month = now.getMonth() + 1;
    var day = now.getDate();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var seconds = now.getSeconds();
    if (hours.toString().length == 1) {
        hours = "0" + hours;
    }
    if (minutes.toString().length == 1) {
        minutes = "0" + minutes;
    }
    if (seconds.toString().length == 1) {
        seconds = "0" + seconds;
    }
    $(".month").text(month + "月");
    $(".day").text(day + "日");
    $(".current-time").text(hours + ":" + minutes + ":" + seconds);
}