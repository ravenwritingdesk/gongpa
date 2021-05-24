﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyOperatorEdit.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyOperatorEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/ProxyOperatorManage.aspx">客服管理</a></li>
                <li><a href="#">客服编辑</a></li>
            </ul>
        </div>
        <div class="formbody">
            <div class="formtitle"><span>基本信息</span></div>

            <ul class="forminfo">
                <li>
                    <label>客服帐号：</label><input name="" type="text" class="dfinput" runat="server" id="txtUserName" readonly="readonly" /><i>
                    </i></li>
                <li>
                    <label>帐号密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword" /></li>
                <li>
                    <label>操作密码：</label><input name="" type="text" class="dfinput" runat="server" id="txtPassword0" /></li>
                <li>
                    <label>限额：</label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQuotaScore"  value="0" /></li>
                <li>
                    <label>微信号：</label><input name="" type="text" class="dfinput" runat="server" id="txtPhone" /></li>
                <li>
                    <label>QQ号码：  </label>
                    <input name="" type="text" class="dfinput" runat="server" id="txtQQ" /></li>
                <li style="display: <%= Proxy.authority ? "block":"none"%>">
                    <label>是否启用：</label><asp:CheckBox ID="cbIsEnabled" runat="server" /></li>

                <li>
                    <label>&nbsp;</label><asp:Button ID="btnSubmit" class="btn" runat="server" Text="确认保存" OnClick="btnSubmit_Click" />&nbsp;<input class="cancel" name="" type="button" onclick="window.history.go(-1);" value="返回" /></li>
            </ul>

        </div>
    </form>
</body>
</html>

