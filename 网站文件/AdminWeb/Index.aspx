<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Game.Web.Index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

     <link href="styles/common.css" rel="stylesheet" type="text/css"  />
    <link href="styles/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css"  />
    <script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="scripts/jquery-1.7.1.js"></script>
    <script  type="text/javascript" src="../../scripts/JQuery.js"></script>
    <script type="text/javascript" src="scripts/jquery.mCustomScrollbar.concat.min.js"></script>

    <title>游戏后台管理系统 - Surfbird</title>
</head>
    <frameset framespacing="0" rows="58,*,40" frameborder="NO" cols="*">
        <frame name="topFrame" src="Top.aspx" noresize scrolling="no">
        </frame>
        <frameset border="2" framespacing="0" rows="*" name="mainFrameset" frameborder="NO" cols="170,5,*">
             <frame src="Left.aspx" frameborder="0" norsize="no" target="frm_main_content"></frame>
             <frame frameborder="0" norsize="no" src="SplitLine.aspx"></frame>
             <frame name="frm_main_content" id="frm_main_content" height="100%" src="Right.aspx" frameborder="no" width="100%"></frame>
        </frameset>
        <frame name="bottomFrame" norsize=""  scrolling="no"></frame>
    </frameset>
</html>

<script type="text/javascript">
    function Set(id) {
        $.get(
					"/Tools/AdminHandler.ashx?action=bindip&isbind=" + id + "&x=" + Math.random(),
					function(data) {
					    if (data < 0) {
					        alert("操作失败！");
					    }
					    $("#ipbind").html(data == 1 ? "<a href='javascript:void(0);' onclick='Set(0);' class='f'>绑定IP</a>" : "<a href='javascript:void(0);' onclick='Set(1);' class='f'>取消绑定</a>");
					}
				);
    }
</script>

