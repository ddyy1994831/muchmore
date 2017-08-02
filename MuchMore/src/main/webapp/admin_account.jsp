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

	List<MoneyinoutVO> moneyinout_list = (List<MoneyinoutVO>)request.getAttribute("moneyinout_list");
%>

<!-- 2017-08-01 다예 : AX5UI grid 사용을 위한 설정 -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>

<!-- 2017-08-01 다예 : gird 스크립트 -->
<script>
//<![DCATA
	var moneyGrid = null;
	
	$(function() {
		//Grid 객체 생성
		moneyGrid = new ax5.ui.grid();

		//Grid 설정 지정
		moneyGrid.setConfig({
			target: $('[data-ax5grid = "money-grid"]'),
			showLineNumber: true,
			showRowSelector: false,
//			multipleSelect: false,
			lineNumberColumnWidth: 40,
//			rowSelectorColumnWidth: 27,
			
			columns: [
				{key: "date", label: "날짜", align: "center", editor: {type: "date"}},
	            {key: "type", label: "구분", align: "center",
					editor: {
						type: "select", config: {
							columnKeys: {
								optionValue: "CD", optionText: "NM"
							},
							options: [
								{CD: "입금", NM: "입금: 입금"},
								{CD: "출금", NM: "출금: 출금"}
							]
						},
						disabled: function() {
							//활성화 여부를 item.complete의 값으로 런타임 판단
							return this.item.complete == "true";
						}
					}
				},
				{key: "holder", label: "출금자", align: "center", editor: {type: "text"}},
				{key: "other", label: "입금자", align: "center", editor: {type: "text"}},
				{key: "price", label: "금액", align: "center", editor: {type: "money"}}
			],
			page: {
				navigationItemCount: 9,
				height: 30,
				display: true,
				firstIcon: '<i class="fa fa-step-backward" aria-hidden="true"></i>',
				prevIcon: '<i class="fa fa-caret-left" aria-hidden="true"></i>',
				nextIcon: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
				lastIcon: '<i class="fa fa-step-forward" aria-hidden="true"></i>',
				onChange: function() {
					search(this.page.selectPage);
				}
			},
		});
	});
	
	function search(_pageNo) {
		if($('#SearchForm').attr("method") == "POST") {
			searchPost(_pageNo);
		}
	}
	
	function searchPost(_pageNo) {
 		$('#page').val(_pageNo||0);
		var sendData = JSON.stringify({date: $('#moneyinout_date').val(), type: $('#moneyinout_state').val(), page: $('#page').val()});
		console.log(sendData); 

		$.ajax({
			type: "POST",
			url: "/searchPost.do",
			data: sendData,
			dataType: "xml",
			contentType: "application/json; charset=UTF-8",
			async: false,
			success: function(xml) {
				moneyGrid.setData({
					list: data.list,
					page: {
						currentPage: _pageNo,
						pageSize: 10,
						totalElements: data.total,
						totalPage: data.totalPages
					}
				});
			},
			error : function() {
				alert('통신실패!!');
			}
		});
	}
	
	function searchType(method) {
		$('#SearchForm').attr("method", method)
		console.log($('SearchForm').attr("method"));
		search(0);
	}
//]]>
</script>

<section class="container">
	<div class="row" style="height:100%">
 		<form id="SearchForm" name="SearchForm" method="GET" style="display:inline;">
		<input type="hidden" id="page" name="page" value="" />
		<label for="type">구분</label>
		<select id="type" name="type">
			<option value="">전체 </option>
			<option value="입금">입금 </option>
			<option value="출금">출금 </option>
		</select>
		</form>
		&nbsp;&nbsp;
		<button onclick="searchType('POST');">조회</button>
		<br> 
		<div data-ax5grid="money-grid" data-ax5grid-config="{}" style="height:300px;"></div>
	</div>
</section>