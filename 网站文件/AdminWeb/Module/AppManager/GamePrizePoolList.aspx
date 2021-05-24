<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GamePrizePoolList.aspx.cs" Inherits="Game.Web.Module.AppManager.GamePrizePoolList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>


    <title></title>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：系统维护 - 彩金奖池管理
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="18%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">查询：
                        </td>
                        <td class="td2"><asp:DropDownList ID="ddlGameId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGameId_SelectedIndexChanged">
                                <asp:ListItem Value="0">==全部游戏==</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="td2"><asp:DropDownList ID="ddlRoomId" runat="server">
                                <asp:ListItem Value="0">==全部房间==</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnSearch_OnClick" />
                            <asp:Button ID="btnInsert" runat="server" Text="新增配置" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center" class="bold">
                            <td>操作</td>
                            <td class="listTitle2">游戏
                            </td>
                            <td class="listTitle2">房间
                            </td>
                            <td class="listTitle2">奖池金额
                            </td>
                            <td class="listTitle2">是否游戏奖池
                            </td>
                            <td class="listTitle2">是否房间奖池
                            </td>
                            <td class="listTitle2">税收比例（‱）
                            </td>
                            <td class="listTitle2">中奖比例（‱）
                            </td>
                            <td class="listTitle2">创建时间
                            </td>
                            <td class="listTitle2">修改时间
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a href="GamePrizePoolEdit.aspx?configid=<%# Eval("ConfigId")%>">更新</a>
                                </td>
                                <td>
                                    <%# GetGameKindName(int.Parse(Eval( "GameId" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse(Eval("ServerId").ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("PrizePool","{0:C}").ToString().Replace("¥","")%>
                                </td>
                                <td>
                                    <%# Eval("IsGamePrize").ToString()=="True"?"是":"否"%>
                                </td>
                                <td>
                                    <%# Eval("IsRoomPrize").ToString()=="True"?"是":"否"%>
                                </td>
                                <td>
                                    <%# Eval("RateOfTax")%>
                                </td>
                                <td>
                                    <%# Eval("RateOfWinPrize")%>
                                </td>
                                <td>
                                    <%# Eval("CreateTime")%>
                                </td>
                                <td>
                                    <%# Eval("ModifyTime")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a href="GamePrizePoolEdit.aspx?configid=<%# Eval("ConfigId")%>">更新</a>
                                </td>
                               <td>
                                    <%# GetGameKindName(int.Parse(Eval( "GameId" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse(Eval("ServerId").ToString()))%>
                                </td>
                                <td>
                                    <%# Eval("PrizePool","{0:C}").ToString().Replace("¥","")%>
                                </td>
                                <td>
                                    <%# Eval("IsGamePrize").ToString()=="True"?"是":"否"%>
                                </td>
                                <td>
                                    <%# Eval("IsRoomPrize").ToString()=="True"?"是":"否"%>
                                </td>
                                <td>
                                    <%# Eval("RateOfTax")%>
                                </td>
                                <td>
                                    <%# Eval("RateOfWinPrize")%>
                                </td>
                                <td>
                                    <%# Eval("CreateTime")%>
                                </td>
                                <td>
                                    <%# Eval("ModifyTime")%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"></td>
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
