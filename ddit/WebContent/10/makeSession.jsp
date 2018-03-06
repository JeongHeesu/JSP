<%--==============================================================
 * 세션만들기
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
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 : 클라이언트와 서버의 영속적이지 않은 상태를 극복하기 위해 서버단에 생성되는 활용되는 기본객체
	// * 최초 클라이언트의 요청시 요청헤더에 포함되어 전송되는 코드를 기초로 해당 클라이언트와 맵핑되는 세션을 생성하고 해당 세션에 
	//   고유 아이디로 부여
	// * 최초 요청시 생성된 세션과 세션정보(세션아이디)는 응답으로 
	//   클라이언트에 전송 후 이후 요청시 쿠키 베이스로 매번 서버로 전송.
	// * 클라이언트로부터 전송된 세션아이디를 활용하여 서블릿(웹) 컨테이너는 해당 클라이언트의 세션을 특정
	// * 서버사이드 프로그래밍 언어별 쿠키 베이스의 세션 아이디의 키가 상이
	//   PHP : PHPSESSIONID=......, ASP :  ASPSESSIONID=....
	//   JSP : JSESSIONID=......
	// * 세션은 설정된 말료시간(Apache Tomcat 서버 : default 30분)내 클라이언트로부터 요청이 전무하면 해당세션이 삭제
	// * sesseion.invalidate() 코드를 통해서 해당세션이 삭제
	
	//세션의 만료시간 : 초단위 설정
	session.setMaxInactiveInterval(60*10*10);
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
세션 아이디 :  <%=session.getId() %> <br>
세션 최초 생성 일자 : <%=dateFormat.format(new Date(session.getCreationTime())) %><br>
클라이언트의 마지막 요청시간 : <%=dateFormat.format(new Date(session.getLastAccessedTime())) %><br>
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	//loginForm.jsp ----------------> loginCheck.jsp
	///								  if(회원)
	//								     session.setAttribute("LOGIN_MEMBERINFO", memberInfo);	
	// 로그인 해야함 접근 가능한 요청 : session에 특정키의 값이 존재 여부 체크 후 접근 여부 검증
	// 로그인 하지 않아도 접근 가능한 요청 : session에 특정키의 값이 존재 여부 체크 후 접근 여부 검증
	session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
	 
%>
</body>
</html>