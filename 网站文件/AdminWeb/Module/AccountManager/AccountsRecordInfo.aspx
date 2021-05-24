<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsRecordInfo.aspx.cs" Inherits="Game.Web.Module.AccountManager.AccountsRecordInfo" %>

<%@ Register Src="~/Themes/TabUser.ascx" TagPrefix="Fox" TagName="Tab" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <%-- <link href="../../styles/layout.css" rel="stylesheet" type="text/css" />

   --%>
     <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

</head>
<body>
    <!-- 头部菜单 Start -->
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
        <tr>
            <td width="19" height="25" valign="top" class="Lpd10">
                <div class="arr">
                </div>
            </td>
            <td width="1232" height="25" valign="top" align="left">
                目前操作功能：用户信息
            </td>
        </tr>
    </table>
    <!-- 头部菜单 End -->
    <%--<Fox:Tab ID="fab1" runat="server" NavActivated="E"></Fox:Tab>--%>
    <ul class="tab_menu clearfix">
        <li><a href="#" onclick="Redirect('AccountsInfo.aspx?param='+GetRequest('param',0))">基本信息</a></li>
        <li><a href="#" onclick="Redirect('AccountsDetailInfo.aspx?param='+GetRequest('param',0))">详细信息</a></li>
        <li><a href="#" onclick="Redirect('AccountsGoldInfo.aspx?param='+GetRequest('param',0))">财富信息</a></li>

        <li class="cur"><a href="#" onclick="Redirect('AccountsRecordInfo.aspx?param='+GetRequest('param',0))">记录信息</a></li>
    </ul>
    <form runat="server" id="form1">
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
        <tr>
            <td class="listTd" style="padding-left: 88px;">
                ID号码(GameID)：
                <span class="Rpd20 lan bold">
                    <asp:Literal ID="ltGameID" runat="server"></asp:Literal></span>
                用户名：<span class="Rpd20 lan bold"><asp:Literal ID="ltAccounts" runat="server"></asp:Literal></span>
            </td>
        </tr>
<%--        <tr>
            <td height="35" class="f14 bold Lpd10 Rpd10">
                <div class="hg3  pd7">
                    基本修改记录</div>
            </td>
        </tr>
        <tr>
            <td class="listTd" style="padding-left: 88px;">
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordAccountsExpendList.aspx?param='+GetRequest('param',0),'RAccounts'+GetRequest('param',0),800,500);">
                    历史改昵称记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordPasswdExpendList.aspx?param='+GetRequest('param',0),'RPassword'+GetRequest('param',0),800,500);">
                    历史改密码记录</a>&nbsp;&nbsp;
            </td>
        </tr>--%>
        <tr>
            <td height="35" class="f14 bold Lpd10 Rpd10">
                <div class="hg3  pd7">
                    财富信息记录</div>
            </td>
        </tr>
        <tr>
            <td class="listTd" style="padding-left: 88px;">
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordUserInoutList.aspx?param='+GetRequest('param',0),'UserInout'+GetRequest('param',0),800,500);">
                    进出记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordDrawInfoList.aspx?param='+GetRequest('param',0),'RDrawInfo'+GetRequest('param',0),800,500);">
                    游戏记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordInsureList.aspx?param='+GetRequest('param',0),'RInsure'+GetRequest('param',0),800,500);">
                    银行记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('ShareDetailList.aspx?param='+GetRequest('param',0),'ShareDetail'+GetRequest('param',0),830,500);">
                    充值记录</a>&nbsp;&nbsp;
            </td>
        </tr>
<%--        <tr>
            <td height="35" class="f14 bold Lpd10 Rpd10">
                <div class="hg3  pd7">
                    系统赠送记录</div>
            </td>
        </tr>
        <tr>
            <td class="listTd" style="padding-left: 88px;">
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordGrantMemberList.aspx?param='+GetRequest('param',0),'RGrantMember'+GetRequest('param',0),800,500);">
                    赠送会员记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordGrantTreasureList.aspx?param='+GetRequest('param',0),'RGrantTreasure'+GetRequest('param',0),800,500);">
                    赠送金币记录</a>&nbsp;&nbsp;
                <a href="javascript:void(0)" class="l" onclick="javascript:openWindowOwn('RecordGrantClearFlee.aspx?param='+GetRequest('param',0),'RGrantClearFlee'+GetRequest('param',0),800,500);">
                    清零逃率记录</a>&nbsp;&nbsp;
            </td>
        </tr>--%>
    </table>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="titleOpBg Lpd10">
                        <input type="button" value="返回" class="btn_operate" onclick="Redirect('AccountsList.aspx')"  />
                <%--<input type="button" value="关闭" class="btn_operate" onclick="window.close();" />--%>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
