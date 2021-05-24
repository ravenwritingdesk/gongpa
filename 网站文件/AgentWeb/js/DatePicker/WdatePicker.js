/*
 * My97 DatePicker 4.6
 * SITE: http://dp.my97.net
 * BLOG: http://my97.cnblogs.com
 * MAIL: smallcarrot@163.com
 */
var $dp,WdatePicker;(function(){var _={
$wdate:true,
$dpPath:"",
$crossFrame:true,
doubleCalendar:false,
position:{},
lang:"zh-cn",
skin:"default",
dateFmt:"yyyy-MM-dd HH:mm:ss",
realDateFmt:"yyyy-MM-dd",
realTimeFmt:"HH:mm:ss",
realFullFmt:"%Date %Time",
minDate:"1900-01-01 00:00:00",
maxDate:"2099-12-31 23:59:59",
startDate:"",
alwaysUseStartDate:false,
yearOffset:1911,
firstDayOfWeek:0,
isShowWeek:false,
highLineWeekDay:true,
isShowClear:true,
isShowToday:true,
isShowOthers:true,
readOnly:false,
errDealMode:0,
autoPickDate:null,
qsEnabled:true,

specialDates: null, specialDays: null, disabledDates: null, disabledDays: null, opposite: false, onpicking: null, onpicked: null, onclearing: null, oncleared: null, ychanging: null, ychanged: null, Mchanging: null, Mchanged: null, dchanging: null, dchanged: null, Hchanging: null, Hchanged: null, mchanging: null, mchanged: null, schanging: null, schanged: null, eCont: null, vel: null, errMsg: "", quickSel: [], has: {}
}; WdatePicker = U; var X = window, O = "document", J = "documentElement", C = "getElementsByTagName", V, A, T, I, b; switch (navigator.appName) { case "Microsoft Internet Explorer": T = true; break; case "Opera": b = true; break; default: I = true; break } A = L(); if (_.$wdate) M(A + "skin/WdatePicker.css"); V = X; if (_.$crossFrame) { try { while (V.parent[O] != V[O] && V.parent[O][C]("frameset").length == 0) V = V.parent } catch (P) { } } if (!V.$dp) V.$dp = { ff: I, ie: T, opera: b, el: null, win: X, status: 0, defMinDate: _.minDate, defMaxDate: _.maxDate, flatCfgs: [] }; B(); if ($dp.status == 0) Z(X, function() { U(null, true) }); if (!X[O].docMD) { E(X[O], "onmousedown", D); X[O].docMD = true } if (!V[O].docMD) { E(V[O], "onmousedown", D); V[O].docMD = true } E(X, "onunload", function() { if ($dp.dd) Q($dp.dd, "none") }); function B() { V.$dp = V.$dp || {}; obj = { $: function($) { return (typeof $ == "string") ? this.win[O].getElementById($) : $ }, $D: function($, _) { return this.$DV(this.$($).value, _) }, $DV: function(_, $) { if (_ != "") { this.dt = $dp.cal.splitDate(_, $dp.cal.dateFmt); if ($) for (var A in $) { if (this.dt[A] === undefined) this.errMsg = "invalid property:" + A; this.dt[A] += $[A] } if (this.dt.refresh()) return this.dt } return "" }, show: function() { Q(this.dd, "block") }, hide: function() { Q(this.dd, "none") }, attachEvent: E }; for (var $ in obj) V.$dp[$] = obj[$]; $dp = V.$dp } function E(A, $, _) { if (T) A.attachEvent($, _); else { var B = $.replace(/on/, ""); _._ieEmuEventHandler = function($) { return _($) }; A.addEventListener(B, _._ieEmuEventHandler, false) } } function L() { var _, A, $ = X[O][C]("script"); for (var B = 0; B < $.length; B++) { _ = $[B].src.substring(0, $[B].src.toLowerCase().indexOf("wdatepicker.js")); A = _.lastIndexOf("/"); if (A > 0) _ = _.substring(0, A + 1); if (_) break } return _ } function F(F) { var E, C; if (F.substring(0, 1) != "/" && F.indexOf("://") == -1) { E = V.location.href; C = location.href; if (E.indexOf("?") > -1) E = E.substring(0, E.indexOf("?")); if (C.indexOf("?") > -1) C = C.substring(0, C.indexOf("?")); var G, I, $ = "", D = "", A = "", J, H, B = ""; for (J = 0; J < Math.max(E.length, C.length); J++) { G = E.charAt(J).toLowerCase(); I = C.charAt(J).toLowerCase(); if (G == I) { if (G == "/") H = J } else { $ = E.substring(H + 1, E.length); $ = $.substring(0, $.lastIndexOf("/")); D = C.substring(H + 1, C.length); D = D.substring(0, D.lastIndexOf("/")); break } } if ($ != "") for (J = 0; J < $.split("/").length; J++) B += "../"; if (D != "") B += D + "/"; F = E.substring(0, E.lastIndexOf("/") + 1) + B + F } _.$dpPath = F } function M(A, $, B) { var D = X[O][C]("HEAD").item(0), _ = X[O].createElement("link"); if (D) { _.href = A; _.rel = "stylesheet"; _.type = "text/css"; if ($) _.title = $; if (B) _.charset = B; D.appendChild(_) } } function Z($, _) { E($, "onload", _) } function G($) { $ = $ || V; var A = 0, _ = 0; while ($ != V) { var D = $.parent[O][C]("iframe"); for (var F = 0; F < D.length; F++) { try { if (D[F].contentWindow == $) { var E = W(D[F]); A += E.left; _ += E.top; break } } catch (B) { } } $ = $.parent } return { "leftM": A, "topM": _} } function W(E) { if (T) return E.getBoundingClientRect(); else { var A = { ROOT_TAG: /^body|html$/i, OP_SCROLL: /^(?:inline|table-row)$/i }, G = null, _ = E.offsetTop, F = E.offsetLeft, D = E.offsetWidth, B = E.offsetHeight, C = E.offsetParent; if (C != E) while (C) { F += C.offsetLeft; _ += C.offsetTop; if (C.tagName.toLowerCase() == "body") G = C.ownerDocument.defaultView; C = C.offsetParent } C = E.parentNode; while (C.tagName && !A.ROOT_TAG.test(C.tagName)) { if (C.scrollTop || C.scrollLeft) if (!A.OP_SCROLL.test(Q(C))) if (!b || C.style.overflow !== "visible") { F -= C.scrollLeft; _ -= C.scrollTop } C = C.parentNode } var $ = a(G); F -= $.left; _ -= $.top; D += F; B += _; return { "left": F, "top": _, "right": D, "bottom": B} } } function N($) { $ = $ || V; var _ = $[O]; _ = _[J] && _[J].clientHeight && _[J].clientHeight <= _.body.clientHeight ? _[J] : _.body; return { "width": _.clientWidth, "height": _.clientHeight} } function a($) { $ = $ || V; var B = $[O], A = B[J], _ = B.body; B = (A && A.scrollTop != null && (A.scrollTop > _.scrollLeft || A.scrollLeft > _.scrollLeft)) ? A : _; return { "top": B.scrollTop, "left": B.scrollLeft} } function D($) { src = $ ? ($.srcElement || $.target) : null; if ($dp && $dp.cal && !$dp.eCont && $dp.dd && Q($dp.dd) == "block" && src != $dp.el) $dp.cal.close() } function Y() { $dp.status = 2; H() } function H() { if ($dp.flatCfgs.length > 0) { var $ = $dp.flatCfgs.shift(); $.el = { innerHTML: "" }; $.autoPickDate = true; $.qsEnabled = false; K($) } } var R, $; function U(E, _) { $dp.win = X; B(); E = E || {}; if (_) { if (!D()) { $ = $ || setInterval(function() { if (V[O].readyState == "complete") clearInterval($); U(null, true) }, 50); return } if ($dp.status == 0) { $dp.status = 1; K({ el: { innerHTML: ""} }, true) } else return } else if (E.eCont) { E.eCont = $dp.$(E.eCont); $dp.flatCfgs.push(E); if ($dp.status == 2) H() } else { if ($dp.status == 0) { U(null, true); return } if ($dp.status != 2) return; var C = A(); if (C) { $dp.srcEl = C.srcElement || C.target; C.cancelBubble = true } E.el = $dp.$(E.el || $dp.srcEl); if (!E.el || E.el.disabled || (E.el == $dp.el && Q($dp.dd) != "none" && $dp.dd.style.left != "-1970px")) return; K(E) } function D() { if (T && V != X && V[O].readyState != "complete") return false; return true } function A() { if (I) { func = A.caller; while (func != null) { var $ = func.arguments[0]; if ($ && ($ + "").indexOf("Event") >= 0) return $; func = func.caller } return null } return event } } function S(_, $) { return _.currentStyle ? _.currentStyle[$] : document.defaultView.getComputedStyle(_, false)[$] } function Q(_, $) { if (_) if ($ != null) _.style.display = $; else return S(_, "display") } function K(H, $) { for (var D in _) if (D.substring(0, 1) != "$") $dp[D] = _[D]; for (D in H) if ($dp[D] !== undefined) $dp[D] = H[D]; var E = $dp.el ? $dp.el.nodeName : "INPUT"; if ($ || $dp.eCont || new RegExp(/input|textarea|div|span|p|a/ig).test(E)) $dp.elProp = E == "INPUT" ? "value" : "innerHTML"; else return; if ($dp.lang == "auto") $dp.lang = T ? navigator.browserLanguage.toLowerCase() : navigator.language.toLowerCase(); if (!$dp.dd || $dp.eCont || ($dp.lang && $dp.realLang && $dp.realLang.name != $dp.lang && $dp.getLangIndex && $dp.getLangIndex($dp.lang) >= 0)) { if ($dp.dd && !$dp.eCont) V[O].body.removeChild($dp.dd); if (_.$dpPath == "") F(A); var B = "<iframe src=\"" + _.$dpPath + "My97DatePicker.htm\" frameborder=\"0\" border=\"0\" scrolling=\"no\"></iframe>"; if ($dp.eCont) { $dp.eCont.innerHTML = B; Z($dp.eCont.childNodes[0], Y) } else { $dp.dd = V[O].createElement("DIV"); $dp.dd.style.cssText = "position:absolute;z-index:197000"; $dp.dd.innerHTML = B; V[O].body.insertBefore($dp.dd, V[O].body.firstChild); Z($dp.dd.childNodes[0], Y); if ($) $dp.dd.style.left = $dp.dd.style.top = "-1970px"; else { $dp.show(); C() } } } else if ($dp.cal) { $dp.show(); $dp.cal.init(); if (!$dp.eCont) C() } function C() { var F = $dp.position.left, B = $dp.position.top, C = $dp.el; if (C != $dp.srcEl && (Q(C) == "none" || C.type == "hidden")) C = $dp.srcEl; var H = W(C), $ = G(X), D = N(V), A = a(V), E = $dp.dd.offsetHeight, _ = $dp.dd.offsetWidth; if (isNaN(B)) { if (B == "above" || (B != "under" && (($.topM + H.bottom + E > D.height) && ($.topM + H.top - E > 0)))) B = A.top + $.topM + H.top - E - 3; else B = A.top + $.topM + H.bottom; B += T ? -1 : 1 } else B += A.top + $.topM; if (isNaN(F)) F = A.left + Math.min($.leftM + H.left, D.width - _ - 5) - (T ? 2 : 0); else F += A.left + $.leftM; $dp.dd.style.top = B + "px"; $dp.dd.style.left = F + "px" } } 
})()

