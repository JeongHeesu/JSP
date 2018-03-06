<%--==============================================================
 * 익셉션 출력
 * @author 정희수
 * @since  2018.02.22.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22. 	 정희수    	만들어진  컨텐트의 주석
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	서버로부터 에러 상태 코드 (404, 500)가 클라이언트에 저송될 때
	컨텐츠가 513바이트 미만일때는 해당 에러상태 코드에 따라 브라우저가 가진 컨텐츠가 출력.
 -->
<%
	out.print("익셉션 발생 자원 : " + exception.getClass().getName()+"<br>");
	out.print("익셉션 메세지 : " +exception.getMessage());
	
%>
</body>
</html>