<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
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

		<!-- page 내용 -->
		
				<!-- ./col-sm-3 -->

				<div class="col-sm-9">
					<div class="col-sm-9 col-sm-offset-1">
						<form class="form-signin" action="home.do" method="post" name="check_pw">
							<fieldset>
								<h4 class="form-signin-heading">회원정보가 수정되었습니다.</h4>
								<br /> <br /> <br /> <br /> <br /> <br />
								<button class="btn btn-primary btn-lg" type="submit">메인페이지로 돌아가기</button>
							</fieldset>
						</form>
					</div>
				</div>

				<!-- ./col-sm-9 -->
			
		<!-- ./page 내용 -->
	</div>
</section>