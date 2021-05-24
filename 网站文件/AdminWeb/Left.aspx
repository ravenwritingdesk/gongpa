<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="Game.Web.Left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="styles/common.css" rel="stylesheet" type="text/css" />
    <link href="styles/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="scripts/common2.js"></script>
    <style type="text/css">
        .selecteda {
            background: url(../images/Sprite.png) no-repeat -280px -268px;
            background-color:#6aa1e3;
            color: white;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#sidebar_insi a").each(function () {
                $(this).on("click", function () {
                    $("a").removeClass("selecteda");
                    $(this).addClass("selecteda");
                });
            });
        });

        function GetUrl(obj, url) {
            //加入一个随机防止OPEN的缓存
            vNum = Math.random()
            vNum = Math.round(vNum * 1000)
            if (url.valueOf("?") > 0) {
                url = url + "&" + vNum;
            }
            else {
                url = url + "?" + vNum;
            }
            window.open(url, "frm_main_content");
            var trList = document.getElementsByTagName("tr");
            for (var i = 0; i < trList.length; i++) {
                if (trList[i].className == "linkBg") {
                    trList[i].className = "s";
                }
            }
            obj.className = "linkBg";
        }
    </script>
</head>
<body>
    <div class="sidebar" style="height: auto; overflow: auto;">
        <div class="sidebar_insi" id="sidebar_insi">
            <div class="sidebar_con" id="sidebar_con">
                <asp:Repeater ID="LeftMenu" runat="server" OnItemDataBound="LeftMenu_ItemDataBound">
                    <ItemTemplate>
                        <dl>
                            <dt>
                                <h2><%# Eval("Title")%></h2>
                            </dt>
                            <asp:Repeater ID="LeftMenu_Sub" runat="server">
                                <ItemTemplate>
                                    <dd>
                                        <h3><a href="#" onclick="GetUrl(this,'<%# Eval("Link")%>')"><%# Eval("Title")%></a></h3>
                                    </dd>
                                </ItemTemplate>
                            </asp:Repeater>
                        </dl>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</body>
</html>


<%--<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="styles/layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {background-image: url(images/sideBg.gif); background-repeat:repeat-y;}
    </style>
    <script type="text/javascript">
        function showHide(obj) {
            var oStyle = obj.style;
            var imgId = obj.id.replace("M","S");
            oStyle.display == "none" ? oStyle.display = "block" : oStyle.display = "none";
            oStyle.display == "none" ? document.getElementById(imgId).src = "images/arrBig1.gif" : document.getElementById(imgId).src = "images/arrBig.gif";
        }
        
        function GetUrl(obj,url) {
            //加入一个随机防止OPEN的缓存
            vNum = Math.random()
            vNum = Math.round(vNum * 1000)
            if (url.valueOf("?") > 0) {
                url = url + "&" + vNum;
            }
            else {
                url = url + "?" + vNum;            
            }
            window.open(url,"frm_main_content");
            var trList = document.getElementsByTagName("tr");
            for(var i=0;i<trList.length;i++)
            {
                if(trList[i].className=="linkBg")
                {
                    trList[i].className = "s";
                }
            }            
            obj.className="linkBg";
        }
    </script>
</head>
<body>
    <asp:Repeater ID="LeftMenu" runat="server" OnItemDataBound="LeftMenu_ItemDataBound">
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                <tr>
		            <td class="hui f14 bold pd32 hand" height="30" onclick="JavaScript:showHide(M_<%# Eval("ModuleID")%>);">
		                <img src="images/arrBig.gif" width="11" height="11" id="S_<%# Eval("ModuleID")%>" /> <%# Eval("Title")%>
		            </td>
	            </tr>
                <tr>
                    <td id="M_<%# Eval("ModuleID")%>">
                        <table width="93%" border="0" align="right" cellpadding="0" cellspacing="0" class="hui">
                            <asp:Repeater ID="LeftMenu_Sub" runat="server">
                                <ItemTemplate>
                                    <tr class="s" onclick="GetUrl(this,'<%# Eval("Link")%>')">
				                        <td width="313" height="25" align="right"></td>
				                        <td width="67" height="25"><img src="images/arrSmall.gif" width="8" height="7" /></td>
				                        <td width="725" height="25" align="left"><%# Eval("Title")%></td>
			                        </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>
</body>
</html>--%>
