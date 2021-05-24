<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/js/DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <section class="content-header">
            <h1>工作台
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">工作台</li>
            </ol>
        </section>

        <div class="pad margin no-print">
            <div class="alert alert-info" style="margin-bottom: 0!important;">
                <i class="fa fa-info"></i>
                <b>公告:</b>
                <asp:Literal ID="ltNotice" runat="server"></asp:Literal>
            </div>
        </div>

        <section class="content invoice">
            <div class="row">
                <div class="col-sm-6 search-form">
                    <div class="input-group">
                        推广链接
                            <input name="txtShareLink" class="form-control input-sm" style="width: 80%;" type="text" runat="server" id="txtShareLink" />
                        <div class="input-group-btn">
                            &nbsp;&nbsp;<img src="img/avatar04.png" runat="server" id="minImg" onclick="imgShowClock(this)" style="width: 30px; height: 30px;" />&nbsp;←点击放大
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i>统计信息
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6" style="width: 100%;">
                    <p class="lead">代理信息</p>
                    <div class="table-responsive" style="overflow: hidden">
                        <table class="table">
                            <tr>
                                <td style="width: 50%">直属代理人数:</td>
                                <td>
                                    <asp:Literal ID="ltProxyCount" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>直属代理余额(金币)：</td>
                                <td>
                                    <asp:Literal ID="ltProxyTotalScore" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>直属代理盈亏(金币):</td>
                                <td>
                                    <asp:Literal ID="ltProxyTotalWinScore" runat="server"></asp:Literal></td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            <div class="row">

                <div class="col-xs-6" style="width: 100%">
                    <p class="lead">会员信息</p>
                    <div class="table-responsive" style="overflow: hidden">
                        <table class="table">
                            <tr>
                                <td style="width: 50%">直属会员：</td>
                                <td>
                                    <asp:Literal ID="ltMemberCount" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>活跃人数：</td>
                                <td>
                                    <asp:Literal ID="ltActiveMemberCount" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>游戏人数:</td>
                                <td>
                                    <asp:Literal ID="ltOnlineMembers" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>直属会员余额(金币)：</td>
                                <td>
                                    <asp:Literal ID="ltMemberTotalScore" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>直属会员盈亏(金币):</td>
                                <td>
                                    <asp:Literal ID="ltMemberTotalWinScore" runat="server"></asp:Literal></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 invoice-col">
                    <b>分成利润总和(金币):</b>
                    <asp:Literal ID="ltTotalProfit" runat="server"></asp:Literal>
                    &nbsp;
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="page-header">
                        <i class="fa fa-globe"></i>输赢排行榜
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6" style="width: 100%;">
                    <div class="table-responsive" style="overflow: hidden">
                        <span>日期：</span><b>
                            <input name="" id="txtRankDay" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" type="text" class="scinput" />
                            <input id="Button3" type="button" value="查询" class="btn btn-sm btn-primary" onclick="searchRankClick('0')" />
                            <input id="Button4" type="button" value="今天" class="btn btn-sm btn-primary" onclick="searchRankClick('<%=DateTime.Now.Date %>    ')" />
                            <input id="Button5" type="button" value="昨天" class="btn btn-sm btn-primary" onclick="searchRankClick('<%=DateTime.Now.Date.AddDays(-1) %>    ')" />
                            <input id="Button1" type="button" value="前天" class="btn btn-sm btn-primary" onclick="searchRankClick('<%=DateTime.Now.Date.AddDays(-2) %>    ')" />
                        </b>
                    </div>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="box-body table-responsive">
                    <img src="/images/ico03.png" /><b id="WinRankingTitle" runat="server"> 今日赢金币前10名</b>
                    <table id="Table2" class="table table-bordered table-striped">
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
                                <th>赢取金币&nbsp;(统计：<b id="totalWinText" runat="server" style="color: green;"></b>)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="reptWinRank" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%# Eval("userid") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td style="color: green;"><%# FormatMoney(Eval("nvalue")) %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-xs-12">
                <div class="box-body table-responsive">
                    <img src="/images/ico03.png" /><b id="LostRankingTitle" runat="server"> 今日输金币前10名</b>
                    <table id="Table1" class="table table-bordered table-striped">
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
                                <th>输掉金币&nbsp;(统计：<b id="totalLostText" runat="server" style="color: red;"></b>)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="reptLoseRank" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%# Eval("userid") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td style="color: red;"><%# FormatMoney(Eval("nvalue")) %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            <div id="bigImgDiv" onclick="hideImgClick()" style="position: absolute; top: 20%; display: none; width: 100%; text-align: center; z-index: 10000;">
                <img id="bigImg" runat="server" src="img/avatar04.png" />
            </div>
        </section>
    </aside>
    <script type="text/javascript">
        function imgShowClock(e) {
            $("body").append('<div id="backgroundDiv" style="position:absolute;top:0;left:0;right:0;bottom:0; width:100%;height:100%; background-color:rgba(151,149,149,0.7); z-index:0;"></div>');
            $("#bigImgDiv").show();
        }

        function hideImgClick() {
            $("#backgroundDiv").remove();
            $("#bigImgDiv").hide();
        }

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
            location.href='/MSysRoot/Index.aspx?rankday='+date;
        }
    </script>
</asp:Content>
