<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="ProxyManage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.ProxyManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <section class="content-header">
            <h1>代理管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">代理管理</li>
            </ol>
        </section>
        <section class="content">
            <form id="Form1" runat="server">
                <div class="row pad">
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <div class="input-group-btn">
                                <a href="/MSysRoot/ProxyAdd.aspx">
                                    <input type="button" value="＋添加代理" class="btn btn-sm btn-primary" /></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row pad">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">代理信息</h3>
                                </div>
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>账号</th>
                                                <th>占成</th>
                                                <th>余额</th>
                                                <th>上下分权限</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="reptDataPager" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%#Eval("ProxyId") %></td>
                                                        <td><%#Eval("account") %></td>
                                                        <td><%#Eval("ProfitProportion") %>%</td>
                                                        <td><%#FormatMoney(Eval("score")) %></td>
                                                        <td><%#Eval("Authority").ToString() == "True"?"<font color='green'>有</font>":"<font color='red'>无</font>" %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>账号</th>
                                                <th>占成</th>
                                                <th>余额</th>
                                                <th>上下分权限</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="box-footer clearfix">
                                    <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%"></webdiyer:AspNetPager>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </aside>
</asp:Content>
