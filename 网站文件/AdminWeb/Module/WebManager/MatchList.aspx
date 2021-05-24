<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatchList.aspx.cs" Inherits="Game.Web.Module.WebManager.MatchList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 比赛管理
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:20px;"></td>
                <td style="width:20%;">
                    <input type="button" value="新增" class="btn_operate" onclick="Redirect('MatchInfo.aspx')" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="btnDel" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDel_Click" OnClientClick="return deleteop()" />
                    <asp:Button ID="btnDisable" runat="server" Text="冻结" CssClass="btn_operate" OnClick="btnDisable_Click" OnClientClick="return deleteop()" />
                    <asp:Button ID="btnEnable" runat="server" Text="解冻" CssClass="btn_operate" OnClick="btnEnable_Click" OnClientClick="return deleteop()" />
                </td>
                <td></td>
            </tr>
        </table>
        <div class="winQuery">
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </th>
                            <th>管理
                            </th>
                            <th>比赛标识
                            </th>
                            <th>比赛名称
                            </th>
                            <th>比赛时间
                            </th>
                            <th>赛事状态
                            </th>
                            <th>冻结状态
                            </th>
                            <th>新增日期
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("MatchID")%>' />
                                </td>
                                <td>
                                    <a href="MatchInfo.aspx?param=<%#  Eval( "MatchID" ).ToString( )%>" class="l">更新</a>
                                </td>
                                <td>
                                    <%#  Eval( "MatchID" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "MatchName" )%>
                                </td>

                                <td>
                                    <%# Eval( "MatchDate" )%>
                                </td>
                                <td>
                                    <%# GetMatchStatus( byte.Parse( Eval( "MatchStatus" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus(byte.Parse(  Eval( "Nullity" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("MatchID")%>' />
                                </td>
                                <td>
                                    <a href="MatchInfo.aspx?param=<%#  Eval( "MatchID" ).ToString( )%>" class="l">更新</a>
                                </td>
                                <td>
                                    <%#  Eval( "MatchID" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "MatchName" )%>
                                </td>
                                <td>
                                    <%# Eval( "MatchDate" )%>
                                </td>
                                <td>
                                    <%# GetMatchStatus( byte.Parse( Eval( "MatchStatus" ).ToString( ) ) )%>
                                </td>
                                <td>
                                    <%# GetNullityStatus(byte.Parse(  Eval( "Nullity" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
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
