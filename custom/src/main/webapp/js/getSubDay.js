/**
 * 计算时间差，向上取整 天
 * @param startTimestr 格式为yyyy-MM-dd HH:mm:ss
 * @param endTimestr
 * @returns {number}
 */

function getYMDHMS(startTimeStr, endTimeStr) {
    var dateStart = new Date(startTimeStr.replace(/-/g,'/'));
    var dateEnd = new Date(endTimeStr.replace(/-/g,'/'));
    var dateInterval = dateEnd.getTime() - dateStart.getTime() //获取时间差毫秒
    //计算出相差天数
    var days = Math.ceil(dateInterval / (24 * 60 * 60 * 1000));
    return days;
}