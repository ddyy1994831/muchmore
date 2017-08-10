<%@page import="com.spring.muchmore.moneyinout.MoneyinoutVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	List<MoneyinoutVO> theWholeList = (List<MoneyinoutVO>)request.getAttribute("moneyinout_list");
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
										<td align="center"><%=moneyinoutVO.getMoneyinout_other_id() %></td>
										<td align="center"><fmt:formatNumber value="<%=moneyinoutVO.getMoneyinout_money() %>" type="currency" currencySymbol="￦" /></td>
									</tr>
					<%
								}
						}
						else {
					%>
								<tr>
									<td colspan="5" align="center">입/출금 내역이 없습니다</td>
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