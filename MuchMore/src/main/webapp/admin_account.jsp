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

	List<MoneyinoutVO> theWholeList = (List<MoneyinoutVO>)request.getAttribute("moneyinout_list");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>

<script>
(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _input;

		function _onInputEvent(e) {
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter);
				});
			});
		}

		function _filter(row) {
			var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('light-table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});

})(document);
</script>


<section class="container">
	<div class="row" style = "min-height:80%;">
		<div class="span12">
			<div class="col-md-10 col-md-offset-1">
			
			<legend><b>입출금내역</b></legend>
			
			<i class="fa fa-search" aria-hidden="true"></i>&nbsp;
			<input type="text" class="light-table-filter" data-table="table" placeholder="검색어를 입력하세요" />
		
			<table class="table table-striped table-condensed table-hover ">
				<thead>
						<tr>
							<th style="text-align: center">날짜</th>
							<th style="text-align: center">입금/출금</th>
							<th style="text-align: center">holder</th>
							<th style="text-align: center">other</th>
							<th style="text-align: center">금액</th>
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
					%>
					</tbody>
					<tfoot>
								<tr>
									<td align="center" colspan="5">
										<ul class="pagination pagination-sm">
										<%
											if(nowpage <= 1) {
										%>
												<li class="disabled"><a href="#">&laquo;</a></li>
										<%
											}
											else { 
										%>
												<li><a href="adminAccount.do?page=<%=nowpage-1 %>">&laquo;</a></li>
										<%
											}
										
											for(int a=startpage; a<=endpage; a++) {
												//현재 보고 있는 페이지는 링크를 걸 필요가 없다.
												if(a == nowpage) {
										%>
													<li class="active"><a href="#"><%=a %></a></li>
										<%
												}
												else {
										%>
													<li><a href="adminAccount.do?page=<%=a %>"><%=a %></a></li>
										<%
												}
											}
											
											if(nowpage >= maxpage) {
										%>
												<li class="disabled"><a href="#">&raquo;</a></li>
										<%
											}
											else {
										%>
												<li><a href="adminAccount.do?page=<%=nowpage+1%>">&raquo;</a></li>
										<%
											}
										%>
									</ul>
								</td>
							</tr>
						</tfoot>
					<%
						}
						else {
					%>
						<tbody>
								<tr>
									<td colspan="5" align="center">입/출금 내역이 없습니다</td>
								</tr>
						</tbody>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
</section>