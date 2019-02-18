// svg
// @font-face {
//   font-family: 'iconfont';
//   src: url('iconfont.eot');
//   src: url('iconfont.eot?#iefix') format('embedded-opentype'),
//       url('iconfont.woff2') format('woff2'),
//       url('iconfont.woff') format('woff'),
//       url('iconfont.ttf') format('truetype'),
//       url('iconfont.svg#iconfont') format('svg');
// }
$(function(){
	//首页显示用户名
	if(sessionStorage.getItem('uname')){
		$('#zdd_a').html(' ')
		$('.icon #uname').html('欢迎您 '+sessionStorage.getItem('uname'))
	}else{
		$('#usercenter>ul').css('opacity','0')
	}
	//鼠标移入显示用户中心,登出按钮
	$('#usercenter').hover(function(){
		$('#usercenter').children(':last-child').css('display','block')
	},function(){
		$('#usercenter').children(':last-child').css('display','none')
	})
	$('li>a.prevent').click(function(){
		sessionStorage.setItem('uname','');
		location.reload();
	})
	// $('#usercenter').mouseenter(function(){
	// 	$('#usercenter').children(':last-child').css('display','block')
	// })
	// $('#usercenter').mouseleave(function(){
	// 	$('#usercenter').children(':last-child').css('display','none')
	// })
	//购物车
	$(function(){
		$(".icon-btn").click(function(){
			$(".buycar").addClass("on");
			$(".Mask").addClass("on");
		})
		$(".Mask").click(function(){
			$(".buycar").removeClass("on");
			$(".Mask").removeClass("on");
			$(".html").css("overflow","auto");
		})
	})

	// 搜索
	$(function(){
		$(".search_btn").click(function(){
			$(".dhl").css("display","none");
			$("header").css("height","80px");
			$("#search").css("display","block");
			event.stopPropagation();
		})
	})
	$(function(){
		$("section").click(function(){
			$("#search").css("display","none");
		})
		$("header").click(function(){
			$("#search").css("display","none");
		})
		$("#search").click(function(event){
			event.stopPropagation();
			$("#search").css("display","block");
		})

	})

	//导航栏展开
	$(document).ready(function(e) {
		$("#fewer").click(function(e) {
			if( $(".dhl").hasClass("show") ){
				$("#search").css("display","none");
				$(".dhl").hide().removeClass("show");
								$("header").css("height","80px");
			}else{
				// 显示
				$(".dhl").show().addClass("show");
				$("header").css("height","315px");
			}
		});
	});
})