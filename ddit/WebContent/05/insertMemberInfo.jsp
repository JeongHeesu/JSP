<%--==============================================================
 * 회원가입
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
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	
	MemberVO memberInfo = new MemberVO();
	BeanUtils.populate(memberInfo, request.getParameterMap());
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.insertMemberInfo(memberInfo);
	
	response.sendRedirect(request.getContextPath()+"/05/loginForm.jsp");
%>
