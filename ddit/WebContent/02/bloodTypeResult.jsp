<%--==============================================================
 * 받은 혈액형으로 혈액형에 맞는 jsp에 보내기
 * @author 정희수
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  정희수      최초작성
 *    2018.03.12.  정희수      EL태그 변경
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	request.setCharacterEncoding("UTF-8");
	
	String name =URLEncoder.encode(request.getParameter("myName"), "UTF-8");
	String bloodType = request.getParameter("bloodType");
%>
<c:set var="bloodType" value="${param.bloodType }"></c:set>
<c:set var="myName" value="${param.myName }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
// 		if(bloodType.equals("A")){
// 			response.sendRedirect("/ddit/02/view/a.jsp?myName="+name+"&bloodType="+bloodType);
// 		}else if(bloodType.equals("B")){
// 			response.sendRedirect("/ddit/02/view/b.jsp?myName="+name+"&bloodType="+bloodType);
// 		}else if(bloodType.equals("AB")){
// 			response.sendRedirect("/ddit/02/view/ab.jsp?myName="+name+"&bloodType="+bloodType);
// 		}else if(bloodType.equals("O")){
// 			response.sendRedirect("/ddit/02/view/o.jsp?myName="+name+"&bloodType="+bloodType);
// 		}
	%> 
	
	<c:choose>
	<c:when test="${ bloodType == 'A' }">
		<c:import url="/02/view/a.jsp" >
			<c:param name="myName" value="${myName }" />
		</c:import>
	</c:when>
	
	<c:when test="${bloodType == 'B' }">
		<c:import url="/02/view/b.jsp" >
			<c:param name="myName" value="${myName }" />
		</c:import>
	</c:when>
	
	<c:when test="${bloodType == 'AB' }">
		<c:import url="/02/view/ab.jsp">
			<c:param name="myName" value="${myName }" />
		</c:import>
	</c:when>
	
	<c:otherwise>
		<c:import url="/02/view/o.jsp">
			<c:param name="myName" value="${myName }" />
		</c:import>
	</c:otherwise>
</c:choose>

</body>
</html>