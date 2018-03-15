<%--==============================================================
 * 로그인 아웃(세선삭제 포함)
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
	//로그아웃시에 실행되어야 비지니스 로직
	session.invalidate();

	String message = URLEncoder.encode("로그아웃 되었습니다","UTF-8");
	response.sendRedirect(request.getContextPath()+"/05/loginForm.jsp?message="+message);

%>
