<%--==============================================================
 * 바이어 이름으로 목록출력
 * @author 정희수
 * @since  2018.03.05.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05.  정희수      최초작성 (스크립트) 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String buyer_name = request.getParameter("buyer_name");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_name", buyer_name);
	
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.getBuyerList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(buyerList);
	
	out.println(jsonData);
%>