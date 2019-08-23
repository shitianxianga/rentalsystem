/**
 * 切换nav
 * @param link 链接
 */
function changeNav(link) {
    var dd = $(link).find("dd").get(0);
    $(".nav-text").removeClass("active");
    $(dd).addClass("active"); // 点击变色
}