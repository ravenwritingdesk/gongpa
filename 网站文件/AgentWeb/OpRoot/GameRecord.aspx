<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameRecord.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.OpRoot.GameRecord" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/DatePicker/WdatePicker.js"></script>
    <script src="/js/Common.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select1").uedSelect({
                width: 345
            });
            $(".select2").uedSelect({
                width: 167
            });
            $(".select3").uedSelect({
                width: 100
            });
            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&ddlGames=" + $("#<%=ddlGames.ClientID%>").val() + "&StartTime=" + $("#<%=txtBeginTime.ClientID%>").val() + "&EndTime=" + $("#<%=txtEndTime.ClientID%>").val()
                                    + "&ddlQueryType=" + $("#<%=ddlQueryType.ClientID%>").val() + "&uid=" + $("#<%=txtKeyword.ClientID%>").val()
                            + "&ddlProxyQueryType=" + $("#<%=ddlProxyQueryType.ClientID%>").val() + "&txtProxy=" + $("#<%=txtProxy.ClientID%>").val() + "&isStat=" + $("#<%=isStat.ClientID%>").is(":checked");
            OrderBy(filed, orderByType, parameters);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/OpRoot/GameRecord.aspx">会员游戏记录</a></li>
            </ul>
        </div>

        <div class="rightinfo">
            <div class="tabson">
                <ul class="seachform">

                    <li>
                        <label>游戏名称</label></li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlGames" CssClass="select3" runat="server"></asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <label>日期</label><input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtEndTime\',{d:-6});}',maxDate:'#F{$dp.$D(\'txtEndTime\',{d:0});}'})" type="text" class="scinput" />-<input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\',{d:0});}'})" runat="server" type="text" class="scinput" /></li>

                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="账号ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="玩家账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtKeyword" /></li>

                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlProxyQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="下级代理ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="下级代理账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtProxy" /></li>
                    <li>
                        <label>统计</label></li>
                    <li>
                        <input type="checkbox" runat="server" style="margin-top: 60%;" name="isStat" id="isStat" />
                    </li>
                    <li>
                        <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                    </li>

                </ul>


                <input type="hidden" id="hdOrderByType" runat="server" value="" />
                <input type="hidden" id="hdOrderByField" runat="server" value="" />
                <b class="unitclass">单位：金币</b>
                <table class="tablelist">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>玩家ID</th>
                            <th>玩家账号</th>
                            <th>游戏名称</th>
                            <th>游戏房间</th>
                            <th><a href='javascript:OrderByClick("ChangeMoney","");' id="OrderByA_ChangeMoney" class="tablelink">变化值</a></th>
                            <th><a href='javascript:OrderByClick("Revenue","");' id="OrderByA_Revenue" class="tablelink">税收</a></th>
                            <th><a href='javascript:OrderByClick("EndTime","");' id="OrderByA_EndTime" class="tablelink">结束时间</a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowIndex")%></td>
                                    <td><%#Eval("UserID")%></td>
                                    <td><%#Eval("UserName")%></td>
                                    <td><%# Eval("ComName")%></td>
                                    <td><%#Eval("RoomName")%></td>
                                    <td style="color: <%#Convert.ToInt64(Eval("ChangeMoney"))>0?"green":(Convert.ToInt64(Eval("ChangeMoney"))<0?"red":"auto") %>"><%#FormatMoney(Eval("ChangeMoney"))+"" %></td>
                                    <td><%#FormatMoney(Eval("Revenue"))%></td>
                                    <td><%#Eval("EndTime")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr style="background-color: #e5ebee" id="statTr" runat="server">
                            <td></td>
                            <td>统计</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><span class="inSpan" runat="server" id="totalChangeMoneySpan"></span></td>
                            <td><span class="inSpan" runat="server" id="totalRevenueSpan"></span></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

            </div>
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

