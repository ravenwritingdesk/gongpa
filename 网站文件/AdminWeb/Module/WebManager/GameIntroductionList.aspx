<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameIntroductionList.aspx.cs" Inherits="Game.Web.Module.WebManager.GameIntroductionList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            SetTableRowColor();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 游戏介绍
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="5%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlGameKind" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('GameIntroductionInfo.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table id="tableList">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" /></th>
                            <th>管理</th>
                            <th>游戏ID</th>
                            <th>游戏名称</th>
                            <th>最后修改用户</th>
                            <th>最后修改时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <input name='cid' type='checkbox' value='<%# Eval("Id")%>' /></td>
                                    <td>
                                        <a class="l" href="GameIntroductionInfo.aspx?cmd=edit&param=<%#Eval("Id")%>">更新</a>
                                    </td>
                                    <td><%# Eval("GameId") %></td>
                                    <td><%#Eval("GameName") %></td>
                                    <td><%#Eval("LastModifyUserAccount") %></td>
                                    <td><%#Eval("LastModifyData") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg" style=""></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpPage" OnPageChanged="anpPage_PageChanged" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%" UrlPaging="false">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>





