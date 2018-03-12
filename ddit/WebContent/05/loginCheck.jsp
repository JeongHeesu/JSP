<%--==============================================================
 * 로그인 체크(id와 비번 일치 확인)
 * @author 정희수
 * @since  2018.02.22.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22. 	 정희수    	최초작성
 *    2018.03.05. 	 정희수    	session 작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.utils.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	//암호문을 세션 내 저장된 비밀키를 활용해서 평문으로 변경.
	mem_id = CryptoGenerator.decryptoRSA(session, mem_id);
	
	String mem_pass = request.getParameter("mem_pass");
	mem_pass = CryptoGenerator.decryptoRSA(session, mem_pass);
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);
	params.put("mem_pass", mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	if( memberInfo == null ){
		String message = URLEncoder.encode("회원이 아닙니다.","UTF-8");
		response.sendRedirect(request.getContextPath() + "/05/loginForm.jsp?message="+message);
	}else{
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		response.sendRedirect(request.getContextPath()+"/05/main.jsp");
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