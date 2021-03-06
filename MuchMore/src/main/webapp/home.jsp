<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}

%>
<!-- animation CSS -->
<link rel="stylesheet" href="http://cdn.bootcss.com/animate.css/3.5.1/animate.min.css">
<link rel="stylesheet" href="./resources/css/animate.min.css">
<script>
(function( $ ) {

    //Function to animate slider captions 
	function doAnimations( elems ) {
		//Cache the animationend event in a variable
		var animEndEv = 'webkitAnimationEnd animationend';
		
		elems.each(function () {
			var $this = $(this),
				$animationType = $this.data('animation');
			$this.addClass($animationType).one(animEndEv, function () {
				$this.removeClass($animationType);
			});
		});
	}
	
	//Variables on page load 
	var $myCarousel = $('#carousel-example-generic'),
		$firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");
		
	//Initialize carousel 
	$myCarousel.carousel();
	
	//Animate captions in first slide on page load 
	doAnimations($firstAnimatingElems);
	
	//Pause carousel  
	$myCarousel.carousel('pause');	
	
	//Other slides to be animated on carousel slide event 
	$myCarousel.on('slide.bs.carousel', function (e) {
		var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
		doAnimations($animatingElems);
	});  
    $('#carousel-example-generic').carousel({
        interval:3000,
        pause: "false"
    });
	
})(jQuery);	
</script>
<body style="width:100%; height:500px; padding-top:64px;">
<div id="first-slider">
    <div id="carousel-example-generic" class="carousel slide carousel-fade">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <!-- <li data-target="#carousel-example-generic" data-slide-to="3"></li> -->
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <!-- Item 1 -->
            <div class="item active slide1">
                <div class="row"><div class="container">               	
                    <div class="col-md-6" style="left:150px; top:150px">  
                    	<a class = "btn btn-default" data-animation="animated bounceInDown" href="FAQ.do">자주하는 질문</a>
                    	<a class = "btn btn-primary" data-animation="animated bounceInUp" href="invest.do">투자상품 확인하기</a>
                    </div>               
                </div></div>
             </div> 
            <!-- Item 2 -->
            <div class="item slide2">
                <div class="row"><div class="container">
                    <div class="col-md-6" style="left:150px; top:150px">  
                    	<a class = "btn btn-default" data-animation="animated bounceInDown" href="FAQ.do">자주하는 질문</a>
                    	<a class = "btn btn-primary" data-animation="animated bounceInUp" href="loan.do">금리/한도 조회하기</a>
                    </div>
                </div></div>
            </div>
            <!-- Item 3 -->
            <div class="item slide3">
                <div class="row"><div class="container">
                    <div class="col-md-6" style="left:150px; top:150px">  
                    	<a class = "btn btn-default" data-animation="animated bounceInDown" href="FAQ.do">자주하는 질문</a>
                    	<a class = "btn btn-primary" data-animation="animated bounceInUp" href="join.do">회원가입하기</a>
                    </div>     
                </div></div>
            </div>
            <!-- Item 4 -->
           <!--  <div class="item slide4">
                <div class="row"><div class="container">
                    <div class="col-md-7 text-left">
                        <h3 data-animation="animated bounceInDown">We are creative</h3>
                        <h4 data-animation="animated bounceInUp">Get start your next awesome project</h4>
                     </div>
                    <div class="col-md-5 text-right">
                        <img style="max-width: 200px;"  data-animation="animated zoomInLeft" src="http://s20.postimg.org/9vf8xngel/internet_speed.png">
                    </div>  
                </div></div>
            </div> -->
            <!-- End Item 4 -->
    
        </div>
        <!-- End Wrapper for slides-->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <i class="fa fa-angle-left"></i><span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <i class="fa fa-angle-right"></i><span class="sr-only">Next</span>
        </a>
    </div>
</div>
</body>

<section class = "container" style="min-height:80%">
	<div class = "row" style = "padding-top:50px">
		<div class="col-md-4 text-center">
			<img class="img-circle" src="./resources/image/main_circle1.png">
			<h4>국내 1등 P2P금융 플랫폼</h4>
			<p>항상 고객을 생각하는 마음으로 1등을 지키겠습니다.</p>
			<p><a class="btn btn-default" href="join.do">JOIN US</a></p>
    	</div>
	    <div class="col-md-4 text-center">
			<img class="img-circle" src="./resources/image/main_circle2.png">
			<h4>국내 최대 대출규모</h4>
			<p>500만 이상의 대출규모를 자랑하는 머치모아</p>
			<p><a class="btn btn-default" href="loan.do">CHECK YOUR CREDIT</a></p>
	    </div>
	    <div class="col-md-4 text-center">
			<img class="img-circle" src="./resources/image/main_circle3.png">
			<h4>국내 최고 투자수익률</h4>
			<p>운영 비용 최소화로 고객의 투자수익을 극대화하겠습니다.</p>
			<p><a class="btn btn-default" href="invest.do">LET'S INVEST</a></p>
		</div>
	</div>
	
	<div class = "row" style = "padding-top:50px; padding-bottom:100px;">
		<div class = "text-center">
			<img src="./resources/image/muchmore_logo.png" align = "middle">
			<br/><br/><br/>
			<h4>머치모아는</h4><br/>
			<h5>기대보다 높은 서비스를</h5>
			<h5>기대보다 높은 수익을</h5>
			<h5>기대보다 높은 만족감을 드리기 위해 노력합니다.</h5><br/>
			<p>Much more than you expected.</p>
		</div>
	</div>
	
</section> 
    
   