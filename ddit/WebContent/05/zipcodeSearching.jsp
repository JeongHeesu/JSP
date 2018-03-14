<%--==============================================================
 * zipcode(우편번호검색 ajaxs)
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
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.zipcode.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.service.zipcode.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//[{ "flag" : "true" },{ "flag" : "true" }]
	// /ddit/05/zipcodeSearching.jsp
	// 전송방식:post  dong=온천동
	
	
	String dong = request.getParameter("dong");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("dong" , dong);
	
	IZipcodeService service = IZipcodeServiceImpl.getInstance();
	List<ZipcodeVO> zipcodeList = service.getZipcodeList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(zipcodeList);
	
	out.println(jsonData);
	
	
	
%>