<%--==============================================================
 * 회원 삭제
 * @author 정희수
 * @since  2018.02.23.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.23. 	 정희수    	최초작성 (스크립트) 
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");

	HashMap<String, String > params = new HashMap<String,String>();
	
	params.put("mem_id", mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	
	service.deleteMemberInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/05/main.jsp");
	

%>