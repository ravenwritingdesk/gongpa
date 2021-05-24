<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LivcardBuildStreamList.aspx.cs" Inherits="Game.Web.Module.FilledManager.LivcardBuildStreamList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/comm.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>

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
                <td width="1232" height="25" valign="top" align="left">你当前位置：充值系统 - 实卡管理
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="Tmg7">
            <tr>
                <td height="28">
                    <ul class="tab_menu clearfix">
                        <li class="cur">实卡管理</li>
                        <li onclick="Redirect('LivcardCreate.aspx')">实卡生成</li>
                        <li onclick="Redirect('LivcardStat.aspx')">库存统计</li>
                        <li onclick="Redirect('GlobalLivcardList.aspx')">类型管理</li>
                    </ul>
                </td>
            </tr>
        </table>
        <div class="winQuery">
            <div class="searchList" style="height: 40px;">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="10%" />
                        <col width="22%" />
                        <col width="15%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td1">批次查询：</td>
                        <td class="td2">
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'txtEndDate\')}'})"></asp:TextBox>
                        至:
                            <asp:TextBox ID="txtEndDate" runat="server"  CssClass="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnQuery" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery_Click" />
                            <input type="button" onclick='openWindowOwn("LivcardAssociatorList.aspx?param=0", "1", 900, 580)' value="全部实卡信息" class="btn_operate" style="width: 100px;" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="searchList" style="height: 40px; margin-right: 60%">
                <table cellspacing="0" cellpading="0">
                    <colgroup>
                        <col width="25%" />
                        <col width="25%" />
                        <col />
                    </colgroup>
                    <tr>
                        <td class="td4">卡号查询：
                            <input id="txtSearch" class="text" />
                            <input id="btnShow" type="button" class="btn_operate" value="查询" />
                        </td>
                        <td class="td4">销售商查询:
                             <asp:TextBox ID="txtsalesperson" runat="server" CssClass="text"></asp:TextBox>

                            <asp:Button ID="btnQuery2" runat="server" Text="查询" CssClass="btn_operate" OnClick="btnQuery2_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div id="content" class="dataList">
                <table cellspacing="0" rules="all" style="border-collapse: collapse;" id="tableList">
                    <thead>
                        <tr align="center" class="bold">
                            <th>生产批次
                            </th>
                            <th>生成日期
                            </th>
                            <th>管理员
                            </th>
                            <th>销售商
                            </th>
                            <th>实卡名称
                            </th>
                            <th>实卡数量
                            </th>
                            <th>实卡价格
                            </th>
                            <th>总金额
                            </th>
                            <th>赠送金币
                            </th>
                            <th>地址
                            </th>
                            <th>导出次数
                            </th>
                            <th>备注
                            </th>
                            <th>管理
                            </th>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptDataList" runat="server">
                        <ItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval( "BuildID" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "BuildDate","{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "AdminName" ).ToString( )%>
                                </td>
                                <td>
                                    <%# GetSalesperson(int.Parse(Eval( "BuildID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString()) )%>
                                </td>
                                <td>
                                    <%# Eval( "BuildCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# int.Parse( Eval( "BuildCount" ).ToString( ) ) * double.Parse( Eval( "CardPrice" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "BuildAddr" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "DownLoadCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "NoteInfo" ).ToString( )%>
                                </td>
                                <td>
                                    <a href="?cmd=export&param=<%# Eval( "BuildID" ).ToString()%>" class="l">实卡导出</a>
                                    <a href="javascript:void(0)" onclick="openWindowOwn('LivcardAssociatorList.aspx?param=<%# Eval( "BuildID" ).ToString()%>', <%# Eval( "BuildID" ).ToString()%>,800,580)"
                                        class="l">实卡信息</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr align="center" class="list" onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#caebfc';this.style.cursor='default';"
                                onmouseout="this.style.backgroundColor=currentcolor">
                                <td>
                                    <%# Eval( "BuildID" ).ToString()%>
                                </td>
                                <td>
                                    <%# Eval( "BuildDate","{0:yyyy-MM-dd HH:mm:ss}" )%>
                                </td>
                                <td>
                                    <%# Eval( "AdminName" ).ToString( )%>
                                </td>
                                <td>
                                    <%# GetSalesperson(int.Parse(Eval( "BuildID" ).ToString( )))%>
                                </td>
                                <td>
                                    <%# GetCardTypeName(int.Parse(Eval( "CardTypeID" ).ToString()) )%>
                                </td>
                                <td>
                                    <%# Eval( "BuildCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "CardPrice" ).ToString( )%>
                                </td>
                                <td>
                                    <%# int.Parse( Eval( "BuildCount" ).ToString( ) ) * double.Parse( Eval( "CardPrice" ).ToString( ) )%>
                                </td>
                                <td>
                                    <%# Eval( "CardGold" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "BuildAddr" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "DownLoadCount" ).ToString( )%>
                                </td>
                                <td>
                                    <%# Eval( "NoteInfo" ).ToString( )%>
                                </td>
                                <td>
                                    <a href="?cmd=export&param=<%# Eval( "BuildID" ).ToString()%>" class="l">实卡导出</a>
                                    <a href="javascript:void(0)" onclick="openWindowOwn('LivcardAssociatorList.aspx?param=<%# Eval( "BuildID" ).ToString()%>', <%# Eval( "BuildID" ).ToString()%>,800,580)"
                                        class="l">实卡信息</a>
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <asp:Literal runat="server" ID="litNoData" Visible="false" Text="<tr class='tdbg'><td colspan='100' align='center'><br>没有任何信息!<br><br></td></tr>"></asp:Literal>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="listTitleBg"></td>
                    <td align="right" class="page">
                        <gsp:AspNetPager ID="anpNews" runat="server" OnPageChanged="anpNews_PageChanged" AlwaysShow="true" FirstPageText="首页" LastPageText="末页"
                            PageSize="20" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0" ShowCustomInfoSection="Left" LayoutType="Table"
                            NumericButtonCount="5" CustomInfoHTML="总记录：%RecordCount%　页码：%CurrentPageIndex%/%PageCount%　每页：%PageSize%">
                        </gsp:AspNetPager>
                    </td>
                </tr>
            </table>
        </div>

        <script>
            $(document).ready(function () {
                $("#btnShow").click(function () {
                    var txtkey = $("#txtSearch").val();
                    if (txtkey == '') {
                        showError("请输入要查询的卡号");
                        return;
                    }
                    openWindow('LivcardAssociatorInfo.aspx?param=' + txtkey, 700, 500);
                });

                window.onload = function () {

                    SetTableRowColor();

                }
            });
        </script>

    </form>
</body>
</html>
