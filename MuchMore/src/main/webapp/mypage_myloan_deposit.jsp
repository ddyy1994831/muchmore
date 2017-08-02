<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	BorrowerVO borrower = (BorrowerVO)request.getAttribute("borrower");
	//월납입금액
	int monthly_pay = (Integer)request.getAttribute("monthly_pay");
	//잔액(borrower_balance)
	int balance = (Integer)request.getAttribute("balance");
	//나의 가상 계좌 잔액
	int account_virtual_balance = (Integer)request.getAttribute("account_virtual_balance");
%>

<script>
	function check_pay() {
		//입금폼에 상환할 입금금액 값
		var pay_amount = loanDepositform.deposit_amount.value;
		
		/*
			1. monthly_pay <= pay_amount : 입력한 금액이 월납입금액보다 커야 상환이 가능하다.
			2. monthly_pay >= balance : 갚아야할 잔액(balance)기 월납입금액보다 작거나 같아도 상환이 가능하다.
				ex) 월납입금액이 13만원, 갚아야할 잔액이 12만원이라면 갚아야할 금액이 월납입금액보다 작아도 상환이 가능하다.
			3. !(pay_amount > account_virtual_balance) : 입력한 금액이 가상 계좌 잔액보다 크지 않아야 상환이 된다.
			4. pay_amount <= balance : 입력한 금액은 갚아야할 금액보다 작거나 같아야 상환이 가능하다.
				ex) 갚아야할 잔액이 2만원이라면 3만원은 입금(상환)할 수 없다.
		*/
		if(((<%= monthly_pay %> <= pay_amount) || (<%= monthly_pay %> >= <%= balance %>))
				&& (!(pay_amount > <%= account_virtual_balance %>))
				&& (pay_amount <= <%= balance %>)) {
			alert(pay_amount + "원이 상환되었습니다.");
			document.loanDepositform.submit();
		}
		else {
			if(pay_amount > <%= account_virtual_balance %>) {
				alert("가상계좌 잔액 부족");
			}
			else if(pay_amount > <%= balance %>) {
				alert("상환액이 잔액보다 많습니다.");
			}
			else {
				alert("'" + <%= monthly_pay %> + "' 이상 입금하세요.");
			}
		}
	}
</script>

<section class="container">
	<div class="row" style = "height: 100%;">
		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >회원정보수정</a></li>
			</ul>
		</div>
		<div class="col-md-9" id="MyLoan">
			<div class="col-md-9 col-md-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4 class="panel-title">대출금 상환</h4>
					</div>
					<div class="panel-body" id="LoanDeposit">
						<div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>이름</th>
										<th>계좌번호</th>
									</tr>
								</thead>
								<tr>
									<td><font size="4">muchmore</font></td>
									<td><font size="4">44372837801689</font></td>
								</tr>
							</table>
						</div>
						<!-- action="mypageMyloanDepositAction.do" -->
						<form class="form-horizontal" id="loanDepositform" name="loanDepositform" method="post">
						<input type="hidden" id="borrower_id" name="borrower_id" value="<%=borrower.getBorrower_id() %>">
						<input type="hidden" id="goods_num" name="goods_num" value="<%=borrower.getGoodsVO().getGoods_num()%>">
							<fieldset>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><b>입금 금액</b></span>
											<input type="text" class="form-control" id="deposit_amount" name="deposit_amount" placeholder="만원단위">
											<fmt:formatNumber value="deposit_amount" type="currency" currencySymbol="￦" />
										<span class="input-group-btn">
											<button type="submit" class="btn btn-default">입금하기</button>
										</span>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>