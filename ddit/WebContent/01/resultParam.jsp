<%--==============================================================
 * request.parameter의 값을 받는 방법
 * @author 정희수
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	http://localhost/ddit/01/resultParm.jsp 
		전송패킷 : mem_id=a001&mem_pass=asdfasdf&mem_name=김은대&param_group=첫번째&param_group=다섯번째
-->
<%
	
%> 
<!--    
	html 태그 랜더링 처리
		 uninitialized : 서버로부터 취득한 응답 컨텐츠의 취득 완료
		 loading :  취득한 응답 컨텐츠를 분석
		 interactive : 응답 컨텐츠 분석이 완료되고 브라우저에 UI가 출력(유저의 조작이 불가능)
		 complete : 유저의 조작이 가능. body태그의 onload이벤트가 발생
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	아 이 디 : <%= request.getParameter("mem_id") %> <br>
	패스워드 : <%= request.getParameter("mem_pass") %> <br>
	이    름 : <%= request.getParameter("mem_name") %> <br>
	미스테리 : <%= request.getParameter("param_group") %>
	<hr>
	<h4>request.getParameterValues(키) : 단일키의 다중값 취득 </h4>
	
	<%
		String[] params = request.getParameterValues("param_group");
		for(String param : params){
	%>
		param_goup value : <%=param%> <br>
	<%
		}
	
	%>
	<hr>
	<h4>request.getParameterNames() : 전송 파라메터의 키들만 Enumeration로 취득</h4>
	<%
		Enumeration<String> keys =  request.getParameterNames();
		while(keys.hasMoreElements()){
			String key = keys.nextElement();
			
			String[] values = request.getParameterValues(key);
			
			for(String value : values){
	%>
				key : <%= key %> - value : <%= value %> <br>
	<%
			}
		}
	%>
	<hr>
	<h4> request.getParameterMap() : 전송 파라메터의 키와 값을 Map 형식으로 취득 </h4>
	<%
		Map<String, String[]> paramMap = request.getParameterMap();
		Iterator<String> keyValues = paramMap.keySet().iterator();
		while(keyValues.hasNext()){
			String key = keyValues.next();
			String[] values = paramMap.get(key);
			
			for(String value : values){
	%>
				key : <%= key %> - value : <%= value %> <br>
	<%
			}
		}
	%>
	
</body>
</html>