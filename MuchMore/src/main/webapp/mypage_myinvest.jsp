<%@page import="java.util.List"%>
<%@page import="com.spring.muchmore.invest.InvestVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	} 

	List<InvestVO> invest_list = (List<InvestVO>) request.getAttribute("invest_list");
%>


<section class="container">
	<div class="row" style="height:100%">
		<div class="col-sm-3" id="menu">
			<ul class="nav nav-pills nav-stacked">
				<li class=""><a href="mypageMyaccount.do" id="MyAccount">MyAccount</a></li>
				<li class=""><a href="mypage_myinvest.do">투자내역</a></li>
				<li class=""><a href="mypage_myloan.do">대출내역</a></li>
				<li class=""><a href="mypage_memberupdate.do" id="MyUpdate">회원정보수정</a></li>
			</ul>
		</div>
		<!-- ./col-sm-3 -->

		<div class="col-sm-9" id="MyInvest">
			<div>
				<fieldset>
					<legend><b>투자내역</b></legend>
					<div class="form-group">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>투자상품명</th>
									<th>투자날짜</th>
									<th>투자금액</th>
									<th>투자수익률</th>
									<th>투자상태</th>
								</tr>
								<%	if(invest_list.size() != 0) {
									for (int i = 0; i < invest_list.size(); i++) {
										InvestVO invest = invest_list.get(i);									
								%>
								<tr>
									<td><%=invest.getGoodsVO().getGoods_object()%></td>
									<td><%=invest.getInvest_date()%></td>
									<td><%=invest.getInvest_sum()%></td>
									<td><%=invest.getGoodsVO().getGoods_rate()%></td>
									<td><%=invest.getGoodsVO().getGoods_status()%></td>
								</tr>
								<%
									}
										} else {
								%>
								<tr>
									<td colspan=5 align=center>투자한 내역이 없습니다.</td>

								</tr>
								<%
										}				
								%>
							</tbody>
						</table>
					</div>

				</fieldset>
			</div>
		</div>
		<!-- ./col-sm-9 -->
	</div>
</section>
<!-- ./page 내용 -->