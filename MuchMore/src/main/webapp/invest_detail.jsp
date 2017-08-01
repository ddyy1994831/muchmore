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
	
	//��ǰ������ ������ ����
	BorrowerVO bg = (BorrowerVO)request.getAttribute("borrowergoods");
	//�� ��ǰ�� ���� �� ���ڱݾ�
	int total_invest = (Integer)request.getAttribute("total_invest");
	//����������
	MemberVO member = (MemberVO)request.getAttribute("borrower_info");	
	//������
	double invest_status =  (double)total_invest / bg.getGoodsVO().getGoods_sum() * 100;
	//���� Ƚ��
	int borrowerCount = (Integer) request.getAttribute("borrowerCount");
	//���� Ƚ��
	int investCount = (Integer) request.getAttribute("investCount");
	//����ڰ� ������ ���
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
						<!-- ��ǰ�� ���� �̹��� ��ġ -->						
						<% if(bg.getGoodsVO().getGoods_object().equals("��Ȱ��")){ %>
						<img src="./resources/image/living.jpg"	class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("����/����")){ %>
						<img src="./resources/image/invest.jpg"	class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("���")){ %>
						<img src="./resources/image/business.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("���ڱ�")){ %>
						<img src="./resources/image/school.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%}if(bg.getGoodsVO().getGoods_object().equals("��Ÿ")){ %>
						<img src="./resources/image/else.jpg" class="img-responsive img-rounded" style="height:150px; width:100%; opacity: 0.7;"/>
						<%} %>						
					<!-- ��ǰ�� ���� �̹��� ��ġ ��-->
					</div>
					<div class="panel-body">				
						<div class="col-sm-4 col-sm-offset-4" style="padding-top:10px">
							<div class="text-center"><h6>�� <%=bg.getGoodsVO().getGoods_num() %>ȣ</h6></div>
							<div class="text-center"><h5><strong><%=bg.getGoodsVO().getGoods_object() %></strong></h5></div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th style="text-align:center">���</th>
									<th style="text-align:center">������Է�</th>
									<th style="text-align:center">����Ⱓ</th>
									<th style="text-align:center">����ݾ�</th>
									<th style="text-align:center">������</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=bg.getBorrower_credit() %></td>
									<td><%=bg.getGoodsVO().getGoods_rate() %>%</td>
									<td><%=bg.getBorrower_loanperiod() %></td>
									<td><fmt:formatNumber value="<%=bg.getGoodsVO().getGoods_sum() %>" type="currency" currencySymbol="��"></fmt:formatNumber></td>
									<td><%=invest_status %>%</td>
								</tr>
							</tbody>
						</table>

						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">������ �⺻����</div>
								<div class="panel-body">
									<div class="col-xs-6">����</div>
									<div class="col-xs-6 text-right">
										<%=member.getMember_gender() %>
									</div>
									<div class="col-xs-6">����</div>
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
								<div class="panel-heading">�ҵ�����</div>
								<div class="panel-body">
									<div class="col-xs-6">���ҵ�</div>
									<div class="col-xs-6 text-right">
										<fmt:formatNumber value="<%=bg.getBorrower_totalincome() %>" type="currency" currencySymbol="��"></fmt:formatNumber>
									</div>
									<div class="col-xs-6">��������</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobbiz() %>
									</div>
									<div class="col-xs-6">������</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobname() %>
									</div>
									<div class="col-xs-6">�����Ⱓ</div>
									<div class="col-xs-6 text-right">
										<%=bg.getBorrower_jobperiod() %>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">��ġ��� �̿� ����</div>
								<div class="panel-body">
									<div class="col-xs-6">����Ƚ��</div>
									<div class="col-xs-6 text-right"><%=borrowerCount%></div>
									<div class="col-xs-6">����Ƚ��</div>
									<div class="col-xs-6 text-right"><%=investCount%></div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">��������</div>
								<div class="panel-body">
									<div class="col-xs-6">����ݸ�</div>
									<div class="col-xs-6 text-right"><%=bg.getBorrower_rate()%>%</div>
									<div class="col-xs-6">�����ѵ��ݾ�</div>
									<div class="col-xs-6 text-right"><fmt:formatNumber value="<%=bg.getBorrower_limit()%>" type="currency" currencySymbol="��"></fmt:formatNumber></div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">������ ��ȣ</div>
								<div class="panel-body">
									<p>��ġ��ƴ��(��)�� ä���ڷμ� �������� �ڻ� ��ȣ�� �ּ��� ���ϸ�, ��ü �߻��Ϸκ��� 10 ������
										�Ŀ��� �����߽ɱ���� �����Ͽ� �߽��� �����ϰ� �ֽ��ϴ�.&nbsp; ��ü �߻� �� 60���� ����Ͽ� ����������
										����� ��� �Ҽ�, �з�(����, �޿�, �ε��� ��) ��� �� ���������� �����մϴ�.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer" align="center">
						<button type="button" class="btn btn-default"
							onclick="history.go(-1);">�ڷ�</button>
						<%
							if ( id == null || bg.getGoodsVO().getGoods_status().equals("�����Ϸ�")) {
						%>
						<button type="submit" class="btn btn-primary" disabled>�����ϱ�</button>
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
						<button type="submit" class="btn btn-primary">�����ϱ�</button>
						<%
				      		}      					
				      		//�̹� ������ ��ǰ�� ���� : disabled
				      		else {
				      	%>
				      	<button type="submit" class="btn btn-primary" disabled>�����ϱ�</button>
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

