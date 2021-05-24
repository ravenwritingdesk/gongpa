<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperateRecord.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.OperateRecord" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script src="/js/DatePicker/WdatePicker.js"></script>
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
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/OperateRecord.aspx">操作日志</a></li>
            </ul>
        </div>

        <div class="rightinfo">
            <div class="tabson">
                <ul class="seachform">
                    <li>
                        <label>日期</label><input name="" id="txtBeginTime" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtEndTime\',{d:-365});}',maxDate:'#F{$dp.$D(\'txtEndTime\',{d:0});}'})" type="text" class="scinput" />-<input name="" id="txtEndTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtBeginTime\',{d:0});}'})" runat="server" type="text" class="scinput" /></li>

                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlQueryType" CssClass="select3" runat="server">
                               
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                    </li>

                </ul>


                <table class="tablelist">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>类型</th>
                            <th>操作内容</th>
                            <th>操作者ID</th>
                            <th>操作者账号</th>
                            <th>授权帐号Id</th>
                            <th>授权帐号</th>
                            <th>被操作人Id</th>
                            <th>被操作人</th>
                            <th>操作IP</th>
                            <th>操作时间</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="reptDataPager" runat="server">
                            <ItemTemplate>
                                 <tr>
                                    <td><%# Eval("RowIndex")%></td>
                                    <td><%#Eval("OperateType")%></td>
                                    <td><%#Eval("operateContent")%></td>
                                    <td><%# Eval("HandlerUserId") %></td>
                                    <td><%# Eval("HandlerUserAccount")%></td>
                                    <td><%# Eval("ProxyID")%></td>
                                    <td><%# Eval("account")%></td>
                                    <td><%#Eval("beOperatePersonId")%></td>
                                    <td><%#Eval("beOperatePerson")%></td>
                                    <td><%#Eval("operateIp")%></td>
                                    <td><%#Eval("operateTime")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

            </div>
            <div class="pagination pull-right">
                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
            </div>
        </div>

        <script type="text/javascript">
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>

