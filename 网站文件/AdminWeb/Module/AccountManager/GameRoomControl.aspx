<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameRoomControl.aspx.cs" Inherits="Game.Web.Module.AccountManager.GameRoomControl" %>

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
    <script src="/js/dialog-plus-min.js"></script>
    <link href="/css/ui-dialog.css" rel="stylesheet" />
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
            <li><a href="#" onclick="Redirect('GameControl.aspx')">玩家</a></li>
            <li class="cur"><a href="#">房间</a></li>
        </ul>
        <div class="winQuery">
            <div class="tabson" style="padding-left: 30px;">Hi，<b><%= userExt.Username %></b>，控制值为0,表示不控制，控制值为正数，表示为要送出的分值，控制值为负数，表示要回收的分值！</div>
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                   <colgroup>
                        <col width="5%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="8%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlTypeID" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlServerID" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table id="tableList">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>房间ID</th>
                            <th>房间描述</th>
                            <th>当前难度</th>
                            <th>当前控制值</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("RowId") %></td>
                                    <td><%# Eval("ServerID") %></td>
                                    <td><%#Eval("ServerName") %></td>
                                    <td>
                                        <%#  
                                    "<a id=\"tdc" +Eval("RowId")+"_"+ Eval("ServerID") + "\" href='javascript:void(0)'  onclick=\"gameRoomLevelControl(this.id,'"+Eval("ServerID")+"','"+Eval("ServerName")+"','"+Eval("GameLevel")+"','"+Eval("TypeName")+"')\">"+Eval("GameLevelDesc")+"</a>"
                                        %>
                                    </td>
                                    <td>
                                        <%# 
                                            Eval("TypeName").ToString().Contains("捕鱼")?
                                    "<a id=\"td" +Eval("RowId")+"_"+ Eval("ServerID") + "\" href='javascript:void(0)'  onclick=\"gameRoomControl(this.id,'"+Eval("ServerID")+"','"+Eval("ServerName")+"','"+Eval("ControlVal")+"')\">"+Eval("ControlVal")+"</a>"
                                        :""
                                        %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
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

            function gameRoomLevelControl(obj, serverID, roomName, gameLevel, typeName) {
                var d = dialog({
                    id: serverID,
                    title: '修改游戏房间控制值',
                    content: '<div class="tabson"><label>房 间 ID：' + serverID + '</label></div>' +
                            '<div class="tabson"><label>房间描述：' + roomName + '</label></div>' +
                            '<div  class="tabson">控 制 值：<input  type="radio" class="redio" name="GameLevelSelect" ' + (gameLevel == "0" ? "checked=checked" : "") + ' value="0"/>简单' +
                                '<input  type="radio" class="redio"  name="GameLevelSelect" ' + (gameLevel == "1" ? "checked=checked" : "") + ' value="1"/>普通' +
                                '<input  type="radio" class="redio"  name="GameLevelSelect" ' + (gameLevel == "2" ? "checked=checked" : "") + ' value="2"/>难' +
                                '<input  type="radio" class="redio"  name="GameLevelSelect" ' + (gameLevel == "3" ? "checked=checked" : "") + ' value="3"/>死难' +
                            '</select></div>',// selected="' + gameLevel == 3 + '"
                    ok: function () {
                        var cValue = $("input[name='GameLevelSelect']:checked").val();
                        if (cValue == '') {
                            alert('请选择控制难度！');
                            return false;
                        } else {
                            $.ajax({
                                url: "/Module/HandlerFolder/Member.ashx?rd=" + Math.random(),
                                data:
                                {
                                    action: "gameroomlevelcontrol",
                                    roomId: serverID,
                                    roomName: roomName,
                                    gameLevel: cValue,
                                    typeName: typeName
                                },
                                type: "POST",
                                async: false,
                                cache: false,
                                success: function (data) {
                                    var msg = "";
                                    if (data == "0") {
                                        msg = '修改成功';
                                    } else {
                                        msg = '修改失败';
                                    }
                                    var d3 = dialog({
                                        title: '提示',
                                        content: msg,
                                        ok: function () {
                                           // window.location.reload();
                                            window.location.href = "GameRoomControl.aspx?TypeID=" + $("#<%=ddlTypeID.ClientID %>").val() + "&ServerID=" + $("#<%=ddlServerID.ClientID %>").val() + "&pageIndex="+$("#anpPage_input").val();
                                        },
                                    });
                                    d3.width(260);
                                    d3.width(300);
                                    d3.show();
                                    setTimeout(function () {
                                        d.close().remove();
                                    }, 2000);
                                    // window.location.reload();
                                },
                                error: function (error) {
                                    alert('修改失败');
                                }
                            });
                        }
                    }
                });
                d.width(260);
                d.width(300);
                d.showModal(document.getElementById(obj));
                //d.showModal();
            }

            function gameRoomControl(obj, serverID, roomName, controlVal) {
                var d = dialog({
                    id: serverID,
                    title: '修改游戏房间控制值',
                    content: '<div class="tabson"><label>房 间 ID：' + serverID + '</label></div>' +
                            '<div class="tabson"><label>房间描述：' + roomName + '</label></div>' +
                            '<div class="tabson"><label>控 制 值：<input id="property-ControlValue" value="' + controlVal + '" class="scinput"/></label></div>',
                    ok: function () {
                        var cValue = $("#property-ControlValue").val();
                        if (cValue == '' || isNaN(cValue) || cValue.indexOf(".") > 0) {
                            alert('请选择控制难度！');
                            $('#property-ControlValue').focus();
                            return false;
                        } else {
                            $.ajax({
                                url: "/Module/HandlerFolder/Member.ashx?rd=" + Math.random(),
                                data:
                                {
                                    action: "gameroomcontrol",
                                    roomId: serverID,
                                    roomName: roomName,
                                    controlVal: cValue
                                },
                                type: "POST",
                                async: false,
                                cache: false,
                                success: function (data) {
                                    var msg = "";
                                    if (data == "0") {
                                        msg = '修改成功';
                                    } else {
                                        msg = '修改失败';
                                    }
                                    var d3 = dialog({
                                        title: '提示',
                                        content: msg,
                                        ok: function () { window.location.reload(); },
                                    });
                                    d3.width(260);
                                    d3.width(300);
                                    d3.show();
                                    setTimeout(function () {
                                        d.close().remove();
                                    }, 2000);

                                },
                                error: function (error) {
                                    alert('修改失败');
                                }
                            });
                        }
                    }
                });
                d.width(260);
                d.width(300);
                d.showModal(document.getElementById(obj));
                // d.showModal();
            }

        </script>
    </form>
</body>
</html>

