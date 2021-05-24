<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackList.aspx.cs" Inherits="Game.Web.Module.WebManager.FeedbackList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/styles/Site.css" rel="stylesheet" type="text/css" />

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 反馈管理
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">用户查询：
                        </td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="text"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlRevertStatus" runat="server">
                                <asp:ListItem Value="0" Text="全部"></asp:ListItem>
                                <asp:ListItem Value="1" Text="已回复"></asp:ListItem>
                                <asp:ListItem Value="2" Text="未回复"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <div class="searchList" style="height: 40px;">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="Tmg7">
                        <colgroup>
                            <col width="10%" />
                            <col />
                        </colgroup>
                        <tr>
                            <td class="td1">
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
                                <th>
                                    <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                                </th>
                                <th>管理
                                </th>
                                <th>反馈标题
                                </th>
                                <th>用户帐号
                                </th>
                                <th>提交时间
                                </th>
                                <th>联系方式
                                </th>
                                <th>浏览次数
                                </th>
                                <th>回复时间
                                </th>
                                <th>回复人
                                </th>
                                <th>禁用状态
                                </th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="rptFeedback" runat="server">
                            <ItemTemplate>
                                <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                    onmouseout="this.style.backgroundColor=currentcolor">
                                    <td>
                                        <input name='cid' type='checkbox' value='<%# Eval("FeedbackID")%>' />
                                    </td>
                                    <td>
                                        <a class="l" href="FeedbackInfo.aspx?cmd=edit&param=<%#Eval("FeedbackID")%>">回复</a>
                                    </td>
                                    <td title="<%#Eval("FeedbackTitle")%>">
                                        <div>
                                            <%# Eval("FeedbackTitle")%>
                                        </div>
                                    </td>
                                    <td>
                                        <%# Eval("Accounts")%>
                                    </td>
                                    <td>
                                        <%# Eval("FeedbackDate")%>
                                    </td>
                                    <td>
                                        <%#Eval( "ClientIP" )%>
                                        <%--<%# GetAddressWithIP(Eval("ClientIP").ToString())%>--%>
                                    </td>
                                    <td>
                                        <%# Eval("ViewCount")%>
                                    </td>
                                    <td>
                                        <%# Eval("RevertDate")%>
                                    </td>
                                    <td>
                                        <%# (int)Eval("RevertUserID") == 0 ? "" : GetMasterName((int)Eval("RevertUserID"))%>
                                    </td>
                                    <td>
                                        <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                    onmouseout="this.style.backgroundColor=currentcolor">
                                    <td>
                                        <input name='cid' type='checkbox' value='<%# Eval("FeedbackID")%>' />
                                    </td>
                                    <td>
                                        <a class="l" href="FeedbackInfo.aspx?cmd=edit&param=<%#Eval("FeedbackID")%>">回复</a>
                                    </td>
                                    <td title="<%#Eval("FeedbackTitle")%>">
                                        <div>
                                            <%# Eval("FeedbackTitle")%>
                                        </div>
                                    </td>
                                    <td>
                                        <%# Eval("Accounts")%>
                                    </td>
                                    <td>
                                        <%# Eval("FeedbackDate")%>
                                    </td>
                                    <td>
                                        <%#Eval( "ClientIP" )%>
                                    </td>
                                    <td>
                                        <%# Eval("ViewCount")%>
                                    </td>
                                    <td>
                                        <%# Eval("RevertDate")%>
                                    </td>
                                    <td>
                                        <%# (int)Eval("RevertUserID") == 0 ? "" : GetMasterName((int)Eval("RevertUserID"))%>
                                    </td>
                                    <td>
                                        <%# GetNullityStatus((byte)Eval("Nullity"))%>
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
