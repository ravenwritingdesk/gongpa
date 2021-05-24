/*
阿拉伯数字转中文
*/
function ArabiaToChinese(num) {
    if (!/^\d*(\.\d*)?$/.test(num)) {
        alert("你输入的不是数字，请重新输入!");
        return false;
    }
    var AA = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖");
    var BB = new Array("", "拾", "佰", "仟", "万", "亿", "点", "");
    var a = ("" + num).replace(/(^0*)/g, "").split("."), k = 0, re = "";
    for (var i = a[0].length - 1; i >= 0; i--) {
        switch (k) {
            case 0:
                re = BB[7] + re;
                break;
            case 4:
                if (!new RegExp("0{4}\\d{" + (a[0].length - i - 1) + "}$").test(a[0]))
                    re = BB[4] + re;
                break;
            case 8:
                re = BB[5] + re;
                BB[7] = BB[5];
                k = 0;
                break;
        }
        if (k % 4 == 2 && a[0].charAt(i) == "0" && a[0].charAt(i + 2) != "0") re = AA[0] + re;
        if (a[0].charAt(i) != 0) re = AA[a[0].charAt(i)] + BB[k % 4] + re;
        k++;
    }
    if (a.length > 1) {
        re += BB[6];
        for (var i = 0; i < a[1].length; i++) re += AA[a[1].charAt(i)];
    }
    return re;
}



// 根据标题排序
function OrderBy(filed, orderByType, parameters) {
    var url = location.href;
    var parameterIndex = url.indexOf("?");
    if (parameterIndex > -1) {
        url = url.substring(0, parameterIndex);
    }
    var value = "orderbyfield=" + filed;
    url = SetUrlParam(url, value);
    //var orderType = GetRequest("orderByType", "");
    if (orderByType == "") {
        orderByType = "0";
    }
    value = "orderbytype=" + orderByType;
    url = SetUrlParam(url, value);
    url += parameters;
    location.href = url;
}

/********************************************************************/
//为url添加参数，自动判断是更新还是添加
//参数格式：如：page=1的形式，不能是“page=1&params=1”的形式，即一次只能添加一个参数
/********************************************************************/
function SetUrlParam(url, param) {
    var interrogation = url.indexOf("?");

    if (interrogation == -1) {
        url += "?" + param;
    }
    else {
        //如果?后面有查询字符串,则检测有没有该字段，如果有，则重新付值
        var fp = param.split("=");
        var search = fp[0] + "=";
        var offset = url.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = url.indexOf("&", offset);
            if (end == -1) {
                url = url.substring(0, offset) + fp[1];
            }
            else {
                url = url.substring(0, offset) + fp[1] + url.substring(end);
            }
        }
        else {
            url = url + "&" + param;
        }
    }
    return url;
}

/********************************************************************/
//获取url中一个指定的参数值
/********************************************************************/
function GetRequest(paramName, defaultValue) {
    var search = paramName + "=";
    var FieldValue = "";
    var URL = location.href;
    var offset = URL.indexOf(search);
    if (offset != -1) {
        offset += search.length;
        var end = URL.indexOf("&", offset);
        if (end == -1) {
            FieldValue = URL.substring(offset);
        }
        else {
            FieldValue = URL.substring(offset, end);
        }
    }
    if (FieldValue == "") {
        FieldValue = defaultValue;
    }
    return FieldValue.toLowerCase();
}

/********************************************************************/
//重新设置排序字段的click事件
/********************************************************************/
function SetOrderByField(fields, type) {
    if (fields == "" || fields == undefined) {
        return;
    }
    if (type == "ASC") {
        $("#OrderByA_" + fields).text($("#OrderByA_" + fields).text() + " ↑");
        $("#OrderByA_" + fields).attr("href", "javascript:OrderByClick('" + fields + "','0');");
    } else if (type == "DESC") {
        $("#OrderByA_" + fields).text($("#OrderByA_" + fields).text() + " ↓");
        $("#OrderByA_" + fields).attr("href", "javascript:OrderByClick('" + fields + "','1');");
    }
}