<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}

	BorrowerVO bg = (BorrowerVO) request.getAttribute("borrower");
	int balance = (Integer) request.getAttribute("balance");
%>
<script type="text/javascript">
	function calsum(num){
		var investsum = Number(document.payform.invest_sum.value);
		
		if(num == 0){
			investsum = 0;
		}
		if(num == 10000){
			investsum = investsum + 10000;
		}
		if(num == 50000){
			investsum = investsum + 50000;
		}
		if(num == 100000){
			investsum = investsum + 100000;
		}
		if(num == 1000000){
			investsum = investsum + 1000000;
		}
		
		document.payform.invest_sum.value = investsum;
	}
</script>

<div id="content">
	<div class="container">
		<div class="row">
			<!-- ������ ��ǰ ���� -->
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div align="left">
							<div style="font-size: 20pt">���ڻ�ǰ</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th style="text-align:center">��ǰ��ȣ</th>
									<th style="text-align:center">��ǰ��</th>
									<th style="text-align:center">���</th>
									<th style="text-align:center">������ͷ�</th>
									<th style="text-align:center">����Ⱓ</th>
									<th style="text-align:center">���� ���ɱݾ�</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=bg.getGoodsVO().getGoods_num()%></td>
									<td><%=bg.getGoodsVO().getGoods_object()%></td>
									<td><%=bg.getBorrower_credit()%></td>
									<td><%=bg.getGoodsVO().getGoods_rate()%>%</td>
									<td><%=bg.getBorrower_loanperiod()%></td>
									<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() - bg.getGoodsVO().getGoods_invest() %>" type="currency" currencySymbol="��"></fmt:formatNumber></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- ������ ��ǰ ���� ��-->
			<div class="col-md-10 col-md-offset-1">
				<form name="payform" id="payform" action="invest_investResult.do" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div align="left">
								<div style="font-size: 20pt">��������</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="panel">
								<div class="panel-body">
									<div class="col-xs-6" style="font-size:12pt">�� ���ڱݾ�</div>
									<div class="col-xs-6 text-right">
										<input type="text" id="invest_sum" name="invest_sum" value="0" size="10" readOnly>�� 
									</div>
									<div class="col-xs-12">
										<div class = "center-block pull-right">									 
									 	 	<button type = "button" class = "btn btn-default" id="invest_sum_format" value="0" onclick="calsum(0);">���</button>
									 	 	<button type = "button" class = "btn btn-primary" id="invest_sum_1man" value="10000" onclick="calsum(10000);">1����</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_5man" value="50000" onclick="calsum(50000);">5����</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_10man" value="100000" onclick="calsum(100000);">10����</button>
										 	<button type = "button" class = "btn btn-primary" id="invest_sum_100man" value="1000000" onclick="calsum(1000000);">100����</button>									
										</div>
									</div>
									<div class="col-xs-12" style="font-size:12pt">					
										<div class="text-left">My�����ܾ�</div>
										<div class="text-right"><fmt:formatNumber value="<%=balance %>" type="currency" currencySymbol="��"></fmt:formatNumber></div>
									</div>							
								</div>
								
								<div class="panel-body">
									<div class = "col-xs-10">
										<h5>���� �ȳ�����</h5><br/>
										<ol type="��">
											<li>������ ����� ���� ������ ���ڻ�ǰ�̸�, ��ü �� �ε� �߻� �� �߽ɿ� ������ å���� ���մϴ�.</li>
											<li>������ �Ϸ�� ���� ��ǰ�� ���ؼ��� ��Ұ� �Ұ����մϴ�.</li>
											<li>�����ڰ� ������ ����� ���, ���ڱ��� '���� ��ġ�� ���¡��� �Աݵ˴ϴ�.</li>
										</ol>
									</div>
								</div>
							</div>
						</div>

						<input type="hidden" name="balance" value="<%=balance%>" /> 
						<input type="hidden" name="goodsVO.goods_num" value="<%=bg.getGoodsVO().getGoods_num()%>" /> 
						<input type="hidden" name="borrower_id" value="<%=bg.getBorrower_id() %>"/>
						<input type="hidden" name="member_id" value="<%=session.getAttribute("id")%>" />
						<input type="hidden" name="goodsVO.goods_sum" value="<%=bg.getGoodsVO().getGoods_sum() %>"/>
						<input type="hidden" name="goodsVO.goods_invest" value="<%=bg.getGoodsVO().getGoods_invest() %>"/>

						<div class="panel-footer" align="center">
							<button type="button" class="btn btn-default" onclick="history.go(-1);">�ڷ�</button>							
							<button type="submit" class="btn btn-primary">�����ϱ�</button>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
