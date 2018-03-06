<%--==============================================================
 * 개인과제 - id 중복체크
 * @author 정희수
 * @since  2018.02.26.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.26. 	 정희수    	최초작성 (스크립트) 
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id =request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id",mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	List<MemberVO> memberList = service.getMemberList();
	
	Map<String, String> jsonMap = new HashMap<String, String>();
	
	if(memberInfo == null ){
		jsonMap.put("flag","true");
	}else{
		jsonMap.put("flag","false");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	
	String result = mapper.writeValueAsString(jsonMap);
	application.log("result : "+result);
	
	out.println(result);
	
%>