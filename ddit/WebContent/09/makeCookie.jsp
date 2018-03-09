<%--==============================================================
 * 쿠키 작성
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
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//서버단에서 쿠키 작성
	// *서버단에서 자바코드를 활용해서 작성된 쿠키는 response에 저장되어 클라이언트에 전송되고,
	// 클라이언트의 저장소에 저장됨.
	// * 쿠키 사이즈 : 4kb이내
	// * 쿠키 구성 : 이름=값;유요시간=값;도메인=값;경로=값;
	//			    쿠키저장소에 저장된 쿠키는 해당 클라이언트의 서버 요청시 동반 전송됨.
	// * 쿠키 도메인 : default - 해당쿠키를 작성하는 서버 요청시의 도메인
	//				 별도 도메인 설정 가능
	// * 쿠키경로 : default - /
	//			  별도 패스 설정 가능
	// * 쿠키 유효시간 : default -1(브라우저 종료시 해당 쿠키는 삭제)
	//				  별도 유효시간 설정 가능
	
	Cookie idCookie = new Cookie("mem_id", "a001");
	idCookie.setPath("/");
	// * 작성된 쿠키는 클라이언트에 전송되어 저장처리
	response.addCookie(idCookie);
	
	Cookie pwdCookie = new Cookie("mem_pass","asdfasdf");
	// 서버단에서 쿠키의 유효시간 : 초단위 설정 
	pwdCookie.setMaxAge(60*60*24);
	// http://localhost/ddit/09/viewCookie.jsp 쿠키전송
	// http://localhost/ddit/05/loginForm.jsp 쿠키 미전송
// 	pwdCookie.setPath("/ddit/09");
	pwdCookie.setPath("/");
	response.addCookie(pwdCookie);
	
	// 클라이언트에 존재하는 쿠키저장소(메로리 또는 파일단위)에는 ISO8859-1 인코딩 환경설정.
	Cookie nameCookie = new Cookie("mem_name", URLEncoder.encode("김은대","UTF-8"));
	nameCookie.setDomain("www.bagrant.co.kr");
	nameCookie.setPath("/");
	response.addCookie(nameCookie);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키 아주 맛있게 되었음. 배고프군...
</body>
</html>