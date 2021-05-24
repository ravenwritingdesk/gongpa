<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayCardFillByPC.aspx.cs" Inherits="Game.FrontWeb.PayCardFillByPC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mt30" runat="server" id="wartingTable">
                <tr>
                    <th width="30%" height="40" class="tr" scope="row">操作提示：</th>

                    <td class="tl fb red">
                        <asp:Literal ID="lit99Bill" runat="server"></asp:Literal></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
