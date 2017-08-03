<%@page import="com.spring.muchmore.invest.InvestVO"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	
	request.setCharacterEncoding("euc-kr");
	
	String id = null;	
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	List<BorrowerVO> invest_list = (List<BorrowerVO>)request.getAttribute("invest_list");
	List<InvestVO> id_invest_list = (List<InvestVO>)request.getAttribute("id_invest_list");
%>
<link href="./resources/css/bootstrap-tablefilter.css" rel="stylesheet">


<div class="container">
	<div class="row" style="min-height:80%">
		<section class="content">
			<h1>투자상품 리스트</h1>			
					<div class="panel-body">						
						<div class="table-container">
							<table class="table table-filter text-center">								
									<tr>
										<th style="text-align:center"></th>
										<th style="text-align:center">상품번호</th>
										<th style="text-align:center">상품명</th>
										<th style="text-align:center">등급</th>
										<th style="text-align:center">예상수익률</th>
										<th style="text-align:center">투자기간</th>										
										<th style="text-align:center">모집율</th>
										<th style="text-align:center">진행상태</th>
										<th style="text-align:center">투자하기</th>
									</tr>														
									<%							
  									for(int i = 0; i < invest_list.size(); i++) {
  										BorrowerVO bg = (BorrowerVO)invest_list.get(i);
  										//서류 미제출이면 건너뛰기 == 서류 미제출이면 goods_status가 null인 상태임
  										if(bg.getGoodsVO().getGoods_status() == null)
  											continue;
  										double percent = ((float)bg.getGoodsVO().getGoods_invest() / (float)bg.getGoodsVO().getGoods_sum()) * 100;  										
  									%>
									<tr>
																		
										<!-- 상품명에 따른 이미지 배치 -->
										<% if(bg.getGoodsVO().getGoods_object().equals("생활비")){ %>
										<td><img src="./resources/image/living.jpg"	class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("저축/투자")){ %>
										<td><img src="./resources/image/invest.jpg"	class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("사업")){ %>
										<td><img src="./resources/image/business.jpg" class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("학자금")){ %>
										<td><img src="./resources/image/school.jpg" class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("기타")){ %>
										<td><img src="./resources/image/else.jpg" class="media-photo"/></td>
										<%} %>
										<!-- 상품명에 따른 이미지 배치 끝-->
										
										<td width="3%">제 <%=bg.getGoodsVO().getGoods_num() %>호</td>										
										<td><h5 class="title"><a href = "invest_detail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num()%>&borrower_registerdate=<%=bg.getBorrower_registerdate()%>"><%=bg.getGoodsVO().getGoods_object() %></a></h5></td>
										<td><%=bg.getBorrower_credit() %></td>
										<td width="9%"><%=bg.getGoodsVO().getGoods_rate() %>%</td>
										<td><%=bg.getBorrower_loanperiod() %></td>
										<td width="15%">
											<div class="progress progress-striped active"
												style="padding-top: 5px; height: 20px; width: 200px; margin: 0;">
												<div class="progress-bar" style="width:<%=percent%>%;" onmouseover="현재 <%=bg.getGoodsVO().getGoods_sum()%>원 중 <%=bg.getGoodsVO().getGoods_invest()%>원 모집완료"></div>
											</div>
										</td>
										<td><%=bg.getGoodsVO().getGoods_status() %></td>
										<% //비회원이거나 투자가 모집완료인 경우
										if ( id == null || bg.getGoodsVO().getGoods_status().equals("모집완료")) {
										%>
										<td><input type="button" class="btn btn-primary btn-xs" value="투자하기" disabled></td>
										<%
										} //로그인 한 상태이고 모집 완료 상태가 아니면
				      					else {
				      						//현재 로그인한 회원이 투자한 상품이 아니면				      						
				      						int j = 0;
				      						for(j = 0; j < id_invest_list.size(); j++) {
				      							//로그인한 회원의 투자 리스트에 현재 상품이 있으면 disabled
				      							if(id_invest_list.get(j).getGoodsVO().getGoods_num() == bg.getGoodsVO().getGoods_num())
				      								continue;
				      						}
				      						//j == id_invest_list.size() : 투자한 상품이 없어서 for문을 다 탐. : 정상 투자버튼
				      						if(j == id_invest_list.size()) {
				      					%>
				      						<td><a href = "invest_investform.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-primary btn-xs">투자하기</a></td>
				      					<%
				      						}      					
				      						//이미 투자한 상품이 존재 : disabled
				      						else {
				      					%>
				      						<td><button class="btn btn-primary btn-xs" disabled>투자하기</button></td>
				      					<%
				      						}
				      							
				      					}
				      					%>				      					
				    				</tr>
									<%				  						
				  					}
				  					%>															
								
							</table>
						</div>
									
			</div>
		</section>		
	</div>
</div>
