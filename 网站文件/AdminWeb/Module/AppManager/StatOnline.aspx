<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatOnline.aspx.cs" Inherits="Game.Web.Module.AppManager.StatOnline" %>

<%@ Register TagPrefix="cc1" Namespace="Anthem" Assembly="Anthem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/comm.js"></script>
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
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 在线统计</td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="20%" />
                        <col width="30%" />
                        <col />
                    </colgroup>
                    <tr>
                    <td class="td1">查询方式：
                    </td>
                    <td class="td3">
                        <cc1:DropDownList ID="ddlType" runat="server" Style="vertical-align: middle" AutoCallBack="true"
                            OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="按年"></asp:ListItem>
                            <asp:ListItem Value="1" Text="按月" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="2" Text="按日"></asp:ListItem>
                        </cc1:DropDownList><cc1:DropDownList ID="ddlSelectYear" runat="server" Style="vertical-align: middle"
                            AutoCallBack="true" OnSelectedIndexChanged="ddlSelectYear_SelectedIndexChanged">
                        </cc1:DropDownList><cc1:DropDownList ID="ddlSelectMonth" runat="server" Style="vertical-align: middle"
                            AutoCallBack="true" OnSelectedIndexChanged="ddlSelectMonth_SelectedIndexChanged">
                        </cc1:DropDownList><cc1:DropDownList ID="ddlSelectDay" runat="server" Visible="false" Style="vertical-align: middle">
                        </cc1:DropDownList>

                    </td>
                    <td style="width: 15%">
                        <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate"
                            OnClick="btnQueryTD_Click" />
                        <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate"
                            OnClick="btnQueryYD_Click" />
                    </td>
                    <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <div id="content" class="dataList">
                <asp:HiddenField ID="hfdTime" runat="server" />
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <td style="width: 100px;" class="listTitle">统计时间</td>
                            <td class="listTitle2">最高在线人数</td>
                            <td class="listTitle2">最低在线人数</td>
                            <td class="listTitle2">平均在线人数</td>
                            <td class="listTitle1">管理</td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptOnLineStream" runat="server" OnItemDataBound="rptOnLineStream_ItemDataBound">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <asp:LinkButton ID="btnNext" runat="server" Text='<%#FormatDate(Eval("InsertDateTime").ToString())%>' CssClass="l"></asp:LinkButton>
                                    <asp:Label ID="lblNext" runat="server" Text='<%#FormatDate(Eval("InsertDateTime").ToString())%>'></asp:Label>
                                </td>
                                <td><%# Eval("MaxCount")%></td>
                                <td><%# Eval("MinCount")%></td>
                                <td><%# Eval("AvgCount")%></td>
                                <td>
                                    <asp:LinkButton ID="btnDetailInfo" runat="server" Text="记录信息" CssClass="l"></asp:LinkButton>
                                    <asp:LinkButton ID="btnGameInfo" Visible="false" runat="server" Text="游戏信息" CssClass="l"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <asp:LinkButton ID="btnNext" runat="server" Text='<%#FormatDate(Eval("InsertDateTime").ToString())%>' CssClass="l"></asp:LinkButton>
                                    <asp:Label ID="lblNext" runat="server" Text='<%#FormatDate(Eval("InsertDateTime").ToString())%>'></asp:Label>
                                </td>
                                <td><%# Eval("MaxCount")%></td>
                                <td><%# Eval("MinCount")%></td>
                                <td><%# Eval("AvgCount")%></td>
                                <td>
                                    <asp:LinkButton ID="btnDetailInfo" runat="server" Text="记录信息" CssClass="l"></asp:LinkButton>
                                    <asp:LinkButton ID="btnGameInfo" Visible="false" runat="server" Text="游戏信息" CssClass="l"></asp:LinkButton>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
        </div>

    </form>
</body>
</html>
