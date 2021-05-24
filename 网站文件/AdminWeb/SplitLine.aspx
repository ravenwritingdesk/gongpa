<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SplitLine.aspx.cs" Inherits="Game.Web.SplitLine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script type="text/javascript" src="scripts/JQuery.js"></script>
   <style type="text/css">
       body {
        background-color:#808080
       }
   </style>
    <script type="text/javascript">
        var flag = false;
        function shift_status() {
            var mainFram = top.document.getElementsByName("mainFrameset")[0];
            if (flag) {
                mainFram.cols = "170,5,*";
            } else {
                mainFram.cols = "0,5,*";
            }
            flag = !flag;
        }

        $(document).click(function () {
                shift_status();
            });
    </script>
</head>
<body>

</body>
</html>
