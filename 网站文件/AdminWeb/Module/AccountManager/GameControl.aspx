<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameControl.aspx.cs" Inherits="Game.Web.Module.AccountManager.GameControl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            SetTableRowColor();
        }
    </script>
    <style type="text/css">
        .tabson {
            margin: 18px 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 游戏控制值
                </td>
            </tr>
        </table>

        <ul class="tab_menu clearfix">
            <li class="cur"><a href="#">玩家</a></li>
            <li><a href="#" onclick="Redirect('GameRoomControl.aspx')">房间</a></li>
        </ul>

        <div class="winQuery">
            <div class="searchList" style="height: 40px;">

                <table width="100%" border="0" align="center">
                   <colgroup>
                        <col width="10%" />
                        <col width="11%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">普通查询：</td>
                        <td>
                            <input name="" type="text" class="text" runat="server" id="txtKeyword" />
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlQueryType" runat="server">
                                <asp:ListItem Value="0">账号ID</asp:ListItem>
                                <asp:ListItem Value="1">玩家账号</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" class="btn_operate" runat="server" Text="查询" OnClick="btnQuery_Click" />
                        </td>
                        <td>Hi，<b><%= userExt.Username %></b>，控制值为0,表示不控制，控制值为正数，表示为要送出的分值，控制值为负数，表示要回收的分值！</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table id="tableList">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>玩家ID</th>
                            <th>玩家帐号</th>
                            <%--<th>是否在线</th>--%>
                            <th>上次控制值</th>
                            <th>当前控制值</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptDataList" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowIndex") %></td>
                                    <td><%# Eval("userid") %></td>
                                    <td><%#Eval("UserName") %></td>
                                    <%--<td><%#Eval("OnlineFlag").ToString() == "1" ? "在线" : "离线" %></td>--%>
                                    <td id='<%# "td" +Eval("RowIndex")+"_"+ Eval("UserId")%>'><%#Eval("ControlValue") %></td>
                                    <td id='<%# "tdc" +Eval("RowIndex")+"_"+ Eval("UserId")%>'><%#Eval("CurrentControlValue") %></td>
                                    <td>
                                        <a id='<%#(Eval("RowIndex")+"_"+ Eval("UserId")) %>' href='javascript:void(0)' onclick="gameControl(this.id,'<%#Eval("UserName") %>','<%#Eval("UserId") %>','<%#(string.IsNullOrEmpty(Eval("ControlId").ToString()) ? "0": Eval("ControlId").ToString()) %>')">修改控制值</a>
                                    </td>
                                    <%--                                <td>
                                    <%# (Proxy.ProxyLevel == 1) ?
                            "<a id=\"" +Eval("RowIndex")+"_"+ Eval("UserId") + "\" href='#'  onclick=\"gameControl(this.id,'"+Eval("UserName")+"','"+Eval("UserId")+"',"+ (string.IsNullOrEmpty(Eval("ControlId").ToString()) ? "0": Eval("ControlId").ToString())+")\">修改控制值</a>"
                                : ""
                                    %>
                                </td>--%>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                    </tbody>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg" style=""></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpPage" OnPageChanged="anpPage_PageChanged" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%" UrlPaging="false">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>

        </div>

        <script type="text/javascript">

            function gameControl(obj, uname, uid, cid) {
                var thisTd = document.getElementById(obj);
                var d = dialog({
                    id: obj,
                    title: '修改游戏控制值',
                    content: '<div class="tabson"><label>用 户 ID：' + uid + '</label></div>' +
                            '<div class="tabson"><label>账    号：' + uname + '</label></div>' +
                            '<div class="tabson"><label>控 制 值：<input id="property-ControlValue" value="-100000" class="text"/></label></div>',
                    ok: function () {
                        var cValue = $('#property-ControlValue').val();
                        if (cValue.length == 0 || cValue == '') {
                            $('#property-ControlValue').focus();
                            return false;
                        } else {
                            $.ajax({
                                url: "/Module/HandlerFolder/Member.ashx?rd=" + Math.random(),
                                data:
                                {
                                    action: "gamecontrol",
                                    uid: uid,
                                    controlId: cid,
                                    controlvalue: cValue
                                },
                                type: "POST",
                                async: false,
                                cache: false,
                                success: function (data) {
                                    var msg = "";
                                    if (data == "success") {
                                        $("#tdc" + obj).text(cValue);
                                        $("#td" + obj).text(cValue);
                                        msg = '游戏控制值修改成功。';
                                    } else {
                                        msg='游戏控制值修改失败，请稍后重试！';
                                    }
                                    var d1 = dialog({
                                        title: '提示',
                                        content: msg,
                                        ok: function () { },
                                    });
                                    d1.show();

                                    setTimeout(function () {
                                        d.close().remove();
                                    }, 2000);

                                },
                                error: function (error) {
                                    console.log(error);
                                }
                            });
                        }
                    }
                });
                d.showModal(document.getElementById(obj));

               // d.showModal();
            }

            function GetAbsoluteLeft(e) {
                var t = e.getBoundingClientRect();
                var x = t.left;
                return x;
            }

            function GetAbsoluteTop(e)
            {
                var t = e.getBoundingClientRect();
                var y= t.top;
                return y;
            }

        </script>
    </form>
</body>
</html>

