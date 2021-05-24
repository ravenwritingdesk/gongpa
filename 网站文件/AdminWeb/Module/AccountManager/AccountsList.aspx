<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsList.aspx.cs" Inherits="Game.Web.Module.AccountManager.AccountsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%--<link href="../../styles/layout.css" rel="stylesheet" type="text/css" />--%>
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
        function ShowDiv() {
            document.getElementById('divQuery').style.display = "block";
        }
        function HideDiv() {
            document.getElementById('divQuery').style.display = "none";
        }

        window.onload = function () {

            SetTableRowColor();

        }
        //showtable();
    </script>

    <style type="text/css">
        .querybox {
            width: 500px;
            background: #caebfc;
            font-size: 12px;
            line-height: 18px;
            text-align: left;
            border-left: 1px solid #066ba4;
            border-right: 1px solid #066ba4;
            border-bottom: 1px solid #066ba4;
            border-top: 1px solid #066ba4;
            z-index: 999;
            display: none;
            position: absolute;
            top: 150px;
            left: 200px; /*filter:progid:DXImageTransform.Microsoft.DropShadow(color=#9a8559,offX=1,offY=1,positives=true); */
        }
    </style>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：用户系统 - 用户管理
                </td>
            </tr>
        </table>

        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="12%" />
                        <col width="10%" />
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">普通查询：</td>
                        <td>
                            <asp:TextBox ID="txtSearch"  CssClass="text" runat="server" ToolTip="输入帐号、昵称、用户标识或游戏ID"></asp:TextBox>
                        </td>
                        <td class="td2">
                            <asp:DropDownList ID="ddlSearchType" runat="server">
                                <asp:ListItem Value="1">按用户帐号</asp:ListItem>
                                <asp:ListItem Value="2">按用户ID</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <asp:Button ID="btnRefresh" runat="server" Text="刷新" CssClass="btn_operate" OnClick="btnRefresh_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <div class="clear"></div>
            <div id="content" class="dataList">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td>
                            <asp:Button ID="btnDongjie" runat="server" Text="冻结" CssClass="btn_operate" OnClick="btnDongjie_Click" OnClientClick="return deleteop()" />
                            <asp:Button ID="btnJiedong" runat="server" Text="解冻" CssClass="btn_operate" OnClick="btnJiedong_Click" OnClientClick="return deleteop()" />
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
                            <th>用户标识
                            </th>
                            <th>游戏ID
                            </th>
                            <th>用户帐号
                            </th>
                            <th>昵称
                            </th>
                            <th>性别
                            </th>
                            <th>会员级别
                            </th>
                            <th>所属代理
                            </th>
                            <th>注册时间
                            </th>
                            <th>注册地址
                            </th>
                            <th>登录次数
                            </th>
                            <th>
                            <a href="Javascript:void(0);" onclick='OrderBy("LastLogonDate")' class="l1">最后登录时间</a>
                            </th>
                            <th>最后登录地址
                            </th>
                            <th>状态
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td style="width: 30px;">
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID").ToString()%>' />
                                </td>
                                <td>
                                    <%# Eval( "UserID" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# Eval( "GameID" ).ToString( ) %>
                                </td>
                                <td title="<%# Eval( "Accounts" ).ToString()%>"><%--[<%# GetMemberType(byte.Parse(Eval("IsAndroid").ToString())) %>]--%>
                                    <a class="l" href="AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>">
                                        <%#Game.Utils.TextUtility.CutString( Eval( "Accounts" ).ToString(),0,10)%></a>
                                </td>
                                <td>
                                    <%# Eval( "NickName" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# Eval( "Gender" ).ToString()=="1"?"男":"女"%>
                                </td>
                                <td>
                                    <%# GetMemberType(Convert.ToByte(Eval( "IsAndroid" )))%>
                                </td>
                                <td>
                                    <%# GetBelongName(Convert.ToInt32(Eval( "UserID" )))%>
                                </td>
                                <td>
                                    <%# Eval( "RegisterDate" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval("RegisterIP").ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "GameLogonTimes" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonDate" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonIP" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="listBg" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td style="width: 30px;">
                                    <input name='cid' type='checkbox' value='<%# Eval("UserID").ToString()%>' />
                                </td>
                                <td>
                                    <%# Eval( "UserID" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# Eval( "GameID" ).ToString( ) %>
                                </td>
                                <td title="<%# Eval( "Accounts" ).ToString()%>">
                                    <a class="l" href="AccountsInfo.aspx?param=<%#Eval("UserID").ToString() %>">
                                        <%#Game.Utils.TextUtility.CutString( Eval( "Accounts" ).ToString(),0,10)%></a>
                                </td>
                                <td>
                                    <%# Eval( "NickName" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# Eval( "Gender" ).ToString()=="1"?"男":"女"%>
                                </td>
                                <td>
                                    <%# GetMemberType(Convert.ToByte(Eval( "IsAndroid" )))%>
                                </td>
                                <td>
                                    <%--<%# int.Parse( Eval( "MasterOrder" ).ToString( ) ) == 0 ? "普通玩家" : "<span style='color:#105399;font-weight:bold;'>管理员</span>"%>--%>
                                    <%# GetBelongName(Convert.ToInt32(Eval( "UserID" )))%>
                                </td>
                                <td>
                                    <%# Eval( "RegisterDate" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval("RegisterIP").ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "GameLogonTimes" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonDate" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "LastLogonIP" ).ToString( ) %>
                                </td>
                                <td>
                                    <%# GetNullityStatus((byte)Eval("Nullity"))%>
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
                        <gsp:AspNetPager ID="anpPage" OnPageChanged="anpPage_PageChanged" runat="server" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%" UrlPaging="false">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
           
        </div>
    </form>
</body>
</html>
