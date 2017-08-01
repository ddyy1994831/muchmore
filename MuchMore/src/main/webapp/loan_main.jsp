<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	int borrower_cnt = (Integer)request.getAttribute("borrower_cnt");
	String msg = null;
	if(borrower_cnt != 0) {
		msg = (String)request.getAttribute("msg");	
	}
	
%>

<script>
   function enter_check() {
      if (<%=borrower_cnt%> == 0) {
         return location.href = 'loanCreditCheck.do';
      } 
      else {
         alert("이미 대출 중입니다.");
         return false;
      }
   }
</script>

<script>
	function enter(){
		if(id == null) {
			alert("로그인을 먼저 해주세요");
			return;
		}
    			
		else
			location.href='loanCreditCheck.do';
	}
</script>
<section class = "container">
	<div class = "row">
    	<!-- 대출 메인 페이지 -->
	    <div class="jumbotron text-center">
			<h1>머치모어 대출 신청</h1>
			<p>지금 바로 대출금 한도를 확인해보세요!</p> 
		</div>
	
	  	<div class="row">
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
    					<h3 class="panel-title">MuchMore만의 장점1</h3>
  					</div>
  					<div class="panel-body">
  						<font size = "3">
    						<b>2,3 금융 10%대 금리를 이겨내다<br/><br/>
							P2P 사이트 중 최저 금리 보장</b><br/><br/>
						</font>
  					</div>
				</div>
			</div>
		
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
  						<h3 class="panel-title">MuchMore만의 장점2</h3>
					</div>
					<div class="panel-body text-center">
						<font size = "3">
  							<b>최소한의 정보만 입력하면 된다</b><br/><br/>
							<b>필요없는 정보는 과감히 뺏다</b><br/><br/>
						</font>
					</div>
				</div>
			</div>
			
			<div class="col-sm-4 text-center">
				<div class="panel panel-primary">
					<div class="panel-heading">
   						<h3 class="panel-title">MuchMore만의 장점3</h3>
					</div>
					<div class="panel-body text-center">
						<font size = "3">
  							<b>이미 수많은 투자자를 확보하였다!</b><br/><br/>
							<b>빠르게 대출금을 받을 수 있다!</b><br/><br/>
						</font>
					</div>
				</div>
			</div>
		</div>
	
		<!--  대출, 한도 버튼 -->
		<div class = "text-center">
			<br/><br/>
		<%
    	if(id != null) {
    		//상환완료하지 않은 회원
    		if( borrower_cnt != 0) {
    	%>
    			<button type="button" class="btn btn-primary btn-lg" disabled>대출/한도 확인하기</button>
    			<br/><br/>
    			<div class="text-center text-danger" style="font-size: 13pt;padding-top:25px;padding-bottom:50px">
					<strong><%=msg%></strong>
				</div>
				
    			
    	<%
    		}
    		
    		//상환 완료 한 회원 or 대출 서비스 이용이 처음인 회원
    		else {
    	%>
    			<button type="button" class="btn btn-primary btn-lg" onclick="enter_check()">대출/한도 확인하기</button>
    			
    	<%
    		}
		}
	
		else{
		%>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='login.do'">로그인 페이지로 이동</button>
		<%
		} 
		%>
    	
		</div>
	</div>
</section>

