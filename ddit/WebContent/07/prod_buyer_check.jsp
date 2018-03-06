<%--==============================================================
 * prod 의 바이어 아이디체크
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
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String prod_buyer = request.getParameter("prod_buyer");
 	application.log(prod_buyer+"바이어 피알오디");
 	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerInfo = service.getBuyerInfo(prod_buyer);
 	
 	Map<String, String> jsonMap = new HashMap<String, String>();
 	
 	if(buyerInfo == null ){
 		jsonMap.put("flag", "등록되지 않은 업체 입니다.");
 	}else{
 		jsonMap.put("flag", "등록된 업체 입니다.");
 	}
 	
 	ObjectMapper mapper = new ObjectMapper();
 	
 	String result = mapper.writeValueAsString(jsonMap);
 	application.log("result : " + result);
 	
 	out.println(result);

 	
 %>