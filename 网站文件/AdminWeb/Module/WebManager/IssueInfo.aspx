<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.IssueInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script  type="text/javascript" src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
    <script type="text/javascript">

        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtIssueContent', {
                cssPath: '/scripts/kindEditor/plugins/code/prettify.css',
                uploadJson: '/scripts/kindEditor/asp.net/upload_json.ashx?type=News',
                allowFileManager: true
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
            <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 规则管理</td>
        </tr>
    </table>  

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
        <tr>
            <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10"><div class="hg3  pd7">
                <asp:Literal ID="litInfo" runat="server"></asp:Literal>问题</div></td>
        </tr>
        <tr>
            <td class="listTdLeft">标题：</td>
            <td>            
                <asp:TextBox ID="txtIssueTitle" runat="server" CssClass="text" Width="465px"></asp:TextBox>            
            </td>
        </tr>
        <tr>
            <td class="listTdLeft">禁用状态：</td>
            <td>        
                <asp:RadioButtonList ID="rbtnNullity" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Text="正常" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="禁用"></asp:ListItem>
                </asp:RadioButtonList>                    
            </td>
        </tr>      
        <tr>
            <td class="listTdLeft">内容：</td>
            <td>        
                <asp:TextBox ID="txtIssueContent" runat="server" CssClass="text" Width="650px" Height="350px" TextMode="MultiLine"></asp:TextBox>                  
            </td>
        </tr>    
    </table>
    <br />
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td2"></td>
                <td class="td4">
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('IssueList.aspx')" />
                    <input class="btnLine" type="button" />
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate"
                        OnClick="btnSave_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
