<%@page import="com.spring.muchmore.borrower.BorrowerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%	
	request.setCharacterEncoding("euc-kr");
	
	String id = null;	
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	
	List<BorrowerVO> invest_list = (List<BorrowerVO>)request.getAttribute("invest_list");
	int list_count = (Integer)request.getAttribute("invest_count");	
%>
<link href="./resources/css/bootstrap-tablefilter.css" rel="stylesheet">
<script type ="text/javascript">
$(document).ready(function () {
	$('.star').on('click', function () {
      $(this).toggleClass('star-checked');
    });

    $('.ckbox label').on('click', function () {
      $(this).parents('tr').toggleClass('selected');
    });

    $('.btn-filter').on('click', function () {
      var $target = $(this).data('target');
      if ($target != 'all') {
        $('.table tr').css('display', 'none');
        $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
      } else {
        $('.table tr').css('display', 'none').fadeIn('slow');
      }
    });
 });
</script>

<div class="container">
	<div class="row" style="height:100%">
		<section class="content">
			<h1>���ڻ�ǰ ����Ʈ</h1>
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
							    <button type="button" class="btn btn-default btn-filter" data-target="all">��ü���</button>
								<button type="button" class="btn btn-success btn-filter" data-target="onaylanan">�ʷϻ�</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="bekleyen">�����</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="iptal">������</button>
								
							</div>
						</div>
						<div class="table-container">
							<table class="table table-filter">
								<tbody>
									<tr data-status="onaylanan">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox1">
												<label for="checkbox1"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://pbs.twimg.com/profile_images/462946345255317505/UUGiYSqY_reasonably_small.jpeg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">August 4, 2017</span>
													<h4 class="title">
														1��
														<span class="pull-right onaylanan">(�ʷϻ�)</span>
													</h4>
													<p class="summary">�ʷϻ��� �ʷϻ�</p>
												</div>
											</div>
										</td>
									</tr>
									<tr data-status="bekleyen">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox3">
												<label for="checkbox3"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://pbs.twimg.com/profile_images/462946345255317505/UUGiYSqY_reasonably_small.jpeg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">August 4, 2017</span>
													<h4 class="title">
														2��
														<span class="pull-right bekleyen">(�����)</span>
													</h4>
													<p class="summary">������� �����</p>
												</div>
											</div>
										</td>
									</tr>
									<tr data-status="iptal">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox2">
												<label for="checkbox2"></label>
											</div>
										</td>
										<td>
											<a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a>
										</td>
										<td>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://pbs.twimg.com/profile_images/462946345255317505/UUGiYSqY_reasonably_small.jpeg" class="media-photo">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">August 4, 2017</span>
													<h4 class="title">
														3��
														<span class="pull-right iptal">(������)</span>
													</h4>
													<p class="summary">�������� ������</p>
												</div>
											</div>
										</td>
									</tr>									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="content-footer">
					<p>
						Page - 2017 <br>
						Powered By <a href="https://www.facebook.com/okantiktas" target="_blank">������</a>
					</p>
				</div>
			</div>
		</section>
		
	</div>
</div>


<%-- <section class="container">
	<div class="row" style="height:100%">
		<div class="span12">
			<!-- ��ȸ���� �� -->
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>image</th>
						<th>��ǰ��ȣ</th>
						<th>��ǰ��</th>
						<th>���</th>
						<th>������ͷ�</th>
						<th>���ڱⰣ</th>
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
						<td><div class="glyphicon glyphicon-cutlery"></div></td>
						<td><%=bg.getGoodsVO().getGoods_num() %></td>
						<td><a href="invest_detail.do?borrower_id=<%=bg.getBorrower_id() %>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num()%>&borrower_registerdate=<%=bg.getBorrower_registerdate()%>"><%=bg.getGoodsVO().getGoods_object() %></a></td>
						<td><%=bg.getBorrower_credit() %></td>
						<td><%=bg.getGoodsVO().getGoods_rate() %></td>
						<td><%=bg.getBorrower_loanperiod() %></td>						
						<td>
							<div class="progress progress-striped active"
								style="padding-top: 5px; height: 20px; width: 200px; margin: 0;">
								<div class="progress-bar" style="width:<%=percent%>%;"></div>
							</div>
						</td>
						<td><%=bg.getGoodsVO().getGoods_status() %></td>
						<%
							if ( id == null || bg.getGoodsVO().getGoods_status().equals("�����Ϸ�")) {
						%>
						<td><input type="button" class="btn btn-primary btn-xs"
							value="�����ϱ�" disabled></td>
						<%
							} else {
						%>
						<td><input type="button" class="btn btn-primary btn-xs"
							value="�����ϱ�" onclick="location.href='invest_investform.do?borrower_id=<%=bg.getBorrower_id()%>&goodsVO.goods_num=<%=bg.getGoodsVO().getGoods_num()%>'"></td>
					</tr>
					<%
							}
  					}
  					%>
				</tbody>
			</table>
		</div>
	</div>
</section> --%>

