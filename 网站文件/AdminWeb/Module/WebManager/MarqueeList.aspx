<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarqueeList.aspx.cs" Inherits="Game.Web.Module.WebManager.MarqueeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <title></title>
    <script type="text/javascript">
        window.onload = function () {
            SetTableRowColor();
        }


        function cancelMarqueeClick(id,objId) {
            var d = dialog({
                id: objId,
                title: '温馨提示',
                content: id==0?"确定要全部取消吗？":'确定要取消吗？',
                ok: function () {
                        $.ajax({
                            url: "/Module/HandlerFolder/Member.ashx?rd=" + Math.random(),
                            data:
                            {
                                action: "CancelMarquee",
                                marqueeId: id,
                            },
                            type: "POST",
                            async: false,
                            cache: false,
                            success: function (data) {
                                var msg = "";
                                if (data == "0") {
                                    msg = '跑马灯消息取消成功。';
                                } else {
                                    msg='由于网络超时，跑马灯消息取消失败，请稍后重试！';
                                }
                                var d1 = dialog({
                                    title: '提示',
                                    content: msg,
                                    ok: function () { },
                                });
                                d1.width(200);
                                d1.show();

                                setTimeout(function () {
                                    d.close().remove();
                                }, 2000);

                            },
                            error: function (error) {
                                console.log(error);
                            }
                        });
                },
                cancelValue: '取消',
                cancel: function () {}
            });
            d.width(200);
            d.showModal(document.getElementById(objId));

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 跑马灯管理</td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="22%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">
                            <input type="button" value="发送消息" class="btn_operate" onclick="Redirect('MarqueeInfo.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate"
                                OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                            <input class="btnLine" type="button" />
                            <input type="button" class="btn_operate" id='cancel_All' value="全部取消" onclick="cancelMarqueeClick(0,'cancel_All')" />
                            
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" /></th>
                            <th>内容</th>
                            <th>循环次数</th>
                            <th>间隔时间(秒)</th>
                            <th>发送用户</th>
                            <th>发送时间</th>
                            <th></th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("Id")%>' /></td>
                                <td title="<%# Eval( "Content")%>">
                                    <%#FormatString(Eval("Content").ToString(),58)%>
                                </td>
                                <td><%# Eval("Counts")%></td>
                                <td><%# Eval("Interval")%></td>
                                <td><%# Eval("SendUserAccount")%></td>
                                <td><%# Eval("LastSendTime")%></td>
                                <td>
                                    <input type="button" class="btn_operate" id="cancel_<%#Eval("Id")%>" value="取消" onclick="cancelMarqueeClick(<%#Eval("Id")%>,this.id)" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("Id")%>' /></td>
                                <td title="<%# Eval( "Content")%>">
                                    <%#FormatString(Eval("Content").ToString(),58)%>
                                </td>
                                <td><%# Eval("Counts")%></td>
                                <td><%# Eval("Interval")%></td>
                                <td><%# Eval("SendUserAccount")%></td>
                                <td><%# Eval("LastSendTime")%></td>
                                <td>
                                    <input type="button" class="btn_operate" id='cancel_<%#Eval("Id")%>' value="取消" onclick="cancelMarqueeClick(<%#Eval("Id")%>,this.id)" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpPage" runat="server" OnPageChanged="anpPage_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20"
                            NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5"
                            CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
