<%--==============================================================
 * 상품 id 중복체크
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
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String prod_id = request.getParameter("prod_id");
 	
 	IProdService service = IProdServiceImpl.getInstance();
	HashMap<String, Object> prodInfo = service.getProdInfo(prod_id);
 	
 	Map<String, String> jsonMap = new HashMap<String, String>();
 	
 	if(prodInfo == null ){
 		jsonMap.put("flag", "사용가능한 아이디 입니다.");
 	}else{
 		jsonMap.put("flag", "중복된 아이디 입니다.");
 	}
 	
 	ObjectMapper mapper = new ObjectMapper();
 	
 	String result = mapper.writeValueAsString(jsonMap);
 	application.log("result : " + result);
 	
 	out.println(result);

 	
 %>