<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 35px;
        }

        .ke-text-input {
        }
    </style>
</head>
<body>
    <form id="frmDefault" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">工作台</a></li>
            </ul>
        </div>
        <div class="mainindex">
            <div class="welinfo">
                <span>
                    <img src="/images/sun.png" /></span> <b>尊敬的<%=DimoNetwork.QPProxyWeb.SystemSetHelper.GetProxyLevelName(this.Proxy.ProxyLevel) %> <%= this.Proxy.account %>欢迎使用游戏管理系统</b>
            </div>
            <div class="welinfo">
                <span>我的推广链接：</span> <b>
                    <asp:TextBox ID="txtShareLink" runat="server" CssClass="scinput" Width="360px" Height="30px"></asp:TextBox>&nbsp;
                    <input id="btnCopy" type="button" value="复制链接" class="scbtn" /></b>
            </div>
            <div class="xline">
            </div>
            <div>
                <div class="xline">
                </div>
                <div class="welinfo">
                    <span>
                        <img src="/images/help.png" /></span> <b>公告</b>
                </div>
                <div>
                    <table class="tablelist">
                        <tbody>
                            <tr>
                                <td class="auto-style1" style="text-align: center;">
                                    <asp:Literal ID="ltNotice" runat="server"></asp:Literal></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="xline">
            </div>
                <b style="float:right; padding-right:10px;">单位：金币</b>
            <div>
                <table class="tablelist">
                    <tbody>
                        <tr>
                            <td class="auto-style1">会员人数：<asp:Literal ID="ltMemberCount" runat="server"></asp:Literal></td>
                            <td class="auto-style1">下级代理：<asp:Literal ID="ltProxyCount" runat="server"></asp:Literal></td>
                            <td class="auto-style1">直属代理总余额：<asp:Literal ID="ltProxyTotalScore" runat="server"></asp:Literal></td>
                            <td class="auto-style1">直属代理盈亏：<asp:Literal ID="ltProxyTotalWinScore" runat="server"></asp:Literal></td>
                            <%--<td class="auto-style1">代理亏损总额(金币)：<asp:Literal ID="ltProxyTotalLostScore" runat="server"></asp:Literal></td>--%>
                            <%--<td class="auto-style1">直属会员抽水值(金币)：<asp:Literal ID="ltMemberTaxTotal" runat="server"></asp:Literal></td>--%>
                            <td class="auto-style1">分成利润总和：<asp:Literal ID="ltTotalProfit" runat="server"></asp:Literal></td>
                        </tr>
                        <tr>
                            <td>活跃人数：<asp:Literal ID="ltActiveMemberCount" runat="server"></asp:Literal>&nbsp;<a href="/SysRoot/MemberGameScoreLocker.aspx" class="tablelink">(游戏人数：<asp:Literal ID="ltOnlineMembers" runat="server"></asp:Literal>)</a></td>
                            <%--<td>活跃人数：<asp:Literal ID="ltActiveMemberCount" runat="server"></asp:Literal></td>--%>
                            <td>我的余额：<asp:Literal ID="ltScore" runat="server"></asp:Literal></td>
                            <td>直属会员总余额：<asp:Literal ID="ltMemberTotalScore" runat="server"></asp:Literal></td>
                            <td>直属会员盈亏：<asp:Literal ID="ltMemberTotalWinScore" runat="server"></asp:Literal></td>
                            <%--<td>会员亏损总额(金币)：<asp:Literal ID="ltMemberTotalLostScore" runat="server"></asp:Literal></td>--%>
                            <%--<td>下级代理抽水值(金币)：<asp:Literal ID="ltNextProxyTaxTotal" runat="server"></asp:Literal></td>--%>
                            <%--<td>佣金利润总和(金币)：<asp:Literal ID="ltTotalTaxProfit" runat="server"></asp:Literal></td>--%>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="xline">
            </div>
            <div class="welinfo" style="padding-top: 5px; padding-bottom: 1px;">
                <span style="padding-left: 50px;">日期：</span><b>
                    <input name="" id="txtRankDay" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" type="text" class="scinput" />
                    <input id="Button3" type="button" value="查询" class="scbtn1" onclick="searchRankClick('0')" />
                    <input id="Button4" type="button" value="今天" class="scbtn1" onclick="searchRankClick('<%=DateTime.Now.Date %>    ')" />
                    <input id="Button5" type="button" value="昨天" class="scbtn1" onclick="searchRankClick('<%=DateTime.Now.Date.AddDays(-1) %>    ')" />
                    <input id="Button1" type="button" value="前天" class="scbtn1" onclick="searchRankClick('<%=DateTime.Now.Date.AddDays(-2) %>    ')" />
                </b>
            </div>
            <div class="leftinfos">

                <div class="infoleft" style="width: 49%;">

                    <div class="listtitle">
                        <img src="/images/ico03.png" /><b id="WinRankingTitle" runat="server"> 今日赢金币前10名</b>
                    </div>
                    <table class="tablelist">
                        <colgroup>
                            <col width="22%" />
                            <col width="22%" />
                            <col width="22%" />
                            <col />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>排名</th>
                                <th>ID</th>
                                <th>账号</th>
                                <th>赢取金币&nbsp;(统计：<b id="totalWinText" runat="server" style="color:green;"></b>)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="reptWinRank" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%# Eval("userid") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td style="color:green;"><%# FormatMoney(Eval("nvalue")) %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>

                </div>


                <div class="inforight" style="width: 49%;">
                    <div class="listtitle">
                        <img src="/images/ico03.png" /><b id="LostRankingTitle" runat="server"> 今日输金币前10名</b>
                    </div>
                    <table class="tablelist">
                        <colgroup>
                            <col width="22%" />
                            <col width="22%" />
                            <col width="22%" />
                            <col />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>排名</th>
                                <th>ID</th>
                                <th>账号</th>
                                <th>输掉金币&nbsp;(统计：<b id="totalLostText" runat="server" style="color:red;"></b>)</th>

                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="reptLoseRank" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%# Eval("userid") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td style="color:red;"><%# FormatMoney(Eval("nvalue")) %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>


            </div>

        </div>
    </form>
</body>
</html>
<script src="/js/zclip/jquery.zclip.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if (window.clipboardData) {
            $("#btnCopy").click(function () {
                window.clipboardData.setData("Text", $("#txtShareLink").val());
                alert("复制成功。");
            });
        } else {
            $("#btnCopy").zclip({
                path: "/js/zclip/ZeroClipboard.swf",
                copy: function () {
                    console.log($("#txtShareLink").val());
                    return $("#txtShareLink").val();
                },
                afterCopy: function () {
                    alert("复制成功。");
                }
            });
        }
    });

    function searchRankClick(dayKey)
    {
        var date=dayKey;
        if(dayKey=="0")
        {
            date=$("#<%=txtRankDay.ClientID %>").val();
        }
        if(date==null || date=="" || date==undefined)
        {
            alert('日期不能为空！');
            return;
        }
        location.href='/SysRoot/Index.aspx?rankday='+date;
    }

</script>
