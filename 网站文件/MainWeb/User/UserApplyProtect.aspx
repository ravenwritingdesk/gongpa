<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserApplyProtect.aspx.cs" Inherits="Game.FrontWeb.User.UserApplyProtect" %>
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
                    <h2><span class="title">申请密码保护</span></h2>
                    <div class="gray_box user_table_box page_box p30 mt10">
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
                                        <asp:TextBox ID="txtResponse1" runat="server" CssClass="com_input w150"></asp:TextBox>
                                        <span id="txtResponse1Tip"></span>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">证件类型：</th>
                                    <td>
                                        <select name="ddlPassportType" runat="server" id="ddlPassportType" style="width: 170px;">
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
                                    <th scope="row">证件号码：</th>
                                    <td>
                                        <asp:TextBox ID="txtPassportID" runat="server" CssClass="com_input w150"></asp:TextBox>
                                        <span id="txtPassportIDTip"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">确认号码：</th>
                                    <td>
                                        <asp:TextBox ID="txtPassportID2" runat="server" CssClass="com_input w150"></asp:TextBox>
                                        <span id="txtPassportID2Tip"></span></td>
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
                                        <asp:Button ID="btnUpdate" Text="确认修改" runat="server" CssClass="button03 cp p10 plr40" OnClick="btnSubmit_Click" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </dl>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            //页面验证
            $.formValidator.initConfig({ formid: "form1", alertmessage: false });
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
            $("#txtResponse1").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
                .regexValidator({ regexp: "usernamecn", datatype: "enum", onerror: "答案格式不正确" });
            $("#ddlQuestion2").formValidator({ onshow: " ", onfocus: "请选择问题" }).inputValidator({ min: 1, onerror: "你是不是忘记选择问题了" })
                .functionValidator({
                    fun: function (val, elem) {
                        if (val != $("#ddlQuestion1").val() && val != $("#ddlQuestion3").val()) {
                            return true;
                        }
                        else {
                            return true;
                           // return "不能选择相同的问题";
                        }
                    }
                });
            $("#txtResponse2").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
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
            $("#txtResponse3").formValidator({ onshow: " ", onfocus: "答案至少2~16个英文或中文字符" }).inputValidator({ min: 2, max: 16, onerror: "你输入的答案非法" })
                .regexValidator({ regexp: "usernamecn", datatype: "enum", onerror: "答案格式不正确" });
            $("#ddlPassportType").formValidator({ onshow: " ", onfocus: "请选择证件类型" }).inputValidator({ min: 1, onerror: "你是不是忘记选择证件类型了!" })
            $("#txtPassportID").formValidator({ onshow: " ", onfocus: "请输入证件号码" }).inputValidator({ min: 1, onerror: "证件号码不能为空" }).functionValidator({
                fun: function (val, elem) {
                    if ($("#ddlPassportType").val() == "1") {
                        return isCardID(val);
                    }
                    else {
                        return true;
                    }
                }
            });
            $("#txtPassportID2").formValidator({ onshow: " ", onfocus: "请输入证件号码" }).inputValidator({ min: 1, onerror: "证件号码不能为空" })
                .compareValidator({ desid: "txtPassportID", operateor: "=", onerror: "两次填写的证件号码不一致" });
            $("#txtSafeEmail").formValidator({ onshow: " ", onfocus: "请输入邮箱号码" }).inputValidator({ min: 6, max: 100, onerror: "你输入的邮箱长度非法" })
                .functionValidator({ fun: isEmail, onerror: "输入的格式不对" });
            $("#txtSafeEmail2").formValidator({ onshow: " ", onfocus: "请输入邮箱号码" }).inputValidator({ min: 6, max: 100, onerror: "你输入的邮箱长度非法" })
                .compareValidator({ desid: "txtSafeEmail", operateor: "=", onerror: "两次填写的邮箱号码不一致" });
        })
    </script>
</asp:Content>
