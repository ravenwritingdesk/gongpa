<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyOperatorManage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyOperatorManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $(".tiptop a").click(function () {
            $(".tip").fadeOut(200);
        });

        $(".sure").click(function () {
            $(".tip").fadeOut(100);
        });

        $(".cancel").click(function () {
            $(".tip").fadeOut(100);
        });

    });
</script>
</head>
<body>
    <form id="form1" runat="server">
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="/SysRoot/index.aspx">首页</a></li>
    <li><a href="/SysRoot/ProxyOperatorManage.aspx">客服管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><a href="ProxyOperatorAdd.aspx"><span><img src="/images/t01.png" /></span>添加</a></li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>&nbsp;</th>
        <th>客服ID</th>
        <th>客服帐号</th>
        <th>限额</th>
        <th>微信号</th>
        <th>电话号码</th>
        <th>添加时间</th>
        <th>是否启用</th>
        <th>状态</th>
        <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="reptDataPager" runat="server">
                <ItemTemplate>
                     <tr>
                        <td><%#Eval("OperatorId")%></td>
                         <td><%#Eval("ProxyId")%></td>
                        <td><%#Eval("account") %></td>
                        <td><%#FormatMoney(Eval("QuotaScore"))%></td>
                        <td><%#Eval("WeChat")%></td>
                        <td><%#Eval("QQ")%></td>
                         <td><%#Eval("RegDate")%></td>
                         <td><%#Eval("IsEnabled").ToString() == "True" ? "<font color='green'>可用</font>" : "<font color='red'>不可用</font>"%></td>
                        <td>
                            <a href="/SysRoot/ProxyOperatorEdit.aspx?oid=<%# Eval("OperatorId")%>" class="tablelink">修改</a>
                        </td>
                     </tr> 
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
        
   
    </div>
    
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>

