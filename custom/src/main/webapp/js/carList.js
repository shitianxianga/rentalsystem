/**
 * 价格区间切换
 * @param minPrice 最低价
 * @param maxPrice 最高价
 */
function selectPrice2(minPrice, maxPrice) {
    var div;
    console.log(minPrice);
    switch (minPrice) {
        case '':
            div = $(".price-line-1");
            break;
        case 0:
            div = $(".price-line-2");
            break;
        case 150:
            div = $(".price-line-3");
            break;
        case 300:
            div = $(".price-line-4");
            break;
        case 500:
            div = $(".price-line-5");
            break;
    }
    // line初始化灰色
    $(".price-line-common").css("border-bottom", "5px solid #E9EBEE");
    // 指定line黄色
    $(div).css("border-bottom", "5px solid #fabe00");

    // 价格初始化灰色
    $(".price-text span").css("color", "#93939E");
    // 指定最低价格和最高价格黄色
    $(".price-"+minPrice).css("color", "#fabe00");
    $(".price-"+maxPrice).css("color", "#fabe00");
    $("#minPrice-input").val(minPrice);
    $("#maxPrice-input").val(maxPrice);
}
/**
 * 品牌切换
 * @param link
 */
function selectBrand(link,kid) {
    var p = $(link).find("p").get(0);
    // 初始化字体颜色灰色
    $(".brand-name-common").css("color", "#93939e");
    // 指定选中字体黄色
    $(p).css("color", "#fabe00");
    $("#kid-input").val(kid);
}

/**
 * 开关切换
 * @param link 链接
 */
function switchChange(link) {
    var img = $(link).find("img").get(0);
    if ($(img).attr("alt") == "switch-on") {
        // 如果初始化是开状态，那么关
        $(img).attr("src", "../../images/switch-off.png");
        $(img).attr("alt", "switch-off");
    } else {
        $(img).attr("src", "../../images/switch-on.png");
        $(img).attr("alt", "switch-on");
    }
}

/**
 * 动态改变租期
 */
function chg(){
    var totalDay = getYMDHMS($("#startTime").val(),$("#endTime").val());
    
    if(totalDay<=0) {
        alert("请填写正确的时间段");
        $("#endTime").val("");
        $("#rentDay").html("-");
        return;
    }
    $("#rentDay").html(totalDay);
}
$(function(){
    $("#endTime").change(chg);
    $("#startTime").change(chg);
})
