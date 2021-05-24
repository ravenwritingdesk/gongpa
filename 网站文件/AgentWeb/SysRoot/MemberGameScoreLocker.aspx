<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberGameScoreLocker.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.MemberGameScoreLocker" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="#">游戏中的用户</a></li>
            </ul>
        </div>

        <div class="rightinfo">
            <div class="tools">
                <ul class="toolbar1" style="width: 70%">
                    <li>游戏中的用户</li>
                </ul>
                <ul class="toolbar1" style="width: 30%; float: right">
                    <li><a href="/SysRoot/index.aspx">返回上一页</a></li>
                </ul>
            </div>
            <table class="tablelist">
                <thead>
                    <tr>
                        <th>序号
                        </th>
                        <th>用户标识
                        </th>
                        <th>用户帐号
                        </th>
                        <th>所属代理
                        </th>
                        <th>游戏
                        </th>
                        <th>房间
                        </th>
                        <th>登录地址
                        </th>
                        <th>登录机器
                        </th>
                        <th>进入时间
                        </th>
                        <th>时长
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("RowIndex") %></td>
                                <td><%#Eval("UserID")%></td>
                                <td><%#Eval("Accounts")%></td>
                                <td><%#Eval("ProxyAccount")%></td>
                                <td><%#Eval("KindName")%></td>
                                <td><%#Eval("ServerName")%></td>
                                <td><%#Eval("EnterIP")%></td>
                                <td><%#Eval("EnterMachine")%></td>
                                <td><%#Eval("CollectDate")%></td>
                                <td><%#Eval("DiffTime")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

        <div class="pagination pull-right">
            <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
        </div>


        <script type="text/javascript">
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>