/*
参数说明
wdate bool true 是否自动引入Wdate类 设置为true时,可直接在引入WdatePicker.js的页面里使用 class="Wdate" 
Wdate可在skin目录下的WdatePicker.css文件中定义
建议使用默认值 
$dpPath string '' 是否显示指定程序包的绝对位置,一般情况下为空即可(程序自动创建),该属性是为防止极其少数的情况下程序创建出错而设置的 

设置方法:
如果,程序包所在http中的地址为 http://localhost/proName/My97DatePicker/
则 $dpPath = '/proName/My97DatePicker/';
建议使用默认值 
可配置属性:可以在WdatePicker方法是配置 
el Element 或 String null 指定一个控件或控件的ID,必须具有value或innerHTML属性(如input,textarea,span,div,p等标签都可以),用户存储日期显示值(也就是dateFmt格式化后的值) 
vel Element 或 String null 指定一个控件或控件的ID,必须具有value属性(如input),用于存储真实值(也就是realDateFmt和realTimeFmt格式化后的值) 
position object {} 日期选择框显示位置 
注意:坐标默认单位是px,是相对当前框架坐标(不受滚动条),left属性只接受数字,top属性除接受数字外还可以接受 'above' 上方显示, 'under' 下方显示, 'auto' 系统根据页面大小自动选择(默认)
如:
{left:100,top:50}表示固定坐标[100,50]
{top:50}表示横坐标自动生成,纵坐标指定为 50
{left:100}表示纵坐标自动生成,横坐标指定为 100
{top:'above'}表示上方显示
{top:'under'}表示下方显示
请参考示例 
lang string 'auto' 当值为'auto'时 自动根据客户端浏览器的语言自动选择语言
当值为 其他 时 从langList中选择对应的语言 
你可以参考语言配置 
skin string 'default' 皮肤名称 默认自带 default和whyGreen两个皮肤 


另外如果你的css够强的话,可以自己做皮肤
你可以参考皮肤配置 
dateFmt string 'yyyy-MM-dd' 日期显示格式
你可以参考自定义格式 
realDateFmt string 'yyyy-MM-dd' 计算机可识别的,真正的日期格式
无效日期设置(disabledDates),最大日期(maxDate),最小日期(minDate)以及快速日期都必须与它们相匹配
建议使用默认值 
realTimeFmt string 'HH:mm:ss' 
realFullFmt string '%Date %Time' 
minDate string '1900-01-01 00:00:00' 最小日期(注意要与上面的real日期相匹配) 
maxDate string '2099-12-31 23:59:59' 最大日期(注意要与上面的real日期相匹配) 
startDate string '' 起始日期,既点击日期框时显示的起始日期 为空时,使用今天作为起始日期(默认值)
否则使用传入的日期作为起始日期(注意要与上面的real日期相匹配)
你可以参考起始日期示例 
isShowWeek bool false 是否显示周
你可以参考周显示示例 
highLineWeekDay bool true 是否高亮显示 周六 周日 
isShowClear bool true 是否显示清空按钮 
isShowToday bool true 是否显示今天按钮 
isShowOthers bool true 为true时,第一行空白处显示上月的日期，末行空白处显示下月的日期,否则不显示 
readOnly bool false 是否只读 
errDealMode int 0 纠错模式设置 可设置3中模式 0 - 提示 1 - 自动纠错 2 - 标记 
autoPickDate bool null 为false时 点日期的时候不自动输入,而是要通过确定才能输入 
为true时 即点击日期即可返回日期值
为null时(推荐使用) 如果有时间置为false 否则置为true 
qsEnabled bool true 是否启用快速选择功能 
quickSel Array null 快速选择数据,可以传入5个快速选择日期
注意:日期格式必须与 realDateFmt realTimeFmt realFullFmt 相匹配
你可以参考快速选择示例 
disabledDays Array null 可以使用此功能禁用周日至周六所对应的日期
0至6 分别代表 周日至周六
你可以参考无效天示例 
disabledDates Array null 可以使用此功能禁用所指定的一个或多个日期 

你可以参考无效日期示例 
opposite bool false 默认为false, 为true时,无效天和无效日期变成有效天和有效日期 
你可以参考有效天与有效日期示例 
onpicking function null 此四个参数为事件参数
你可以参考自定义事件示例 
onpicked function null 
onclearing function null 
oncleared function null 
*/