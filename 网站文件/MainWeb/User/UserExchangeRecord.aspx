<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="UserExchangeRecord.aspx.cs" Inherits="Game.FrontWeb.User.UserExchangeRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function QueryInfo() {
            var startDate = document.form1.StartDate.value;
            var endDate = document.form1.EndDate.value;
            if (!isDate(startDate) || !isDate(endDate)) {
                alert("日期格式不正确！");
                return false;
            }
        }
    </script>
    <div class="rightMold fr">

        <div class="comUserMold comMold">
            <dl>
                <dt class="clearfix">
                    <p class="fl">
                        <img src="/images/ico-User.png" alt=""></p>
                </dt>
                <div class="body p20">
                    <h2><span class="title">兑换记录</span></h2>
                    <div class="orange_box p20 mt10">
                        <form action="" method="post">
                            <table class="ser_table" width="100%">
                                <colgroup>
                                    <col width="10%">
                                    <col>
                                    <col>
                                    <col width="10%">
                                    <col width="7%">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>日期查询：</td>
                                        <td>
                                            <input type="text" id="domain" name="domain" class="com_input w100" value="">
                                            - 
                                <input type="text" id="Text1" name="domain" class="com_input w100" value=""></td>
                                        <td>
                                            <select name="ddlType" id="ddlType" style="width: 80px;">
                                                <option selected="selected" value="0">全部</option>
                                                <option value="1">已发货</option>
                                                <option value="2">正在处理</option>

                                            </select></td>
                                        <td>
                                            <input type="submit" class="button01 p3 plr30 mr20 cp" name="" value="查询">
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="user_table_box02 page_box mt10">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <th scope="col">兑换时间</th>
                                <th scope="col">收件人</th>
                                <th scope="col">发货时间</th>
                                <th scope="col">联系电话</th>
                                <th scope="col">联系地址</th>
                                <th scope="col">是否已发货</th>
                            </tr>
                            <tr>
                                <td>2015-10-01</td>
                                <td>abc</td>
                                <td>dddd</td>
                                <td>充值</td>
                                <td>100.00</td>
                                <td>0.00</td>
                            </tr>
                        </table>
                    </div>
                    <div class="mold-page mt20">
                        <ul class="clearfix">
                            <li><a href="Prizelist.html">首页</a></li>
                            <li><a href="Prizelist.html">上一页</a></li>
                            <li><a href="Prizelist.html">01</a></li>
                            <li><span>02</span></li>
                            <li><a href="Prizelist.html">03</a></li>
                            <li><a href="Prizelist.html">下一页</a></li>
                            <li><a href="Prizelist.html">尾页</a></li>
                        </ul>
                    </div>
                </div>
            </dl>
        </div>
    </div>
</asp:Content>
