<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUS.aspx.cs" Inherits="Game.Web.Module.WebManager.AboutUS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
    <script type="text/javascript">
        
        KindEditor.ready(function (K) {
            var editor1 = K.create('#txtContent', {
                cssPath: '/scripts/kindEditor/plugins/code/prettify.css',
                uploadJson: '/scripts/kindEditor/asp.net/upload_json.ashx?type=Articles',
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
            <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 关于我们</td>
        </tr>
    </table>  

    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
        <tr>
            <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10"><div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>(关于我们)</div></td>
        </tr>
        <tr>
            <td class="listTdLeft">内容：</td>
            <td>        
                <asp:TextBox ID="txtContent" runat="server" CssClass="text" Width="550px" Height="500px" TextMode="MultiLine"></asp:TextBox> 
                    <input type="hidden" id="hiddenId" name="hiddenId" runat="server" value="0" />
            </td>
        </tr>    
    </table>
    <br />
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <colgroup>
            <col width="10%" />
            <col width="10%" />
            <col />
        </colgroup>
        <tr>
            <td></td>
            <td class="td4">
                <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" 
                    onclick="btnSave_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
