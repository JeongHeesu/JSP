<%--==============================================================
 * 세션 삭제
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
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// * 세션은 설정된 말료시간(Apache Tomcat 서버 : default 30분)내 클라이언트로부터 요청이 전무하면 해당세션이 삭제
	// * sesseion.invalidate() 코드를 통해서 해당세션이 삭제
	// * session.setMaxInActiveInterval(0 or  음수) 삭제
// 	MemberVO memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
	//세션은 유지되고, 세션 내에 저장된 값만 삭제.	
// 	session.removeAttribute("LOGIN_MEMBERINFO");
	//클라이언트 ------------------------> logout.jsp
	//									 session.invalidate();
	session.invalidate();

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