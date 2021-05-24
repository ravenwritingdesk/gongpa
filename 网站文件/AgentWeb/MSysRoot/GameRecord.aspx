<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/main.Master" AutoEventWireup="true" CodeBehind="GameRecord.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.GameRecord" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <section class="content-header">
            <h1>玩家游戏记录
                        <small>信息列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">玩家游戏记录</li>
            </ol>
        </section>

        <section class="content">
            <form id="Form1" runat="server">
                <div class="row pad">
                    <div class="col-sm-6">
                        <div class="btn-group">
                            <%--<asp:DropDownList ID="ddlGames" CssClass="dropdownmenu" runat="server"></asp:DropDownList>--%>
                            <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                <span id="gameText" runat="server">全部游戏</span> <span class="caret"></span>
                            </button>
                            <input runat="server" type="hidden" id="hiddenGameId" value="0" />
                            <ul class="dropdown-menu" id="GamesUl" runat="server" role="menu">
                                <li><a href="#" onclick="gameSelectClick(0,this)">全部游戏</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm btn-flat dropdown-toggle" data-toggle="dropdown">
                                <span id="searchText" runat="server">玩家ID</span> <span class="caret"></span>
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
                                <asp:Button ID="btnQuery" class="btn btn-sm btn-primary" runat="server" Text="查询" OnClick="btnQuery_Click" />
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
                                            <th>账号</th>
                                            <th>游戏</th>
                                            <th>房间</th>
                                            <th>输赢</th>
                                            <th>税收</th>
                                            <th>时间</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="reptDataPager" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("RowIndex") %></td>
                                                    <td><%#Eval("UserName") %></td>
                                                    <td><%# Eval("ComName") %></td>
                                                    <td><%#Eval("RoomName") %></td>
                                                    <td><%#FormatMoney(Eval("ChangeMoney")) %></td>
                                                    <td><%# FormatMoney(Eval("Revenue")) %></td>
                                                    <td><%#Eval("EndTime") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>序号</th>
                                            <th>账号</th>
                                            <th>游戏</th>
                                            <th>房间</th>
                                            <th>输赢</th>
                                            <th>税收</th>
                                            <th>时间</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer clearfix">
                                <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%"></webdiyer:AspNetPager>
                                <%--<webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged" NumericButtonCount="5" CustomInfoSectionWidth="0%"></webdiyer:AspNetPager>--%>
                            </div>
                        </div>
                        <!-- /.box -->
                    </div>
                </div>
              <%--  <div class="input-group" style="display: none;">
                    <div class="input-group-btn">
                    </div>
                </div>--%>
            </form>
        </section>
        <!-- /.content -->
    </aside>
    <script type="text/ecmascript">
        function selectClick(value, e) {
            $("#<%=searchText.ClientID %>").text($(e).text());
            $("#<%=hiddenQueryType.ClientID %>").val(value);
        }

        function gameSelectClick(value, e) {
            $("#<%=gameText.ClientID %>").text($(e).text());
            $("#<%=hiddenGameId.ClientID %>").val(value);
            document.getElementById("<%=btnQuery.ClientID %>").click();
        }
    </script>

</asp:Content>

