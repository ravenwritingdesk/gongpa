<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordExchangeList.aspx.cs" Inherits="Game.Web.Module.WebManager.RecordExchangeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script src="../../scripts/My97DatePicker/WdatePicker.js"></script>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 商品管理</td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="24%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">日期查询：
                        </td>
                        <td>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                            至
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddHandleType" runat="server">
                                <asp:ListItem Value="-1" Text="-所有状态-"></asp:ListItem>
                                <asp:ListItem Value="0" Text="未处理"></asp:ListItem>
                                <asp:ListItem Value="1" Text="审批成功"></asp:ListItem>
                                <asp:ListItem Value="2" Text="审批不通过"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width:50px;"></td>
                        <td height="td3">
                            <asp:Button ID="btnSuccess" runat="server" Text="发货" CssClass="btn_operate"
                                OnClick="btnSuccess_Click" OnClientClick="return deleteop()" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn_operate"
                                OnClick="btnCancel_Click" OnClientClick="return deleteop()" />
                            <input type="text" name="txtCancelReson" class="text" id="txtCancelReson" runat="server" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" /></th>
                            <th>管理</th>
                            <th>购买者帐号</th>
                            <th>所属代理</th>
                            <th>收货人姓名</th>
                            <th>收货人电话</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>状态</th>
                            <th>兑换时间</th>
                            <th>处理时间</th>
                            <th>审核原因</th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptExchange" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#Convert.ToInt16(Eval("HandleType")) == 0 ? "<input name='cid' type='checkbox' value='" + Eval("Id") + "' />" : "" %> </td>
                                <td>
                                    <a class="l" href="RecordExchangeInfo.aspx?cmd=edit&param=<%#Eval("Id")%>">查看</a>
                                </td>
                                <td><%# Eval("UserAccount")%></td>
                                <td><%# Eval("BelongAgentAccount")%></td>
                                <td><%# Eval("RecUserName")%></td>
                                <td><%# Eval("RecUserPhone")%></td>
                                <td><%# Eval("PrizeName")%></td>
                                <td><%# Eval("PrizePrice")%></td>
                                <td><%#GetHandleTypeDesc(Convert.ToInt16(Eval("HandleType")))%></td>
                                <td><%# Eval("CreateDate")%></td>
                                <td><%# Eval("HandleDate")%></td>
                                <td><%# Eval("CancelReason")%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%#Convert.ToInt16(Eval("HandleType")) == 0 ? "<input name='cid' type='checkbox' value='" + Eval("Id") + "' />" : "" %> </td>
                                <td>
                                    <a class="l" href="RecordExchangeInfo.aspx?cmd=edit&param=<%#Eval("Id")%>">查看</a>
                                </td>
                                <td><%# Eval("UserAccount")%></td>
                                <td><%# Eval("BelongAgentAccount")%></td>
                                <td><%# Eval("RecUserName")%></td>
                                <td><%# Eval("RecUserPhone")%></td>
                                <td><%# Eval("PrizeName")%></td>
                                <td><%# Eval("PrizePrice")%></td>
                                <td><%#GetHandleTypeDesc(Convert.ToInt16(Eval("HandleType")))%></td>
                                <td><%# Eval("CreateDate")%></td>
                                <td><%# Eval("HandleDate")%></td>
                                <td><%# Eval("CancelReason")%></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"><span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpExchange" runat="server" OnPageChanged="anpPage_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20"
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


