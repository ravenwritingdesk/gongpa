<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnLineOrderList.aspx.cs" Inherits="Game.Web.Module.FilledManager.OnLineOrderList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/JQuery.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 订单管理
                </td>
            </tr>
        </table>
        <!-- 头部菜单 End -->
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                     <colgroup>
                        <col width="8%" />
                        <col width="25%" />
                        <col width="9%" />
                        <col width="9%" />
                        <col width="28%" />
                        <col />
                    </colgroup>
                    <tr>

                        <td class="td1">日期查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtStartDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        至:
                            <asp:TextBox ID="txtEndDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlGlobalShareInfo" runat="server">
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
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                     <colgroup>
                        <col width="8%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col width="9%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">用户查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" CssClass="text" runat="server"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按游戏ID</asp:ListItem>
                                <asp:ListItem Value="3">按订单号</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td>
                            <asp:Button ID="btnQueryOrder" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQueryOrder_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr>
                            <td class="listTitle">
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </td>
                            <td class="listTitle2">订单日期
                            </td>
                            <td class="listTitle2">订单号码
                            </td>
                            <td class="listTitle2">服务类别
                            </td>
                            <td class="listTitle2">用户帐号
                            </td>
                            <td class="listTitle2">游戏ID
                            </td>
                            <td class="listTitle2">订单金额
                            </td>
                            
                            <td class="listTitle2">订单金币
                            </td>
                            
                            <td class="listTitle2">订单状态
                            </td>
                            
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptOnLineOrder" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# (byte)Eval("OrderStatus") == 0 ? "<input name='cid' type='checkbox' value='" + Eval("OnLineID") + "'/>" : "&nbsp;"%>
                                </td>
                                <td>
                                    <%# Eval("ApplyDate")%>
                                </td>
                                <td>
                                    <%# Eval("OrderID")%>
                                </td>
                                <td>
                                    <%# GetShareName((int)Eval("ShareID"))%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('../AccountManager/AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                        <%#Eval("Accounts") %></a>
                                </td>
                                <td>
                                    <%# Eval("GameID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                
                                <td>
                                    <%# Eval( "CardGold" )%>
                                </td>
                               
                                <td>
                                    <%# GetOnLineOrderStatus((byte)Eval("OrderStatus"))%>
                                </td>
                                
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                               <td>
                                    <%# (byte)Eval("OrderStatus") == 0 ? "<input name='cid' type='checkbox' value='" + Eval("OnLineID") + "'/>" : "&nbsp;"%>
                                </td>
                                <td>
                                    <%# Eval("ApplyDate")%>
                                </td>
                                <td>
                                    <%# Eval("OrderID")%>
                                </td>
                                <td>
                                    <%# GetShareName((int)Eval("ShareID"))%>
                                </td>
                                <td>
                                    <a class="l" href="javascript:void(0);" onclick="openWindowOwn('../AccountManager/AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>','<%#Eval("UserID").ToString() %>',850,600);">
                                        <%#Eval("Accounts") %></a>
                                </td>
                                <td>
                                    <%# Eval("GameID")%>
                                </td>
                                <td>
                                    <%# Eval("OrderAmount")%>
                                </td>
                                
                                <td>
                                    <%# Eval( "CardGold" )%>
                                </td>
                               
                                <td>
                                    <%# GetOnLineOrderStatus((byte)Eval("OrderStatus"))%>
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
