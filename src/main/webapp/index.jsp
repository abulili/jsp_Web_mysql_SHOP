<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/vue.js"></script>
<!--引入BootStrap的JS的文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<style>
   body{
    margin: 0;
    padding: 0;
   }
   .lunbo{
    width:100%;
    height:720px;
    background-image: url(./image/1.png);/*背景图片*/
    background-size:100% 100%; 
   }
  </style>
</head>
<body>
	<div class="shortcut">
        <div class="wrapper">
            <!-- 因为每一个a都相同 -->
            <ul>
            	<li>
            		<%
					if(session.getAttribute("user")!=null)
					{
						String uname=(String)session.getAttribute("user");
						out.print("<a href='DoInvalidate'>欢迎"+uname + " 注销</a>");
					}
					else
					{
						out.print("<a href='login.jsp'>登录</a>");
					}
					%>
            	</li>
            	<li><a href="register.jsp">免费注册</a></li>
            	<li><a href="buycar.jsp">全部商品</a></li>
                <li><a href="selfInfo.jsp">我的淘宝</a></li>
                <li><a href="realCar.jsp">购物车</a></li>
                <li><a href="#">收藏夹</a></li>
                <li><a href="#"><span></span>联系客服</a></li>
            </ul>
        </div>
    </div>
    <div class="header wrapper">
        <div class="logo">
            <h1><a href="index.jsp">购物网站</a></h1>
        </div>
        <div class="nav">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="#">猫天</a></li>
                <li><a href="#">聚划算</a></li>
                <li><a href="#">猫超</a></li>
                <li><a href="#">司法拍卖</a></li>
                <li><a href="#">旅行</a></li>
                <li><a href="#">特卖</a></li>
            </ul>
        </div>
        <div class="search">
            <input type="text" placeholder="回车键搜索商品种类" id="input"  onkeydown="if(event.keyCode==13) dosome()" style="width:100%">
            <span></span>
            <script type="text/javascript">  
                var dosome = function(){  
                    document.location.href ='doSerach.jsp?species=' + $("#input").val();  
                    return false;
                }  
            </script> 
        </div>
        <div class="car">
            <span>0</span>
        </div>
    </div>
    <!-- banner -->
    <div class="banner">
        <div class="wrapper">
            <!-- 图 -->
            <ul>
               <li><a href="#"><img src="/study/app.jpg" alt=""></a></li>
            </ul>
            <!-- 侧导航 -->
            <div class="aside">
                <ul>
                    <li><a href="#"><span>家用电器</span></a></li>
                    <li><a href="#"><span>手机 运营商 数码</span></a></li>
                    <li><a href="#"><span>家居 家具 家装 厨具</span></a></li>
                    <li><a href="#"><span>男装 女装 童装 内衣</span></a></li>
                    <li><a href="#"><span>美妆 个护清洁 宠物</span></a></li>
                    <li><a href="#"><span>女鞋 箱包 珠宝 钟表</span></a></li>
                    <li><a href="#"><span>男鞋 运动 户外</span></a></li>
                    <li><a href="#"><span>食品 酒类 生鲜 特产</span></a></li>
                </ul>
            </div>
            <ol class="lunbo"></ol>
            <script type="text/javascript">
		    var index = 1;
		   function lunbo(){
		    index ++ ;
		    //判断number是否大于3
		    if(index > 2){
		     index = 1;
		    }
		    //获取img对象
		  var img = document.getElementsByClassName("lunbo")[0];
		  img.style.background = "url(./image/"+index+".png)";
		  img.style.backgroundSize="50% 50%"; 
		   }
		   //2.定义定时器
		   setInterval(lunbo,4000);
		  </script>
        </div>
    </div>
    
    <!-- 新鲜好物 -->
    <div class="goods wrapper">
        <!-- hd headder 头部 -->
        <div class="hd">
            <h2>新鲜好物<span>新鲜出炉 品质靠谱</span></h2>
            <a href="#">查看全部</a>
        </div>
        <div class="bd clearfix">
            <ul>
                <li>
                    <a href="#">
                        <img src="./image/吸尘.png" alt="">
                        <h3>无线吸尘器</h3>
                        <div>￥<span>8999</span></div>
                        <b>新品</b>
                    </a>
                </li>
                <li>
                	<a href="#">
                        <img src="./image/吸尘.png" alt="">
                        <h3>无线吸尘器</h3>
                        <div>￥<span>8999</span></div>
                        <b>新品</b>
                    </a>
                </li>
                <li>
                	<a href="#">
                        <img src="./image/吸尘.png" alt="">
                        <h3>无线吸尘器</h3>
                        <div>￥<span>8999</span></div>
                        <b>新品</b>
                    </a>
                </li>
                <li>
                	<a href="#">
                        <img src="./image/吸尘.png" alt="">
                        <h3>无线吸尘器</h3>
                        <div>￥<span>8999</span></div>
                        <b>新品</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 生鲜 -->
    <div class="shengxian wrapper">
        <div class="hd">
            <h2>猜你喜欢</h2>
            <a href="#" class="more">查看全部</a>
            <ul>
                <li><a href="#">超市</a></li>
                <li><a href="#">秒杀</a></li>
                <li><a href="#">家电</a></li>
                <li><a href="#">生鲜</a></li>
                <li><a href="#">会员</a></li>
                <li><a href="#">进口</a></li>
                <li><a href="#">闪购</a></li>
            </ul>
        </div>
        <div class="clearfix goods">
            <div class="left" style="float:left;">
                <a href="#"><img src="./image/leftt.png" style="width:400px;height:800px" alt=""></a>
            </div>
            <div class="right bd" style="float:left;">
            	<ul>
            		<li>
	                	<a href="#">
	                        <img src="./image/吸尘.png" alt="">
	                        <h3>无线吸尘器</h3>
	                        <div>￥<span>8999</span></div>
	                        <b>新品</b>
	                    </a>
                	</li>
                	<li>
	                	<a href="#">
	                        <img src="./image/吸尘.png" alt="">
	                        <h3>无线吸尘器</h3>
	                        <div>￥<span>8999</span></div>
	                        <b>新品</b>
	                    </a>
                	</li>
            	</ul>
            </div>
        </div>
    </div>
    <!-- 版权区域 -->
    <div class="footer">
        <div class="wrapper">
            <div class="top">
                <ul>
                    <li>
                        <!-- 通过伪元素添加标签实现精灵图 -->
                        <span>价格亲民</span>
                    </li>
                    <li>
                        <span>品类齐全</span>
                    </li>
                    <li>
                        <span>多仓直发</span>
                    </li>
                </ul>
            </div>
            <div class="bottom">
                <p>
                    <a href="#">关于我们</a> |
                    <a href="#">联系我们</a> |
                    <a href="#">联系客服</a> |
                    <a href="#">合作招商</a> |
                    <a href="#">隐私政策</a>
                </p>
                <p>copyRight @ 202020201204</p>
            </div>
        </div>
    </div>
</body>
</html>