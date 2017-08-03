<%@page import="com.spring.muchmore.moneyinout.MoneyinoutVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	List<MoneyinoutVO> theWholeList = (List<MoneyinoutVO>)request.getAttribute("theWholeList");
%>

<script>
function myFunction() {
	var input, filter, table, tr, td, i;
	
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable");
	tr = table.getElementsByTagName("tr");

	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
		
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}       
	}
}
</script>


<section class="container">
	<div class="row" style = "min-height:80%;">
		<div class="span12">
			<div class="col-md-10 col-md-offset-1">
			
			<legend><b>����ݳ���</b></legend>
			
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;
			<input type="text" id="myInput" onkeyup="myFunction()" placeholder="�˻�� �Է��ϼ���">
		
			<table id="myTable" class="table table-striped table-condensed table-hover ">
				<thead>
					<tr>
						<th style="text-align: center">��¥</th>
						<th style="text-align: center">�Ա�/���</th>
						<th style="text-align: center">holder</th>
						<th style="text-align: center">other</th>
						<th style="text-align: center">�ݾ�</th>
					</tr>
				</thead>
				<tbody>
					<%
						if(theWholeList != null) {
					%>
					<%
								for(int i=0; i<theWholeList.size(); i++) {
									MoneyinoutVO moneyinoutVO = (MoneyinoutVO)theWholeList.get(i);
					%>
									<tr>
										<td align="center"><%=moneyinoutVO.getMoneyinout_date() %></td>
										<td align="center"><%=moneyinoutVO.getMoneyinout_state() %></td>
										<td align="center"><%=moneyinoutVO.getMoneyinout_holder_id() %></td>
										<td align="center"><%=moneyinoutVO.getMoneyinout_other_id() %></td>
										<td align="center"><%=moneyinoutVO.getMoneyinout_money() %></td>
									</tr>
					<%
								}
						}
						else {
					%>
								<tr>
									<td colspan="5" align="center">��/��� ������ �����ϴ�</td>
								</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</section>