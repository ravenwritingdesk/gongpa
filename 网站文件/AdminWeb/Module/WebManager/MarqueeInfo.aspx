<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarqueeInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.MarqueeInfo" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../scripts/common.js"></script>
    <script type="text/javascript"  src="../../scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../../scripts/My97DatePicker/WdatePicker.js"></script>
    <script  type="text/javascript" src="../../scripts/iColorPicker.js"></script>
    <script  type="text/javascript">
        $(function () {
            //$("a img").attr("src", "/images/selectcolor.png");

            //if (window.clipboardData) {
            //    alert(1);
            //    document.getElementById("hidden2").onpropertychange = oninputclick;
            //} else{
            //    document.getElementById("hidden2").addEventListener("input", oninputclick(), false);
            //}
            $("#<%=hdTextColor1.ClientID %>").val("000000");
            $("#<%=hdTextColor2.ClientID %>").val("000000");
            $("#<%=hdTextColor3.ClientID %>").val("000000");
        });


        function submitClientClick()
        {
            var styleArr1 = $("#<%=TextBox1.ClientID %>").attr("style").split(';');
            for (var i = 0; i < styleArr1.length; i++) {
                var thisStyle = styleArr1[i];
                if (thisStyle != null && thisStyle != '' && thisStyle.toUpperCase().indexOf("COLOR") > -1)
                {
                    $("#<%=hdTextColor1.ClientID %>").val(thisStyle.split(':')[1].replace("#",""));
                }
            }

            var styleArr2 = $("#<%=TextBox2.ClientID %>").attr("style").split(';');
            for (var i = 0; i < styleArr2.length; i++) {
                var thisStyle = styleArr2[i];
                if (thisStyle != null && thisStyle != '' && thisStyle.toUpperCase().indexOf("COLOR")>-1) {
                    $("#<%=hdTextColor2.ClientID %>").val(thisStyle.split(':')[1].replace("#", ""));
                }
            }

            var styleArr3 = $("#<%=TextBox3.ClientID %>").attr("style").split(';');
            for (var i = 0; i < styleArr3.length; i++) {
                var thisStyle = styleArr3[i];
                if (thisStyle != null && thisStyle != '' && thisStyle.toUpperCase().indexOf("COLOR")>-1) {
                    $("#<%=hdTextColor3.ClientID %>").val(thisStyle.split(':')[1].replace("#",""));
                }
            }
            return true;
        }

    </script>
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
                <td width="1232" height="25" valign="top" align="left">你当前位置：网站系统 - 跑马灯管理</td>
            </tr>
        </table>

        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tr>
                <td height="35" colspan="2" class="f14 bold Lpd10 Rpd10">
                    <div class="hg3  pd7">
                        <asp:Literal ID="litInfo" runat="server"></asp:Literal>跑马灯信息
                    </div>
                </td>
            </tr>
          <%--  <tr>
                <td class="listTdLeft">开始时间：</td>
                <td>
                     <span style="display:none;"><asp:TextBox ID="txtStartDate"  runat="server" CssClass="text wd2"  onfocus="WdatePicker({dateFmt:'',maxDate:'#F{$dp.$D(\'txtBeginTime\')}'})"></asp:TextBox></span>
                    <asp:TextBox ID="txtBeginTime" runat="server" CssClass="text wd2" Width="200px" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"></asp:TextBox>
                    <img  src="../../Images/btn_calendar.gif" onclick="WdatePicker({el:'txtEndDate',dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'txtStartDate\')}'})"
                        style="cursor: pointer; vertical-align: middle" />
                    </td>
            </tr>--%>
            <tr>
                <td class="listTdLeft">循环次数：</td>
                <td>
                    <asp:TextBox ID="txtCounts" runat="server" CssClass="text" Width="165px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="listTdLeft">间隔时间：</td>
                <td>
                    <asp:TextBox ID="txtInterval" runat="server" CssClass="text" Width="165px"></asp:TextBox>秒
                </td>
            </tr>
            <%--<tr>
                <td class="listTdLeft">发送标识：</td>
                <td>
                    <input type="checkbox" id="ckbIsSend" runat="server" />立即发送</td>
            </tr>--%>
            <%--  <tr>
                <td class="listTdLeft">最后发送时间：</td>
                <td>
                    <asp:Literal ID="lastSendTime" runat="server"></asp:Literal>
                </td>
            </tr>--%>
            <tr>
                <td class="listTdLeft">内容：</td>
                <td>
                    <table>
                        <tr>
                            <td> <asp:TextBox ID="TextBox1" runat="server"  Width="300px" CssClass="iColorPicker" ></asp:TextBox><input type="hidden" runat="server" value="" id="hdTextColor1" /></td>
                        </tr>
                        <tr>
                            <td> <asp:TextBox ID="TextBox2" runat="server"  Width="300px" CssClass="iColorPicker" ></asp:TextBox><input type="hidden" runat="server" value="" id="hdTextColor2" /></td>
                        </tr>
                        <tr>
                            <td> <asp:TextBox ID="TextBox3" runat="server" Width="300px" CssClass="iColorPicker" ></asp:TextBox><input type="hidden" runat="server" value="" id="hdTextColor3" /></td>
                        </tr>
                        <tr>
                            <td> 注意：一条消息可以分为3段，每段可以选不同的颜色。最后发送会合并成一条消息！</td>
                        </tr>
                    </table>
                   
                </td>
            </tr>

        </table>
        <br />
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width:10%;"></td>
                <td class="td4">
                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btn_operate" OnClientClick="return submitClientClick()" onclick="btnSave_Click" />
                    <input class="btnLine" type="button" /> 
                    <input type="button" value="返回" class="btn_operate" onclick="Redirect('MarqueeList.aspx')" />                           
                </td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>
