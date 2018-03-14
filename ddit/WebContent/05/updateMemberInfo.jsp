<%--==============================================================
 * 회원정보 수정
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
	service.updateMemberInfo(memberInfo);
	
	response.sendRedirect(request.getContextPath()+"/05/main.jsp");
	
%>
<!-- html 코드가 필요 없으면 지워도디낟. -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->