<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreRanking.aspx.cs" Inherits="UserHandlerWeb.ReferencePage.ScoreRanking" %>

<!DOCTYPE html>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>排行榜</title>
    <link href="/style/base.css" rel="stylesheet" type="text/css" />
    <link href="/style/Ranking.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
</head>



<body>

    <section class="Recharge">
        <ul class="tab_menu clearfix">
            <li class="cur">富豪榜</li>
            <li onclick="redirectPageClick()">赌神榜</li>
        </ul>
        <div class="tab_box">

            <div class="" date-name="富豪榜">
                <div class="DivBg">
                    <div class="DivBr">
                        <div class="">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table02">
                                <colgroup>
                                    <col width="20%">
                                    <col width="20%">
                                    <col width="20%">
                                    <col width="40%">
                                </colgroup>
                                <tr class="tr01">
                                    <th scope="col">称号排行</th>
                                    <th scope="col">昵称</th>
                                    <th scope="col">金币数</th>
                                    <th scope="col">游戏宣言</th>
                                </tr>
                            </table>
                            <div style="height: 300px; overflow-y: auto;" id="tbodyTable">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table02">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="20%">
                                        <col width="20%">
                                        <col width="40%">
                                    </colgroup>
                                    <asp:Repeater ID="reptDataPager" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("RowId") %></td>
                                                <td><%#Eval("NickName") %></td>
                                                <td><%#UserHandlerWeb.App_Class.WebAppCommon.FormatMoney(Eval("Score").ToString()) %></td>
                                                <td><%#Eval("UnderWrite") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table02">
                                <colgroup>
                                    <col width="20%">
                                    <col width="19%">
                                    <col width="20%">
                                     <col width="40%">
                                </colgroup>
                                <tr>
                                    <td><span id="spUserRanking" runat="server"></span></td>
                                    <td><span id="spNickName" runat="server"></span></td>
                                    <td><span id="spScore" runat="server"></span></td>
                                    <td><span id="spUnderWrite" runat="server"></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="UserIdHidden" runat="server" />
            <input type="hidden" id="TokenHidden" runat="server" />
        </div>
    </section>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $("#tbodyTable tr").each(function (k, v) {
            if ($(v).children().eq(0).text() == 1)
            {
                $(v).children().eq(0).html('<img src="/images/Ranking01.png">');
            } else if ($(v).children().eq(0).text() == 2) {
                $(v).children().eq(0).html('<img src="/images/Ranking02.png">');
            } else if ($(v).children().eq(0).text() == 3) {
                $(v).children().eq(0).html('<img src="/images/Ranking03.png">');
            }
        });
    });

    function redirectPageClick()
    {
        location.href = "/ReferencePage/WinRanking.aspx?Token=" + $("#<%=TokenHidden.ClientID %>").val() + "&UserId=" + $("#<%=UserIdHidden.ClientID %>").val();
    }
</script>
