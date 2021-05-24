//如果是手机端登入 则跳转到手机端
function CheckMobileAndRedirect(url)
{
    if (CheckIsMobile() && url!=null && url!='' && url!=undefined)
    {
        window.top.location = url;
    }
}

//如果是手机端登入 则将下载地址改为手机的
function CheckMobileAndReplaceUrl(url) {
    if (CheckIsMobile() && url != null && url != '' && url != undefined) {
        $("#linksA").attr("href", url);
    }
}


//检查是否是手机端
function CheckIsMobile() {
    var u1 = navigator.userAgent.toLowerCase(), app = navigator.appVersion;
    var isMobile = u1.match(/(iphone|ipod|ios|ipad|android)/i);
    return isMobile
}