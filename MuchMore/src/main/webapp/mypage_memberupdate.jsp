<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	System.out.println("mypage_memberupdate.jsp");
	
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
%>
<section class="container">
	<div class="row" style="height:100%">
		<div class="col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount">MyAccount</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a	href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate">회원정보수정</a></li>
			</ul>
		</div>

		<section class="col-md-6">
			<div class="col-sm-9">
				<form name="check_pw" class="form-signin" action="mypage_memberupdateform.do" method="post">
					<fieldset>
						<h4 class="form-signin-heading">비밀번호 확인</h4>
						<label for="member_password" class="sr-only">패스워드</label> 
							<input type="password" id="member_pw1" name="member_pw1" 
							class="form-control" placeholder="비밀번호" required><br/><br/>
						<button class="btn btn-primary btn-lg" type="submit">확인</button>
					</fieldset>
				</form>
			</div>
		</section>
		
	</div>
</section>