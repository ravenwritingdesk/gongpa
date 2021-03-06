// JavaScript Document
$(function () {
    //sidebar javascript
    var iWinH = $(window).outerHeight();
    var iHeadH = $(".header").outerHeight();
    $("#sidebar_insi").css({
        height: iWinH - iHeadH + 'px'
    });
    $(".sidebar_con").css({
        'min-height': iWinH - iHeadH + 'px'
    });
    $(".sidebar_con2").css({
        'min-height': iWinH - iHeadH + 'px'
    });

    $(window).resize(function (event) {
        iWinH = $(window).outerHeight();
        iHeadH = $(".header").outerHeight();
        $("#sidebar_insi").css({
            height: iWinH - iHeadH + 'px'
        });
        $(".sidebar_con").css({
            'min-height': iWinH - iHeadH + 'px'
        });
        $(".sidebar_con2").css({
            'min-height': iWinH - iHeadH + 'px'
        });
    });

    $(window).load(function () {
        //$.mCustomScrollbar.defaults.scrollButtons.enable = true; //enable scrolling buttons by default
        //$.mCustomScrollbar.defaults.axis = "yx"; //enable 2 axis scrollbars by default
        //$("#sidebar_insi").mCustomScrollbar({ theme: "minimal-dark" });
    });

    $("#sidebar_con dl").children("dt").bind('click', function (event) {
        if ($(this).nextAll("dd").css('display') == 'none') {
            $("#sidebar_con dl").children("dd").slideUp(500);
            $(this).nextAll("dd").slideDown(500);
        } else {
            $(this).nextAll("dd").slideUp(500);
        }
    });
    $("#sidebar_con2 dl").children("dt").bind('click', function (event) {
        if ($(this).nextAll("dd").css('display') == 'none') {
            $("#sidebar_con2 dl").children("dd").slideUp(500);
            $(this).nextAll("dd").slideDown(500);
        } else {
            $(this).nextAll("dd").slideUp(500);
        }
    });

    $('#sidebar_but').bind('click', function () {
        if ($("#sidebar").css('left') == '0px') {
            $("#sidebar").animate({ left: -$("#sidebar_con").outerWidth(true) + 'px' }, 500);
            $("#sidebar").animate({ left: -$("#sidebar_con2").outerWidth(true) + 'px' }, 500);
            $(this).addClass('open');
            $("#main").animate({ 'padding-left': '14px' }, 500);
        } else {
            $("#sidebar").animate({ left: 0 + 'px' }, 500);
            $(this).removeClass('open');
            $("#main").animate({ 'padding-left': $("#sidebar").outerWidth(true) + 'px' }, 500);
        }
    });

    $(".newspic_addbut").bind('click', function () {

        if ($(".newspic_addwrap").css('display') == 'none') {
            $(".newspic_addwrap").slideDown(200);
        }
    })

})
/**
*  @des ajax????????????
*  @todo ?????? 2015-06-15
*  @handlerUrl:????????????????
*  @post_data:?????????????? {"act":"open","id":"1"}
*  @loadingDiv:????????????????ID
*  @successCallback:????????????????
*  @errCallback:????????????????
*  @completeCallback:????????????????
*  @return ????http????????
*/
function f_ajaxPost(handlerUrl, post_data, loadingDiv, successCallback, errCallback, completeCallback) {
    if (loadingDiv) {
        $("#" + loadingDiv).showLoading();
    }
    $.ajax({
        type: "post",
        url: handlerUrl,
        data: post_data,
        cache: false,
        async: true,
        dataType: "json",
        success: function (result) {
            if (successCallback) {
                if (loadingDiv) {
                    $("#" + loadingDiv).hideLoading();
                }
                successCallback(result);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (errCallback) {
                errCallback(XMLHttpRequest, textStatus, errorThrown);
            }
        },
        complete: function (XMLHttpRequest, SuccessOrErrorthrown) {
            if (completeCallback) {
                completeCallback(XMLHttpRequest, SuccessOrErrorthrown);
            }
        }
    });
}
function trim(str) { //??????????????????
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
/**
*  @des ??????????????????url??"?"??????????
*  ?????????? ???????? var obj =GetRequest????
*  ???????????????? obj["????????"]
*  @todo ?????? 2015-06-15
*  @return ????http????????
*/
function GetRequest() {
    var url = location.search; //????url??"?"??????????
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = (strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
/**
*  @des  ??????JSON????
*  @jsonDate JSON????
*  @type ??????0??????????1????????
*  @todo ?????? 2015-06-15
*  @return ????????
*/
function jsonDateFormat(jsonDate, type) {
    try {
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        var milliseconds = date.getMilliseconds();
        if (type == 0) {
            return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds;
        }
        else {
            return date.getFullYear() + "-" + month + "-" + day;
        }
    } catch (ex) {
        return "";
    }
}