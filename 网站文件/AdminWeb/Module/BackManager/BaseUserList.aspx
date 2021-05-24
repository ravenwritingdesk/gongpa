<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseUserList.aspx.cs" Inherits="Game.Web.Module.BackManager.BaseUserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：后台系统 - 用户管理
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <ul class="tab_menu clearfix">
            <li onclick="Redirect('BaseRoleList.aspx')">角色管理</li>
            <li class="cur" onclick="Redirect('BaseUserList.aspx')">用户管理</li>
        </ul>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 30%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="3%" />
                        <col width="30%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td height="39">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('BaseUserInfo.aspx?cmd=add')" />
                            <asp:Button ID="btnDongjie" runat="server" Text="冻结" CssClass="btn_operate" OnClick="btnDongjie_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnJiedong" runat="server" Text="解冻" CssClass="btn_operate" OnClick="btnJiedong_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <td style="width: 30px;" class="listTitle">
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </td>
                            <td style="width: 100px;" class="listTitle2">管理
                            </td>
                            <td class="listTitle2">用户帐号
                            </td>
                            <td class="listTitle2">用户角色
                            </td>
                            <td class="listTitle2">状态
                            </td>
                            <td class="listTitle2">登录次数
                            </td>
                            <td class="listTitle2">上次登录地址
                            </td>
                            <td class="listTitle1">上次登录时间
                            </td>
                            <td class="listTitle2">最后登录地址
                            </td>
                            <td class="listTitle1">最后登录时间
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptUser" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (int)Eval("UserID") == 1 ? "&nbsp;" : "<input name='cid' type='checkbox' value='" + Eval("UserID") + "'/>"%>
                                </td>
                                <td>
                                    <%# (int)Eval("RoleID") == -1 ? "&nbsp;" : "<a class='l' href='BaseUserInfo.aspx?cmd=edit&param=" + Eval("UserID") + "'>更新</a> "%>
                                </td>
                                <td>
                                    <%# Eval("UserName")%>
                                </td>
                                <td>
                                    <%# GetRoleName((int)Eval("RoleID"))%>
                                </td>
                                <td>
                                    <%# GetNullityStatus( Convert.ToByte( Eval("Nullity") ))%>
                                </td>
                                <td>
                                    <%# Eval("LoginTimes")%>
                                </td>
                                <td>
                                    <%# Eval( "PreLoginIP" )%>
                                </td>
                                <td>
                                    <%# Eval( "PreLogintime" )%>
                                </td>
                                <td>
                                    <%# Eval("LastLoginIP")%>
                                </td>
                                <td>
                                    <%# Eval( "LastLoginTime" )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (int)Eval("UserID") == 1 ? "&nbsp;" : "<input name='cid' type='checkbox' value='" + Eval("UserID") + "'/>"%>
                                </td>
                                <td>
                                    <%# ( int ) Eval( "RoleID" ) == 1 ? "&nbsp;" : "<a class='l' href='BaseUserInfo.aspx?cmd=edit&param=" + Eval( "UserID" ) + "'>更新</a> "%>
                                </td>
                                <td>
                                    <%# Eval( "UserName" )%>
                                </td>
                                <td>
                                    <%# GetRoleName((int)Eval("RoleID"))%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                </td>
                                <td>
                                    <%# Eval("LoginTimes")%>
                                </td>
                                <td>
                                    <%# Eval( "PreLoginIP" )%>
                                </td>
                                <td>
                                    <%# Eval( "PreLogintime" )%>
                                </td>
                                <td>
                                    <%# Eval("LastLoginIP")%>
                                </td>
                                <td>
                                    <%# Eval("LastLoginTime")%>
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
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
