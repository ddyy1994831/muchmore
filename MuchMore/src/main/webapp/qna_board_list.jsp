<%@ page import="com.spring.muchmore.board.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% 
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	System.out.println("qna_board_list.jsp");
	
	//forward�� request�� response��ü�� �����ؾ� ������ �����͸� ���� ����
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardlist");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%>

<section class="container">
	<div class="row">
		<div class="span12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>
							<div align="center" style="width: 100px">��ȣ</div>
						</th>
						<th>
							<div align="center" style="width: 400px">����</div>
						</th>
						<th>
							<div align="center" style="width: 200px">�ۼ���</div>
						</th>
						<th>
							<div align="center" style="width: 200px">�ۼ���</div>
						</th>
						<th>
							<div align="center" style="width: 100px">��ȸ��</div>
						</th>
					</tr>
				</thead>
			<%
				if(listcount > 0) {
			%>
					<tbody>
					<%
						for(int i=0; i<boardList.size(); i++) {
							BoardVO boardVO = (BoardVO)boardList.get(i);
					%>
							<tr>
								<td align="center">
									<div align="center" style="width: 100px"><%=boardVO.getBoard_num() %></div>
								</td>
								<td>
								<%
									if(boardVO.getBoard_lev() != 0) {
										for(int a=0; a<boardVO.getBoard_lev() * 2; a++) {
								%>
											&nbsp;&nbsp;
								<%
										}
								%>
 										&nbsp;&nbsp; 
								<%
									}
									if(id != null) {
										//�������� ���
										if(id.equals("muchmore")) {
								%>
											<div align="center" style="width: 400px">
												<a href="BoardDetail.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
											</div>
								<%
										}
										//�Ϲ�ȸ���� ���
										else {											
								%>
											<div align="center" style="width: 400px">
												<a href="BoardViewCheck.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
											</div>
								<%
										}
									}
								%>
								</td>
								<td>
									<div align="center" style="width: 200px"><%=boardVO.getMember_id() %></div>
								</td>
								<td>
									<div align="center" style="width: 200px"><%=boardVO.getBoard_date() %></div>
								</td>
								<td>
									<div align="center" style="width: 100px"><%=boardVO.getBoard_readcount() %></div>
								</td>
							</tr>
					<%
						}
					%>
					</tbody>
					<tfoot>
						<tr>
							<td align="center" colspan="5">
								<ul class="pagination pagination-sm">
								<%
									if(nowpage <= 1) {
								%>
										<li class="disabled"><a href="#">&laquo;</a></li>
								<%
									}
									else { 
								%>
										<li><a href="BoardList.do?page=<%=nowpage-1 %>">&laquo;</a></li>
								<%
									}
								
									for(int a=startpage; a<=endpage; a++) {
										//���� ���� �ִ� �������� ��ũ�� �� �ʿ䰡 ����.
										if(a == nowpage) {
								%>
											<li class="active"><a href="#"><%=a %></a></li>
								<%
										}
										else {
								%>
											<li><a href="BoardList.do?page=<%=a %>"><%=a %></a></li>
								<%
										}
									}
									
									if(nowpage >= maxpage) {
								%>
										<li class="disabled"><a href="#">&raquo;</a></li>
								<%
									}
									else {
								%>
										<li><a href="BoardList.do?page=<%=nowpage+1%>">&raquo;</a></li>
								<%
									}
								%>
								</ul>
							</td>
						</tr>
					</tfoot>
			<%
				}
				//���� ������
				else {
			%>
					<tbody>
						<tr>
							<td colspan="5" align="center">
								<font size="2">��ϵ� ���� �����ϴ�.</font>
							</td>
						</tr>
					</tbody>
			<%
				}
			%>
			</table>
		</div>
	</div>
	
	<div class="row">
		<a href="BoardWriteForm.do" class="btn btn-primary">�۾���</a>
	</div>
</section>