<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RouletteSet.aspx.cs" Inherits="Game.Web.Module.WebManager.RouletteSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script src="/js/dialog-plus-min.js"></script>
    <link href="/css/ui-dialog.css" rel="stylesheet" />
    <title></title>
    <script>
        $(function () {
            $("#tbody1 td").each(function () {
                if ($(this).index() < 3) {
                    $(this).attr("style", "border-bottom:  1px dashed #9ecee7;");
                }
            });

            var allProbability = 100;
            $("input[type=text]").each(function (k, v) {
                allProbability -= parseFloat($(v).val());
            });
            $("#surplus").text(allProbability);
        });

        function ProbabilityBlur(e) {
            var surplusProbability = $("#surplus").text();
            var thisPro = $(e).val();
            if (parseFloat(thisPro) < 0 || parseFloat(thisPro) > 100 || isNaN(thisPro) || thisPro.indexOf(".") > -1) {
                $(e).val("0");
                var d3 = dialog({
                    title: '提示',
                    content: "几率必须为0-100的正整数，",
                    ok: function () { },
                });
                d3.width(260);
                d3.width(300);
                d3.show();
                return;
            }
            if (thisPro == "")
            {
                $(e).val("0");
                return;
            }
            var allProbability = 100;
            $("input[type=text]").each(function (k, v) {
                allProbability -= parseFloat($(v).val());
            });
            $("#surplus").text(allProbability);
            if (allProbability < 0 || allProbability > 100) {
                $("#surplus").css("color", "red");
                //var d3 = dialog({
                //    title: '提示',
                //    content: "总几率已经超过100，请及时调整！",
                //    ok: function () { },
                //});
                //d3.width(260);
                //d3.width(300);
                //d3.show();
                //return;
            } else {
                $("#surplus").css("color", "");
            }
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 轮盘设置
                </td>
            </tr>
        </table>

        <ul class="tab_menu clearfix">
            <li><a href="#" onclick="Redirect('LuckDrawPrizeList.aspx')">奖品管理</a></li>
            <li class="cur"><a href="#">轮盘设置</a></li>
        </ul>

        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" style="text-align: center;" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="12%" />
                        <col width="12%" />
                        <col />
                    </colgroup>
                    <tr>
                        <th>序号</th>
                        <th>奖品</th>
                        <th>几率(%)</th>
                        <td style="text-align:left;">剩余几率(<span id="surplus" runat="server">100</span>%)</td>
                    </tr>
                    <tbody id="tbody1">
                        <tr>
                            <td>1
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize1" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability1" name="txtProbability" value="" onblur="ProbabilityBlur(this)" />
                                <input type="hidden" id="idHidden1" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="border-bottom: 1px dashed #9ecee7;">
                            <td>2
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize2" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability2" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden2" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr style="border-bottom: 3px solid #9ecee7;">
                            <td>3
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize3" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability3" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden3" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>4
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize4" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability4" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden4" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>5
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize5" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability5" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden5" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>6
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize6" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" runat="server" id="txtProbability6" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden6" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>7
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize7" runat="server" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability7" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden7" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>8
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize8" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability8" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden8" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>9
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize9" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability9" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden9" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>10
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize10" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability10" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden10" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>11
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize11" runat="server" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability11" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden11" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>12
                            </td>
                            <td class="td2">
                                <asp:DropDownList ID="ddlPrize12" runat="server" Width="200">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <input type="text" class="text" id="txtProbability12" runat="server" name="txtProbability"  value="" onblur="ProbabilityBlur(this)"  />
                                <input type="hidden" id="idHidden12" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />

                            </td>

                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
