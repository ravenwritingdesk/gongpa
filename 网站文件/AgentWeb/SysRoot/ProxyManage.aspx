<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxyManage.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxyManage" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>

    <script src="/js/Common.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".select3").uedSelect({
                width: 120
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });

            $(".sure").click(function () {
                $(".tip").fadeOut(100);
            });

            $(".cancel").click(function () {
                $(".tip").fadeOut(100);
            });

            SetOrderByField($("#<%=hdOrderByField.ClientID%>").val(), $("#<%=hdOrderByType.ClientID%>").val());
        });
        function OrderByClick(filed, orderByType) {
            var parameters = "&ddlParentProxyQueryType=" + $("#<%=ddlParentProxyQueryType.ClientID %>").val() + "&txtParentProxyId=" + $("#<%=txtParentProxyId.ClientID %>").val()
                            + "&ddlProxyQueryType=" + $("#<%=ddlProxyQueryType.ClientID %>").val() + "&txtProxyId=" + $("#<%=txtProxyId.ClientID %>").val()
                            + "&ddlLockType=" + $("#<%=ddlLockType.ClientID %>").val() + "&isStat=" + $("#<%=isStat.ClientID %>").is(":checked");
            OrderBy(filed, orderByType, parameters);
        }
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
                    <li><a href="#tab2" onclick="location.href='/SysRoot/ProxySet.aspx#tab2'">等级设置</a></li>
                </ul>
            </div>
            <br />
            <div class="tabson">
                <ul id="addBtn" runat="server" class="toolbar">
                    <li class="click"><a href="ProxyAdd.aspx"><span>
                        <img src="/images/t01.png" /></span>添加代理</a></li>
                </ul>
                <ul class="seachform">
                     <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlParentProxyQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="所属代理ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="所属代理账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtParentProxyId" /></li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlProxyQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="代理ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="代理账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtProxyId" /></li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlLockType" CssClass="select3" runat="server">
                                <asp:ListItem Text="--帐号状态--" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="可用" Value="0"></asp:ListItem>
                                <asp:ListItem Text="冻结" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>
                    <li>
                        <label>统计</label></li>
                    <li>
                        <input type="checkbox" runat="server" style="margin-top: 60%;" name="isStat" id="isStat" />
                    </li>
                    <li>
                        <label>&nbsp;</label><asp:Button ID="btnQuery" class="scbtn" runat="server" Text="查询" OnClick="btnQuery_Click" />
                    </li>
                </ul>
            </div>

            <input type="hidden" id="hdOrderByType" runat="server" value="" />
            <input type="hidden" id="hdOrderByField" runat="server" value="" />
             <b class="unitclass">单位：金币</b>
            <table class="tablelist">
                <thead>
                    <tr>
                        <th>
                            <input name="" type="checkbox" value="" checked="checked" /></th>
                        <th>序号<i class="sort"><img src="/images/px.gif" /></i></th>
                        <th>代理ID</th>
                        <th>代理帐号</th>
                        <th><a href='javascript:OrderByClick("ProxyLevel","");' id="OrderByA_ProxyLevel" class="tablelink">代理级数</a></th>
                        <%--<th>佣金占成</th>--%>
                        <th>占成</th>
                        <th><a href='javascript:OrderByClick("totalUpScore","");' id="OrderByA_totalUpScore" class="tablelink">总上分</a></th>
                        <th><a href='javascript:OrderByClick("totalDownScore","");' id="OrderByA_totalDownScore" class="tablelink">总下分</a></th>
                        <th><a href='javascript:OrderByClick("score","");' id="OrderByA_score" class="tablelink">当前余额</a></th>
                        <th>初始押金</th>
                        <th><a href='javascript:OrderByClick("SubProxyCount","");' id="OrderByA_SubProxyCount" class="tablelink">直属代理</a></th>
                        <th><a href='javascript:OrderByClick("Members","");' id="OrderByA_Members" class="tablelink">直属会员</a></th>
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
                            <tr style="font-weight: <%#Eval("ProxyId").ToString() == this.Proxy.ProxyID.ToString() ? 900 : 100%>; color: <%#Eval("freezeState").ToString() == "False" ? "":"red"%>;">
                                <td>
                                    <input name="" type="checkbox" value="" /></td>
                                <td><%#Eval("RowIndex")%></td>
                                <td>
                                    <%# Eval("ProxyId")%>
                                </td>
                                <td><%#Eval("account")%></td>
                                <td><%#Eval("LevelName")%></td>
                                <td><%#Eval("ProfitProportion")%>%</td>
                                <td><a href="/SysRoot/ProxyScoreList.aspx?pid=<%# Eval("ProxyId")%>&op=0&uname=<%# Eval("Account")%>" class="tablelink"><%#FormatMoney(Eval("totalUpScore"))%></a></td>
                                <td><a href="/SysRoot/ProxyScoreList.aspx?pid=<%# Eval("ProxyId")%>&op=1&uname=<%# Eval("Account")%>" class="tablelink"><%#FormatMoney(Eval("totalDownScore"))%></a></td>
                                <td><%#FormatMoney(Eval("score"))%></td>
                                <td><%#FormatMoney(Eval("initDeposit"))%></td>
                                <td>
                                    <%#
                                     "<a href=\"/SysRoot/ProxyManage.aspx?txtParentProxyId=" + Eval("ProxyId") + "\" class=\"tablelink\"> " + Eval("SubProxyCount") + "</a>"
                                    %>
                                </td>
                                <td>
                                    <%#
                                     "<a href=\"/SysRoot/Members.aspx?txtProxyId=" + Eval("ProxyId") + "\" class=\"tablelink\"> " + Eval("Members") + "</a>"
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
                    <tr style="background-color: #e5ebee" id="statTr" runat="server">
                        <td></td>
                        <td></td>
                        <td>统计</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><span class="inSpan" runat="server" id="totalScoreSpan"></span></td>
                        <td></td>
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
