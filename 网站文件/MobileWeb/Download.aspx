<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.Master" AutoEventWireup="true" CodeBehind="Download.aspx.cs" Inherits="OfficialWap.Web.Download" %>
<%@ MasterType VirtualPath="/SiteMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="center_mold mt20">
        <h2>游戏下载</h2>
        <div class="plr10">
            <div class="Download list p15 ptb30 lh200">
                <p class='red01'>分享二维码 </p>
                <asp:Image runat="server" ID="qRCodeImg" />
                <script type="text/javascript">
                    /*
                    * 智能机浏览器版本信息:
                    *
                    */
                    var browser = {
                        versions: function () {
                            var u = navigator.userAgent, app = navigator.appVersion;
                            return {//移动终端浏览器版本信息
                                trident: u.indexOf('Trident') > -1, //IE内核
                                presto: u.indexOf('Presto') > -1, //opera内核
                                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                                mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
                                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                                iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
                                iPad: u.indexOf('iPad') > -1, //是否iPad
                                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
                            };
                        }(),
                        language: (navigator.browserLanguage || navigator.language).toLowerCase()
                    }

                    var iosDownloadLink = "http://localhost:8082/UserReg.html";
                    var androidDownloadLink = "http://localhost:8082/UserReg.html";

                    if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
                        if (iosDownloadLink != "") {
                            //document.write("<p class='red01'>如果无法下载，请点击手机屏右上方这个<img src='images/ios.gif' >按妞<br>选择【在Safari中打开】</p><p class='mt30'>您当前使用的是苹果系统 </p><p class='mt10'><a class='button01 w6 br3 lh50 f18' href='#' target='_blank'>【苹果版】下载</a></p>");
                            document.write("<p class='mt30'>您当前使用的是苹果系统 </p><p class='mt10'><a class='button01 w6 br3 lh50 f18' href='" + iosDownloadLink + "' target='_blank'>【苹果版】下载</a></p>");
                        } else {
                            document.write("<p class='red01' style='line-height:45px;'>您好，苹果系统暂时不提供安装包 </p><p class='mt10'><a class='button01 w6 br3 lh50 f18' href='#'  disabled='true'  style='background-color:gray'>【敬请期待】</a></p>");
                        }
                    }
                    else {
                        if (androidDownloadLink != "") {
                            //document.write("<p class='red01'>如果无法下载，请点击手机屏右上方这个<img src='images/Android.gif' >按妞<br>选择【在浏览器中打开】</p><p class='mt30'>您当前使用的是安卓系统 </p><p class='mt10'><a class='button03 w6 br3 lh50 f18' href='#' target='_blank'>【安卓版】下载</a></p>");
                            document.write("<p class='mt30' style='margin'>您当前使用的是安卓系统 </p><p class='mt10'><a class='button03 w6 br3 lh50 f18' href='" + androidDownloadLink + "' target='_blank'>【安卓版】下载</a></p>");
                        } else {
                            document.write("<p class='red01' style='line-height:45px;'>您好，安卓系统暂时不提供安装包 </p><p class='mt10'><a class='button03 w6 br3 lh50 f18' href='#'  disabled='true'   style='background-color:gray;disabled:true;'>【敬请期待】</a></p>");
                        }
                    }
                </script>

            </div>
        </div>
    </section>
</asp:Content>
