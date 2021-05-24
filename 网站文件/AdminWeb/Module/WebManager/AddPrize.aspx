<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPrize.aspx.cs" Inherits="Game.Web.Module.WebManager.AddPrize" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script  type="text/javascript" src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/kindEditor/kindeditor.js"></script>
    <script  type="text/javascript" src="../../scripts/kindEditor/plugins/code/prettify.js"></script>
    <title></title>
      <script type="text/javascript">

          KindEditor.ready(function (K) {
              var editor1 = K.create('#txtIntro', {
                  cssPath: '/scripts/kindEditor/plugins/code/prettify.css',
                  uploadJson: '/scripts/kindEditor/asp.net/upload_json.ashx?type=prize',
                  allowFileManager: true
              });
              prettyPrint();
          });

          function ClientClick()
          {
              var imgUrl = $("#<%=this.imgUrl.ClientID %>").val();
              var imgName= $("#<%=this.imgName.ClientID%>").val();
              var name = $("#<%=this.txtName.ClientID%>").val();
              var txtValue = $("#<%=this.txtValue.ClientID%>").val();
              var txtCounts = $("#<%=this.txtCounts.ClientID%>").val();
              if ((imgUrl.length == 0 && imgName == "") || (imgUrl.toLowerCase().indexOf(".jpg") < 0 && imgUrl.toLowerCase().indexOf(".png") < 0 && imgUrl.toLowerCase().indexOf(".gif") < 0 && imgName.toLowerCase().indexOf(".jpg") < 0 && imgName.toLowerCase().indexOf(".png") < 0 && imgName.toLowerCase().indexOf(".gif") < 0)) {
                  alert("请选择商品的图片。");
                  return false;
              }
              if (name == "")
              {
                  alert("名称不能为空。");
                  return false;
              }
              if (txtValue == "" || isNaN(txtValue) || parseFloat(txtValue) <= 0 || txtValue.indexOf('.') > 0) {
                  alert("价格只能为大于0的整数。");
                  return false;
              }
              if (txtCounts == "" || isNaN(txtCounts) || parseFloat(txtCounts) < 0 || txtCounts.indexOf('.') > 0) {
                  alert("库存只能为正整数。");
                  return false;
              }
              return true;
          }

         // var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
          function fileChange(target) {
              $("#<%=this.imgName.ClientID%>").val(target.value);
              //debugger
              //var fileSize = 0;
              //if (isIE && !target.files) {
              //    alert($("#tIme").attr("dynsrc"));
              //    $("#tIme").attr("dynsrc", target.value);
              //    alert($("#tIme").attr("dynsrc"));
              //    obj.dynsrc = target.value;
              //} else {
              //    fileSize = target.files[0].size;
              //}
              //alert(fileSize);
          }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- 头部菜单 Start -->
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr"></div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 商品管理</td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>商品
                    </div>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">类型：</td>
                <td>
                    <asp:DropDownList ID="ddlTypeId" runat="server" Width="265">
                        <asp:ListItem Value="0" Text="电器数码"></asp:ListItem>
                        <asp:ListItem Value="1" Text="生活家居"></asp:ListItem>
                        <asp:ListItem Value="2" Text="虚拟点卡"></asp:ListItem>
                        <asp:ListItem Value="3" Text="话费专区"></asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td class="listTdLeft">商品名称：</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" CssClass="text" Width="265px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="listTdLeft">价格：</td>
                <td>
                    <asp:TextBox ID="txtValue" runat="server" CssClass="text" Width="265px"></asp:TextBox>奖券</td>
            </tr>
            <tr>
                <td class="listTdLeft">库存：</td>
                <td>
                    <asp:TextBox ID="txtCounts" runat="server" CssClass="text" Width="265px"></asp:TextBox></td>
            </tr>
             <tr>
                <td class="listTdLeft">图片：</td>
                <td>
                    <input type="file" runat="server" id="imgUrl" onchange="fileChange(this)" />
                    <input type="text" readonly="readonly" runat="server" id="imgName" style="width:300px;" />
                    <span style="color:green;">注意：图片大小不能超过5M,只支持(.png,.jif,.jpg )格式</span>
                </td>
            </tr>
            <tr>
                <td class="listTdLeft">详细描述：</td>
                <td>
                    <asp:TextBox ID="txtIntro" runat="server" CssClass="text" Width="550px" Height="300px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:10%;"></td>
                <td class="td1">
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" OnClientClick="return ClientClick()"  onclick="btnSave_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
