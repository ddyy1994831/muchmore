<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
%>

<%-- <script>
   function enter_check() {
      if (<%=borrower_cnt%> == 0) {
         return location.href = 'loan_input.do';
      } 
      else {
         alert("이미 대출 중입니다.");
         return false;
      }
   }
</script>
 --%>
<section class = "container">
	<div class = "row" style = "height: 80%;">
    	<!-- 대출 메인 페이지 -->
	    <div class="jumbotron text-center">
			<h1>머치모어 대출 신청</h1>
			<p>지금 바로 대출금 한도를 확인해보세요!</p> 
		</div>
	
		<div>
	  		<div class="row">
				<div class="col-sm-4">
					<h3>머치모어만의 장점 1!</h3>
					<p>2,3 금융 10%대 금리를 이겨내다</p>
					<p>P2P 사이트 중 최저 금리 보장</p>
				</div>
				
				<div class="col-sm-4">
					<h3>머치모어만의 장점 2!</h3>
					<p>최소한의 정보만 입력하면 된다</p>
					<p>필요없는 정보는 과감히 뺏다</p>
				</div>
			
				<div class="col-sm-4">
					<h3>머치모어만의 장점 3!</h3> 
					<p>이미 수많은 투자자를 확보하였다!</p>
					<p>빠르게 대출금을 받을 수 있다!</p>
				</div>
				
				
				<!--  대출, 한도 버튼 -->
				<%
	    		if(id != null) {
	    		%>
	    		<div>
					<br/><br/>	
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="enter_check()">대출/한도 확인하기</button>
				</div>
				<%
				}
		
				else{
				%>
				<div>
					<br/><br/>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='login.do'">로그인 페이지로 이동</button>
				</div>
				<%
				} 
				%>
		  	</div>
		</div>
    	
	    <script>
    		function enter(){
    			if(id == null) {
    				alert("로그인을 먼저 해주세요");
    				return;
    			}
    			
    			else
    				location.href='loan_input.do';
    		}
    	</script>
	</div>
</section>

