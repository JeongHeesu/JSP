<%--==============================================================
 * 게시판 삭제(비활성화)
 * @author 정희수
 * @since  2018.03.12.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.12.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	String bo_no = request.getParameter("bo_no");
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("bo_no",bo_no);
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	service.deleteFreeboardInfo(params);
	
	response.sendRedirect(request.getContextPath() + "/12/main.jsp");
%>