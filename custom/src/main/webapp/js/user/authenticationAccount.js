$(function () {
    $(".nav-text").removeClass("active");
    $(".auth-text").addClass("active");
});

/**
 * 打开修改姓名框
 */
function openEditName() {
    // 修改姓名
    layer.open({
        title: '修改姓名',
        type: 1,
        closeBtn: 1,  // 调试用
        area: ['480px', '220px'], //宽高
        content: '<div class="dialog-content">' +
        '<span class="dialog-span">姓名</span>' +
        '<input class="dialog-input" placeholder="请输入姓名"><br/>' +
        '<span class="red-text dialog-error">姓名格式错误</span><br/>' +
        '<input class="dialog-btn" type="submit" value="修改">' +
        '</div>'
    });
}

/**
 * 打开修改性别框
 */
function openEditSex() {
    // 修改性别
    layer.open({
        title: '修改性别',
        type: 1,
        closeBtn: 1,  // 调试用
        area: ['480px', '170px'], //宽高
        content: '<div class="dialog-content">' +
        '<span class="dialog-span">性别</span>' +
        '<div class="dialog-input-radio"><input id="d-m-sex" type="radio" name="sex" checked><label class="sex-text" for="d-m-sex">&nbsp;男</label></div>' +
        '<div class="dialog-input-radio"><input id="d-fm-sex" type="radio" name="sex"><label class="sex-text" for="d-fm-sex">&nbsp;女</label></div>' +
        '<input class="dialog-btn" type="submit" value="修改">' +
        '</div>'
    });
}

/**
 * 打开修改身份证号码框
 */
function openEditIdCard() {
    // 修改身份证号码
    layer.open({
        title: '修改身份证号码',
        type: 1,
        closeBtn: 1,  // 调试用
        area: ['480px', '220px'], //宽高
        content: '<div class="dialog-content">' +
        '<span class="dialog-span">身份证号码</span>' +
        '<input class="dialog-input" placeholder="请输入身份证号码"><br/>' +
        '<span class="red-text dialog-error">身份证号码格式错误</span><br/>' +
        '<input class="dialog-btn" type="submit" value="修改">' +
        '</div>'
    });
}