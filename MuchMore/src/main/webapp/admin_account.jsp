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

<!-- 2017-08-01 �ٿ� : AX5UI grid ����� ���� ���� -->
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>

<!-- 2017-08-01 �ٿ� : gird ��ũ��Ʈ -->
<script>
//<![DCATA
	var moneyGrid = null;
	
	$(function() {
		//Grid ��ü ����
		moneyGrid = new ax5.ui.grid();

		//Grid ���� ����
		moneyGrid.setConfig({
			target: $('[data-ax5grid = "money-grid"]'),
			showLineNumber: true,
			showRowSelector: false,
//			multipleSelect: false,
			lineNumberColumnWidth: 40,
//			rowSelectorColumnWidth: 27,
			
			columns: [
				{key: "date", label: "��¥", align: "center", editor: {type: "date"}},
	            {key: "type", label: "����", align: "center",
					editor: {
						type: "select", config: {
							columnKeys: {
								optionValue: "CD", optionText: "NM"
							},
							options: [
								{CD: "�Ա�", NM: "�Ա�: �Ա�"},
								{CD: "���", NM: "���: ���"}
							]
						},
						disabled: function() {
							//Ȱ��ȭ ���θ� item.complete�� ������ ��Ÿ�� �Ǵ�
							return this.item.complete == "true";
						}
					}
				},
				{key: "holder", label: "�����", align: "center", editor: {type: "text"}},
				{key: "other", label: "�Ա���", align: "center", editor: {type: "text"}},
				{key: "price", label: "�ݾ�", align: "center", editor: {type: "money"}}
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
				alert('��Ž���!!');
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
		<label for="type">����</label>
		<select id="type" name="type">
			<option value="">��ü </option>
			<option value="�Ա�">�Ա� </option>
			<option value="���">��� </option>
		</select>
		</form>
		&nbsp;&nbsp;
		<button onclick="searchType('POST');">��ȸ</button>
		<br> 
		<div data-ax5grid="money-grid" data-ax5grid-config="{}" style="height:300px;"></div>
	</div>
</section>