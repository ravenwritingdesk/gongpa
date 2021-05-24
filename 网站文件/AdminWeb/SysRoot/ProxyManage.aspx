<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyManage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
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
                <li><a href="/SysRoot/ProxyManage.aspx">代理管理</a></li>
            </ul>
        </div>

        <div class="rightinfo">
            <div class="itab" style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>">
                <ul id="tabUl">
                    <li><a href="#tab1">代理管理</a></li>
                    <li><a href="#tab2" onclick="location.href='/SysRoot/ProxySet.aspx#tab2'">代理设置</a></li>
                </ul>
            </div>
            <br />
            <div class="tools">

                <ul id="addBtn" runat="server" class="toolbar">
                    <li class="click"><a href="ProxyAdd.aspx"><span>
                        <img src="/images/t01.png" /></span>添加代理</a></li>
                </ul>

            </div>


            <table class="tablelist">
                <thead>
                    <tr>
                        <th>
                            <input name="" type="checkbox" value="" checked="checked" /></th>
                        <th>序号<i class="sort"><img src="/images/px.gif" /></i></th>
                        <th>代理ID</th>
                        <th>代理帐号</th>
                        <th>代理级数</th>
                        <%--<th>佣金占成</th>--%>
                        <th>占成</th>
                        <th>总上分</th>
                        <th>总下分</th>
                        <th>当前余额(金币)</th>
                        <th>初始押金(金币)</th>
                        <th>直属会员</th>
                        <th>所属代理</th>
                        <th>上下分权限</th>
                        <th>添加时间</th>
                        <th>状态</th>
                        <th colspan="2" style="text-align: center">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <input name="" type="checkbox" value="" /></td>
                                <td><%#Eval("RowIndex")%></td>
                                <td>
                                    <%# Eval("ProxyId")%>
                                </td>
                                <td><%#Eval("account")%></td>
                                <td><%#DimoNetwork.QPProxyWeb.SystemSetHelper.GetProxyLevelName(Convert.ToInt32(Eval("ProxyLevel")))%></td>
                                <%--<td><%#Eval("assignProportion") %>%</td>--%>
                                <td><%#Eval("ProfitProportion")%>%</td>
                                 <td><a href="/SysRoot/ProxyScoreList.aspx?pid=<%# Eval("ProxyId")%>&op=0&uname=<%# Eval("Account")%>" class="tablelink"><%#Convert.ToInt64(Eval("totalUpScore").ToString()) == 0 ? "0" : Eval("totalUpScore", "{0:0,00}")%></a></td>
                                <td><a href="/SysRoot/ProxyScoreList.aspx?pid=<%# Eval("ProxyId")%>&op=1&uname=<%# Eval("Account")%>" class="tablelink"><%#Convert.ToInt64(Eval("totalDownScore").ToString()) == 0 ? "0" : Eval("totalDownScore", "{0:0,00}")%></a></td>
                                <td><%#Eval("score")%></td>
                                <td><%#Eval("initDeposit")%></td>
                                <td>
                                     <%#
                                     "<a href=\"/SysRoot/Members.aspx?requestProxyId=" + Eval("ProxyId") + "\" class=\"tablelink\"> " + Eval("Members") + "</a>"
                                    %>
                                </td>
                                <td><%#Eval("BelongsAgentName")%></td>
                                <td><%#Eval("Authority").ToString() == "True" ? "<font color='green'>有</font>" : "<font color='red'>无</font>"%></td>
                                <td><%#Eval("registerdate")%></td>
                                <td><%#Eval("freezeState").ToString() == "False" ? "<font color='green'>可用</font>" : "<font color='red'>不可用</font>"%></td>
                                <td>
                                    <%# Convert.ToInt32(Eval("belongsAgent").ToString()) == this.Proxy.ProxyID
                                ? ("<a href=\"/SysRoot/ProxyEdit.aspx?pid=" + Eval("ProxyId") + "\" class=\"tablelink\">修改</a>")
                                : ""
                                    %>
                            
                                </td>
                                <td>
                                    <%# Convert.ToInt32(Eval("belongsAgent").ToString()) == this.Proxy.ProxyID
                                ? ("<a href=\"#\"  onclick=\"freezeProxy(" + Eval("ProxyId") + "," + (Eval("freezeState").ToString() == "False" ? "1" : "0") + ")\" class=\"tablelink\">" + (Eval("freezeState").ToString() == "False" ? "<font color='red'>冻结</font>" : "解冻") + "</a>")
                                : ""
                                    %>
                             
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                     <tr style="background-color:#e5ebee" id="statTr" runat="server">
                        <td></td>
                        <td></td>
                        <td>统计</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><span class="inSpan" runat="server" id="totalScoreSpan"></span></td>
                        <td></td>
                        <td><span class="inSpan" runat="server" id="totalMembersSpan"></span></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>


        <div class="pagination pull-right">
            <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条" FirstPageText="|<" LastPageText=">|" NextPageText=">" PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul" PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged"></webdiyer:AspNetPager>
        </div>

        <div class="tip">
            <div class="tiptop"><span>提示信息</span><a></a></div>

            <div class="tipinfo">
                <span>
                    <img src="images/ticon.png" /></span>
                <div class="tipright">
                    <p>是否确认对信息的修改 ？</p>
                    <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
                </div>
            </div>

            <div class="tipbtn">
                <input name="" type="button" class="sure" value="确定" />&nbsp;
        <input name="" type="button" class="cancel" value="取消" />
            </div>

        </div>

        <script type="text/javascript">
            $("#tabUl").idTabs("tab1");
            function freezeProxy(uid, op) {
                $.ajax({
                    url: "/ProxyHandler/Proxy.ashx",
                    data: { action: "freezeproxy", uid: uid, op: op },
                    success: function (data) {
                        if (data == "success") {
                            alert("冻结成功！");
                            window.location.reload();
                        } else {
                            alert("冻结失败！");
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("发生错误：" + error);
                    }
                });
            }
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>
