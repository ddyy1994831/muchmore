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

<section class = "container">
  	<div class = "row" style = "min-height:80%;" >
	  	<div class="container" align="center">
				<div class="jumbotron">
					<h1>Q&A</h1>
				</div>      
		</div>
			<div style="padding-left:120px;padding-right:120px;">
				<table class="table table-hover">
					 <thead>
						<tr>
							<th style="width: 100px">번호	</th>
							<th style="width: 400px">제목	</th>
							<th style="width: 200px">작성자</th>
							<th style="width: 200px">작성일</th>
							<th style="width: 100px">조회수</th>
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
									<td align="center" style="width: 100px"><%=boardVO.getBoard_num() %></td>
									<td style="width: 400px">
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
										else {
									%>
											&nbsp;&nbsp;
									<%
										}
										if(id != null) {
											//관리자인 경우
											if(id.equals("muchmore")) {
									%>
													<a href="BoardDetail.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
									<%
											}
											//일반회원인 경우
											else {											
									%>
													<a href="BoardViewCheck.do?board_num=<%=boardVO.getBoard_num() %>"><%=boardVO.getBoard_title() %></a>
									<%
											}
										}
										else {
									%>
											<%=boardVO.getBoard_title() %>
									<%
										}
									%>
									</td>
									<td><%=boardVO.getMember_id() %></td>
									<td><%=boardVO.getBoard_date() %></td>
									<td><%=boardVO.getBoard_readcount() %></td>
								</tr>
						<%
							}
						%>
						</tbody>
						<tfoot>
							<tr>
								<td align="center" colspan="4">
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
											//현재 보고 있는 페이지는 링크를 걸 필요가 없다.
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
								<td style = "vertical-align:middle">
									<%
										if(id != null) {
									%>
											<a href="BoardWriteForm.do" class="btn btn-primary">글쓰기</a>
									<%
										}
										else {
									%>
											<Button class="btn btn-primary" disabled>글쓰기</Button>
									<%
										}
									%>
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
								<td colspan="5" align="center">
									<font size="2">등록된 글이 없습니다.</font>
								</td>
							</tr>
							<tr>
								<td colspan = "5" align="right">
									<a href="BoardWriteForm.do" class="btn btn-primary">글쓰기</a>
								</td>
							</tr>
						</tbody>
				<%
					}
				%>
				</table>
			</div>
	</div>
</section>