<%--==============================================================
 * 구구단 단의 값을 받아와서 선택한 단의 구구단의 결과를 출력
 * @author 정희수
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  정희수      최초작성
 *    2018.03.08.  정희수      EL 코드로 변경
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<!--
   -Jasper 엔진 : gugdanResult.jsp 요청시
   				  gugudanResult_jsp.java(서블릿)
   				  gugudanResult_jsp.class
     public final class gugdanResult_jsp extends HttpJapBase{
     	public void _jspService(HttpServletRequest request, HttpServletRespose response){5-*y
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>        
<%!
// 	private int multiple(int i, int j){
// 		return i*j;
// }
%>    
<!-- http://localhost/ddit/01/gugdanResult.jsp?dan=5 -->
<%
// 	String dan = request.getParameter("dan");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="i" value="${param.dan }"></c:set>
<h3>${i }단</h3> 
<c:forEach var="j" begin="1" end="9"> 
	${i } * ${j } = ${i*j }<br>
</c:forEach>



<%
// 		for(int j=1; j<10; j++){
// 			int i = Integer.parseInt(dan);
%>
<%-- 		<%= i%> * <%=j%> = <%= multiple(i,j)  %></br> --%>
<%						
// 	}
%>
</body>
</html>
<!-- 	} -->
<!-- }	 -->