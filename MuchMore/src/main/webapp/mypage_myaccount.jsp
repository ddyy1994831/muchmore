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
				<li class=""><a href="mypage_myinvest.do" id="MyInvest">���ڳ���</a></li>
				<li class=""><a href="mypage_myloan.do" id="MyLoan">���⳻��</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate" >ȸ����������</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->
   		
   		<div class = "col-sm-9" id="Context">
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">�Ա��ϱ�</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th>�̸�</th>
	      							<th>���¹�ȣ</th>
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
						<font size = "5"><b>�ܾ�</b></font>
					</div>
  						
					<div class = "col-md-4 text-right">
						<br/>
						<font size = "5">
						<b><%=member.getAccount().getAccount_balance() %>����</b>
						<br/><br/>
						</font>
   					</div>	
    				
    				<form action = "mypage_myaccount_deposit_input.do" method = "post" name = "depositform" id = "depositform">
    					<input type = "hidden" name = "member_id" value = "<%=member.getMember_id()%>">
    					<input type = "hidden" name = "accountVO.account_virtual" value = "<%=member.getAccount().getAccount_virtual() %>">
    					<div class ="col-md-6 col-md-offset-3 text-center"> 
    						<input type = "submit" class="btn btn-primary" value = "�Ա��ϱ�">
    					</div>
    				</form>
  				</div>
			</div>
			
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">����ϱ�</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th class = "text-right">������� �ܾ�</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	    						<tr align = "right">
	      							<td><font size = "5"><%=member.getAccount().getAccount_balance() %>����</font></td>
	      						</tr>
	      					</tbody>
	      				</table>
      				</div>
      				<br/><br/>
      				
      				<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	      							<th>���¹�ȣ</th>
	      							<th>�̸�</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	    						<tr>
	    							<%
	    							if(member.getAccount().getAccount_real() == null) {
	    							%>
	    							<td><a href = "mypage_myaccount_withdraw_register_real_account.do"
	    									 class = "btn btn-primary">���µ��</a></td>
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
	    						<button type = "submit" class = "btn btn-primary" value = "����ϱ�" disabled>����ϱ�</button>
	    					<%
	    					}
    						
	    					else {
	    					%>
    						<input type = "submit" class="btn btn-primary" value = "����ϱ�">
    						<%
	    					}
    						%>
    					</div>
    				</form>
  				</div>
			</div>
			
			<div class = "panel panel-primary">
				<div class = "panel-heading">
					<h3 class = "panel-title">����ݳ���</h3>
				</div>
				<div class="panel-body">
   					<div>
	    				<table class="table table-striped table-hover ">
	  						<thead>
	    						<tr>
	    							<th>��¥</th>
	      							<th>������</th>
	      							<th>�Ա��ڸ�</th>
	      							<th>�ݾ�</th>
	      							<th>��/���</th>
	    						</tr>
	  						</thead>
	  						<tbody>
	  						<%
	  						if(moneyinout_list.size() == 0) {
	  						%>
	  							<tr>
	  								<td colspan = "5" align = "center">����� ������ �����ϴ�.</td>
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