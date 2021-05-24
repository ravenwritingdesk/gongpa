<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/Main.Master" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.Members" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:content id="Content1" contentplaceholderid="head" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>会员管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">会员管理</li>
            </ol>
        </section>
        <!-- Main content -->
        <!-- Main content -->
        <section class="content">
            <form id="Form1" runat="server">
                 <div class="alert alert-success alert-dismissable" style="text-align: left; display: none;" id="message-model">
                </div>
                <div class="row pad">
                    <div class="col-sm-6">
                        <!-- Action button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                <span id="searchText"  runat="server">玩家ID</span> <span class="caret"></span>
                            </button>
                            <input runat="server" type="hidden" id="hiddenQueryType" value="0" />
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#" onclick="selectClick(0,this)">玩家ID</a></li>
                                <li><a href="#" onclick="selectClick(1,this)">玩家账号</a></li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-sm-6 search-form">
                        <div class="input-group">
                            <input name="" class="form-control input-sm" placeholder="Search" type="text" runat="server" id="txtKeyword" />
                            <div class="input-group-btn">
                                <asp:Button ID="btnQuery" class="btn btn-sm btn-primary" runat="server" Text="查询" OnClick="btnQuery_Click" />&nbsp;&nbsp;
                                <a href="/MSysRoot/MemberAdd.aspx"><input type="button" value="添加会员"  class="btn btn-sm btn-primary"/></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">会员信息</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>账号</th>
                                            <th>所属代理</th>
                                            <th>总输赢</th>
                                            <th>余额</th>
                                            <th>状态</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <asp:Repeater ID="reptDataPager" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("userid") %></td>
                                                    <td><%#Eval("UserName") %></td>
                                                    <td><%#Eval("Proxy")%></td>
                                                    <td><%#FormatMoney(Eval("TotalWin")) %></td>
                                                    <td><%#FormatMoney(Eval("Score")) %></td>
                                                    <td><%#Eval("Disabled").ToString()=="0"?"<font color='green'>可用</font>":"<font color='red'>不可用</font>"%></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>账号</th>
                                            <th>所属代理</th>
                                            <th>总输赢</th>
                                            <th>余额</th>
                                            <th>状态</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%" Font-Size="8"></webdiyer:AspNetPager>
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
    <script type="text/ecmascript">

        function selectClick(value, e) {
            $("#<%=searchText.ClientID %>").text($(e).text());
            $("#<%=hiddenQueryType.ClientID %>").val(value);
        }
    </script>
</asp:content>

