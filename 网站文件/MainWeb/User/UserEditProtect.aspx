<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserEditProtect.aspx.cs" Inherits="Game.FrontWeb.User.UserEditProtect" %>

<%@ MasterType VirtualPath="~/User/User.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rightMold fr">
        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt="">
                    </p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">修改密码保护</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
                        <div id="form1" name="form1" runat="server">

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                    <col width="120">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">第一步：</th>
                                        <td>
                                            <asp:Label ID="Label1" runat="server">请回答下面问题</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">问题一：</th>
                                        <td>
                                            <asp:Label ID="lblQuestion1" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">答案：</th>
                                        <td>
                                            <asp:TextBox ID="txtResponse1" runat="server" CssClass="text"></asp:TextBox>
                                            <span class="tipsM" id="txtResponse1Tips"></span></td>
                                    </tr>

                                    <%-- <tr>
                                    <th scope="row">证件类型：</th>
                                    <td>
                                        <input type="text" name="tempname" class="com_input w150" id="Text3" maxlength="30" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row">证件号码：</th>
                                    <td>
                                        <select name="ddlPassportType" id="ddlPassportType" style="width: 170px;">
                                            <option selected="selected" value="0">请选择证件类型</option>
                                            <option value="1">身份证</option>
                                            <option value="2">学生证</option>
                                            <option value="3">军官证</option>
                                            <option value="4">驾驶证</option>
                                            <option value="5">其它</option>

                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">确认号码：</th>
                                    <td>
                                        <input type="text" name="tempname" class="com_input w150" id="Text4" maxlength="30" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row">电子邮箱：</th>
                                    <td>
                                        <input type="text" name="tempname" class="com_input w150" id="Text5" maxlength="30" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row">确认邮箱：</th>
                                    <td>
                                        <input type="text" name="tempname" class="com_input w150" id="Text6" maxlength="30" value=""></td>
                                </tr>--%>
                                    <tr>
                                        <th scope="row">&nbsp;</th>
                                        <td>
                                            <asp:Button ID="btnConfirm" Text="确认提交" runat="server" CssClass="button03 cp p10 plr40" OnClick="btnConfirm_Click" />
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="form2" name="form2" runat="server">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <colgroup>
                                    <col width="120">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">问题一：</th>
                                        <td>
                                            <select name="ddlQuestion1" runat="server" id="ddlQuestion1">
                                                <option value="0">请选择密保问题</option>
                                                <option value="您母亲的姓名是？">您母亲的姓名是？</option>
                                                <option value="您父亲的姓名是？">您父亲的姓名是？</option>
                                                <option value="您配偶的姓名是？">您配偶的姓名是？</option>
                                                <option value="您的出生地是？">您的出生地是？</option>
                                                <option value="您高中班主任的姓名是？">您高中班主任的姓名是？</option>
                                                <option value="您初中班主任的姓名是？">您初中班主任的姓名是？</option>
                                                <option value="您小学班主任的姓名是？">您小学班主任的姓名是？</option>
                                                <option value="您的小学校名是？">您的小学校名是？</option>
                                                <option value="您的学号（或工号）是？">您的学号（或工号）是？</option>
                                                <option value="您母亲的生日是？">您母亲的生日是？</option>
                                                <option value="您父亲的生日是？">您父亲的生日是？</option>
                                                <option value="您配偶的生日是？">您配偶的生日是？</option>
                                                <option value="您最熟悉的童年好友名字是？">您最熟悉的童年好友名字是？</option>
                                                <option value="对您影响最大的人名字是？">对您影响最大的人名字是？</option>

                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">答案：</th>
                                        <td>
                                            <asp:TextBox ID="txtMResponse1" runat="server" Width="162" CssClass="text"></asp:TextBox>
                                            <span id="txtMResponse1Tip"></span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row">电子邮箱：</th>
                                        <td>
                                            <asp:TextBox ID="txtSafeEmail" runat="server" CssClass="com_input w150"></asp:TextBox>
                                            <span id="txtSafeEmailTip"></span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">确认邮箱：</th>
                                        <td>
                                            <asp:TextBox ID="txtSafeEmail2" runat="server" CssClass="com_input w150"></asp:TextBox>
                                            <span id="txtSafeEmail2Tip"></span>
                                    </tr>
                                    <tr>
                                        <th scope="row">&nbsp;</th>
                                        <td>
                                            <asp:Button ID="btnUpdate" Text="确认修改" runat="server" CssClass="button03 cp p10 plr40" OnClick="btnUpdate_Click" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </dl>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            //页面验证
            $.formValidator.initConfig({ formid: "form2", alertmessage: false });
            $("#ddlQuestion1").formValidator({ onshow: " ", onfocus: "请选择问题" }).inputValidator({ min: 1, onerror: "你是不是忘记选择问题了" })
                .functionValidator({
                    fun: function (val, elem) {
                        if (val != $("#ddlQuestion2").val() && val != $("#ddlQuestion3").val()) {
                            return true;
                        }
                        else {
                            return true;
                            //return "不能选择相同的问题";
                        }
                    }
                });
            $("#txtMResponse1").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
                .regexValidator({ regexp: "usernamecn", datatype: "enum", onerror: "答案格式不正确" });
            $("#ddlQuestion2").formValidator({ onshow: " ", onfocus: "请选择问题" }).inputValidator({ min: 1, onerror: "你是不是忘记选择问题了" })
                .functionValidator({
                    fun: function (val, elem) {
                        if (val != $("#ddlQuestion1").val() && val != $("#ddlQuestion3").val()) {
                            return true;
                        }
                        else {
                            return true;
                            //return "不能选择相同的问题";
                        }
                    }
                });
            $("#txtMResponse2").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
                .regexValidator({ regexp: "usernamecn", datatype: "enum", onerror: "答案格式不正确" });
            $("#ddlQuestion3").formValidator({ onshow: " ", onfocus: "请选择问题" }).inputValidator({ min: 1, onerror: "你是不是忘记选择问题了" })
                .functionValidator({
                    fun: function (val, elem) {
                        if (val != $("#ddlQuestion1").val() && val != $("#ddlQuestion2").val()) {
                            return true;
                        }
                        else {
                            return true;
                            //return "不能选择相同的问题";
                        }
                    }
                });
            $("#txtMResponse3").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
                .regexValidator({ regexp: "usernamecn", datatype: "enum", onerror: "答案格式不正确" });
            $("#txtSafeEmail").formValidator({ onshow: " ", onfocus: "请输入邮箱号码" }).inputValidator({ min: 6, max: 100, onerror: "你输入的邮箱长度非法" })
                .functionValidator({ fun: isEmail, onerror: "输入的格式不对" });
            $("#txtSafeEmail2").formValidator({ onshow: " ", onfocus: "请输入邮箱号码" }).inputValidator({ min: 6, max: 100, onerror: "你输入的邮箱长度非法" })
                .compareValidator({ desid: "txtSafeEmail", operateor: "=", onerror: "两次填写的邮箱号码不一致" });



            $("#txtResponse1").blur(function () { checkResponse1(); });
            $("#txtResponse2").blur(function () { checkResponse2(); });
            $("#txtResponse3").blur(function () { checkResponse3(); });

            $("#btnConfirm").click(function () {
                return checkInput();
            });
        })

        function hintMessage(hintObj, error, message) {
            //删除样式
            if (error == "error") {
                $("#" + hintObj + "").removeClass("onCorrect");
                $("#" + hintObj + "").removeClass("onFocus");
                $("#" + hintObj + "").addClass("onError");
            } else if (error == "right") {
                $("#" + hintObj + "").removeClass("onError");
                $("#" + hintObj + "").removeClass("onFocus");
                $("#" + hintObj + "").addClass("onCorrect");
            } else if (error == "info") {
                $("#" + hintObj + "").removeClass("onError");
                $("#" + hintObj + "").addClass("onFocus");
                $("#" + hintObj + "").removeClass("onCorrect");
            }

            $("#" + hintObj + "").html(message);
        }

        function checkResponse1() {
            if ($("#txtResponse1").val() == "") {
                hintMessage("txtResponse1Tips", "error", "请输入您的密保答案");
                return false;
            }
            hintMessage("txtResponse1Tips", "right", "");
            return true;
        }
        function checkResponse2() {
            if ($("#txtResponse2").val() == "") {
                hintMessage("txtResponse2Tips", "error", "请输入您的密保答案");
                return false;
            }
            hintMessage("txtResponse2Tips", "right", "");
            return true;
        }
        function checkResponse3() {
            if ($("#txtResponse3").val() == "") {
                hintMessage("txtResponse3Tips", "error", "请输入您的密保答案");
                return false;
            }
            hintMessage("txtResponse3Tips", "right", "");
            return true;
        }

        function checkInput() {
            if (!checkResponse1()) { $("#txtResponse1").focus(); return false; }
            if (!checkResponse2()) { $("#txtResponse2").focus(); return false; }
            if (!checkResponse3()) { $("#txtResponse3").focus(); return false; }
        }

    </script>
</asp:Content>
