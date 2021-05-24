<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProxySet.aspx.cs" Inherits="DimoNetwork.QPProxyWeb.SysRoot.ProxySet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/js/select-ui.min.js"></script>

    <style>
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="/SysRoot/index.aspx">首页</a></li>
                <li><a href="/SysRoot/ProxyManage.aspx">代理管理</a></li>
            </ul>
        </div>


        <div class="rightinfo">
            <div class="itab" style="display: <%=this.Proxy.belongsAgent == -1 ? "" : "none"%>">
                <ul id="tabUl">
                    <li><a href="#tab1" onclick="location.href='/SysRoot/ProxyManage.aspx#tab1'">代理管理</a></li>
                    <li><a href="#tab2">等级设置</a></li>
                </ul>
            </div>
            <div class="formtitle">
                <span>代理等级设置</span>
            </div>
            <table class="tablelist1">
                <tbody id="listBody">
                    <asp:Repeater ID="reptDataPager" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="td2">等级:</td>
                                <td class="td1"><%#Eval("LevelId")%></td>
                                <td class="td2">描述:</td>
                                <td class="td1">
                                    <input name="Id" type="text" class="dfinput" value="<%#Eval("LevelName")%>" id='<%#Eval("Id") %>' style="width: 200px;" /></td>
                                <td class="td1">
                                    <%#  Eval("LevelId").ToString()==maxLevel.ToString()?"<input type='button' name='delBtn' id='del_"+Eval("Id")+"' class='scbtn1' onclick='delClick(this)' value='删除'>":"" %>
                                </td>
                                <td style="width: 50%;"></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <input type="hidden" value="" runat="server" name="idHidden" id="idHidden" />
            <input type="hidden" value="" runat="server" name="valHidden" id="valHidden" />
            <div style="display: none">
                <asp:Button Text="" ID="delBtn" runat="server" OnClick="delBtn_Click" />
                <asp:Button Text="" ID="saveBtn" runat="server" OnClick="saveBtn_Click" />
            </div>
            <br />
            <div style="padding-left: 20%;">
                <asp:Button Text="新增等级" ID="addBtn" CssClass="scbtn" OnClick="addBtn_Click" runat="server" />
                <asp:Button Text="保存" ID="btnSave" CssClass="scbtn" OnClientClick="return submitClick()" OnClick="btnSave_Click" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>

<script type="text/javascript">

    $("#tabUl").idTabs("tab2");

    function SaveClick(e) {
        var thisId = $(e).attr("id");
        var id = thisId.split("_")[1];
        $("#<%=this.idHidden.ClientID %>").val(id);
        $("#<%=this.valHidden.ClientID %>").val($("#Name_" + id).val());
        document.getElementById("<%=this.saveBtn.ClientID %>").click();
    }

    function delClick(e) {
        var thisId = $(e).attr("id");
        var id = thisId.split("_")[1];

        $("#<%=this.idHidden.ClientID %>").val(id);
        document.getElementById("<%=this.delBtn.ClientID %>").click();
    }

    function submitClick() {
        var idStr = "";
        var valStr = "";
        $("input[type='text'][name='Id']").each(function (k, v) {
            idStr += $(v).attr("id") + "*";
            valStr += $(v).val() + "*";
        });
        if (idStr == "") {
            return false;
        }
        $("#<%=this.idHidden.ClientID%>").val(idStr.length > 0 ? idStr.substring(0, idStr.length - 1) : "");
        $("#<%=this.valHidden.ClientID %>").val(valStr.length > 0 ? valStr.substring(0, valStr.length - 1) : "");
        return true;
    }
</script>
