<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteHead.ascx.cs" Inherits="Game.FrontWeb.SiteHead" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title><%=title %></title>
    <meta name="keywords" content="手机游戏,安卓手游,Android,苹果手游,ios,斗地主,捕鱼,街机" />
    <meta name="description" content="一款手机游戏与PC游戏数据互通，棋牌平台第一品牌游戏。" />
    <link rel="stylesheet" type="text/css" href="/css/public.css" />
    <link rel="stylesheet" type="text/css" href="/css/index.css" />
    <script src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        function mouseover() {
            $("#backImg").attr("src", "/images/btnback1.png");
        }

        function mouseout() {
            $("#backImg").attr("src", "/images/btnback.png");
        }
    </script>
</head>
