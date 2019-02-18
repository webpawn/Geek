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
    if(location.search.indexOf("kwords")!=-1){
		// 加入购物车后首页的购物车跳出显示
		$(".buycar").addClass("on");
		//?kwords=雷蛇（Razer）曼巴眼镜蛇无线版%20游戏鼠标
		var kwords=decodeURI(location.search.split('=')[1]);
		console.log(kwords);
		$.ajax({
			url:"http://127.0.0.1:3000/Cdetails",
			type:"get",
			data:{kwords},
			dataType:"json",
			success:function(output){
				console.log(output);
				console.log(output[0].title);
				console.log(output[0].price);
				console.log(output[0].sm);
				var html="";
				var a=2;
				var name1=sessionStorage.getItem("name1");
				var name1=Number(name1);
					html+=`<div class="row">
					<div id="bcp" class="col-3">
						<img src="${output[0].sm}">
					</div>
					<div class="col-7">
						<a href=""><span>${output[0].pname}</span></a>
						<span>x</span>
						<select name="" id="select">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</div>
					<div class="col-2" id="select1">
						
					</div>
				</div>
				<div class="price row">
					<div class="col-6">
						<p>小计：</p>
						<p>运费：</p>
						<p>总计：</p>
					</div>
					<div class="col-6" id="select2">
						<p>￥${output[0].price}元</p>
						<p>￥8元</p>
						<p>￥${output[0].price+8}元</p>
					</div>
				</div>
				<div>
				<center><button class="btn btn-dark" id="jiesuan">进行结算</button></center>
				<br>
				<center><button class="btn btn-dark" id="tuichu">退出</button></center>
				</div>`
				// 点击退出按钮隐藏购物车栏
				$("#p11").html(html);
				$("#tuichu").click(function(){
					$(".buycar").removeClass("on");
					$(".Mask").removeClass("on");
				})
				// 购物车计算方法
				$("#select").change(function(){
					var n=1;
					var n=$("#select").children('option:selected').text();
					$("#select").children('option:selected').text=n;
					$("#select1>span").html(output[0].price*n);
					$("#select2 p:first-child").html("￥"+output[0].price*n+"元");
					$("#select2 p:nth-child(3)").html("￥"+(output[0].price*n+8)+"元");
				});

				$("#jiesuan").click(function(){
					alert("已结算"+($("#select2 p:nth-child(3)").html()))
					location.href="index.html";
				})
			}
		})
	}
})

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