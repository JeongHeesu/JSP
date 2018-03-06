<%--==============================================================
 * 익셉션 일으켜서 익셉션 처리하기
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
<%@ page errorPage="/error/errorCtrl.jsp" isErrorPage="false" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	isErrorPage="false" : jsp 내에서 발생된 익셉션을 처리하기 위해 기본ㄱ개체 exception을 활용할 수 없는 jsp.
	
	errorPage :  해당 jsp 내에서 발생된 익셉션을 처리하는 isErrorPage="true"가 선언된 특정 jsp로의 포워딩 설정.
 -->
<%
	// 블랙홀 : 부피는 0 밀도 무한대
	int i = 1/0;

%>
</body>
</html>