<%@ Page Title="" Language="C#" MasterPageFile="~/MSysRoot/Main.Master" AutoEventWireup="true" CodeBehind="ProxyAdd.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.MSysRoot.ProxyAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>添加代理
            </h1>
            <ol class="breadcrumb">
                <li><a href="/msysroot/index.aspx"><i class="fa fa-dashboard"></i>首页</a></li>
                <li class="active">添加代理</li>
            </ol>
        </section>

        <section class="content">
            <form id="Form1" runat="server">
                <div class="alert alert-success alert-dismissable" style="text-align: left; display: none;" id="message-model">
                </div>
                <div id="tab2" class="tabson" style="display: block;">
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon">帐号</span>
                            <input name="txtUserName" type="text" id="txtUserName" runat="server" class="form-control" placeholder=" " />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">密码</span>
                            <input name="txtPassword" id="txtPassword" type="text" runat="server" class="form-control" placeholder="" />
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon">占成</span>
                            <input name="txtAssignProportion" id="txtAssignProportion" type="text" runat="server" class="form-control" placeholder="" />
                        </div>
                        <br />
                        <div class="input-group" >
                            <span class="input-group-addon" style="border-right:1px solid gray;">上下分权限</span>
                             &nbsp;&nbsp;&nbsp;<input type="radio" name="cbAuthority" value="1" id="YAuthority" runat="server"/>有 
                            &nbsp;&nbsp;&nbsp;<input type="radio" name="cbAuthority" value="0" id="NAuthority" runat="server"  />无
                        </div>
                        <br />
                        
                        <div class="input-group pull-right">
                            <br />
                            <asp:Button ID="btnAdd" runat="server" Text="添加" class="btn btn-primary" OnClick="btnAdd_Click" OnClientClick="return Validate();" />
                            <a href="/MSysRoot/ProxyManage.aspx">
                                <input type="button" class="btn" value="返回" /></a>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </aside>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        function Validate() {
            var regUname = /[a-zA-Z0-9]{6,10}?/g;
            var regPassword = /[a-zA-Z0-9]{5,20}?/g;
            var userName = $('#<%=this.txtUserName.ClientID%>').val();
            var userPass = $('#<%=this.txtPassword.ClientID%>').val();
            var txtAssignProportion = $('#<%=this.txtAssignProportion.ClientID%>').val();
            var sex = $("input[name='sex']:checked").val();
            if (!regUname.test(userName)) {
                alert("账号格式错误，必须大于6位小于等于10位！");
                $('#<%=this.txtUserName.ClientID%>').focus();
                return false;
            }
            if (!regPassword.test(userPass)) {
                alert("密码不对，必须大于5位小于20位！");
                $('#<%=this.txtPassword.ClientID%>').focus();
                return false;
            }
            if (txtAssignProportion == null || txtAssignProportion == '' || isNaN(txtAssignProportion) || txtAssignProportion.indexOf('.') > -1 || parseFloat(txtAssignProportion) < 0 || parseFloat(txtAssignProportion) > 100) {
                alert("分红比例只能为1-100的正整数！");
                return false;
            }
            return true;
        }

    </script>
</asp:Content>
