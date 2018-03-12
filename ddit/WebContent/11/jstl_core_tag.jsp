<%--==============================================================
 * JSTL활용
 * @author 정희수
 * @since  2018.03.07.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.07.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	// JSTL 활용을 위한 라이브러리
	//1 다운로드
// 		http://search.maven.org
// 		jstl-1.2.jar
// 		jstl-api-1.2.jar
	//2.web-inf/lib import
	//3. JSTL 태그를 활용하기 위한 taglib 디렉티브 선언	
	// taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
	Map<String,String> params = new HashMap<String, String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	List<MemberVO> memberList = service.getMemberList();
	
	String[] hosils = {"201호", "202호" ,"203호", "204호", "205호"};
	
	String hosil = "201호, 202호 ,203호, 204호, 205호";
	pageContext.setAttribute("hosils", hosils);
// 	pageContext.setAttribute("memberInfo", memberInfo);
	pageContext.setAttribute("memberList", memberList);


%>
<!-- 
	set : scope  -  Scope 기본객체 (page[default], request, session,application)\
		  var    -  저장 키
		  value  -  저장 대상 값
 -->  
<c:set var="memberInfo" value="<%=memberInfo %>"></c:set>  
<c:set scope="request" var="reqMemberInfo" value="<%=memberInfo %>"></c:set>  
<c:set scope="session" var="sesMemberInfo" value="<%=memberList %>"></c:set>  
<c:set scope="application" var="params" value="<%=params %>"></c:set>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4>반복문</h4>
	<!-- 
		코어태그 내 속성 중 var 또는 var 로시작되는 속성명의 가지는 값은 
		EL로 접근 후에 활용(pageContest 내에 저장 pageContext.setAttribute("속성명", "값"))
		
		for(int i=0; i<=10 ; i++){}
		
		forEach : bean -  해당 반복문의 반복횟수 초기값
				  end  -  반복횟수 종료값
				  var  -  반복횟수가 저장되는 속성
				  step -  반복횟수의 증가값(default 1)
				  varStatus - 반복문의 상태
				  			  first  -  최초 반복일때  true
				  			  last   -  최종 반복일때  true
				 items  - 배열 또는 컬렉션(JCF) 			  
		if : test  -  해당 조건문을 실행하기 위한 조건식
			 var   -  해당 조건문의 test 속성의 결과		  
	 -->
	<c:forEach begin="0" end="10" step="3" var="i" varStatus="stat">
		<c:if test="${stat.first }">
			시작<br>
		</c:if>
		${i }<br>
		<c:if test="${stat.last }">
			끗<br>
		</c:if>
	</c:forEach>

	<!-- 
		forTokens : items - 대상문자열
					delims - 대상문자열에서 split을 위한 기준문자열
					ex) hosil.split(",")  =>  배열  =>  반복문   =-> 배역내에 인덱스에 순차접근 후 값을 var속성에 할당
	 -->
	<c:forTokens items="<%=hosil %>" delims="," var="ho">
		${ho }<br>	
	</c:forTokens>
<table>
	<thead>
		<tr>
			<th>아아디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>직업</th>
			<th>취미</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberList }" var="memberInfo"> 
		<tr>
			<td>${memberInfo.mem_id }</td>
			<td>${memberInfo.mem_pass }</td>
			<td>${memberInfo.mem_name }</td>
			<td>${memberInfo.mem_job }</td>
			<td>${memberInfo.mem_like }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<c:forEach items="${cookie }" var="currentCookie">
	쿠키 key : ${currentCookie.key } <br>
	쿠키 값   : ${currentCookie.value.value }<br>
</c:forEach>
<!-- 
	El 내 || == or
		 && == and
 -->
<c:set var="jumsu" value="83"></c:set>

<c:if test="${jumsu >= 90}">
	수<br>
</c:if>

<c:if test="${jumsu < 90 && jumsu >= 80}" var="result" scope="request">
	우<br>
</c:if>

<c:if test="${jumsu lt 80 and jumsu ge 70}">
	미<br>
</c:if>

<c:if test="${jumsu lt 70 }">
	분발바람<br>
</c:if>
${result }<br>

<!--  조건문  -->
<c:choose>
	<c:when test="${jumsu >= 90 }">수</c:when>
	<c:when test="${jumsu < 90 and jumsu >= 80}">우</c:when>
	<c:when test="${jumsu < 80 and jumsu >= 70}">미</c:when>
	<c:otherwise>분발합시다</c:otherwise>
</c:choose>
<br>
<!-- 
	out : value  -  선언위치에 출력될 값
		  default - value 속성을 통해 출력될 값
 -->
<c:out value="${jumsu }" default="대체값"></c:out><br>
<c:out value="${mem_id }" default="대체값"></c:out><br>
<c:out value="<script type='text/javascript'>alert('출력');</script> "></c:out><br>
<!-- <script type='text/javascript'>alert('출력');</script> -->
<!-- 
	main.jsp  jsp:include page="05/memberList.jsp"/
	import : url - 포워딩(컨텍스트 루트 | 패스가 생략) 대상 경로
			charEncoding  포워딩 대상 자원으로부터 컨텐츠 리딩시 적용될 인코딩 타입
			var - scope 속성을통해 저장영역에 포워딩 대상으로부터 취득한 컨텐츠를 저장시 "키"
			scope - 저장영역 
	param : import, url 태그 활용시 전탈 파라메터 형식 설정 
 -->
 <c:url var="gugudan" value="/01/gugudanResult.jsp">
 	<c:param name="dan" value="4"></c:param>
 </c:url><br>
 <a href="${gugudan }">클릭하면 구구단 4단이 출력</a><br>
<c:import url="/01/gugudanResult.jsp" charEncoding="UTF-8" var="gugudanResult" >
	<c:param name="dan" value="5"></c:param>
</c:import><br>
${gugudanResult }<br>

<!-- 
	url : var	- 해당 scope속성의 저장영역 내 value 속성의 갑 ㅅ을 저장시 키
	      value - 저장 값 
	      scope - 저장영역 
 -->
<c:url var="comment" value="/01/comment.jsp"></c:url>
<a href="${comment }">클릭하면 요청갑니다.</a><br>

<!-- 
	catch : var - 익셉션 발생 정보를 pageScope내에 저장하기 위한 키
 -->
<c:catch var="exceptionMsg">
	<% int i= 1/0; %>
</c:catch>
${exceptionMsg }<br>
${applicationScope.params["mem_id"] }<br>
${params["mem_id"] }<br>
</body>
</html>