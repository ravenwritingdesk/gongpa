<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckDraw.aspx.cs" Inherits="UserHandlerWeb.ReferencePage.LuckDraw" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>幸运抽奖
    </title>
    <link href="/style/LuckDraw.css" rel="stylesheet" />
    <script src="/js/jquery.min.js"></script>
    <script src="/js/awardRotate.js"></script>
    <script type="text/javascript">
        //var winWidth = 0;
        //var winHeight = 0;
        //if (window.innerWidth)
        //{
        //    winWidth = window.innerWidth;
        //} else if (document.body && document.body.clientWidth)
        //{
        //    winWidth = document.body.clientWidth;
        //}

        //if (window.innerHeight) {
        //    winHeight = window.innerHeight;
        //} else if (document.body && document.body.clientHeight) {
        //    winHeight = document.body.clientHeight;
        //}
        //alert(winWidth);
        //alert(winHeight);

        var turnplate = {
            restaraunts: [],				//大转盘奖品名称
            colors: [],					//大转盘奖品区块对应背景颜色
            outsideRadius: 215,			//大转盘外圆的半径
            textRadius: 185,				//大转盘奖品位置距离圆心的距离
            insideRadius: 68,			//大转盘内圆的半径
            startAngle: 0,				//开始角度
            rouletteId: [],				//大转盘id
            prizeId: [],				//奖品Id
            prizeSequence: [],				//大转盘奖品序号

            bRotate: false				//false:停止;ture:旋转
        };

        var setId = null;
        var setId2;
        var setId3;
        var setIntervalCount2 = 0;
        var setIntervalCount3 = 0;
        var resultData;
        $(document).ready(function () {

            $('.pointer').click(function () {
                if (turnplate.bRotate) {
                    return;
                }
                if (turnplate.restaraunts.length < 12) {
                    return;
                }

                var consumeScore = $("#consumeScore").text();
                var balanceScore = $("#txtScore").val();
                if (parseFloat(balanceScore) < parseFloat(consumeScore)) {
                    alert("您银行余额不足，开始失败！");
                    return;
                }


                turnplate.bRotate = !turnplate.bRotate;


                //指针开始
                $("img[class='pointer']").attr("src", "/images/luckdraw/turnplate-pointer-1.png");
                $("#gotoShop").hide();
                $("#gotoShop1").show();
                $("#CheckImg").unbind("click");

                //转盘背景
                if (setId == null || setId == undefined) {
                    setId = setInterval('changeTurnplateBg()', 300);
                }
                //获取随机数(奖品个数范围内)
                $.ajax({
                    url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
                    data: { action: "getLuckDrawNum" },
                    type: "GET",
                    cache: false,
                    success: function (seq) {

                        if (seq >= 0 && seq <= turnplate.restaraunts.length) {
                            rotateFn(seq);
                            console.log(seq);
                        } else {
                            alert("网络连接超时！" + seq);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $("img[class='pointer']").attr("src", "/images/luckdraw/turnplate-pointer.png");
                        clearInterval(setId);
                        alert("网络连接超时！");
                        console.log(XMLHttpRequest.statusText);
                    }
                });

            });
        });

        //中奖特效
        function WinningSpecial(seq) {
            turnplate.bRotate = !turnplate.bRotate;
            if (resultData != null) {
                var score = $("#txtScore").val();
                var gold = $("#txtGold").val();
                if (resultData.Score != score) {
                    $("#txtScore").val(resultData.Score).attr("class", "ScoreInput1");
                }
                if (resultData.Gold != gold) {
                    $("#txtGold").val(resultData.Gold).attr("class", "ScoreInput1");
                }
                $("#showResultBack").show();
                $("#showResult").show();
                $("#contentDiv").text("").hide();
                var prizeName = turnplate.restaraunts[seq - 1];
                if (prizeName.indexOf("再接再厉") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw16.png");
                } else if (prizeName.indexOf("谢谢参与") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw15.png");
                } else if (prizeName.indexOf("赠送一次") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw17.png");
                } else if (prizeName.indexOf("祝您好运") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw18.png");
                } else if (prizeName.indexOf("金币") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw14-1.png");
                    $("#contentDiv").text("恭喜您，获得" + prizeName).show();
                } else if (prizeName.indexOf("奖券") > -1) {
                    $("#showResultImg").attr("src", "/images/luckdraw/luckdraw13-1.png");
                    $("#contentDiv").text("恭喜您，获得" + prizeName).show();
                }
                setId2 = setTimeout('CloseSpecial()', 1500);



            } else {
                alert("网络故障，请重新链接！");
                return;
            }
        }

        //关闭特效 看是否在此开始
        function CloseSpecial() {
            $("#showResultBack").hide();
            $("#showResult").hide();
            $("#contentDiv").text("").hide();
            clearTimeout(setId2);
            $("#txtScore").attr("class", "ScoreInput");
            $("#txtGold").attr("class", "ScoreInput");

            if (resultData.PrizeId == 0) {
                $('.pointer').click();
                return;
            }
            var surplusNum = $("#surplusNum").text();
            var singleLuckDrawScore = $("#hiddenSingleLuckDrawScore").val();
            if (!isNaN(surplusNum) && surplusNum > 0) {
                $("#consumeScore").text(singleLuckDrawScore * (surplusNum - 1));
                $("#surplusNum").text(surplusNum - 1);
                $('.pointer').click();
            } else {
                $("#consumeScore").text(singleLuckDrawScore);
                $("#CheckImg").attr("src", "/images/luckdraw/luckdraw10.png");
                $("#CheckImg").bind("click", checkClick);
                $("#hdChecke").val(0);
                $("#surplusSpan").hide();
                clearInterval(setId);
                setId = null;
                $("#gotoShop").show();
                $("#gotoShop1").hide();
                $("img[class='pointer']").attr("src", "/images/luckdraw/turnplate-pointer.png");
            }
        }

        //旋转转盘 seq:奖品位置; txt：提示语;
        var rotateFn = function (seq) {
            var angles = seq * (360 / turnplate.restaraunts.length) - (360 / (turnplate.restaraunts.length * 2));
            if (angles < 270) {
                angles = 270 - angles;
            } else {
                angles = 360 - angles + 270;
            }
            calculate(seq);
            var duration = 6000;
            var isCheckContinuation = $("#hdChecke").val() == "1";
            if (isCheckContinuation) {
                duration = 4000;
            }
            $('#wheelcanvas').stopRotate();
            $('#wheelcanvas').rotate({
                angle: 0,
                animateTo: angles + 1800,
                duration: duration,
                callback: function () {
                    WinningSpecial(seq);
                }
            });
        };

        function calculate(seq) {
            $.ajax({
                url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
                data: { action: "calculateLuckDraw", RouletteId: turnplate.rouletteId[seq - 1], UserId: $("#UserIdHidden").val() },
                type: "GET",
                cache: false,
                dataType: "json",
                success: function (d) {
                    if (d.Code == 0) {
                        resultData = d.Data[0];
                    } else {
                        alert(d.Msg);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    return 99;
                    console.log(XMLHttpRequest.statusText);
                }
            });

        }


        //页面所有元素加载完毕后执行drawRouletteWheel()方法对转盘进行渲染
        window.onload = function () {
            $("#consumeScore").text($("#hiddenSingleLuckDrawScore").val());
            $("#CheckImg").bind("click", checkClick);
            getRoulettePrize();
        };

        function getRoulettePrize() {
            //动态添加大转盘的奖品与奖品区域背景颜色
            turnplate.colors = ["#F7941D", "#FFF100", "#F7941D", "#FFF100", "#F7941D", "#FFF100", "#F7941D", "#FFF100", "#F7941D", "#FFF100", "#F7941D", "#FFF100"];
            $.ajax({
                url: "/ProxyHandler/User.ashx?rd=" + Math.random(),
                data: { action: "getRoulette" },
                type: "GET",
                cache: false,
                dataType: "json",
                success: function (d) {
                    if (d.Code == 0) {
                        var restaraunts = new Array(12);
                        var rouletteIdArr = new Array(12);
                        var prizeSequenceArr = new Array(12);
                        var prizeIdArr = new Array(12);
                        for (var i = 0; i < d.Data.length; i++) {
                            restaraunts[i] = d.Data[i].PrizeName;
                            rouletteIdArr[i] = d.Data[i].Id;
                            prizeSequenceArr[i] = d.Data[i].Sequence;
                            prizeIdArr[i] = d.Data[i].PrizeId;
                        }
                        turnplate.restaraunts = restaraunts;
                        turnplate.rouletteId = rouletteIdArr;
                        turnplate.prizeSequence = prizeSequenceArr;
                        turnplate.prizeId = prizeIdArr;
                    } else {
                        alert("暂未开放，请联系客服。");
                        return;
                    }
                    drawRouletteWheel();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.statusText);
                }
            });
        }

        function drawRouletteWheel() {
            var canvas = document.getElementById("wheelcanvas");
            if (canvas.getContext) {
                //根据奖品个数计算圆周角度
                var arc = Math.PI / (turnplate.restaraunts.length / 2);
                var ctx = canvas.getContext("2d");
                //在给定矩形内清空一个矩形
                ctx.clearRect(0, 0, 522, 522);
                //strokeStyle 属性设置或返回用于笔触的颜色、渐变或模式  
                ctx.strokeStyle = "#FFBE04";
                //font 属性设置或返回画布上文本内容的当前字体属性
                ctx.font = '16px Microsoft YaHei';
                for (var i = 0; i < turnplate.restaraunts.length; i++) {
                    var angle = turnplate.startAngle + i * arc;
                    ctx.fillStyle = turnplate.colors[i];
                    ctx.beginPath();
                    //arc(x,y,r,起始角,结束角,绘制方向) 方法创建弧/曲线（用于创建圆或部分圆）    
                    ctx.arc(261, 261, turnplate.outsideRadius, angle, angle + arc, false);
                    ctx.arc(261, 261, turnplate.insideRadius, angle + arc, angle, true);
                    ctx.stroke();
                    ctx.fill();
                    //锁画布(为了保存之前的画布状态)
                    ctx.save();

                    //----绘制奖品开始----
                    ctx.fillStyle = "#691503";
                    ctx.font = 'bold 20px Microsoft YaHei';
                    var text = turnplate.restaraunts[i];
                    var line_height = 10;
                    //translate方法重新映射画布上的 (0,0) 位置
                    ctx.translate(261 + Math.cos(angle + arc / 2) * turnplate.textRadius, 261 + Math.sin(angle + arc / 2) * turnplate.textRadius);

                    //rotate方法旋转当前的绘图
                    ctx.rotate(angle + arc / 2 + Math.PI / 2);

                    /** 下面代码根据奖品类型、奖品名称长度渲染不同效果，如字体、颜色、图片效果。(具体根据实际情况改变) **/
                    if (text.indexOf("金币") > 0) {//流量包
                        var text1 = text.substring(0, text.indexOf("金币"));
                        ctx.fillText(text1, -ctx.measureText(text1).width / 2, 1 * line_height);
                        var text2 = text.substring(text.indexOf("金币"));
                        ctx.fillText(text2, -ctx.measureText(text2).width / 2, 3 * line_height);
                    } else if (text.indexOf("奖券") > 0) {//流量包
                        var text1 = text.substring(0, text.indexOf("奖券"));
                        ctx.fillText(text1, -ctx.measureText(text1).width / 2, 1 * line_height);
                        var text2 = text.substring(text.indexOf("奖券"));
                        ctx.fillText(text2, -ctx.measureText(text2).width / 2, 3 * line_height);
                    } else if (text.indexOf("金币") == -1 && text.indexOf("奖券") == -1 && text.length > 2) {//奖品名称长度超过一定范围 
                        text = text.substring(0, 2) + "||" + text.substring(2);
                        var texts = text.split("||");
                        for (var j = 0; j < texts.length; j++) {
                            if (j == 0) {
                                ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, line_height);
                            } else {
                                ctx.fillText(texts[j], -ctx.measureText(texts[j]).width / 2, j * 3 * line_height);
                            }
                        }
                    } else {
                        //在画布上绘制填色的文本。文本的默认颜色是黑色
                        //measureText()方法返回包含一个对象，该对象包含以像素计的指定字体宽度
                        ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
                    }

                    //添加对应图标
                    if (text.indexOf("金币") > 0) {
                        var img = document.getElementById("shan-img");
                        img.onload = function () {
                            ctx.drawImage(img, -15, 35);
                        };
                        ctx.drawImage(img, -15, 35);
                    } else if (text.indexOf("奖券") >= 0) {
                        var img = document.getElementById("sorry-img");
                        img.onload = function () {
                            ctx.drawImage(img, -15, 35);
                        };
                        ctx.drawImage(img, -15, 35);
                    }
                    //把当前画布返回（调整）到上一个save()状态之前 
                    ctx.restore();
                    //----绘制奖品结束----
                }
            }
        }

        function ruleClick() {
            //$("body").append('<div id="bigform" style="left:0;right:0;top:0;bottom:0;z-index:0;background-color:rgba(151,149,149,0.2);position:fixed;" ></div>');
            $("#showResultBack").show();
            $("#ruleDiv").show();
        }

        function closeRule() {
            $("#ruleDiv").hide();
            $("#showResultBack").hide();
        }

        function checkClick() {
            var isCheck = $("#hdChecke").val() == "1";
            var singleLuckDrawScore = $("#hiddenSingleLuckDrawScore").val();
            if (isCheck) {
                $("#CheckImg").attr("src", "/images/luckdraw/luckdraw10.png");
                $("#hdChecke").val(0);
                $("#surplusSpan").hide();
                $("#consumeScore").text(singleLuckDrawScore);
                $("#surplusNum").text(0);
            } else {
                $("#CheckImg").attr("src", "/images/luckdraw/luckdraw10-1.png");
                $("#hdChecke").val(1);
                $("#surplusSpan").show();
                $("#consumeScore").text(singleLuckDrawScore * 10);
                $("#surplusNum").text(10);
            }
        }


        function changeTurnplateBg() {
            var hdTurnplate = $("#hdTurnplate").val();
            if (hdTurnplate == 0) {
                $("#turnplateDiv").attr("class", "turnplate1");
                $("#hdTurnplate").val(1);
            } else {
                $("#turnplateDiv").attr("class", "turnplate");
                $("#hdTurnplate").val(0);
            }
        }




    </script>
    <style>
    </style>
