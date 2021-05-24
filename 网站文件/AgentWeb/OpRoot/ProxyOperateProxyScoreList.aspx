<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyOperateProxyScoreList.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.OpRoot.ProxyOperateProxyScoreList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/Common.js"></script>
    <script>
        $(document).ready(function (e) {
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&proxyId=" + $("#<%=hdproxyId.ClientID%>").val() + "&op=" + $("#<%=hdop.ClientID%>").val();
            OrderBy(filed, orderByType, parameters);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/OpRoot/PayOrderManage.aspx">上分下分</a></li>
                <li><a href="/OpRoot/ProxyUpScore.aspx">代理上分下分记录</a></li>
            </ul>
        </div>

        <div class="rightinfo">

            <div class="tools">
                <ul class="toolbar1" style="width: 70%">
                    <li>代理 <%=this.Proxy.account%> 对代理的上下分详情</li>
                </ul>
                <ul class="toolbar1" style="width: 30%; float: right">
                    <li><a href="ProxyUpScore.aspx">返回上一页</a></li>
                </ul>
            </div>


             <input type="hidden" id="hdop" runat="server" value="" />
            <input type="hidden" id="hdproxyId" runat="server" value="" />
            <input type="hidden" id="hdOrderByType" runat="server" value="" />
            <input type="hidden" id="hdOrderByField" runat="server" value="" />
            <table class="tablelist">
                <thead>
                    <tr>
                        <th>序号<i class="sort"><img src="/images/px.gif" /></i></th>
                        <th><a href='javascript:OrderByClick("CreateTime","");' id="OrderByA_CreateTime" class="tablelink">时间</a></th>
                        <th>操作者帐号</th>
                        <th>操作前银行余额</th>
                        <th><a href='javascript:OrderByClick("ChangeScore","");' id="OrderByA_ChangeScore" class="tablelink">变化数值(金币)</a></th>
                        <th>变化数值(RMB)</th>
                        <th>操作后银行余额</th>
                        <th><%= this.operate ? "出分者帐号" : "接分者帐号"%></th>
                        <th><%= this.operate ? "出分者姓名" : "接分者姓名"%></th>
                        <th><%= this.operate ? "接分者帐号" : "出分者帐号"%></th>
                        <th><%= this.operate ? "接分者姓名" : "出分者姓名"%></th>
                        <th>操作类型</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("RowIndex")%></td>
                                <td><%#Eval("CreateTime")%></td>
                                <td><%#Eval("HandlerUserAccount")%></td>
                                <td><%#FormatMoney(Eval("OpPreviouScore"))%></td>
                                <td><%#FormatMoney(Eval("ChangeScore"))%></td>
                                <td><%#FormatMoney(ConvertGoldToRMB(Convert.ToInt64(Eval("ChangeScore"))))%></td>
                                <td><%#FormatMoney(Eval("SrcScore"))%></td>
                                <td><%#Eval("Account")%></td>
                                <td><%#Eval("Name")%></td>
                                <td><%#Eval("OperateAccount")%></td>
                                <td><%#Eval("OperateName")%></td>
                                <td><%= this.operate ? "下分" : "上分"%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>


            <div class="pagination pull-right">
                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
            </div>
        </div>
        <script type="text/javascript">
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>


