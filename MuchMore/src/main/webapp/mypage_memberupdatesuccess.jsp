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
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a	href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate">ȸ����������</a></li>
			</ul>
		</div>

		<!-- page ���� -->
		
				<!-- ./col-sm-3 -->

				<div class="col-sm-9">
					<div class="col-sm-9 col-sm-offset-1">
						<form class="form-signin" action="home.do" method="post" name="check_pw">
							<fieldset>
								<h4 class="form-signin-heading">ȸ�������� �����Ǿ����ϴ�.</h4>
								<br /> <br /> <br /> <br /> <br /> <br />
								<button class="btn btn-primary btn-lg" type="submit">������������ ���ư���</button>
							</fieldset>
						</form>
					</div>
				</div>

				<!-- ./col-sm-9 -->
			
		<!-- ./page ���� -->
	</div>
</section>