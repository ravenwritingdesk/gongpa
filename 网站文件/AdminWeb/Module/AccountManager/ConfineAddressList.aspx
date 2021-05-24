<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfineAddressList.aspx.cs" Inherits="Game.Web.Module.AccountManager.ConfineAddressList" %>

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
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 限制地址
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px; margin-right: 50%">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="8%" />
                        <col width="10%" />
                        <col width="8%" />
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>

                        <td class="td1">普通查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="text" ToolTip="输入限制字符串"></asp:TextBox>
                        </td>
                        <td class="td1">
                            <asp:CheckBox ID="ckbIsLike" runat="server" Text="模糊查询" />
                        </td>
                        <td class="td4">
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="OpList">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td>
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('ConfineAddressInfo.aspx')" />
                            <asp:Button ID="btnDelete1" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <td class="listTitle1">
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </td>
                            <td class="listTitle2">序号
                            </td>
                            <td class="listTitle2">管理
                            </td>
                            <td class="listTitle2">限制地址
                            </td>
                            <td class="listTitle2">限制登录
                            </td>
                            <td class="listTitle2">限制注册
                            </td>
                            <td class="listTitle2">失效时间
                            </td>
                            <td class="listTitle">录入时间
                            </td>
                            <td class="listTitle2">备注
                            </td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td style="width: 30px;">
                                    <input name='cid' type='checkbox' value='<%# Eval("AddrString").ToString()%>' />
                                </td>
                                <td>
                                    <%# anpNews.PageSize * ( anpNews.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td style="width: 100px;">
                                    <a class="l" href="<%#"ConfineAddressInfo.aspx?param="+Eval("AddrString").ToString()+"&reurl="+ Server.UrlEncode(Game.Utils.Utility.CurrentUrl) %>">更新</a>
                                    <a class="l" href="ConfineAddressList.aspx?cmd=del&param=<%#Eval("AddrString") %>" onclick="return confirm('确定要删除吗？')">删除</a>
                                </td>
                                <td>
                                    <%# Eval( "AddrString" ).ToString( )%>
                                </td>
                                <td>
                                    <%# ( ( bool ) Eval( "EnjoinLogon" ) ) ? "<span class='hong'>禁止</span>" : "正常"%>
                                </td>
                                <td>
                                    <%# ( ( bool ) Eval( "EnjoinRegister" ) ) ? "<span class='hong'>禁止</span>" : "正常"%>
                                </td>
                                <td>
                                    <%# string.IsNullOrEmpty( Eval( "EnjoinOverDate" ).ToString() ) ? "永久限制" : Eval( "EnjoinOverDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectNote" ).ToString( )%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td style="width: 30px;">
                                    <input name='cid' type='checkbox' value='<%# Eval("AddrString").ToString()%>' />
                                </td>
                                <td>
                                    <%# anpNews.PageSize * ( anpNews.CurrentPageIndex - 1 ) + ( Container.ItemIndex + 1 )%>
                                </td>
                                <td style="width: 100px;">
                                    <a class="l" href="<%#"ConfineAddressInfo.aspx?param="+Eval("AddrString").ToString()+"&reurl="+ Game.Utils.Utility.CurrentUrl %>">更新</a>
                                    <a class="l" href="ConfineAddressList.aspx?cmd=del&param=<%#Eval("AddrString") %>" onclick="return confirm('确定要删除吗？')">删除</a>
                                </td>
                                <td>
                                    <%# Eval( "AddrString" ).ToString( )%>
                                </td>
                                <td>
                                    <%# ( ( bool ) Eval( "EnjoinLogon" ) ) ? "<span class='hong'>禁止</span>" : "正常"%>
                                </td>
                                <td>
                                    <%# ( ( bool ) Eval( "EnjoinRegister" ) ) ? "<span class='hong'>禁止</span>" : "正常"%>
                                </td>
                                <td>
                                    <%# string.IsNullOrEmpty( Eval( "EnjoinOverDate" ).ToString() ) ? "永久限制" : Eval( "EnjoinOverDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectDate", "{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "CollectNote" ).ToString( )%>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg">
                        <span>选择：</span>&nbsp;<a class="l1" href="javascript:SelectAll(true);">全部</a>&nbsp;-&nbsp;<a class="l1" href="javascript:SelectAll(false);">无</a>
                    </td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页" PageSize="20" NextPageText="下页"
                            PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%"
                            UrlPaging="True">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
