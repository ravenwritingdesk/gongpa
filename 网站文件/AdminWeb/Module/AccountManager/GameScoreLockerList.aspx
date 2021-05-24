<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameScoreLockerList.aspx.cs" Inherits="Game.Web.Module.AccountManager.GameScoreLockerList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>

    <title></title>
    <script type="text/javascript">
        window.onload = function () {
            SetTableRowColor();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 正在游戏中玩家
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="titleQueBg">
            <tr>
                <td class="listTdLeft" style="width: 80px">普通查询：
                </td>
                <td>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="text"></asp:TextBox>
                    <asp:CheckBox ID="ckbIsLike" runat="server" Text="模糊查询" />

                    <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                    <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td height="39" class="td5">
                            <asp:Button ID="btnDelete" runat="server" Text="卡线清理" class="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td></td>
                    </tr>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="box" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center" class="bold">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </th>
                            <th>序号
                            </th>
                            <th>管理
                            </th>
                            <th>用户标识
                            </th>
                            <th>用户帐号
                            </th>
                            <th>游戏
                            </th>
                            <th>房间
                            </th>
                            <th>登录地址
                            </th>
                            <th>登录机器
                            </th>
                            <th>进入时间
                            </th>
                            <th>时长
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID").ToString()%>' />
                                </td>
                                <td>
                                    <%# anpPage.PageSize * ( anpPage.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td>
                                    <a class="l" href="GameScoreLockerList.aspx?cmd=del&param=<%#Eval("UserID") %>" onclick="return confirm('确定要删除吗？')">卡线清理</a>
                                </td>
                                <td>
                                    <%# Eval( "UserID" ).ToString( )%>
                                </td>
                                <td>
                                    <%#GetAccounts(int.Parse( Eval( "UserID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%#GetGameKindName(int.Parse( Eval( "KindID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse( Eval( "ServerID" ).ToString( )))%>
                                </td>
                                <td title="<%# Eval("EnterIP").ToString()%>">
                                    <%# GetAddressWithIP( Eval("EnterIP").ToString())%>
                                </td>
                                <td>
                                    <%# Eval( "EnterMachine" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Game.Facade.Fetch.GetTimeSpan(Convert.ToDateTime( Eval( "CollectDate" )),DateTime.Now)%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID").ToString()%>' />
                                </td>
                                <td>
                                    <%# anpPage.PageSize * ( anpPage.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td>
                                    <a class="l" href="GameScoreLockerList.aspx?cmd=del&param=<%#Eval("UserID") %>" onclick="return confirm('确定要删除吗？')">卡线清理</a>
                                </td>
                                <td>
                                    <%# Eval( "UserID" ).ToString( )%>
                                </td>
                                <td>
                                    <%#GetAccounts(int.Parse( Eval( "UserID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%#GetGameKindName(int.Parse( Eval( "KindID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse( Eval( "ServerID" ).ToString( )))%>
                                </td>
                                <td title="<%# Eval("EnterIP").ToString()%>">
                                    <%# GetAddressWithIP( Eval("EnterIP").ToString())%>
                                </td>
                                <td>
                                    <%# Eval( "EnterMachine" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Game.Facade.Fetch.GetTimeSpan(Convert.ToDateTime( Eval( "CollectDate" )),DateTime.Now)%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg">
                        <span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a>
                    </td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpPage" OnPageChanged="anpPage_PageChanged" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20" NextPageText="下页"
                            PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%"
                            UrlPaging="false">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="OpList">
                <tr>
                    <td height="39" class="titleOpBg">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
