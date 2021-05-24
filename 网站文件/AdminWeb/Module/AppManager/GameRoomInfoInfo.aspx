<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GameRoomInfoInfo.aspx.cs" Inherits="Game.Web.Module.AppManager.GameRoomInfoInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.validate.js"></script>

    <script type="text/javascript" src="../../scripts/messages_cn.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.metadata.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            $("input[type='text']").each(function (k, v) {
                if ($(v).attr("readonly") == "readonly" || $(v).attr("readonly") == true) {
                    $(v).css("border", "1px solid red");
                } else {
                    $(v).css("border", "1px solid green");
                }
            });

            $("select").each(function (k, v) {
                if ($(v).attr("disabled") == "disabled" || $(v).attr("disabled") ==true) {
                    $(v).css("border", "1px solid red");
                } else {
                    $(v).css("border", "1px solid green");
                }
            });
        }
        jQuery(document).ready(function () {
            jQuery.metadata.setType("attr", "validate");
            jQuery("#<%=form1.ClientID %>").validate();
            $("input[type='text']").css("width", "150px");
        });


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
                <td width="1232" height="25" valign="top" align="left">你当前位置：游戏系统 - 房间管理
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tableList" style="border-style: solid; border-bottom: 1px;">
            <colgroup>
                <col width="10%" />
                <col width="10%" />
                <col width="10%" />
                <col width="15%" />
                <col  />
            </colgroup>
            <tr>
                <td height="35" colspan="5" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>房间信息
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">房间名称：
                </td>
                <td>
                    <asp:TextBox ID="txtServerName" runat="server" CssClass="text" MaxLength="31" ReadOnly="true"></asp:TextBox>
                    <span style="color: Red">*</span>
                </td>
                <td class="listTdLeft">游戏名称：
                </td>
                <td>
                    <asp:DropDownList ID="ddlKindID" runat="server" Width="158px" Enabled="false" ReadOnly="true">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">模块名称：
                </td>
                <td>
                    <asp:DropDownList ID="ddlGameID" runat="server" Width="158px" Enabled="false">
                    </asp:DropDownList>
                </td>
                <td class="listTdLeft">节点名称：
                </td>
                <td>
                    <asp:DropDownList ID="ddlNode" runat="server" Width="158px">
                    </asp:DropDownList>
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">房间类型：
                </td>
                <td>
                    <asp:DropDownList ID="ddlServerType" runat="server" Width="158px" Enabled="false">
                    </asp:DropDownList>
                </td>
                <td class="listTdLeft">排序：
                </td>
                <td>
                    <asp:TextBox ID="txtSortID" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">服务端口：
                </td>
                <td>
                    <asp:TextBox ID="txtServerPort" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                </td>
                <td class="listTdLeft">桌子数量：
                </td>
                <td>
                    <asp:TextBox ID="txtTableCount" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0"></asp:TextBox>
                </td>
                
                <td>&nbsp;</td>
            </tr>
            <%--            <tr style="display: none">
                <td class="listTdLeft">数据库名称：
                </td>
                <td>
                    <asp:TextBox ID="txtDataBaseName" runat="server" CssClass="text" MaxLength="20" ReadOnly="true"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="display: none">
                <td class="listTdLeft">数据库地址：
                </td>
                <td>
                    <asp:DropDownList ID="ddlDataBaseAddr" runat="server" Width="158px" Enabled="false">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>--%>
            <tbody id="tby">
                <tr>
                    <td class="listTdLeft">单位金币：
                    </td>
                    <td>
                        <asp:TextBox ID="txtCellScore" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="18" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                     <td class="listTdLeft">税收比例：
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtRevenueRatio" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="3" Text="0"></asp:TextBox>
                        ‰（千分比）
                        说明：税收类型为抽成则表示千分比；类型为服务费则表示金币数</td>
                </tr>
                <tr>
                    <td class="listTdLeft">最低金币：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMinTableScore" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="18" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">限制金币：
                    </td>
                    <td>
                        <asp:TextBox ID="txtRestrictScore" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="18" Text="0"></asp:TextBox>
                    </td>
                    
                <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="listTdLeft">最小进入金币：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMinEnterScore" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="18" Text="0"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">最大进入金币：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMaxEnterScore" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="18" Text="0"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
                </tr>
                <%--                <tr style="display: none">
                    <td class="listTdLeft">最小进入等级：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMinEnterMember" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">最大进入等级：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMaxEnterMember" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td class="listTdLeft">最大玩家数目：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMaxPlayer" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="listTdLeft">房间规则：
                    </td>
                    <td>
                        <asp:TextBox ID="txtServerRule" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                        &nbsp;<asp:HyperLink ID="hlGameConfigRule" runat="server">房间规则配置</asp:HyperLink></td>
                    <td class="listTdLeft">分组规则：
                    </td>
                    <td>
                        <asp:TextBox ID="txtDistributeRule" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="10" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="listTdLeft">最小人数：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMinDistributeUser" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">最多人数：
                    </td>
                    <td>
                        <asp:TextBox ID="txtMaxDistributeUser" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="listTdLeft">分组间隔：
                    </td>
                    <td>
                        <asp:TextBox ID="txtDistributeTimeSpace" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="10" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">分组局数：
                    </td>
                    <td>
                        <asp:TextBox ID="txtDistributeDrawCount" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="9" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="listTdLeft">开始延时：
                    </td>
                    <td>
                        <asp:TextBox ID="txtDistributeStartDelay" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="10" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td class="listTdLeft">附加属性：
                    </td>
                    <td>
                        <asp:TextBox ID="txtAttachUserRight" runat="server" CssClass="text" validate="{digits:true}" onkeyup="if(isNaN(value))execCommand('undo')" MaxLength="10" Text="0" ReadOnly="true"></asp:TextBox>
                    </td>
                <td>&nbsp;</td>
                </tr>
            </tbody>
            <tr>
                <td class="listTdLeft">运行机器：
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtServiceMachine" runat="server" CssClass="text" Width="250" MaxLength="32" ReadOnly="true"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">自定规则：
                </td>
                <td colspan="4">
                    <asp:TextBox ID="txtCustomRule" runat="server" CssClass="text" Width="400px" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">禁用状态：
                </td>
                <td>
                    <asp:RadioButtonList ID="rbtnNullity" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Text="正常" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="1" Text="禁用"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">备注：
                </td>
                <td colspan="4">
                    <asp:TextBox ID="txtServerNote" runat="server" CssClass="text" Width="400" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">创建时间：
                </td>
                <td>
                    <asp:Label ID="lblCreateDateTime" runat="server"></asp:Label>
                </td>
                <td class="listTdLeft">修改时间：
                </td>
                <td>
                    <asp:Label ID="lblModifyDateTime" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="listTdLeft">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="titleOpBg Lpd10">
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('GameRoomInfoList.aspx')" />
                    <!--<input class="btnLine" type="button" />-->
                    <asp:Button ID="btnSave1" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    $(document).ready(function () {
        $("#tby :text").bind('keyup', function () {
            if (isNaN($(this).val())) document.execCommand('undo');
        }).attr("validate", "{digits:true}");
    });

</script>

