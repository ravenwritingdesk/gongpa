$(document).ready(function(){
	$(".Js_btn").bind({
		mouseover:function(){$(this).attr("id","menu-hover");},  
		mouseout:function(){$(this).attr("id","");}  
	});
	//简单弹窗
	$(".js_popup").click(function(){$(".js_tip").show();$(".popup-mask").show();});
	$(".js_close").click(function(){$(".js_tip").hide();$(".popup-mask").hide();});
	$(".pass-button-submit").click(function(){$(".popup-login").hide();$(".popup-mask").hide();});
	
	$(".js_o_del").click(function(){$(".js_Selected").show();$(".js_o_del").hide();});
	$(".js_c_Cancel").click(function(){$(".js_Selected").hide();$(".js_o_del").show();});
	
	$(".js_o_01").click(function(){$(".js_tip01").toggle();});
	$(".js_o_011").click(function(){$(".js_tip011").toggle();});
	$(".js_o_012").click(function(){$(".js_tip012").toggle();$(".popup-mask").toggle();});
	$(".js_o_02").click(function(){$(".js_tip02").toggle();});
	$(".js_o_03").click(function(){$(".js_tip03").toggle();});
	$(".js_o_04").click(function(){$(".js_tip04").toggle();});
	$(".js_o_99").click(function(){$(".js_tip99").toggle();});
	//遮罩弹窗
	$(".mypop").click(function(){$(".popup-login").show();$(".popup-mask").show();});
	$(".js_close").click(function(){$(".popup-login").hide();$(".popup-mask").hide();});
	$(".pass-button-submit").click(function(){$(".popup-login").hide();$(".popup-mask").hide();});
	//收缩
	$(".js_to_01").click(function(){$(".js_box01").slideToggle();});
});

//选项卡
;(function($){
	$.fn.extend({
		Tabs:function(options){
			// 处理参数
			options = $.extend({
				event : 'mouseover',
				timeout : 0,
				auto : 0,
				callback : null
			}, options);
			
			var self = $(this),
				tabBox = self.children( 'div.tab_box' ).children( 'div' ),
				menu = self.children( 'ul.tab_menu' ),
				items = menu.find( 'li' ),
				timer;
				
			var tabHandle = function( elem ){
					elem.siblings( 'li' )
						.removeClass( 'cur' )
						.end()
						.addClass( 'cur' );
						
					tabBox.siblings( 'div' )
						.addClass( 'none' )
						.end()
						.eq( elem.index() )
						.removeClass( 'none' );
				},
					
				delay = function( elem, time ){
					time ? setTimeout(function(){ tabHandle( elem ); }, time) : tabHandle( elem );
				},
				
				start = function(){
					if( !options.auto ) return;
					timer = setInterval( autoRun, options.auto );
				},
				
				autoRun = function(){
					var current = menu.find( 'li.cur' ),
						firstItem = items.eq(0),
						len = items.length,
						index = current.index() + 1,
						item = index === len ? firstItem : current.next( 'li' ),
						i = index === len ? 0 : index;
					
					current.removeClass( 'cur' );
					item.addClass( 'cur' );
					
					tabBox.siblings( 'div' )
						.addClass( 'none' )
						.end()
						.eq(i)
						.removeClass( 'none' );
				};
							
			items.bind( options.event, function(){
				delay( $(this), options.timeout );
				if( options.callback ){
					options.callback( self );
				}
			});
			
			if( options.auto ){
				start();
				self.hover(function(){
					clearInterval( timer );
					timer = undefined;
				},function(){
					start();
				});
			}
			
			return this;
		}
	});
})(jQuery);