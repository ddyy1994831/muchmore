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
	
	//forward로 request와 response객체를 공유해야 저장한 데이터를 공유 가능
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
			<%
				if(listcount > 0) {
			%>
					<thead>
						<tr>
							<div class="row">
								<th>
									<div class="col-md-2" align="center">번호</div>
								</th>
								<th>
									<div class="col-md-7" align="center">제목</div>
								</th>
								<th>
									<div class="col-md-6" align="center">작성자</div>
								</th>
								<th>
									<div class="col-md-6" align="center">작성일</div>
								</th>
								<th>
									<div class="col-md-2" align="center">조회수</div>
								</th>
							</div>
						</tr>
					</thead>
					<tbody>
					<%
						for(int i=0; i<boardList.size(); i++) {
							BoardVO boardVO = (BoardVO)boardList.get(i);
					%>
							<tr>
								<td align="center">
									<div class="col-md-2" align = "center"><%=boardVO.getBoard_num() %></div>
								</td>
								<td>
								<%
									if(boardVO.getBoard_re_lev() != 0) {
										for(int a=0; a<boardVO.getBoard_re_lev() * 2; a++) {
								%>
											&nbsp;&nbsp;
								<%
										}
								%>
										&nbsp;&nbsp;
								<%
									}
									else {
								%>
										&nbsp;&nbsp;
								<%
									}
								
									if(id != null) {
										//관리자인 경우
										if(id.equals("muchmore")) {
								%>
											<div class="col-md-7" align = "center">
												<a href="qna_board_view.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
											</div>
								<%
										}
										//일반회원인 경우
										else {
								%>
											<div class="col-md-7" align = "center">
												<a href="BoardViewCheck.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
											</div>
								<%
										}
									}
								%>
								</td>
								<td>
									<div class="col-md-6" align="center"><%=boardVO.getMember_id() %></div>
								</td>
								<td>
									<div class="col-md-6" align="center"><%=boardVO.getBoard_date() %></div>
								</td>
								<td>
									<div class="col-md-2" align="center"><%=boardVO.getBoard_readcount() %></div>
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
										<li><a href="qna_board_list.do?page=<%=nowpage-1 %>">&laquo;</a></li>
								<%
									}
								
									for(int a=startpage; a<=endpage; a++) {
										//현재 보고 있는 페이지는 링크를 걸 필요가 없다.
										if(a == nowpage) {
								%>
											<li class="active"><a href="#"><%=a %></a></li>
								<%
										}
										else {
								%>
											<li><a href="qna_board_list.do?page=<%=a %>"><%=a %></a></li>
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
										<li><a href="qna_board_list.do?page=<%=nowpage+1%>">&raquo;</a></li>
								<%
									}
								%>
								</ul>
							</td>
						</tr>
					</tfoot>
			<%
				}
				//글이 없을때
				else {
			%>
					<tbody>
						<tr>
							<td>
								<font size="2">등록된 글이 없습니다.</font>
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
		<a href="BoardWriteForm.do" class="btn btn-primary">글쓰기</a>
	</div>
</section>