<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrizeList.aspx.cs" Inherits="Game.Web.Module.WebManager.PrizeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="../../scripts/jquery-1.8.3.min.js"></script>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 商品管理</td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="5%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td></td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlTypeId" runat="server">
                                <asp:ListItem Value="-1" Text="-所有类型-"></asp:ListItem>
                                <asp:ListItem Value="0" Text="电器数码"></asp:ListItem>
                                <asp:ListItem Value="1" Text="生活家居"></asp:ListItem>
                                <asp:ListItem Value="2" Text="虚拟点卡"></asp:ListItem>
                                <asp:ListItem Value="3" Text="话费专区"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px;">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('AddPrize.aspx?cmd=add')" />
                            <input class="btnLine" type="button" />
                            <asp:Button ID="btnDelete" runat="server" Text="删除" CssClass="btn_operate"
                                OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
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
                            <th>管理</th>
                            <th>名称</th>
                            <th>价格(奖券)</th>
                            <th>库存</th>
                            <th>上架时间</th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptPrizeList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("ID")%>' /></td>
                                <td>
                                    <a class="l" href="AddPrize.aspx?cmd=edit&param=<%#Eval("ID")%>">更新</a>
                                </td>
                                <td><%# Eval("Name")%></td>
                                <td><%# Eval("Value")%></td>
                                <td><%# Eval("Counts")%></td>
                                <td><%# Eval("InputTime")%></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("ID")%>' /></td>
                                <td>
                                    <a class="l" href="AddPrize.aspx?cmd=edit&param=<%#Eval("ID")%>">更新</a>
                                </td>
                                <td><%# Eval("Name")%></td>
                                <td><%# Eval("Value")%></td>
                                <td><%# Eval("Counts")%></td>
                                <td><%# Eval("InputTime")%></td>
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


