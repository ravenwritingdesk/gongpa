<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemStat.aspx.cs" Inherits="Game.Web.Module.BackManager.SystemStat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/comm.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

    <title></title>
    <style type="text/css">
        .gamelist {
            width: 650px;
        }

            .gamelist span {
                float: left;
                width: 200px;
                height: 23px;
                line-height: 19px;
                text-align: left;
                margin-top: 2px;
                margin-right: 0;
                margin-bottom: 2px;
                margin-left: 0;
            }
    </style>
    <script type="text/javascript">
        function showWastClick(e)
        {
            if ($(e).text() == "隐藏") {
                $("#wastTr").hide();
                $(e).text("查看每日明细");
            } else {
                searchWastDetailClick();
                $("#txtStartDate").val();
                $("#wastTr").show();
                $(e).text("隐藏");
            }
        }

        function searchWastDetailClick() {
            var startDate= $("#txtStartDate").val();
            var endDate = $("#txtEndDate").val();
            if (startDate == "")
            {
                alert("开始时间不能为空。");
                return;
            }
            if (endDate == "") {
                alert("结束时间不能为空。");
                return;
            }
            $.ajax({
                url: "/Module/HandlerFolder/AdminHandler.ashx?rd=" + Math.random(),
                data:
                {
                    "action": "GetWasteDetail",
                    "startDate": startDate,
                    "endDate": endDate
                },
                type: "GET",
                async: false,
                cache: false,
                success: function (data) {
                    if (data != "") {
                        var headHtml = "<tr><th class='listTitle2'>日期</th>";
                        var bodyHtml = "<tr align='center'><td>损耗</td>";
                        var allWaste = 0;
                        var result = eval(data);
                        $.each(result, function (k, v) {
                            headHtml += "<th>" + v.InsertTime + "</th>";
                            bodyHtml += "<td>" + v.Waste + "</td>";
                            allWaste += parseFloat(v.Waste);
                        });
                        headHtml += "<th>总损耗</th></tr>";
                        bodyHtml += "<td>" + allWaste + "</td></tr>";
                        $("#tableList thead").html(headHtml);
                        $("#tableList tbody").html(bodyHtml);
                    }
                },
                error: function () {
                    alert(1);
                }
            });

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：后台系统 - 系统统计
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10">
                    <input type="button" id="btnRefresh" class="btn_operate" value="刷新" onclick="javascript: location.href = location.href;" />
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="5" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        用户统计
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">游戏人数：
                </td>
                <td class="listTdRight">
                    <asp:Literal ID="ltOnLineCount" runat="server"></asp:Literal>
                    个
                </td>
                <td class="listTdLeft">注册总人数：
                </td>
                <td class="listTdRight">
                    <asp:Literal ID="ltAllCount" runat="server"></asp:Literal>
                    个
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="listTdLeft">冻结用户：
                </td>
                <td class="">
                    <asp:Literal ID="ltDisenableCount" runat="server"></asp:Literal>
                    个
                </td>
                <td class="listTdLeft">今日注册人数：
                </td>
                <td>
                    <asp:Literal ID="ltDayCount" runat="server"></asp:Literal>
                    个
                </td>
                <td></td>
            </tr>
            <tr>
                <td height="35" colspan="5" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        金币统计
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">金币总量：
                </td>
                <td>
                    <asp:Literal ID="ltScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td class="listTdLeft">代理金币总和：
                </td>
                <td>
                    <asp:Literal ID="ltProxyScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="listTdLeft">银行总量：
                </td>
                <td>
                    <asp:Literal ID="ltInsureScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td class="listTdLeft">会员金币总和：
                </td>
                <td>
                    <asp:Literal ID="ltMemberScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="listTdLeft">银行+背包总量：
                </td>
                <td>
                    <asp:Literal ID="ltAllScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td height="35" colspan="5" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        赠送统计
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">注册赠送：
                </td>
                <td>
                    <asp:Literal ID="ltRegGrantScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td class="listTdLeft">今日赠送：
                </td>
                <td>
                    <asp:Literal ID="ltDayGrantScore" runat="server"></asp:Literal>
                    金币
                </td>
                <td></td>
            </tr>

            <tr>
                <td height="35" colspan="5" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        点卡统计
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">生成张数：
                </td>
                <td>
                    <asp:Literal ID="ltCardCount" runat="server"></asp:Literal>
                    张
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">金币总量：
                </td>
                <td>
                    <asp:Literal ID="ltCardGold" runat="server"></asp:Literal>
                    金币
                </td>
                <td class="listTdLeft">面额总量：
                </td>
                <td>
                    <asp:Literal ID="ltCardPrice" runat="server"></asp:Literal>
                    元
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="listTdLeft">充值张数：
                </td>
                <td>
                    <asp:Literal ID="ltCardPayCount" runat="server"></asp:Literal>
                    张
                </td>
                <td class="listTdLeft">充值金币：
                </td>
                <td>
                    <asp:Literal ID="ltCardPayGold" runat="server"></asp:Literal>
                    金币
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="listTdLeft">充值人民币总数：
                </td>
                <td>
                    <asp:Literal ID="ltCardPayPrice" runat="server"></asp:Literal>
                    元
                </td>
                <td class="listTdLeft">实卡张数：
                </td>
                <td>
                    <asp:Literal ID="ltMemberCardCount" runat="server"></asp:Literal>
                    张
                </td>
                <td></td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        税收统计
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">税收总量：
                </td>
                <td>
                    <asp:Literal ID="ltRevenue" runat="server"></asp:Literal>
                    金币
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">转账税收：
                </td>
                <td>
                    <asp:Literal ID="ltTransferRevenue" runat="server"></asp:Literal>
                    金币
                </td>
            </tr>
            <tr>
                <td valign="top" class="listTdLeft">游戏税收：<br />
                    （金币）&nbsp;&nbsp;
                </td>
                <td>
                    <div class="gamelist">
                        <asp:Repeater ID="rptGameTax" runat="server">
                            <ItemTemplate>
                                <span>
                                    <%# GetGameKindName(int.Parse( Eval( "KindID" ).ToString( )))%>(<%# Eval( "Revenue" ).ToString( )%>) </span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3 pd7">
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="listTdLeft">房间税收：<br />
                    （金币）&nbsp;&nbsp;
                </td>
                <td>
                    <div class="gamelist">
                        <asp:Repeater ID="rptRoomTax" runat="server">
                            <ItemTemplate>
                                <span>
                                    <%#GetGameRoomName(int.Parse( Eval( "ServerID" ).ToString( )))%>(<%# Eval( "Revenue" ).ToString( )%>)</span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        损耗统计&nbsp;&nbsp;
                        <a style="color: #056dae;" href="javascript:void(0)" onclick="showWastClick(this)">查看每日明细</a>
                    </div>
                </td>
            </tr>

            <tr id="wastTr" style="display:none;">
                <td colspan="2">
                    <div class="winQuery"  style="height: 100px;">
                          <div class="searchList" style="height: 40px;">
                            <table cellspacing="0" cellpading="0">
                                <tr>
                                    <td class="td1"></td>
                                    <td class="td2">日期:
                                        <asp:TextBox ID="txtStartDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtEndDate\',{d:-9})}',maxDate:'#F{$dp.$D(\'txtEndDate\',{d:0})}'})"></asp:TextBox>
                                    </td>
                                    <td class="td2">至:
                                        <asp:TextBox ID="txtEndDate" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\',{d:0})}',maxDate:'#F{$dp.$D(\'txtStartDate\',{d:9})}'})"></asp:TextBox>
                                    </td>
                                    <td class="td4">
                                        <input type="button" value="查询" class="btn_operate" onclick="searchWastDetailClick()" />
                                    </td>
                                    <td>一次最多查询10天</td>
                                    <td style="width:30%;"></td>
                                </tr>
                            </table>
                        </div>

                        <div class="dataList">
                            <table cellspacing="0" rules="all"  id="tableList">
                                <thead>
                                    <tr>
                                        <th class="listTitle2">日期</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>2015-10-1</th>
                                        <th>总损耗</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr align="center">
                                        <td>损耗</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                        <td>1000000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3 pd7">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">损耗总量：
                </td>
                <td>
                    <asp:Literal ID="ltWaste" runat="server"></asp:Literal>
                    金币
                </td>
            </tr>
            <tr>
                <td valign="top" class="listTdLeft">游戏损耗：<br />
                    （金币）&nbsp;&nbsp;
                </td>
                <td>
                    <div class="gamelist">
                        <asp:Repeater ID="rptGameWast" runat="server">
                            <ItemTemplate>
                                <span>
                                    <%# GetGameKindName(int.Parse( Eval( "KindID" ).ToString( )))%>(<%# Eval( "Waste" ).ToString( )%>)</span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
            </tr>
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3 pd7">
                    </div>
                </td>
            </tr>
            <tr>
                <td valign="top" class="listTdLeft">房间损耗：<br />
                    （金币）&nbsp;&nbsp;
                </td>
                <td>
                    <div class="gamelist">
                        <asp:Repeater ID="rptRoomWast" runat="server">
                            <ItemTemplate>
                                <span>
                                    <%#GetGameRoomName(int.Parse( Eval( "ServerID" ).ToString( )))%>(<%# Eval( "Waste" ).ToString( )%>)</span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </td>
            </tr>

        </table>

    </form>
</body>
</html>
