<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%> 
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE> 
<html>
<head> 
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
</head>
   <div id="wrapper">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      
      <div id="content">
         <tiles:insertAttribute name="content"/>
      </div>
      
      <div id="footer">
         <tiles:insertAttribute name="footer"/>
      </div>
   </div>
</html>