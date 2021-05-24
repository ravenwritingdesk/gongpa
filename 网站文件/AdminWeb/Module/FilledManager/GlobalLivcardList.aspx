<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GlobalLivcardList.aspx.cs" Inherits="Game.Web.Module.FilledManager.GlobalLivcardList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                        <li onclick="Redirect('LivcardStat.aspx')">库存统计</li>
                        <li class="cur">类型管理</li>
                    </ul>
                </td>
            </tr>
        </table>
        <div class="winQuery">

            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="18%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td height="39">
                            <input id="btnNew1" type="button" class="btn_operate" value="新建" onclick="Redirect('GlobalLivcardInfo.aspx')" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center" class="bold">
                            <th style="width: 30px;">
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" /></th>
                            <th>管理
                            </th>
                            <th>实卡名称
                            </th>
                            <th>实卡价格
                            </th>
                            <th>赠送金币
                            </th>
                            <th>会员等级
                            </th>
                            <th>会员天数
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#  "<input name='cid' type='checkbox' value='" + Eval( "CardTypeID" ).ToString( ) + "'/>" %>
                                </td>
                                <td>
                                    <a href="GlobalLivcardInfo.aspx?param=<%# Eval( "CardTypeID" ).ToString( )%>" class="l">更新 </a>
                                </td>
                                <td>
                                    <%# Eval( "CardName" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" ).ToString( )%>
                                </td>
                                <td>
                                    <%#GetMemberName( (byte)Eval( "MemberOrder" ))%>
                                </td>
                                <td>
                                    <%# Eval( "MemberDays" ).ToString( )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#  "<input name='cid' type='checkbox' value='" + Eval( "CardTypeID" ).ToString( ) + "'/>" %>
                                </td>
                                <td>
                                    <a href="GlobalLivcardInfo.aspx?param=<%# Eval( "CardTypeID" ).ToString( )%>" class="l">更新 </a>
                                </td>
                                <td>
                                    <%# Eval( "CardName" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" ).ToString( )%>
                                </td>
                                <td>
                                    <%#GetMemberName( (byte)Eval( "MemberOrder" ))%>
                                </td>
                                <td>
                                    <%# Eval( "MemberDays" ).ToString( )%>
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
