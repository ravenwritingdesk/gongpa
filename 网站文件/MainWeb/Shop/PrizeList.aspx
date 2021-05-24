<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrizeList.aspx.cs" Inherits="Game.FrontWeb.Shop.PrizeList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Src="~/UserControl/SiteFooter.ascx" TagPrefix="uc1" TagName="SiteFooter" %>
<%@ Register Src="~/UserControl/SiteHead.ascx" TagPrefix="uc1" TagName="SiteHead" %>
<%@ Register Src="~/UserControl/SiteLeft.ascx" TagPrefix="uc1" TagName="SiteLeft" %>
<%@ Register Src="~/UserControl/SiteMenu.ascx" TagPrefix="uc1" TagName="SiteMenu" %>


<!DOCTYPE HTML>
<html>
<uc1:SiteHead runat="server" ID="SiteHead" />

<body>
    <uc1:SiteMenu runat="server" ID="SiteMenu" />

    <div id="wrapper">

        <div class="Poster01 wrap"></div>
        <div class="wrap clearfix tl">
            <!-- leftMold-->
            <uc1:SiteLeft runat="server" ID="SiteLeft" />
            <!-- leftMold /-->

            <!-- rightMold-->
            <div class="rightMold fr">

                <div class="d2">
                    <div class="comPrizeList comMold">
                        <dl>
                            <dt class="clearfix">
                                <p class="fl">
                                    <img src="/images/ico-Prize.png" alt="">
                                </p>
                                <p class="fr">
                                    <a href="/Index.aspx" onmouseover="mouseover()" onmouseout="mouseout()">
                                        <img id="backImg" src="/images/btnback.png" />
                                    </a>
                                </p>
                            </dt>
                            <div class="body p20">
                                <form id="form1" runat="server">
                                    <div class="w">
                                        <div class="user_demoBox js_user_demoBox">
                                            <ul class="tab_menu clearfix" id="typeUl">
                                                <li class="<%=string.IsNullOrWhiteSpace(type)?"cur":"" %>"><a href="javascript:void(0);" onclick="searchClick(-1)" >全部奖品</a></li>
                                                <li class="<%=type=="0"?"cur":"" %>"><a href="javascript:void(0);" onclick="searchClick(0)" >电器数码</a></li>
                                                <li class="<%=type=="1"?"cur":"" %>"><a href="javascript:void(0);" onclick="searchClick(1)" >生活家居</a></li>
                                                <li class="<%=type=="2"?"cur":"" %>"><a href="javascript:void(0);" onclick="searchClick(2)" >虚拟点卡</a></li>
                                                <li class="<%=type=="3"?"cur":"" %>"><a href="javascript:void(0);" onclick="searchClick(3)" >话费专区</a></li>
                                            </ul>
                                            <div class="tab_box w">
                                                <div class="sort">
                                                    排序：<a href="javascript:void(0);"><span onclick="searchOrderByClick(0)" class="<%=orderBy=="0"?"cur":"" %>">上架时间</span></a>
                                                    <a href="javascript:void(0);"><span onclick="searchOrderByClick(1)"  class="<%=orderBy=="1"?"cur":"" %>">热门</span></a>
                                                    <a href="javascript:void(0);"><span onclick="searchOrderByClick(2)"  class="<%=orderBy=="2"?"cur":"" %>">价格</span></a>
                                                    <%--<i class=""><input type="checkbox" id="isCanExchange"><label for="isCanExchange" class="cp">我可以兑换奖品</label></i>--%>
                                                </div>
                                                <div class="list">
                                                    <ul class="clearfix">
                                                        <asp:Repeater ID="rptPrizeList" runat="server">
                                                            <ItemTemplate>  
                                                                <li><a href="Prize.aspx?prizeId=<%# Eval("ID")%>">
                                                                    <p class="img">
                                                                        <img src='<%=PrizeImgUrl %><%#Eval("ImgName") %>'  >
                                                                    </p>
                                                                    <p class="title"><%# Eval("Name")%></p>
                                                                    <p class="Price">价格：<i><%# Eval("Value")%></i>奖券</p>
                                                                </a>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </div>
                                                <div class="mold-page mt20">
                                                    <ul class="clearfix">
                                                        <webdiyer:AspNetPager ID="anpPage" runat="server" AlwaysShow="true" FirstPageText="首页"
                                                            LastPageText="末页" PageSize="12" NextPageText="下页" PrevPageText="上页" ShowBoxThreshold="0"
                                                            LayoutType="Table" NumericButtonCount="5" CustomInfoHTML="共 %PageCount% 页"
                                                            UrlPaging="false" OnPageChanging="anpPage_PageChanging" ShowCustomInfoSection="Never">
                                                        </webdiyer:AspNetPager>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
            <!-- rightMold /-->

        </div>

    </div>
    <uc1:SiteFooter runat="server" ID="SiteFooter" />
</body>
</html>
<script type="text/javascript">
    function searchOrderByClick(orderBy) {
        var typeText = $("#typeUl li[class='cur'] ").text();
        var type = "";
        switch (typeText) {
            case "全部奖品":
                type = "";
                break;
            case "电器数码":
                type = "0";
                break;
            case "生活家居":
                type = "1";
                break;
            case "虚拟点卡":
                type = "2";
                break;
            case "话费专区":
                type = "3";
                break;
            default:
                type = "";
                break;
        }
        location.href = "/Shop/PrizeList.aspx?orderBy=" + orderBy + "&type="+type;
    }

    function searchClick(type) {
        var orderByText = $("div[class='sort'] span[class='cur'] ").text();
        var orderBy = "-1";
        switch (orderByText) {
            case "上架时间":
                orderBy = "0";
                break;
            case "热门":
                orderBy = "1";
                break;
            case "价格":
                orderBy = "2";
                break;
            default:
                orderBy = "-1";
                break;
        }
        location.href = "/Shop/PrizeList.aspx?orderBy=" + orderBy + "&type=" + type;
    }

 //<!-- 
 //   function DrawImage(ImgD, FitWidth, FitHeight) {
 //       var image = new Image();
 //       image.src = ImgD.src;
 //       if (image.width > 0 && image.height > 0) {
 //           if (image.width / image.height >= FitWidth / FitHeight) {
 //               alert(image.width / image.height);
 //               alert(FitWidth / FitHeight);
 //               if (image.width > FitWidth) {
 //                   ImgD.width = FitWidth;
 //                   ImgD.height = (image.height * FitWidth) / image.width;
 //               } else {
 //                   ImgD.width = image.width;
 //                   ImgD.height = image.height;
 //               }
 //           } else {
 //               if (image.height > FitHeight) {
 //                   ImgD.height = FitHeight;
 //                   ImgD.width = (image.width * FitHeight) / image.height;
 //               } else {
 //                   ImgD.width = image.width;
 //                   ImgD.height = image.height;
 //               }
 //           }
 //       }
 //   }
 //   //-->
 </script>
