/**
 * 汽车图片变换
 * @param link
 */
function changeCarImg(link) {
    var smallImg = $(link).find("img").get(0);
    var smallImgSrc = $(smallImg).attr("src");
    $(".car-img-big").attr("src",smallImgSrc);  // 改变图片
    $(".car-img-small").css("border", "1px solid #E9EBEE");  // 小图片默认浅灰色边框
    $(smallImg).css("border", "1px solid #61A1DF");  // 选中图片蓝色边框
}