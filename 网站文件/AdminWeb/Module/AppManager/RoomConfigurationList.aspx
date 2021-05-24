<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomConfigurationList.aspx.cs" Inherits="Game.Web.Module.AppManager.RoomConfigurationList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>


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
                <td width="1232" height="25" valign="top" align="left">你当前位置：系统维护 - 游戏配置
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
                        <col width="20%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">查询：
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlGameId" runat="server">
                                <asp:ListItem Value="0">==全部游戏==</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlRoomId" runat="server">
                                <asp:ListItem Value="0">==全部房间==</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnSearch_OnClick" />
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
                            <td class="listTitle2">类型
                            </td>
                            <td class="listTitle2">库存
                            </td>
                            <td class="listTitle2">创建时间
                            </td>
                            <td class="listTitle2">修改时间
                            </td>
                            <td class="listTitle2">状态
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a class="l" href="RoomConfigurationInfo.aspx?cmd=edit&param=<%#Eval("ID")%>">编辑</a>
                                </td>
                                <td>
                                    <%# GetGameKindName(int.Parse(Eval( "GameId" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse(Eval("RoomID").ToString()))%>
                                </td>
                                <td>
                                    <%# GetTypeDesc(Eval("ConfigName").ToString())%>
                                </td>
                                <td>
                                    <%# Eval("Extend1")%>
                                </td>
                                <td>
                                    <%# Eval("CreateTime")%>
                                </td>
                                <td>
                                    <%# Eval("ModifyTime")%>
                                </td>
                                <td>
                                    <%# Eval("Nullity").ToString()=="0"?"有效":"无效"%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <a class="l" href="RoomConfigurationInfo.aspx?cmd=edit&param=<%#Eval("ID")%>">编辑</a>
                                </td>
                                <td>
                                    <%# GetGameKindName(int.Parse(Eval( "GameId" ).ToString()))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName(int.Parse(Eval("RoomID").ToString()))%>
                                </td>
                                <td>
                                    <%# GetTypeDesc(Eval("ConfigName").ToString())%>
                                </td>
                                <td>
                                    <%# Eval("Extend1")%>
                                </td>
                                <td>
                                    <%# Eval("CreateTime")%>
                                </td>
                                <td>
                                    <%# Eval("ModifyTime")%>
                                </td>
                                <td>
                                    <%# Eval("Nullity").ToString()=="0"?"有效":"无效"%>
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
                        <gsp:AspNetPager ID="anpPages" runat="server" OnPageChanged="anpPages_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
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
