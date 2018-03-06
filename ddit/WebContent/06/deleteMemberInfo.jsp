<%--==============================================================
 * 개인과제-회원삭제
 * @author 정희수
 * @since  2018.02.26.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.26.  정희수      최초작성 (스크립트) 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	Map<String,String> params = new HashMap<String, String>();
	params.put("mem_id", mem_id);

	IMemberService service = IMemberServiceImpl.getInstance();
	service.deleteMemberInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/06/main.jsp");
%>
