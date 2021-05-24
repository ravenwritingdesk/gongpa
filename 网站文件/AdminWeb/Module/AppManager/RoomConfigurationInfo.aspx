<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomConfigurationInfo.aspx.cs" Inherits="Game.Web.Module.AppManager.RoomConfigurationInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：系统维护 - 游戏配置</td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>游戏配置
                    </div>
                </td>
            </tr>

            <tr>
                <td class="listTdLeft">游戏：
                </td>
                <td>
                    <asp:DropDownList ID="ddlGameId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGameId_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="listTdLeft">房间：
                </td>
                <td>
                    <asp:DropDownList ID="ddlRoomId" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">配置类型：
                </td>
                <td>
                    <asp:DropDownList ID="ddlConfigNameType" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">配置内容：</td>
                <td>
                    <%--<asp:TextBox ID="txtConfigValue" runat="server" CssClass="text" Width="550px"></asp:TextBox>--%>
                    <table style="text-align: right;">
                        <tbody>
                            <tr>
                                <td>&nbsp;最小区间1&nbsp;</td>
                                <td>
                                    <input id="txtMinRate1" type="text" runat="server" value="" style="width: 100px;" />
                                </td>
                                <td>&nbsp;最大区间1&nbsp;</td>
                                <td>
                                    <input id="txtMaxRate1" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;难度系数1&nbsp;</td>
                                <td>
                                    <input id="txtDifficulty1" type="text" runat="server" value="" style="width: 100px;" />
                                </td>
                                <td>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMinRate1" Display="Dynamic" ErrorMessage="最小区间1,只能输入整数" SetFocusOnError="True" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMaxRate1" Display="Dynamic" ErrorMessage="最大区间1,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtDifficulty1" Display="Dynamic" ErrorMessage="难度系数1,格式为7,8,9,10" SetFocusOnError="True" ValidationExpression="^(\d+,){3}(\d+)$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;最小区间2&nbsp;</td>
                                <td>
                                    <input id="txtMinRate2" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;最大区间2&nbsp;</td>
                                <td>
                                    <input id="txtMaxRate2" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;难度系数2&nbsp;</td>
                                <td>
                                    <input id="txtDifficulty2" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtMinRate2" Display="Dynamic" ErrorMessage="最小区间2,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtMaxRate2" Display="Dynamic" ErrorMessage="最大区间2,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtDifficulty2" Display="Dynamic" ErrorMessage="难度系数2,格式为7,8,9,10" SetFocusOnError="True" ValidationExpression="^(\d+,){3}(\d+)$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;最小区间3&nbsp;</td>
                                <td>
                                    <input id="txtMinRate3" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;最大区间3&nbsp;</td>
                                <td>
                                    <input id="txtMaxRate3" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;难度系数3&nbsp;</td>
                                <td>
                                    <input id="txtDifficulty3" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtMinRate3" Display="Dynamic" ErrorMessage="最小区间3,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtMaxRate3" Display="Dynamic" ErrorMessage="最大区间3,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtDifficulty3" Display="Dynamic" ErrorMessage="难度系数3,格式为7,8,9,10" SetFocusOnError="True" ValidationExpression="^(\d+,){3}(\d+)$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;难度系数&nbsp;</td>
                                <td>
                                    <input id="txtMinMaxMapping" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;衰减比&nbsp;</td>
                                <td>
                                    <input id="txtDamping" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;最大库存&nbsp;</td>
                                <td>
                                    <input id="txtMaxStock" type="text" runat="server" value="" style="width: 100px;" /></td>
                                 <td>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtMinMaxMapping" Display="Dynamic" ErrorMessage="难度系数,格式为-1,-2,-5,-10" SetFocusOnError="True" ValidationExpression="^(-\d+,){3}(-\d+)$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="txtDamping" Display="Dynamic" ErrorMessage="衰减比,格式为20,30,40,50" SetFocusOnError="True" ValidationExpression="^(\d+,){3}(\d+)$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txtMaxStock" Display="Dynamic" ErrorMessage="最大库存,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                               
                                <td>&nbsp;吃分比例&nbsp;</td>
                                <td>
                                    <input id="txtDecreaseRate" type="text" runat="server" value="" style="width: 100px;" /></td>
                                <td>&nbsp;控制机率&nbsp;</td>
                                <td colspan="4">
                                    <input id="txtControlRate" type="text" runat="server" value="" style="width: 100%;" /></td>
                                <td>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txtDecreaseRate" Display="Dynamic" ErrorMessage="吃分比例,只能输入正整数" SetFocusOnError="True" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="txtControlRate" Display="Dynamic" ErrorMessage="控制机率,格式为0,0,10,20,30,40,50,60,70" SetFocusOnError="True" ValidationExpression="^(\d+,){8}(\d+)$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">库存：
                </td>
                <td>
                    <asp:TextBox ID="txtExtend1" runat="server" CssClass="text" onblur="this.value=this.value.replace(/[^-?\d\.]/g,'')"  Width="150px"></asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="txtExtend1" Display="Dynamic" ErrorMessage="库存,只能输入整数" SetFocusOnError="True" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>

                    <%--<input id="txtExtend1" runat="server" class="text" type="number"  />--%>
                </td>

            </tr>
            <tr runat="server" id="nullityTr">
                <td class="listTdLeft">是否冻结：</td>
                <td>
                    <asp:CheckBox ID="ckbNullity" runat="server" />
                </td>
            </tr>
            <tr runat="server" id="createTimeTr">
                <td class="listTdLeft">创建时间：</td>
                <td>
                    <asp:Label ID="lbCreateTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr runat="server" id="modifyTimeTr">
                <td class="listTdLeft">最后修改时间：</td>
                <td>
                    <asp:Label ID="lbModifyTime" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 100px;"></td>
                <td class="td4">
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('RoomConfigurationList.aspx')" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" OnClick="btnSave_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
