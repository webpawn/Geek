$(function(){

$(".newlist li>h3").click(function(){
	$(".newlist li h3").css({"background":"#F2F2F2","color":"#333"});
	$(".newlist li .list").removeClass("on");
	$(this).next().addClass("on");
	$(this).css({"background":"#000","color":"#fff"});
})

/*登录注册*/
// 注册验证
$('.registe #userName').blur(function(){
	var reg=/^\w{6,15}$/;
	if(!reg.test($('#userName').val())){
		$('#userName').css('margin-bottom','0').next().css('display','block').html('用户名为6~15位英文或数字')
	}else{
		$.post('http://127.0.0.1:3000/user/registe',{uname:$('.registe #userName').val()},function(result){$('#userName').css('margin-bottom','0').next().css('display','block').html(result.msg)})
	}
})
$('.registe #userPwd').blur(function(){
	var reg=/^\w{6,15}$/;
	if(!reg.test($('#userPwd').val())){
		$('#userPwd').css('margin-bottom','0').next().css('display','block').html('用户密码为6~15位英文或数字')
	}else{
		$('#userPwd').css('margin-bottom','5%').next().css('display','none')
	}
})
$('.registe #userPwd2').blur(function(){
	var pwd1=$('.registe #userPwd').val()
	var pwd2=$('.registe #userPwd2').val()
	if(pwd2!=pwd1){
		$('#userPwd2').css('margin-bottom','0').next().css('display','block').html('两次输入密码不一致')
	}else{
		$('#userPwd2').css('margin-bottom','5%').next().css('display','none')
	}
})
$('.registe #userPhone').blur(function(){
	var reg=/^1[3-8]\d{9}$/;
	if(!reg.test($('#userPhone').val())){
		$('#userPhone').css('margin-bottom','0').next().css('display','block').html('请输入正确的手机号码')
	}else{
		$('#userPhone').css('margin-bottom','5%').next().css('display','none')
	}
})

$('.registe form>.sum').click(function(){
	if(!($('#userName').val()&&$('#userPwd').val()&&$('#userPwd2').val()&&$('#userPhone').val())){
		alert('请输入必填信息')
	}else if($('#userName').next().html()=='用户名已存在'){
		alert('该用户名已被注册,请使用其他用户名');
		return;
	}else{
		$.post(
		'http://127.0.0.1:3000/user/register',
		{uname:$('.registe #userName').val(),upwd:$('.registe #userPwd').val(),phone:$('.registe #userPhone').val()},
		function(){
			$(".Substitute").addClass("on");
			$(".loadbox").addClass("on");
			setTimeout(function(){
				location.href='http://127.0.0.1:3000/land.html'
			},2000)}
		)
	}
})
//登录验证
$(".Land form>.submi").click(function(){
	if(!($('#userName').val()&&$('#userPwd').val())){
		alert('请输入必填信息')
	}else{
		$.post(
		'http://127.0.0.1:3000/user/login',
		{uname:$('.Land #userName').val(),upwd:$('.Land #userPwd').val()},
		function(result){
			if(result.code==301){
				$('.Land #submi').css('margin-bottom','0').next().css('display','block').html('用户名或密码错误')
			}else if(result.code==200){
				$(".Substitute").addClass("on");
				$(".loadbox").addClass("on");
				sessionStorage.setItem('uid',result.uid);
				sessionStorage.setItem('uname',`${$('.Land #userName').val()}`)
				setTimeout(function(result){
					location.href='http://127.0.0.1:3000/index.html'
				},2000)
			}
		}
		)
	}
})

$(".Cdtlist li>h3").click(function(){
	$(".Cdtlist li h3").css({"background":"#F2F2F2","color":"#555"});
	$(".Cdtlist li .Ctdnewlist").removeClass("on");
	$(this).next().addClass("on");
	$(this).css({"background":"#000","color":"#fff"});
})
	var wh=$(window).height();
			$(window).scroll(function(){
			var s=wh-$(window).scrollTop();
			if(s<250){
			 $(".Towat").addClass("on");
			}else{
			 $(".Towat").removeClass("on");
			}
	});
	
	var wk=$(window).height();
			$(window).scroll(function(){
			var k=wk-$(window).scrollTop();
			if(k<200){
			 $(".mtop").addClass("on");
			}else{
			 $(".mtop").removeClass("on");
			}
	});
			
})