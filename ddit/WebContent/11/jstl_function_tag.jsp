<%--==============================================================
 * JSTL function 태그 활용 및 사용자가 정의 내용 활용
 * @author 정희수
 * @since  2018.03.08.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.08.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="targetclazz" uri="http://ddit.com/taglib/TargetClazz-taglib"%>
<c:set var="targetString1" value="function 태그는 java.lang.String 클래스 내 빈번하게 활용되는 몇몇 메서드를 태그로 제공합니다."></c:set>
<c:set var="targetString2" value="제공"></c:set>
<c:set var="targetStrtin3" value="201호, 202호, 203호, 204호, 205호"></c:set>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%=	((String)pageContext.getAttribute("targetString1")).length()%> --%>
length() : ${fn:length(targetString1) } <br>
toUpperCase() : ${fn:toUpperCase(targetString1) }<br> 
toLowerCase() : ${fn:toLowerCase(targetString1) }<br>
subString() : ${fn:substring(fn:trim(targetString1),0,9) }<br>
subStringAfter() : ${fn:substringAfter(targetString1,'태그') }<br>
subStringBefter() : ${fn:substringBefore(targetString1,'태그') }<br>
repalce() : ${fn:replace(targetString1,'활용',targetString2) }<br>
indexOf() :${fn:indexOf(targetString1,'태그') }<br>
startsWith() :${fn:startsWith(targetString1, 'fun') }<br>
endsWith() :${fn:endsWith(targetString1, '미다.') }<br>
contains() : ${fn:contains(targetString1, targetString2) }<br>
split() : ${fn:split(targetString3,', ') }<br>
<c:set var="targetString4" value="<script type='text/javascript'>alert('알럿');</script>"></c:set>
<%-- ${targetString4 } --%>
escapeXml() : ${fn:escapeXml(targetString4) }<br>

<!-- 사용자 정의 태그 활용 -->
plus : ${targetclazz:plus(1,1) }<br>
multiple : ${targetclazz:mulitple('3',3) }<br>
today() : ${targetclazz:today() }<br>
charCount() : ${targetclazz:charCount('123455678','5') }<br>

</body>
</html>