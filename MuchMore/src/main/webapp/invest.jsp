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
	<div class="row" style="height:100%">
		<section class="content">
			<h1>���ڻ�ǰ ����Ʈ</h1>			
					<div class="panel-body">						
						<div class="table-container">
							<table class="table table-filter text-center">								
									<tr>
										<th style="text-align:center"></th>
										<th style="text-align:center">��ǰ��ȣ</th>
										<th style="text-align:center">��ǰ��</th>
										<th style="text-align:center">���</th>
										<th style="text-align:center">������ͷ�</th>
										<th style="text-align:center">���ڱⰣ</th>										
										<th style="text-align:center">������</th>
										<th style="text-align:center">�������</th>
										<th style="text-align:center">�����ϱ�</th>
									</tr>														
									<%							
  									for(int i = 0; i < invest_list.size(); i++) {
  										BorrowerVO bg = (BorrowerVO)invest_list.get(i);
  										//���� �������̸� �ǳʶٱ� == ���� �������̸� goods_status�� null�� ������
  										if(bg.getGoodsVO().getGoods_status() == null)
  											continue;
  										double percent = ((float)bg.getGoodsVO().getGoods_invest() / (float)bg.getGoodsVO().getGoods_sum()) * 100;  										
  									%>
									<tr>
																		
										<!-- ��ǰ�� ���� �̹��� ��ġ -->
										<% if(bg.getGoodsVO().getGoods_object().equals("��Ȱ��")){ %>
										<td><img src="./resources/image/living.jpg"	class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("����/����")){ %>
										<td><img src="./resources/image/invest.jpg"	class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("���")){ %>
										<td><img src="./resources/image/business.jpg" class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("���ڱ�")){ %>
										<td><img src="./resources/image/school.jpg" class="media-photo"/></td>
										<%}if(bg.getGoodsVO().getGoods_object().equals("��Ÿ")){ %>
										<td><img src="./resources/image/else.jpg" class="media-photo"/></td>
										<%} %>
										<!-- ��ǰ�� ���� �̹��� ��ġ ��-->
										
										<td width="3%">�� <%=bg.getGoodsVO().getGoods_num() %>ȣ</td>										
										<td><h5 class="title"><a href = "invest_detail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num()%>&borrower_registerdate=<%=bg.getBorrower_registerdate()%>"><%=bg.getGoodsVO().getGoods_object() %></a></h5></td>
										<td><%=bg.getBorrower_credit() %></td>
										<td width="9%"><%=bg.getGoodsVO().getGoods_rate() %>%</td>
										<td><%=bg.getBorrower_loanperiod() %></td>
										<td width="15%">
											<div class="progress progress-striped active"
												style="padding-top: 5px; height: 20px; width: 200px; margin: 0;">
												<div class="progress-bar" style="width:<%=percent%>%;" onmouseover="���� <%=bg.getGoodsVO().getGoods_sum()%>�� �� <%=bg.getGoodsVO().getGoods_invest()%>�� �����Ϸ�"></div>
											</div>
										</td>
										<td><%=bg.getGoodsVO().getGoods_status() %></td>
										<%
										if ( id == null || bg.getGoodsVO().getGoods_status() != null) {
										%>
										<td><input type="button" class="btn btn-primary btn-xs" value="�����ϱ�" disabled></td>
										<%
										} //�α��� �� �����̰� ���� �Ϸ� ���°� �ƴϸ�
				      					else {
				      						//���� �α����� ȸ���� ������ ��ǰ�� �ƴϸ�				      						
				      						int j = 0;
				      						for(j = 0; j < id_invest_list.size(); j++) {
				      							//�α����� ȸ���� ���� ����Ʈ�� ���� ��ǰ�� ������ disabled
				      							if(id_invest_list.get(j).getGoodsVO().getGoods_num() == bg.getGoodsVO().getGoods_num())
				      								break;
				      						}
				      						//j == id_invest_list.size() : ������ ��ǰ�� ��� for���� �� Ž. : ���� ���ڹ�ư
				      						if(j == id_invest_list.size()) {
				      					%>
				      						<td><a href = "invest_investform.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-primary btn-xs">�����ϱ�</a></td>
				      					<%
				      						}      					
				      						//�̹� ������ ��ǰ�� ���� : disabled
				      						else {
				      					%>
				      						<td><button class="btn btn-primary btn-xs" disabled>�����ϱ�</button></td>
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


<%-- <section class = "container">
   	<div class = "row" style = "height: 100%;">
   		<div class = "span12">
   			<table class="table table-striped table-hover ">
				<thead>
   					<tr>
   						<th>image</th>
  						<th>��ǰ��ȣ</th>
  						<th>��ǰ��</th>
   						<th>���</th>
   						<th>������ͷ�</th>
   						<th>���ڱⰣ</th>
   						<th>������Ȳ</th>
    					<th>������</th>
      					<th>�������</th>
      					<th>�����ϱ�</th>
    				</tr>
  				</thead>
  				
  				<tbody>
  					<%
  					for(int i = 0; i < invest_list.size(); i++) {
  						BorrowerVO bg = (BorrowerVO)invest_list.get(i);
  						double percent = ((float)bg.getGoodsVO().getGoods_invest() / (float)bg.getGoodsVO().getGoods_sum()) * 100;
  						System.out.println("percent : " + percent);
  					%>
  					<tr>
      					<td><div class = "glyphicon glyphicon-cutlery"></div></td>
      					<td><%=bg.getGoodsVO().getGoods_num() %>
      					<td><a href = "invest_detail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num()%>&borrower_registerdate=<%=bg.getBorrower_registerdate()%>"><%=bg.getGoodsVO().getGoods_object() %></a></td>
      					<td><%=bg.getBorrower_credit() %></td>
      					<td><%=bg.getGoodsVO().getGoods_rate() %></td>
      					<td><%=bg.getBorrower_loanperiod() %></td>
      					<td><%=bg.getGoodsVO().getGoods_invest()%>���� / <%=bg.getGoodsVO().getGoods_sum()%>����
      					<td>
      						<div class="progress progress-striped active" style="padding-top:5px;height:20px;width:200px;margin:0;">
  								<div class="progress-bar" style="width:<%=percent%>%;"></div>
							</div>
      					</td>
      					<td><%=bg.getGoodsVO().getGoods_status() %></td>
      					<%
      					//�����Ϸ��� ��� �����ϱ� ��ư disabled
      					//�α��� ���� ���� ��� : id = null
      					if(bg.getGoodsVO().getGoods_status().equals("�����Ϸ�") || id == null ) {
      					%>
      					<td><button class="btn btn-primary btn-xs" disabled>�����ϱ�</button></td>
      					<%	
      					}
      					
      					//�α��� �� �����̰� ���� �Ϸ� ���°� �ƴϸ�
      					else {
      						//���� �α����� ȸ���� ������ ��ǰ�� �ƴϸ�
      						List<InvestVO> id_invest_list = (List<InvestVO>)request.getAttribute("id_invest_list");
      						int j = 0;
      						for(j = 0; j < id_invest_list.size(); j++) {
      							//�α����� ȸ���� ���� ����Ʈ�� ���� ��ǰ�� ������ disabled
      							if(id_invest_list.get(j).getGoodsVO().getGoods_num() == bg.getGoodsVO().getGoods_num())
      								break;
      						}
      						//j == id_invest_list.size() : ������ ��ǰ�� ��� for���� �� Ž. : ���� ���ڹ�ư
      						if(j == id_invest_list.size()) {
      					%>
      						<td><a href = "invest_investform.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num() %>" class="btn btn-primary btn-xs">�����ϱ�</a></td>
      					<%
      						}      					
      						//�̹� ������ ��ǰ�� ���� : disabled
      						else {
      					%>
      						<td><button class="btn btn-primary btn-xs" disabled>�����ϱ�</button></td>
      					<%
      						}
      							
      					}
      					%>
      					
    				</tr>
					<%
  						
  					}
  					%>
  				</tbody>
			</table> 
    	</div>
    </div>
</section> --%>

