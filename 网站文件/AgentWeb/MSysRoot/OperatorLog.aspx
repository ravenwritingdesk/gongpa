<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="OperatorLog.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.OperatorLog" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>代理操作日志
                        <small>信息列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">代理操作日志</li>
            </ol>
        </section>

        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
            <form id="Form1" class="text-right" runat="server">
                <div class="row pad">
                    <div class="col-sm-6">
                        <!-- Action button -->
                        <div class="btn-group">
                        </div>
                    </div>
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <div class="input-group-btn">
                                <asp:DropDownList ID="ddlQueryType" CssClass="dropdownmenu" runat="server" OnSelectedIndexChanged="ddlQueryType_ServerChange" AutoPostBack="true" OnTextChanged="ddlQueryType_ServerChange">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>类型</th>
                                            <th>操作内容</th>
                                            <th>操作者账号</th>
                                            <th>授权帐号</th>
                                            <th>被操作人</th>
                                            <th>操作IP</th>
                                            <th>操作时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="reptDataPager" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("RowIndex") %></td>
                                                    <td><%#Eval("OperateType") %></td>
                                                    <td><%#Eval("operateContent") %></td>
                                                    <td><%# Eval("HandlerUserAccount") %></td>
                                                    <td><%# Eval("account") %></td>
                                                    <td><%#Eval("beOperatePerson") %></td>
                                                    <td><%#Eval("operateIp") %></td>
                                                    <td><%#Eval("operateTime") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>序号</th>
                                            <th>类型</th>
                                            <th>操作内容</th>
                                            <th>操作者账号</th>
                                            <th>授权帐号</th>
                                            <th>被操作人</th>
                                            <th>操作IP</th>
                                            <th>操作时间</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%"></webdiyer:AspNetPager>

                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </aside>
    <!-- /.right-side -->
</asp:Content>
