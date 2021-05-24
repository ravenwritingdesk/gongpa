﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemMessageList.aspx.cs" Inherits="Game.Web.Module.AppManager.SystemMessageList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <title></title>
    <script type="text/javascript">
        window.onload = function () {

            SetTableRowColor();
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 系统消息</td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 50%">
                <table cellspacing="0" cellpading="0">
                    <tr>
                        <td class="td4">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('SystemMessageInfo.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate"
                                OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnNoEnable" runat="server" Text="冻结" CssClass="btn_operate"
                                OnClick="btnNoEnable_Click" OnClientClick="return deleteop()" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnEnable" runat="server" Text="解冻" CssClass="btn_operate"
                                OnClick="btnEnable_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" /></th>
                            <th>管理</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>消息范围</th>
                            <th>消息内容</th>
                            <th>频率(秒)</th>
                            <th>禁止标志</th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptSystemMessage" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("ID")%>' /></td>
                                <td>
                                    <a class="l" href="SystemMessageInfo.aspx?cmd=edit&id=<%#Eval("ID") %>">更新</a>
                                </td>
                                <td><%# Eval("StartTime")%></td>
                                <td><%# Eval("ConcludeTime")%></td>
                                <td><%# GetMessageTypeName((int)Eval("MessageType"))%></td>
                                <td title="<%# Eval("MessageString")%>">
                                    <div><%# Eval("MessageString")%></div>
                                </td>
                                <td><%# Eval("TimeRate")%></td>
                                <td><%# GetNullityStatus((byte)Eval("Nullity"))%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("ID")%>' /></td>
                                <td>
                                    <a class="l" href="SystemMessageInfo.aspx?cmd=edit&id=<%#Eval("ID") %>">更新</a>
                                </td>
                                <td><%# Eval("StartTime")%></td>
                                <td><%# Eval("ConcludeTime")%></td>
                                <td><%# GetMessageTypeName((int)Eval("MessageType"))%></td>
                                <td title="<%# Eval("MessageString")%>">
                                    <div><%# Eval("MessageString")%></div>
                                </td>
                                <td><%# Eval("TimeRate")%></td>
                                <td><%# GetNullityStatus((byte)Eval("Nullity"))%></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"><span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20"
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
