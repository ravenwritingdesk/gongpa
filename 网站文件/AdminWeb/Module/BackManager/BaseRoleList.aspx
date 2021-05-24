<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaseRoleList.aspx.cs" Inherits="Game.Web.Module.BackManager.BaseRoleList" %>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：后台系统 - 管理员管理
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <ul class="tab_menu clearfix">
            <li class="cur" onclick="Redirect('BaseRoleList.aspx')">角色管理</li>
            <li onclick="Redirect('BaseUserList.aspx')">用户管理</li>
        </ul>

        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 30%">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="3%" />
                        <col width="16%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td height="39">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('BaseRoleInfo.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <td style="width: 30px;" class="listTitle">
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </td>
                            <td style="width: 100px;" class="listTitle2">管理
                            </td>
                            <td class="listTitle2">角色名称
                            </td>
                            <td class="listTitle2">备注
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptRole" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (int)Eval("RoleID") == 1 ? "&nbsp;":"<input name='cid' type='checkbox' value='" + Eval("RoleID") + "'/>" %>
                                </td>
                                <td>
                                    <%# (int)Eval("RoleID") == 1 ? "&nbsp;&nbsp;&nbsp;&nbsp;" : "<a class='l' href='BaseRoleInfo.aspx?cmd=edit&param=" + Eval("RoleID") + "'>更新</a> "%>
                                    <a class="l" href="BaseRolePermission.aspx?param=<%#Eval("RoleID") %>">配置权限</a>
                                </td>
                                <td>
                                    <%# Eval("RoleName")%>
                                </td>
                                <td>
                                    <%# Eval("Description")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (int)Eval("RoleID") == 1 ? "&nbsp;":"<input name='cid' type='checkbox' value='" + Eval("RoleID") + "'/>" %>
                                </td>
                                <td>
                                    <%# ( int ) Eval( "RoleID" ) == 1 ? "&nbsp;&nbsp;&nbsp;&nbsp;" : "<a class='l' href='BaseRoleInfo.aspx?cmd=edit&param=" + Eval( "RoleID" ) + "'>更新</a> "%>
                                    <a class="l" href="BaseRolePermission.aspx?param=<%#Eval("RoleID") %>">配置权限</a>
                                </td>
                                <td>
                                    <%# Eval("RoleName")%>
                                </td>
                                <td>
                                    <%# Eval("Description")%>
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
