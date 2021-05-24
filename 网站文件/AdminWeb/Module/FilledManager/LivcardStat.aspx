<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LivcardStat.aspx.cs" Inherits="Game.Web.Module.FilledManager.LivcardStat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 实卡管理
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="Tmg7">
            <tr>
                <td height="28">
                    <ul class="tab_menu clearfix">
                        <li onclick="Redirect('LivcardBuildStreamList.aspx')">实卡管理</li>
                        <li onclick="Redirect('LivcardCreate.aspx')">实卡生成</li>
                        <li class="cur">库存统计</li>
                        <li onclick="Redirect('GlobalLivcardList.aspx')">类型管理</li>
                    </ul>
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10"></td>
            </tr>
        </table>
        <div class="winQuery">
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <td class="listTitle1">实卡
                            </td>
                            <td class="listTitle2">库存
                            </td>
                            <td class="listTitle2">已充值
                            </td>
                            <td class="listTitle2">未充值
                            </td>
                            <td class="listTitle2">已过期
                            </td>
                            <td class="listTitle2">冻结
                            </td>
                            <td class="listTitle2">总金额
                            </td>
                            <td class="listTitle2">总金币
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# string.IsNullOrEmpty(Eval( "CardTypeID" ).ToString( ))?"合计：": GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString( )))%>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>',800,580)" class="l">
                                        <%# Eval( "TotalCount" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=1&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>1',800,580)" class="l">
                                        <%# Eval( "TotalUsed" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=2&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>2',800,580)" class="l">
                                        <%# Eval( "TotalNoUsed" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=3&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>3',800,580)" class="l">
                                        <%# Eval( "TotalOut" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=4&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>4',800,580)" class="l">
                                        <%# Eval( "TotalNullity" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <%# Eval( "TotalPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "TotalGold" ).ToString( )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# string.IsNullOrEmpty(Eval( "CardTypeID" ).ToString( ))?"合计：": GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString( )))%>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>',800,580)" class="l">
                                        <%# Eval( "TotalCount" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=1&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>1',800,580)" class="l">
                                        <%# Eval( "TotalUsed" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=2&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>2',800,580)" class="l">
                                        <%# Eval( "TotalNoUsed" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=3&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>3',800,580)" class="l">
                                        <%# Eval( "TotalOut" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="javascript:openWindowOwn('LivcardAssociatorListByStat.aspx?cmd=4&param=<%# Eval( "CardTypeID" ).ToString()%>','<%# Eval( "CardTypeID" ).ToString()%>4',800,580)" class="l">
                                        <%# Eval( "TotalNullity" ).ToString( )%>
                                    </a>
                                </td>
                                <td>
                                    <%# Eval( "TotalPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "TotalGold" ).ToString( )%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
        </div>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10"></td>
            </tr>
        </table>
    </form>
</body>
</html>