</head>
<body class="luckDrawBodyback">
    <div class="LuckWrap">
        <img src="/images/luckdraw/luckdraw13.png" id="sorry-img" style="display: none;" />
        <img src="/images/luckdraw/luckdraw14.png" id="shan-img" style="display: none;" />
        <img class="imgBg" src="/images/luckdraw/backgroundimg.png" />
        <div class="LuckPeople img100">
            <img src="/images/luckdraw/luckdraw03.png" />
        </div>
        <div class="LuckTurnplate img100">
            <img src="/images/luckdraw/turnplate-bg.png" />
            <div id="turnplateDiv" class="turnplate">
                <canvas class="item" id="wheelcanvas" width="522px" height="522px"></canvas>
                <img class="pointer" src="/images/luckdraw/turnplate-pointer.png" />
            </div>
        </div>
        <div class="LuckParameter">
            <div class="Text">
                <p class="rule"><a href="javascript:void(0);" onclick="ruleClick()" class="ruleA"><i>抽奖规则 &gt;&gt;</i></a></p>
                <ul class="ul01">
                    <li>我的金币：</li>
                    <li>
                        <input name="txtScore" type="text" id="txtScore" disabled="disabled" runat="server" class="ScoreInput" /></li>
                    <li>我的奖券：</li>
                    <li>
                        <input name="txtGold" type="text" id="txtGold" disabled="disabled" runat="server" class="ScoreInput" /></li>
                    <li style="text-align:center;">连转十次&nbsp;&nbsp;<img id="CheckImg" src="/images/luckdraw/luckdraw10.png" /><input type="hidden" value="0" id="hdChecke" /></li>
                    <li  style="text-align:center;" class="color">所需金币:<span id="consumeScore">10000</span></li>
                    <li style="display: none;text-align:center;" id="surplusSpan" class="color"><span>剩余次数:<span id="surplusNum"></span></span></li>
                </ul>
                <div class="bnt img100">
                    <a href="<%=UserWebLinks %>" target="_blank" id="gotoShop">
                        <img src="/images/luckdraw/luckdraw09.png" /></a>
                    <a href="javascript:void(0);" style="display: none;" id="gotoShop1">
                        <img src="/images/luckdraw/luckdraw09-1.png" /></a>
                </div>
                <input type="hidden" id="TokenHidden" runat="server" />
                <input type="hidden" id="UserIdHidden" runat="server" />
                <input type="hidden" id="hiddenSingleLuckDrawScore" runat="server" />
            </div>
        </div>


    </div>

</body>
</html>

<div class="ruleDiv" id="ruleDiv">
    <p class="close">
        <a href="javascript:void(0);" onclick="closeRule()">
            <img src="/images/luckdraw/X.png" />
        </a>
    </p>
    <p class="title"><i>抽奖规则</i></p>
    <p class="content">1.每次抽奖消耗<span runat="server" id="consumeSpan"></span>金币</p>
    <p class="content">2.幸运中奖结果由大盘指针所指区域为准</p>
    <p class="content">3.奖品系统会自动下发到账户</p>
</div>
<style>


</style>
<div class="showResultBack" id="showResultBack">
</div>
<div class="showResult" id="showResult">
    <div id="imgDiv" style="margin-top: 100px;">
        <img id="showResultImg" src="/images/luckdraw/luckdraw13-1.png" />
    </div>
    <div id="contentDiv" style="font-weight: 700; font-size: 30px; border-radius: 20px; color: #ffd800; margin-top: 20px;">
    </div>
</div>
