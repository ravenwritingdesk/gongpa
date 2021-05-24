<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordUserInoutList.aspx.cs" Inherits="Game.Web.Module.AccountManager.RecordUserInoutList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>
    <script>
        window.onload = function () {

            SetTableRowColor();

        }
    </script>
    <title></title>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 进出记录
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="20%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">日期查询：
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlTimeType" runat="server">
                                <asp:ListItem Value="1">进入时间</asp:ListItem>
                                <asp:ListItem Value="2">退出时间</asp:ListItem>
                                <asp:ListItem Value="3">停留时间</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                            至
                        </td>
                        <td>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>

                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />
                            <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="btnQueryTW" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="btnQueryYW" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="Tmg7">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td>
                            <input type="button" value="返回" class="btn_operate" onclick='Redirect("AccountsRecordInfo.aspx?param="+<%=IntParam %>)' />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <td class="listTitle">进入时间</td>
                            <td class="listTitle2">进入地址</td>
                            <td class="listTitle2">进入机器</td>
                            <td class="listTitle2">游戏</td>
                            <td class="listTitle2">房间</td>

                            <td class="listTitle2">积分</td>
                            <%--<td class="listTitle2">存款</td>
                            <td class="listTitle2">奖牌</td>
                            <td class="listTitle2">魅力</td>--%>

                            <td class="listTitle2">离开时间</td>
                            <td class="listTitle2">离开地址</td>
                            <td class="listTitle2">离开原因</td>

                            <td class="listTitle2">积分变化</td>
                            <%--<td class="listTitle2">银行变更</td>-->
                            <!--<td class="listTitle2">奖牌变更</td>-->
                            <td class="listTitle2">魅力变更</td>
                            <td class="listTitle2">经验变更</td>--%>
                            <td class="listTitle2">税收</td>
                            <td class="listTitle2">游戏时长(秒)</td>
                            <td class="listTitle2">在线时长(秒)</td>
                            <td class="listTitle2">总局</td>
                            <td class="listTitle2">赢局</td>
                            <td class="listTitle2">输局</td>
                            <td class="listTitle2">和局</td>
                            <td class="listTitle1">逃局</td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptUserInout" runat="server" OnItemDataBound="rptUserInout_ItemDataBound">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td><%# Eval("EnterTime")%></td>
                                <td title="<%# GetAddressWithIP( Eval("EnterClientIP").ToString())%>"><%# Eval( "EnterClientIP" ).ToString( ) %></td>
                                <td><%# Eval("EnterMachine")%></td>
                                <td><%# GetGameKindName((int)Eval("KindID"))%></td>
                                <td><%# GetGameRoomName((int)Eval("ServerID"))%></td>

                                <td><%# Eval("EnterScore")%></td>
                                <%-- <td><%# Eval("EnterInsure")%></td>
                               <td><%# Eval( "EnterUserMedal" )%></td>
                                <td><%# Eval( "EnterLoveliness" )%></td>--%>


                                <%# Eval("LeaveTime") == DBNull.Value ? "<td align=\"left\">正在游戏中</td>" : "<td>" + Eval("LeaveTime") + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td title='"+GetAddressWithIP( Eval( "LeaveClientIP" ).ToString( ))+"'>" +  Eval( "LeaveClientIP" ).ToString( )  + "</td>"%>
                                <td>
                                    <asp:Label ID="lblLeaveReason" runat="server"></asp:Label></td>

                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Score") + "</td>"%>
                                <%--<%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Insure") + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td>" + Eval( "UserMedal" ) + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td>" + Eval( "LoveLiness" ) + "</td>"%>

                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Experience") + "</td>"%>--%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Revenue") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("PlayTimeCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("OnLineTimeCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + ((int)Eval("WinCount") + (int)Eval("LostCount") + (int)Eval("DrawCount") + (int)Eval("FleeCount")) + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("WinCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("LostCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("DrawCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("FleeCount") + "</td>"%>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td><%# Eval("EnterTime")%></td>
                                <td title="<%# GetAddressWithIP( Eval("EnterClientIP").ToString())%>"><%# Eval( "EnterClientIP" ).ToString( ) %></td>
                                <td><%# Eval("EnterMachine")%></td>
                                <td><%# GetGameKindName((int)Eval("KindID"))%></td>
                                <td><%# GetGameRoomName((int)Eval("ServerID"))%></td>

                                <td><%# Eval("EnterScore")%></td>
                                <%-- <td><%# Eval("EnterInsure")%></td>
                               <td><%# Eval( "EnterUserMedal" )%></td>
                                <td><%# Eval( "EnterLoveliness" )%></td>--%>


                                <%# Eval("LeaveTime") == DBNull.Value ? "<td align=\"left\">正在游戏中</td>" : "<td>" + Eval("LeaveTime") + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td title='"+GetAddressWithIP( Eval( "LeaveClientIP" ).ToString( ))+"'>" +  Eval( "LeaveClientIP" ).ToString( )  + "</td>"%>
                                <td>
                                    <asp:Label ID="lblLeaveReason" runat="server"></asp:Label></td>

                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Score") + "</td>"%>
                                <%--<%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Insure") + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td>" + Eval( "UserMedal" ) + "</td>"%>
                                <%# Eval( "LeaveTime" ) == DBNull.Value ? "<td></td>" : "<td>" + Eval( "LoveLiness" ) + "</td>"%>

                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Experience") + "</td>"%>--%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("Revenue") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("PlayTimeCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("OnLineTimeCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + ((int)Eval("WinCount") + (int)Eval("LostCount") + (int)Eval("DrawCount") + (int)Eval("FleeCount")) + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("WinCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("LostCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("DrawCount") + "</td>"%>
                                <%# Eval("LeaveTime") == DBNull.Value ? "<td></td>" : "<td>" + Eval("FleeCount") + "</td>"%>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>

            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
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
