<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AndroidList.aspx.cs" Inherits="Game.Web.Module.AccountManager.AndroidList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/JQuery.js"></script>

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">
        function GrantManager(opType) {
            if (deleteop()) {
                var cid = "";
                var cids = GelTags("input");

                for (var i = 0; i < cids.length; i++) {
                    if (cids[i].checked) {
                        if (cids[i].name == "cid")
                            cid += cids[i].value + ",";
                    }
                }

                if (cid == "") {
                    showError("未选中任何数据");
                    return;
                }

                //操作处理
                cid = cid.substring(0, cid.length - 1);
                switch (opType) {
                    case "GrantMember":
                        openWindowOwn('GrantMember.aspx?param=' + cid, '_GrantMember', 600, 240);
                        break;
                    case "GrantTreasure":
                        openWindowOwn('GrantTreasure.aspx?param=' + cid, '_GrantTreasure', 600, 240);
                        break;
                    case "GrantExperience":
                        openWindowOwn('GrantExperience.aspx?param=' + cid, '_GrantExperience', 600, 240);
                        break;
                    case "GrantScore":
                        openWindowOwn('GrantScore.aspx?param=' + cid, '_GrantScore', 600, 240);
                        break;
                    case "GrantClearScore":
                        openWindowOwn('GrantClearScore.aspx?param=' + cid, '_GrantClearScore', 600, 240);
                        break;
                    case "GrantFlee":
                        openWindowOwn('GrantFlee.aspx?param=' + cid, '_GrantFlee', 600, 240);
                        break;
                }
            }
        }

        window.onload = function () {

            SetTableRowColor();
        }
    </script>

    <title></title>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 机器人管理
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList"  style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="11%" />
                        <col width="13%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="30%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td  class="td1">日期查询：</td>
                        <td>
                            <asp:TextBox ID="txtStartDate" CssClass="text" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        </td>
                        <td>至:&nbsp;
                            <asp:TextBox ID="txtEndDate" CssClass="text" runat="server" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td  class="td2">
                            <asp:DropDownList ID="ddlServerID1" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td  class="td2">
                            <asp:DropDownList ID="ddlNullity" runat="server">
                                <asp:ListItem Value="-1" Text="全部状态"></asp:ListItem>
                                <asp:ListItem Value="0" Text="启用"></asp:ListItem>
                                <asp:ListItem Value="1" Text="禁用"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnQueryTD" runat="server" Text="今天" CssClass="btn_operate" OnClick="btnQueryTD_Click" />
                            <asp:Button ID="btnQueryYD" runat="server" Text="昨天" CssClass="btn_operate" OnClick="btnQueryYD_Click" />
                            <asp:Button ID="btnQueryTW" runat="server" Text="本周" CssClass="btn_operate" OnClick="btnQueryTW_Click" />
                            <asp:Button ID="btnQueryYW" runat="server" Text="上周" CssClass="btn_operate" OnClick="btnQueryYW_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList"  style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="11%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col width="10%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">用户查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtSearch" CssClass="text" runat="server"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按游戏ID</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td  class="td2">
                            <asp:DropDownList ID="ddlServerID" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQueryAcc" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQueryAcc_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="OpList">
                    <colgroup>
                        <col width="25%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td height="39">
                            <input type="button" value="新增" class="btn_operate" onclick="Redirect('AndroidAdd.aspx')" />
                            <asp:Button ID="Button1" runat="server" Text="删除" CssClass="btn_operate" OnClick="btnDelete_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnDongjie1" runat="server" Text="冻结" CssClass="btn_operate" OnClick="btnDongjie_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnJiedong1" runat="server" Text="解冻" CssClass="btn_operate" OnClick="btnJiedong_Click" OnClientClick="return deleteop()" />
                            <%--<input class="btnLine" type="button" />
                        <input type="button" value="赠送会员" class="btn_operate" onclick="GrantManager('GrantMember')" />
                        <input id="btnGrantTreasure2" type="button" value="赠送金币" class="btn_operate" onclick="GrantManager('GrantTreasure')" />
                        <input id="btnGrantExperience2" type="button" value="赠送经验" class="btn_operate" onclick="GrantManager('GrantExperience')" />
                        <input type="button" value="赠送积分" class="btn_operate" onclick="GrantManager('GrantScore')" />
                        <input type="button" value="清零积分" class="btn_operate" onclick="GrantManager('GrantClearScore')" />
                        <input type="button" value="清零逃率" class="btn_operate" onclick="GrantManager('GrantFlee')" />--%>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center">
                            <th>
                                <input type="checkbox" name="chkAll" onclick="SelectAll(this.checked);" />
                            </th>
                            <th>管理
                            </th>
                            <th>创建时间
                            </th>
                            <th>用户帐号
                            </th>
                            <th>房间
                            </th>
                            <th>最少局数
                            </th>
                            <th>最大局数
                            </th>
                            <th>最少分数
                            </th>
                            <th>最高分数
                            </th>
                            <th>最少游戏时间
                            </th>
                            <th>最大游戏时间
                            </th>
                            <th>服务类型
                            </th>
                            <th>状态
                            </th>
                            <th>备注
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptAndroid" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID")%>' />
                                </td>
                                <td>
                                    <a class="l" href="AndroidInfo.aspx?param=<%#Eval("UserID") %>">配置</a>
                                </td>
                                <td>
                                    <%# Eval("CreateDate")%>
                                </td>
                                <td>
                                    <%# GetAccounts((int)Eval("UserID"))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName((int)Eval("ServerID"))%>
                                </td>
                                <td>
                                    <%# Eval("MinPlayDraw")%>
                                </td>
                                <td>
                                    <%# Eval("MaxPlayDraw")%>
                                </td>
                                <td>
                                    <%# Eval("MinTakeScore")%>
                                </td>
                                <td>
                                    <%# Eval("MaxTakeScore")%>
                                </td>
                                <td>
                                    <%# Eval("MinReposeTime")%>
                                </td>
                                <td>
                                    <%# Eval("MaxReposeTime")%>
                                </td>
                                <td>
                                    <%# Eval("ServiceGender")%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                </td>
                                <td>
                                    <%# Eval("AndroidNote")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID")%>' />
                                </td>
                                <td>
                                    <a class="l" href="AndroidInfo.aspx?param=<%#Eval("UserID") %>">配置</a>
                                </td>
                                <td>
                                    <%# Eval("CreateDate")%>
                                </td>
                                <td>
                                    <%# GetAccounts((int)Eval("UserID"))%>
                                </td>
                                <td>
                                    <%# GetGameRoomName((int)Eval("ServerID"))%>
                                </td>
                                <td>
                                    <%# Eval("MinPlayDraw")%>
                                </td>
                                <td>
                                    <%# Eval("MaxPlayDraw")%>
                                </td>
                                <td>
                                    <%# Eval("MinTakeScore")%>
                                </td>
                                <td>
                                    <%# Eval("MaxTakeScore")%>
                                </td>
                                <td>
                                    <%# Eval("MinReposeTime")%>
                                </td>
                                <td>
                                    <%# Eval("MaxReposeTime")%>
                                </td>
                                <td>
                                    <%# Eval("ServiceGender")%>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                </td>
                                <td>
                                    <%# Eval("AndroidNote")%>
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
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
