<%@page import="com.spring.muchmore.invest.InvestVO"%>
<%@page import="com.spring.muchmore.member.MemberVO"%>
<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;	
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");		
	}
	
	//상품정보와 대출자 정보
	BorrowerVO bg = (BorrowerVO)request.getAttribute("borrowergoods");
	//한 상품에 대한 총 투자금액
	int total_invest = (Integer)request.getAttribute("total_invest");
	//대출자정보
	MemberVO member = (MemberVO)request.getAttribute("borrower_info");	
	//모집율
	double invest_status =  (double)total_invest / bg.getGoodsVO().getGoods_sum() * 100;
	//대출 횟수
	int borrowerCount = (Integer) request.getAttribute("borrowerCount");
	//투자 횟수
	int investCount = (Integer) request.getAttribute("investCount");
	//사용자가 투자한 목록
	List<InvestVO> id_invest_list = (List<InvestVO>)request.getAttribute("id_invest_list");
	
%>

<section class="container">
	<form name="invest_detail" action="invest_investform.do" method="post">
		<input type="hidden" name="borrower_id" value="<%=bg.getBorrower_id() %>">
		<input type="hidden" name="goodsVO.goods_num" value="<%=bg.getGoodsVO().getGoods_num()%>"> 		
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<!-- 상품명에 따른 이미지 배치 -->						
						<% if(bg.getGoodsVO().getGoods_object().equals("생활비")){ %>
						<img src="./resources/image/living.jpg"	class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("저축/투자")){ %>
						<img src="./resources/image/invest.jpg"	class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("사업")){ %>
						<img src="./resources/image/business.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("학자금")){ %>
						<img src="./resources/image/school.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("기타")){ %>
						<img src="./resources/image/else.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%} %>						
					<!-- 상품명에 따른 이미지 배치 끝-->
					</div>
					<div class="panel-body">				
						<div class="col-sm-4 col-sm-offset-4" style="padding-top:10px">
							<div class="text-center"><h6>제 <%=bg.getGoodsVO().getGoods_num() %>호</h6></div>
							<div class="text-center"><h5><strong><%=bg.getGoodsVO().getGoods_object() %></strong></h5></div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th style="text-align:center">등급</th>
									<th style="text-align:center">예상수입률</th>
									<th style="text-align:center">대출기간</th>
									<th style="text-align:center">대출금액</th>
									<th style="text-align:center">모집율</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=bg.getBorrower_credit() %></td>
									<td><%=bg.getGoodsVO().getGoods_rate() %>%</td>
									<td><%=bg.getBorrower_loanperiod() %></td>
									<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="￦"></fmt:formatNumber></td>
									<td><%=invest_status %>%</td>
								</tr>
							</tbody>
						</table>

						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">대출자 기본정보</div>
								<div class="panel-body">
									<div class="col-xs-6">성별</div>
									<div class="col-xs-6 text-right">
										<%=member.getMember_gender() %>
									</div>
									<div class="col-xs-6">나이</div>
									<div class="col-xs-6 text-right">
										<%=member.getMember_age() %>
									</div>
									<div class="col-xs-6">&nbsp;</div>
									<div class="col-xs-6 text-right">&nbsp;</div>
									<div class="col-xs-6">&nbsp;</div>
									<div class="col-xs-6 text-right">&nbsp;</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">소득정보</div>
								<div class="panel-body">
									<div class="col-xs-6">연소득</div>
									<div class="col-xs-6 text-right">
										<fmt:formatNumber value="<%=bg.getBorrower_totalincome() %>" type="currency" currencySymbol="￦"></fmt:formatNumber>
									</div>
									<div class="col-xs-6">직업구분</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobbiz() %>
									</div>
									<div class="col-xs-6">직업명</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobname() %>
									</div>
									<div class="col-xs-6">재직기간</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobperiod() %>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">머치모아 이용 내역</div>
								<div class="panel-body">
									<div class="col-xs-6">대출횟수</div>
									<div class="col-xs-6 text-right"><%=borrowerCount%></div>
									<div class="col-xs-6">투자횟수</div>
									<div class="col-xs-6 text-right"><%=investCount%></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">대출정보</div>
								<div class="panel-body">
									<div class="col-xs-6">대출금리</div>
									<div class="col-xs-6 text-right"><%=bg.getBorrower_rate()%>%</div>
									<div class="col-xs-6">대출한도금액</div>
									<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=bg.getBorrower_limit()%>" type="currency" currencySymbol="￦"></fmt:formatNumber></div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">투자자 보호</div>
								<div class="panel-body">
									<p>머치모아대부(주)는 채권자로서 투자자의 자산 보호에 최선을 다하며, 연체 발생일로부터 10 영업일
										후에는 전문추심기관에 위임하여 추심을 진행하고 있습니다.&nbsp; 연체 발생 후 60일이 경과하여 기한이익이
										상실한 경우 소송, 압류(예금, 급여, 부동산 등) 경매 등 법적절차를 진행합니다.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer" align="center">
						<button type="button" class="btn btn-default"
							onclick="history.go(-1);">뒤로</button>
						<%
							if ( id == null || bg.getGoodsVO().getGoods_status().equals("모집완료")) {
						%>
						<button type="submit" class="btn btn-primary" disabled>투자하기</button>
						<%
							} //로그인 한 상태이고 모집 완료 상태가 아니면
	      					else {
	      						//현재 로그인한 회원이 투자한 상품이 아니면				      						
	      						int j = 0;
	      						for(j = 0; j < id_invest_list.size(); j++) {
	      							//로그인한 회원의 투자 리스트에 현재 상품이 있으면 disabled
	      							if(id_invest_list.get(j).getGoodsVO().getGoods_num() == bg.getGoodsVO().getGoods_num())
	      								break;
	      						}
	      						//j == id_invest_list.size() : 투자한 상품이 없어서 for문을 다 탐. : 정상 투자버튼
	      						if(j == id_invest_list.size()) {
	      				%>	      				
						<button type="submit" class="btn btn-primary">투자하기</button>
						<%
				      		}      					
				      		//이미 투자한 상품이 존재 : disabled
				      		else {
				      	%>
				      	<button type="submit" class="btn btn-primary" disabled>투자하기</button>
				      	<%
				   			}				      							
				      	}
				      	%>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>

