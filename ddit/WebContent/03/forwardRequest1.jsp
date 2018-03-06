<%--==============================================================
 * 저장객체중 포워드 사용했을 때 저장객체의 내용
 * @author 정희수
 * @since  2018.02.21.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id","a001");
	params.put("mem_pass","asdfasdf");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	//			bloodTypeResult.jsp?bloodType=A	
	// 브라우저 ------------------------------------> 서버
	//												bloodTypeResult.jsp
	//												request.getParameter("bloodType");
	//											  |	<-- 포워딩(a.jsp)
	//											  |	--> a.jsp
	//											  			request.getParameter("bloodType");
	//		<-------------------------------------	컨텐츠
	
	/* 기본객체 중 저장영역(Scope)를 포함하는 네개의 기본객체
			pagaeContext : jsp 한개당 하나 할당
			request		 : 리다이렉트 요청시에는 항상 새롭게 생성.
							포워딩 요청시에는 재사용
			session      : 최초 리다이렉트 요청시 생성되는 세션 만료시간까지 유지.	
			application  : 해당 웹 어플리케이션이 서비스 시작될때 생성되어 서비스가 정지되면 삭제
			저장영역 접근 공통 메서드 : 저장 - setAttribute(키, 값); Object타입으로 저장
								   취득 - setAttribute(키);    Object타입으로 반환
								   삭제 - removeAttribute(키);
								   갱신 -  setAttribute(동일키, 다른값);
	*/							   
	
	pageContext.setAttribute("pageMemberInfo", memberInfo);
// 	MemberVO returnValaue = (MemberVO)pageContext.getAttribute("pageMemberInfo");
// 	pageContext.removeAttribute("pageMemberInfo");
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/03/forwardRequest2.jsp");
	dispatcher.forward(request, response);	
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