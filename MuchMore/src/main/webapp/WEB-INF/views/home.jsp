<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("EUC-KR");

	String id = null;
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}

%>

    <section class = "container">
    	<div class = "row" style="height:80%">
    		<div class = "span12">
    			<h3><%=id %>로 로그인하셨습니다.</h3>
    		</div>
    	</div>
    </section>