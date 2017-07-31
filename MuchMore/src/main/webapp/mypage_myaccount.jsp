<%@page import="com.spring.muchmore.member.MemberVO"%>
<%@page import="com.spring.muchmore.moneyinout.MoneyinoutVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String msg = (String)request.getAttribute("msg");
	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	
	MemberVO member = (MemberVO)request.getAttribute("getmember");	
	List<MoneyinoutVO> moneyinout_list = (List<MoneyinoutVO>)request.getAttribute("moneyinoutlist");
	
%>

<section class = "container">
	<div class = "row" style = "height: 100%;">
		<div class = "col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypage_myaccount.do" id="MyAccount" >My Account</a></li>
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >회원정보수정</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
   		
   		<div class = "col-sm-9" id="Context">
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">입금하기</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th>이름</th>
	      							<th>계좌번호</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	    						<tr>
	      							<td><font size = "5"><%=member.getMember_name() %></font></td>
	      							<td><font size = "5"><%=member.getAccount().getAccount_virtual()%></font></td>
	      						</tr>
	      					</tbody>
	      				</table>
      				</div>
      				<div class = "col-md-8 text-right">
      					<br/>
						<font size = "5"><b>잔액</b></font>
					</div>
  						
					<div class = "col-md-4 text-right">
						<br/>
						<font size = "5">
						<b><%=member.getAccount().getAccount_balance() %>만원</b>
						<br/><br/>
						</font>
   					</div>	
    				
    				<form action = "mypage_myaccount_deposit_input.do" method = "post" name = "depositform" id = "depositform">
    					<input type = "hidden" name = "member_id" value = "<%=member.getMember_id()%>">
    					<input type = "hidden" name = "accountVO.account_virtual" value = "<%=member.getAccount().getAccount_virtual() %>">
    					<div class ="col-md-6 col-md-offset-3 text-center"> 
    						<input type = "submit" class="btn btn-primary" value = "입금하기">
    					</div>
    				</form>
  				</div>
			</div>
			
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">출금하기</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th class = "text-right">가상계좌 잔액</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	    						<tr align = "right">
	      							<td><font size = "5"><%=member.getAccount().getAccount_balance() %>만원</font></td>
	      						</tr>
	      					</tbody>
	      				</table>
      				</div>
      				<br/><br/>
      				
      				<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th>계좌번호</th>
	      							<th>이름</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	    						<tr>
	    							<%
	    							if(member.getAccount().getAccount_real() == null) {
	    							%>
	    							<td><a href = "mypage_myaccount_withdraw_register_real_account.do"
	    									 class = "btn btn-primary">계좌등록</a></td>
	    							<%	
	    							}
	    							
	    							else {
	    							%>
	    							<td><font size = "5"><%=member.getAccount().getAccount_real()%></font></td>
	    							<%
	    							}
	    							%>
	      							<td><font size = "5"><%=member.getMember_name()%></font></td>
	      						</tr>
	      					</tbody>
	      				</table>
      				</div>
      				
    				<form action = "mypage_myaccount_withdraw_input.do" method = "post" name = "depositform" id = "depositform">
    					<input type = "hidden" name = "member_id" value = "<%=member.getMember_id() %>">
    					<input type = "hidden" name = "accountVO.account_virtual" value = "<%=member.getAccount().getAccount_virtual() %>">
    					<div class ="col-md-6 col-md-offset-3 text-center"> 
    						<%
	    					if(member.getAccount().getAccount_real() == null) {
	    					%>
	    						<button type = "submit" class = "btn btn-primary" value = "출금하기" disabled>출금하기</button>
	    					<%
	    					}
    						
	    					else {
	    					%>
    						<input type = "submit" class="btn btn-primary" value = "출금하기">
    						<%
	    					}
    						%>
    					</div>
    				</form>
  				</div>
			</div>
			
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">입출금내역</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	    							<th>날짜</th>
	      							<th>예금주</th>
	      							<th>입금자명</th>
	      							<th>금액</th>
	      							<th>입/출금</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	  						<%
	  						if(moneyinout_list.size() == 0) {
	  						%>
	  							<tr>
	  								<td colspan = "5" align = "center">입출금 내역이 없습니다.</td>
	  							</tr>
	  						<%
	  						}
	  						
	  						else {
	  							for(int i = 0; i < moneyinout_list.size(); i++) {
	  								MoneyinoutVO mv = (MoneyinoutVO)moneyinout_list.get(i);
	  						%>
	  							<tr>
	      							<td><%=mv.getMoneyinout_date() %></td>
	      							<td><%=mv.getMoneyinout_holder_id() %></td>
	      							<td><%=mv.getMoneyinout_payer_id() %></td>
	      							<td><%=mv.getMoneyinout_money()%></td>
	      							<td><%=mv.getMoneyinout_state() %></td>
	      	
	      						</tr>
	  						<%
	  							}
	  						}
	  						%>
	      					</tbody>
	      				</table>
      				</div>
  				</div>
			</div>
		</div>
		<!-- ./col-sm-9 -->
	</div>
</section>