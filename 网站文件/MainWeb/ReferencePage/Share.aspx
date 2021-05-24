<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Share.aspx.cs" Inherits="UserHandlerWeb.ReferencePage.Share" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>分享二维码</title>
    <link href="/style/base.css" rel="stylesheet" type="text/css" />
    <link href="/style/Share.css" rel="stylesheet" type="text/css" />
</head>


<body>
    <section class="Recharge">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table03">
            <tr>
                <td rowspan="3">
                    <img style="width: 200px; height: 320px;" src="/images/Share01.png"></td>
                <td class="tc">扫描二维码,下载游戏</td>
            </tr>
            <tr>
                <td class="tc">&nbsp;</td>
            </tr>
            <tr>
                <td class="tc">
                    <img id="ShareImg" style="width: 200px; height: 200px; border: 5px solid #ffffff" src="/images/QRCodeImg/IndexDownloadQr.png">
                </td>
            </tr>
        </table>
    </section>
</body>
</html>


