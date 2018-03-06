<%--==============================================================
 * createXMLData
 * @author 정희수
 * @since  2018.03.05
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05. 	 정희수    	최초작성(스크립트)
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList = service.getMemberList();


	out.println("<members>");
	for(MemberVO memberInfo : memberList){
		out.println("<member id='"+memberInfo.getMem_id()+"'>");
			out.println("<mem_pass>"+memberInfo.getMem_pass()+"</mem_pass>");
			out.println("<mem_name>"+memberInfo.getMem_name()+"</mem_name>");
			
		out.println("</member>");
	}
	out.println("</members>");

%>