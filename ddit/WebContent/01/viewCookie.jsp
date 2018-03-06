<%--==============================================================
 * 쿠키 받아오기
 * @author 정희수
 * @since  2018.03.06.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.06.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 클라이언트의 쿠키저장소에 저장된 쿠키는 해당 쿠키의 도메인, 경로 ㅅ ㅓㄹ정에 따라
	// 클라이언트의 서버요청시 동반 전송.
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		out.println("쿠키 name : " + cookie.getName() + " | 쿠키 value : " + 
					URLDecoder.decode(cookie.getValue(),"UTF-8") + "<br>");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>