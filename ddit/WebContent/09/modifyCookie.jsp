<%--==============================================================
 * 받은 쿠키 수정하기
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
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		if("mem_id".intern() == cookie.getName().intern()){
			//쿠키갱신
			Cookie idCookie = new Cookie("mem_id","b001");
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키를 바꿔 보았네...함 맛보시게나...
</body>
</html>