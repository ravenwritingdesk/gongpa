<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.OpRoot.Members" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/select.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>
    <script type="text/javascript" src="/js/DatePicker/WdatePicker.js"></script>
    <script src="/js/Common.js"></script>
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
            var parameters = "&ddlProxyQueryType=" + $("#<%=ddlProxyQueryType.ClientID %>").val() + "&txtProxyId=" + $("#<%=txtProxyId.ClientID %>").val()
                            + "&ddlQueryType=" + $("#<%=ddlQueryType.ClientID %>").val() + "&txtKeyword=" + $("#<%=txtKeyword.ClientID %>").val()
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
                <li><a href="/OpRoot/Members.aspx">会员管理</a></li>
            </ul>
        </div>

        <div class="rightinfo">

            <div class="tabson">

                <ul class="toolbar">
                    <li class="click"><a href="MemberAdd.aspx"><span>
                        <img src="/images/t01.png" /></span>添加会员</a></li>
                </ul>
                <ul class="seachform">

                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlProxyQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="下级代理ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="下级代理账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtProxyId" /></li>
                    <li>
                        <div class="vocation">
                            <asp:DropDownList ID="ddlQueryType" CssClass="select3" runat="server">
                                <asp:ListItem Text="账号ID" Value="0"></asp:ListItem>
                                <asp:ListItem Text="玩家账号" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </li>

                    <li>
                        <input name="" type="text" class="scinput" runat="server" id="txtKeyword" /></li>
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
                        <th>序号<i class="sort"><img src="/images/px.gif" /></i></th>
                        <th>玩家ID</th>
                        <th>玩家帐号</th>
                         <th><a href='javascript:OrderByClick("UpScore","");' id="OrderByA_UpScore" class="tablelink">总上分</a></th>
                         <th><a href='javascript:OrderByClick("DownScore","");' id="OrderByA_DownScore" class="tablelink">总下分</a></th>
                         <th><a href='javascript:OrderByClick("DiffScore","");' id="OrderByA_DiffScore" class="tablelink">差值</a></th>
                         <th><a href='javascript:OrderByClick("TotalWin","");' id="OrderByA_TotalWin" class="tablelink">总输赢</a></th>
                         <th><a href='javascript:OrderByClick("Score","");' id="OrderByA_Score" class="tablelink">账户余额(背包+银行)</a></th>
                        <th>推荐人</th>
                        <th>所属代理</th>
                        <th>帐号状态</th>
                        <th>机器锁定</th>
                        <th colspan="2">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("RowIndex") %></td>
                                <td><%# Eval("userid") %></td>
                                <td><%#Eval("UserName") %></td>
                                <td><a href="/OpRoot/MemberScoreList.aspx?uid=<%# Eval("UserId") %>&op=0&uname=<%# Eval("UserName") %>" class="tablelink"><%#FormatMoney(Eval("UpScore")) %></a></td>
                                <td><a href="/OpRoot/MemberScoreList.aspx?uid=<%# Eval("UserId") %>&op=1&uname=<%# Eval("UserName") %>" class="tablelink"><%#FormatMoney(Eval("DownScore")) %></a></td>
                                <td><%#FormatMoney(Eval("DiffScore")) %></td>
                                <td><a href="/OpRoot/GameRecord.aspx?uid=<%# Eval("UserId") %>" class="tablelink"><%#FormatMoney(Eval("TotalWin")) %></a></td>
                                <td><%#FormatMoney(Eval("Score")) %></td>
                                <td><%#Eval("RecommendUserName") %></td>
                                <td><%#Eval("Proxy") %></td>
                                <td><%#Eval("Disabled").ToString()=="0"?"<font color='green'>可用</font>":"<font color='red'>不可用</font>"%></td>
                                <td>
                                    <img src="<%#Eval("LockMathine").ToString()=="0"?"/images/unlock.png":"/images/lock.png"%>" title="点击修改用户锁定状态" style="cursor: pointer" onclick="unlock(<%# Eval("userid") %>,'<%#Eval("LockMathine").ToString()%>')" /></td>
                                <td>
                                    <%# (Eval("ProxyID").ToString() == Proxy.ProxyID.ToString() || Eval("OtherOperator").ToString() == Proxy.account) ?
                                "<a href=\"#\"  onclick=\"freezeUsre(" + Eval("userid") +"," + (Eval("Disabled").ToString()=="0"?"1":"0")+")\" class='tablelink'>"+ (Eval("Disabled").ToString()=="0"?"<font color='red'>冻结</font>":"<font color='green'>解冻</font>")+"</a>":""
                                    %>                                
                                </td>
                                <td>
                                    <%# (Proxy.ProxyLevel == 1) ?
                                "<a href=\"/OpRoot/MemberEdit.aspx?uid=" + Eval("UserId") + "\" class=\"tablelink\">修改</a>&nbsp;" : ""
                                    %>

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr style="background-color: #e5ebee" id="statTr" runat="server">
                        <td>统计</td>
                        <td></td>
                        <td></td>
                        <td><span class="inSpan" runat="server" id="totalUpScoreSpan"></span></td>
                        <td><span class="inSpan" runat="server" id="totalDownScoreSpan"></span></td>
                        <td></td>
                        <td><span class="inSpan" runat="server" id="totalWinSpan"></span></td>
                        <td><span class="inSpan" runat="server" id="totalScoreSpan"></span></td>
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
            <webdiyer:AspNetPager ID="anpDataPager" runat="server" CustomInfoHTML="共%PageCount%页，当前为第%CurrentPageIndex%页，每页%PageSize%条"
                FirstPageText="|<" LastPageText=">|" NextPageText=">"
                PageSize="10" PrevPageText="<" ShowCustomInfoSection="Left" CssClass="pagination" LayoutType="Ul"
                PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active" OnPageChanged="anpDataPager_PageChanged">
            </webdiyer:AspNetPager>
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
            function freezeUsre(uid, op) {
                $.ajax({
                    url: "/ProxyHandler/ProxyOp.ashx",
                    data: { action: "freezeuser", uid: uid, op: op },
                    success: function (data) {
                        if (data == "success") {
                            alert("操作成功！");
                            window.location.reload();
                        } else {
                            alert("操作失败！");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                        alert("发生错误：" + error);
                    }
                });
            }

            function unlock(uid, islock) {
                if (islock == 'False') {
                    alert("已经解锁，无需再次解锁！");
                    return;
                }
                $.ajax({
                    url: "/ProxyHandler/ProxyOp.ashx",
                    data: { action: "unlock", uid: uid },
                    success: function (data) {
                        if (data == "success") {
                            alert("解锁成功！");
                            window.location.reload();
                        } else {
                            alert("解锁失败！");
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                        alert("解锁发生错误：" + error);
                    }
                });
            }

            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </form>
</body>
</html>

