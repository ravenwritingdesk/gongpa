<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice.aspx.cs" Inherits="UserHandlerWeb.ReferencePage.Notice" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>公告</title>
    <style>
        html,body,div,span,h1,h2,h3,h4,h5,h6,p,em,img,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,caption,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video{margin:0;padding:0;outline:0;border:0;background:transparent;vertical-align:baseline;font-size:100%;}
        table,tbody,tfoot,thead,tr,th,td{margin:0;padding:0;outline:0;background:transparent;font-size:100%;}
        table{border-collapse:collapse;border-spacing:0;}
        article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section,title{display:block;}
        fieldset,img {border:0}
        b{font-weight:normal;}
        i{font-style:normal;}
        u{text-decoration:none;}
        address,caption,cite,code,dfn,em,strong,th,var{font-style:normal;font-weight:normal}
        ol,ul {list-style:none}
        caption,th {text-align:left}
        h1,h2,h3,h4,h5,h6 {font-size:100%;font-weight:normal}
        q:before,q:after {content:''}
        abbr,acronym {border:0}
        input,select,label{vertical-align:middle;outline:none;}
        html,body{width:100%; height:auto;}
        body{color:#16c1ec;font:12px/1 Arial,'Microsoft YaHei',Tahoma,Verdana,'Simsun';height:100%;}
        body{background-color:#052435;}
        a{color:#35b7ec; text-decoration:underline;}
        a:hover{color:#f60;}
        .none{display:none}
        .br4{border-radius:4px}
        .Notice{padding:10px;padding-bottom:0px;}
        .Notice li h2{font-size:16px; font-weight:700;height:40px; line-height:40px; background-color:#043e54; border:1px solid #038aaf; padding:0 20px; cursor:pointer;}
        .Notice li{margin-bottom:10px;}
        .Notice li.cur h2{background-color:#0a7d9d; border:1px solid #4afffd;color:#ff0;}
        .Notice li.read h2{background-color:#08718e;border:1px solid #4afffd;color:#fff;}
        .Notice li .Article{background-color:#093143; border:1px solid #011824;padding:10px 20px; line-height:22px; font-size:14px;}
        .Notice li .Article p{text-indent:2em;}
        .Notice li .Article .date{color:#1f80ad; text-align:right;}
    </style>
    <script src="/js/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <section class="Notice">
            <ul id="notices">
                <asp:Repeater ID="reptNews" runat="server">
                    <ItemTemplate>
                        <li class="read">
                            <h2 class="br4"><%# Eval("Subject") %></h2>
                            <div class="Article none">
                                <p>
                                    <%# Eval("Body") %>
                                </p>
                                <div class="date"><%# Convert.ToDateTime(Eval("IssueDate")).ToString("yyyy年MM月dd日") %></div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
        </section>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".Notice li").bind({
                click: function () {
                    $(".Notice li").attr("class", "read");
                    $(".Notice li").children("div").attr("class", "Article none");

                    $(this).attr("class", "cur");
                    $(this).children("div").attr("class", "Article br4");
                }
            });

            $(".Notice li").eq(0).attr("class", "cur");
            $(".Notice li").eq(0).children("div").attr("class", "Article br4");
        });
    </script>
</body>
</html>
