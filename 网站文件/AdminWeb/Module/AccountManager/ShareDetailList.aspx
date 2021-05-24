<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShareDetailList.aspx.cs" Inherits="Game.Web.Module.AccountManager.ShareDetailList" %>

<!DOCTYPE html>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 充值记录
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="20%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">日期查询：
                        </td>
                        <td>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                            至
                        </td>
                        <td>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlShareID" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlCardType" runat="server">
                            </asp:DropDownList>
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
                        <tr align="center" class="bold">
                            <td class="listTitle">充值时间</td>
                            <td class="listTitle2">服务类型</td>
                            <td class="listTitle2">用户名</td>
                            <td class="listTitle2">游戏ID</td>
                            <td class="listTitle2">订单号码</td>
                            <td class="listTitle2">卡名称</td>
                            <td class="listTitle2">卡价格</td>

                            <td class="listTitle2">赠送金币</td>
                            <td class="listTitle2">充值前金币</td>
                            <td class="listTitle1">订单数量</td>
                            <td class="listTitle2">订单金额</td>
                            <td class="listTitle2">实付金额</td>
                            <td class="listTitle1">充值地址</td>
                            <td class="listTitle1">操作用户</td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptShareDetail" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td><%# Eval("ApplyDate")%></td>
                                <td><%# GetShareName((int)Eval("ShareID"))%></td>
                                <td><%# Eval("Accounts")%></td>
                                <td><%# Eval("GameID")%></td>
                                <td><%# Eval("OrderID")%></td>
                                <td><%# Eval( "CardTypeID" )%></td>
                                <td><%# Eval( "CardPrice" )%></td>
                                <td><%# Eval( "CardGold" )%></td>
                                <td><%# Eval( "BeforeGold" )%></td>
                                <td><%# Eval( "CardTotal" )%></td>
                                <td><%# Eval( "OrderAmount" )%></td>
                                <td><%# Eval( "PayAmount" )%></td>
                                <td title=" <%# Eval( "IPAddress" ).ToString( )%>"><%# GetAddressWithIP( Eval( "IPAddress" ).ToString( ) )%></td>
                                <td><%# GetAccounts((int)Eval("OperUserID"))%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td><%# Eval("ApplyDate")%></td>
                                <td><%# GetShareName((int)Eval("ShareID"))%></td>
                                <td><%# Eval("Accounts")%></td>
                                <td><%# Eval("GameID")%></td>
                                <td><%# Eval("OrderID")%></td>
                                <td><%# Eval( "CardTypeID" )%></td>
                                <td><%# Eval( "CardPrice" )%></td>
                                <td><%# Eval( "CardGold" )%></td>
                                <td><%# Eval( "BeforeGold" )%></td>
                                <td><%# Eval( "CardTotal" )%></td>
                                <td><%# Eval( "OrderAmount" )%></td>
                                <td><%# Eval( "PayAmount" )%></td>
                                <td title=" <%# Eval( "IPAddress" ).ToString( )%>"><%# GetAddressWithIP( Eval( "IPAddress" ).ToString( ) )%></td>
                                <td><%# GetAccounts((int)Eval("OperUserID"))%></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20"
                            NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5"
                            CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
