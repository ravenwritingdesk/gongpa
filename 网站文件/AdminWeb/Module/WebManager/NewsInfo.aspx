<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.NewsInfo" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
    <script type="text/javascript">
        //KE.show({
        //    id: 'txtBody',
        //    urlType: 'domain',
        //    imageUploadJson: '../../asp.net/upload_json.asp?type=News',
        //    fileManagerJson: '../../asp.net/file_manager_json.asp?type=News',
        //    allowFileManager: true
        //});
        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtBody', {
                cssPath: '/scripts/kindEditor/plugins/code/prettify.css',
                uploadJson: '/scripts/kindEditor/asp.net/upload_json.ashx?type=News',
               // fileManagerJson: '/scripts/kindEditor/asp.net/file_manager_json.ashx?type=News',
                allowFileManager: true
                //,
                //afterCreate: function () {
                //    var self = this;
                //    K.ctrl(document, 13, function () {
                //        self.sync();
                //        K('form[name=example]')[0].submit();
                //    });
                //    K.ctrl(self.edit.doc, 13, function () {
                //        self.sync();
                //        K('form[name=example]')[0].submit();
                //    });
                //}
            });
            prettyPrint();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <!-- 头部菜单 Start -->
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
        <tr>
            <td width="19" height="25" valign="top"  class="Lpd10"><div class="arr"></div></td>
            <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 新闻管理</td>
        </tr>
    </table>  

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
        <tr>
            <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10"><div class="hg3  pd7">
                <asp:Literal ID="litInfo" runat="server"></asp:Literal>新闻</div></td>
        </tr>
        <tr>
            <td class="listTdLeft">标题：</td>
            <td>        
                <asp:DropDownList ID="ddlClassID" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlClassID_SelectedIndexChanged" Width="80px">
                    <asp:ListItem Value="1" Text="新闻"></asp:ListItem>
                    <asp:ListItem Value="2" Text="客户端公告"></asp:ListItem>
                    <asp:ListItem Value="3" Text="代理公告"></asp:ListItem>
                </asp:DropDownList>      
                <asp:TextBox ID="txtSubject" runat="server" CssClass="text" Width="465px"></asp:TextBox>            
                <asp:RequiredFieldValidator ID="rvSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="标题不能为空！" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
       
           <tr>
            <td class="listTdLeft">展示目标：</td>
            <td>        
                <asp:RadioButtonList ID="rdoShowType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0" Selected="True">所有</asp:ListItem>
                            <asp:ListItem Value="1">电脑</asp:ListItem>
                            <asp:ListItem Value="2">移动终端</asp:ListItem>
                        </asp:RadioButtonList>    
            </td>
        </tr>
         <tr style="display:none;">
            <td class="listTdLeft">属性：</td>
            <td>        
                <asp:CheckBox ID="chkOnTop" runat="server" Text="置顶" />     
                <asp:CheckBox ID="chkOnTopAll" runat="server" Text="总置顶" />     
                <asp:CheckBox ID="chkIsElite" runat="server" Text="推荐" />     
                <asp:CheckBox ID="chkIsHot" runat="server" Text="热门" />     
                <asp:CheckBox ID="chkIsLock" runat="server" Text="立即发布" Checked="true" />     
            </td>
        </tr>
         <tr style="display:none;">
            <td class="listTdLeft">引用：</td>
            <td>        
                <asp:TextBox ID="txtLinkUrl" runat="server" CssClass="text" Text="http://" Width="550px"></asp:TextBox> 
                <asp:CheckBox ID="chkIsLinks" runat="server" Text="链接地址" />     
            </td>
        </tr>        
        <tr>
            <td class="listTdLeft">内容：</td>
            <td>        
                <asp:TextBox ID="txtBody" runat="server" CssClass="text" Width="550px" Height="300px" TextMode="MultiLine"></asp:TextBox> 
                <asp:TextBox ID="txtBody1" runat="server" CssClass="text" Width="550px" Height="300px"  TextMode="MultiLine"  ></asp:TextBox>  
            </td>
        </tr>    
    </table>
    <br />
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td2"></td>
            <td class="td4">
                <input type="button" value="返回" class="btn_operate" onclick="Redirect('NewsList.aspx')" />                           
                <input class="btnLine" type="button" />  
                <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" 
                    onclick="btnSave_Click" />
            </td>
            <td></td>
        </tr>
    </table>
    </form>
</body>
</html>
