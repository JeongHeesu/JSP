<%--==============================================================
 * 상품등록
 * @author 정희수
 * @since  2018.02.27.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성 (스크립트) 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	ProdVO prodInfo = new ProdVO();
	BeanUtils.populate(prodInfo, request.getParameterMap());
	
	IProdService service = IProdServiceImpl.getInstance();
	service.insertProd(prodInfo);
	
	response.sendRedirect(request.getContextPath()+"/07/main.jsp");

%>
