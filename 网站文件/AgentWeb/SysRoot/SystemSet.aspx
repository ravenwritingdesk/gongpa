<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemSet.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.SystemSet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <style>
        input {
            width: 60px;
        }
    </style>
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
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/Index.aspx">首页</a></li>
                <li><a href="#">计划配置</a></li>
            </ul>
        </div>

        <div class="formbody">
            <div style="display:none;">
                <div class="formtitle">
                    <span>统计每日输赢任务配置</span>
                </div>
                <ul class="forminfo">
                    <li>
                        <label>时间类型：</label>
                        <div class="vocation">
                            <asp:DropDownList ID="ddTaxTimeType" runat="server" CssClass="select3" OnSelectedIndexChanged="ddTimeType_SelectedIndexChanged">
                                <asp:ListItem Value="0">每天</asp:ListItem>
                                <asp:ListItem Value="1">每周</asp:ListItem>
                                <asp:ListItem Value="2">每月</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                    </li>
                    <li>
                        <label>日期：</label><input name="" type="text" class="dfinput" runat="server" id="tTaxDay" maxlength="200" style="width: 200px;" /><span>日期必须要逗号分开：比如选每周一，周三，周五：（1,3,5）.礼拜天对应为0</span></li>
                    <li>
                        <label>小时：</label>
                        <div class="vocation">
                            <asp:DropDownList ID="ddTaxHour" CssClass="select3" runat="server">
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <label>分钟：</label>
                        <div class="vocation">
                            <asp:DropDownList ID="ddTaxMinute" CssClass="select3" runat="server">
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <label>是否有效：</label><input type="checkbox" runat="server" id="taxIsActive" checked="checked" />
                    </li>
                    <li>
                        <label>上次执行时间：</label><input name="" type="text" disabled="disabled" class="dfinput" runat="server" id="taxLastExecDate" maxlength="200" style="width: 200px;" /><input type="hidden" runat="server" id="taxLastExecDateH" />
                    </li>
                </ul>
                <br />
                <br />
            </div>

            <div class="formtitle"><span>发放利润任务配置</span></div>
            <ul class="forminfo">
                <li>
                    <label>时间类型：</label>
                    <div class="vocation">
                        <asp:DropDownList ID="ddSendBTimeType" runat="server" CssClass="select3" OnSelectedIndexChanged="ddTimeType_SelectedIndexChanged">
                            <asp:ListItem Value="0">每天</asp:ListItem>
                            <asp:ListItem Value="1">每周</asp:ListItem>
                            <asp:ListItem Value="2">每月</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </li>
                <li>
                    <label>日期：</label><input name="" type="text" class="dfinput" runat="server" id="tSendBDay" maxlength="200" style="width: 200px;" /><span>日期必须要逗号分开：比如选每周一，周三，周日：（1,3,0）。礼拜天对应为0</span></li>
                <li>
                    <label>小时：</label>
                    <div class="vocation">
                        <asp:DropDownList ID="ddSendBHour" CssClass="select3" runat="server">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <label>分钟：</label>
                    <div class="vocation">
                        <asp:DropDownList ID="ddSendBMinute" CssClass="select3" runat="server">
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <label>是否有效：</label><input type="checkbox" runat="server" id="sendBIsActive" checked="checked" />
                </li>
                <li>
                    <label>上次执行时间：</label><input name="" type="text" disabled="disabled" class="dfinput" runat="server" id="sendBLastExecDate" maxlength="200" style="width: 200px;" /><input type="hidden" runat="server" id="sendBLastExecDateH" />
                </li>
            </ul>
            <ul class="forminfo">
                <li>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="保存" OnClick="btnSubmit_Click" />
                </li>
            </ul>
        </div>
    </form>
</body>
</html>

