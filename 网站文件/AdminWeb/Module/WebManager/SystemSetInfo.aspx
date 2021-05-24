<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemSetInfo.aspx.cs" Inherits="Game.Web.Module.WebManager.SystemSetInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../styles/Site.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../scripts/common.js"></script>

    <script type="text/javascript" src="../../scripts/jquery.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
            <tr>
                <td width="19" height="25" valign="top" class="Lpd10">
                    <div class="arr">
                    </div>
                </td>
                <td width="1232" height="25" valign="top" align="left">你当前位置：系统维护 - 推广管理
                </td>
            </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listBg2">
            <tbody id="setInfoBody" runat="server">
                <tr>
                    <td style="border-bottom: 1px solid #9ecee7; padding: 7px; width:10%; text-align:right;" class="f14 bold Lpd10 Rpd10">注册赠送
                    </td>

                    <td style="border-bottom: 3px solid #9ecee7; padding: 7px;width:25%;">
                        <input type="text" class="text" runat="server" id="setValue_" style="width:100%;" />
                    </td>
                    <td style="border-bottom: 3px solid #9ecee7; padding: 7px;">
                        <input type="button" value="保存" class="btn_operate" onclick="updateClick(key)" />
                    </td>
                    <td style="border-bottom: 3px solid #9ecee7; padding: 7px; width:50%;"></td>
                </tr>
                <tr><td style='border-bottom: 3px solid #9ecee7; padding: 7px; width:10%; text-align:right;' class='f14 bold Lpd10 Rpd10'>{0}</td>
                  <td style='border-bottom: 3px solid #9ecee7; padding: 7px;width:25%;'>
                        不控制<input type="radio" value="0" name="radRename" id="Radio1" checked="checked" onclick='radioClick(this)' />
                        &nbsp;必须填写<input type="radio" value="1" name="radRename" id="Radio2"  onclick='radioClick(this)'  />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px;'>
                        <input type='button' value='保存' class='btn_operate' onclick=updateClick('{3}') />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px; width:50%;'></td>
                </tr>

                <tr><td style='border-bottom: 1px solid #9ecee7; padding: 7px; width:10%; text-align:right;' class='f14 bold Lpd10 Rpd10'>{0}</td>
                  <td style='border-bottom: 1px solid #9ecee7; padding: 7px;width:25%;'>
                        在线充值<input type="checkbox" value="0" name="rechargeCheck" checked="checked" onclick='checkClick(this)'  />
                        支付宝充值<input type="checkbox" value="1"  name="rechargeCheck" checked="checked" onclick='checkClick(this)'  />
                        微信充值<input type="checkbox" value="2"  name="rechargeCheck" checked="checked" onclick='checkClick(this)'  />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px;'>
                        <input type='button' value='保存' class='btn_operate' onclick='submitClick()' />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px; width:50%;'></td>
                </tr>
                <tr><td style='border-bottom: 1px solid #9ecee7; padding: 7px; width:10%; text-align:right;' class='f14 bold Lpd10 Rpd10'>{0}</td>
                  <td style='border-bottom: 1px solid #9ecee7; padding: 7px;width:25%;'>
                        我要充值<input type="checkbox" value="1" name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                        充值记录<input type="checkbox" value="2"  name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                        兑奖申请<input type="checkbox" value="3"  name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                      兑奖记录<input type="checkbox" value="4"  name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                      赠 送<input type="checkbox" value="5"  name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                      赠送记录<input type="checkbox" value="6"  name="rechargeCenterTabCheck" checked="checked" onclick='checkClick(this)'  />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px;'>
                        <input type='button' value='保存' class='btn_operate' onclick='submitClick()' />
                    </td>
                    <td style='border-bottom: 3px solid #9ecee7; padding: 7px; width:50%;'></td>
                </tr>
            </tbody>
        </table>
        <input type="hidden" value="" id="SetNameHidden" runat="server" />
        <input type="hidden" value="" id="SetValueHidden" runat="server" />
        <br />
        <div style="padding-left:30%;">
         <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn_operate" OnClientClick="return submitClick()" OnClick="btnSave_Click" /></div>
    </form>
</body>
</html>
<script type="text/javascript">
    function updateClick(key)
    {
        $("#<%=this.SetNameHidden.ClientID%>").val(key);
        $("#<%=this.SetValueHidden.ClientID %>").val($("#setValue_" + key).val());
        document.getElementById("<%=this.btnSave.ClientID%>").click();
    }

    function radRenameClick(id,val)
    {
        $("#setValue_"+id).val(val);
    }

    function checkClick(id,name)
    {
        debugger
        var checkVal="";
        $("input[name="+name+"]").each(function(k,v){
            if(v.checked)
            {
                checkVal+=$(v).val()+",";
            }
        });
        $("#setValue_"+id).val(checkVal.length>0?checkVal.substring(0,checkVal.length-1):"");
    }

    function submitClick()
    {
        var idStr="";
        var valStr="";
        $("input[type='text'][name='SetVal']").each(function(k,v){
            idStr+=$(v).attr("id")+"*";
            valStr+=$(v).val()+"*";
        });
        if(idStr=="")
        {
            return false;
        }
        $("#<%=this.SetNameHidden.ClientID%>").val(idStr.length>0?idStr.substring(0,idStr.length-1):"");
        $("#<%=this.SetValueHidden.ClientID %>").val(valStr.length>0?valStr.substring(0,valStr.length-1):"");
        return true;
        //document.getElementById("").click();
    }

</script>
