<%--==============================================================
 * EL 언어
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
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,String> params = new HashMap<String, String>();
	params.put("mem_id", "a001");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	pageContext.setAttribute("pageMemberInfo", memberInfo);
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo", memberInfo);
	
	String[] hosils = {"201호", "202호" ,"203호", "204호", "205호"};
	pageContext.setAttribute("hosils", hosils);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>EL을 활용한 사칙연산, 비교연산</h4>
	<table border="1" width="300px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<td><%=3+2 %></td>
			<td>${3+2}</td>
		</tr>
		<tr>
			<td>\${ 3 - 2 }</td>
			<td>${3-2}</td>
		</tr>
		<tr>
			<td>\${ 3 * 2 }</td>
			<td>${3*2}</td>
		</tr>
		<tr>
			<td>\${ 3 div 2 }</td>
			<td>${3 div 2}</td>
		</tr>
		<tr>
			<td>\${ 3 mod 2 }</td>
			<td>${3 mod 2}</td>
		</tr>
		<tr>
			<td>\${ 3 > 2 }</td>
			<td>${3 > 2}</td>
		</tr>
		<tr>
			<td>\${ 3 gt 2 }</td>
			<td>${3 gt 2}</td>
		</tr>
		<tr>
			<td>\${ 3 >= 2 }</td>
			<td>${3 >= 2}</td>
		</tr>
		<tr>
			<td>\${ 3 ge 2 }</td>
			<td>${3 ge 2}</td>
		</tr>
		<tr>
			<td>\${ 3 < 2 }</td>
			<td>${3 < 2}</td>
		</tr>
		<tr>
			<td>\${ 3 lt 2 }</td>
			<td>${3 lt 2}</td>
		</tr>
		<tr>
			<td>\${ 3 <= 2 }</td>
			<td>${3 <= 2}</td>
		</tr>
		<tr>
			<td>\${ 3 le 2 }</td>
			<td>${3 le 2}</td>
		</tr>
		<tr>
			<td>\${ 3 == 2 }</td>
			<td>${3 == 2}</td>
		</tr>
		<tr>
			<td>\${ 3 != 2 }</td>
			<td>${3 != 2}</td>
		</tr>
	</table>
	<hr color="red">
	<h4>EL을 활용한 요청 헤더 취득</h4>
	<table border="1" width="600px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<td><%=request.getHeader("User-Agent") %></td>
			<td>${header["user-agent"]}</td>
		</tr>
		<tr>
			<td>/${header["host"] }</td>
			<td>${header["host"]}</td>
		</tr>
	</table>
	<hr color="red">
	<h4>EL을 활용한 web.xml내 선언된 상수취득</h4>
	<table border="1" width="600px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<td><%=application.getInitParameter("oracleDriver") %></td>
			<td>${initParam.oracleDriver }</td>
		</tr>
		<tr>
			<td>\${initParam.oracleURL }</td>
			<td>${initParam.oracleURL }</td>
		</tr>
	</table>
	<hr color="red">
	<h4>EL을 활용한 기본객체(9개)의 getter  정보 취득</h4>
	<table border="1" width="600px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<!-- 기본객체 pageContext(전체 기본객체에서 8개의 기본객체 취득)를  반드시
				활용해서 기본객체에 접근
			 -->
			<td><%=request.getContextPath() %></td>
			<td>${pageContext.request.contextPath }</td>
		</tr>
		<tr>
			<td><%=request.getProtocol() %></td>
			<td>${pageContext.request.protocol }</td>
		</tr>
		<tr>
			<td><%=request.getRemoteAddr() %></td>
			<td>${pageContext.request.remoteAddr }</td>
		</tr>
		<tr>
			<!--
				기본객체의 getter 접근시 해당 getter 가 파라메터 요구시에는 
				해당 메서드 요구
			 -->
			<td><%=application.getRealPath("") %></td>
			<td>${pageContext.servletContext.getRealPath('') }</td>
		</tr>
	</table>
	<hr color="red">
	<h4>EL을 활용한 요청시 파라메터 취득</h4>
	<!-- 
		http:/localhost.ddit/11/expressionLanguage.jsp?mem_id=a001&mem_pass=asdfasdf
	 -->
	<table border="1" width="600px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<td><%=request.getParameter("mem_id") %></td>
			<td>${param.mem_id }</td>
		</tr>
		<tr>
			<td>\${param.mem_pass }</td>
			<td>${param.mem_pass }</td>
		</tr>
	</table>
	<hr color="red">
	<h4>EL을 활용한 저장역역(Scope)을 포함하는 기본객체 접근</h4>
	<div style="height: auto; width: 100%; border:1px solid pink;">
	<!-- 
		pageContext : ${pageScope}
		requet 		: ${requestScope}
		session 	: ${sessionScope}
		application : ${applicationScope}
		* 개별 저장역역 접근 명시적선언이 생략 가능
	 -->
	<h5>pageContext&pageScope</h5>
	pageContext id: <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_id() %><br>	
	pageContext pwd : <%=((MemberVO)pageContext.getAttribute("pageMemberInfo")).getMem_pass() %><br>	
	pageScope id : ${pageScope.pageMemberInfo.mem_id }<br>
	pageScope pwd : ${pageScope.pageMemberInfo.mem_pass }<br>
	implicit pageScope id : ${pageMemberInfo.mem_id  }<br>
	implicit pageScope pwd : ${pageMemberInfo.mem_pass  }<br>
	<hr color="pink">	
	<h5>request&requestScope</h5>
	request id: <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_id() %><br>	
	request pwd : <%=((MemberVO)request.getAttribute("reqMemberInfo")).getMem_pass() %><br>	
	requestScope id : ${requestScope.reqMemberInfo.mem_id }<br>
	requestScope pwd : ${requestScope.reqMemberInfo.mem_pass }<br>
	implicit requestScope id : ${reqMemberInfo.mem_id  }<br>
	implicit requestScope pwd : ${reqMemberInfo.mem_pass  }<br>	
	<hr color="pink">	
	<h5>sessionScope</h5>	
	sessionScope id : ${sessionScope.sesMemberInfo.mem_id }<br>
	sessionScope pwd : ${sessionScope.sesMemberInfo.mem_pass }<br>
	implicit sessionScope id : ${sesMemberInfo.mem_id  }<br>
	implicit sessionScope pwd : ${sesMemberInfo.mem_pass  }<br>		
	<hr color="pink">	
	<h5>applicationScope</h5>		
	applicationScope id : ${applicationScope.appMemberInfo.mem_id }<br>
	applicationScope pwd : ${applicationScope.appMemberInfo.mem_pass }<br>
	implicit applicationScope id : ${appMemberInfo.mem_id  }<br>
	implicit applicationScope pwd : ${appMemberInfo.mem_pass  }<br>	
	<hr color="pink">	
	<h5>expression</h5>
	<!-- EL에서 zero length String, Null은 공백으로 처리 -->
	expression : <%=request.getAttribute("memberInfo") %><br>
	expression language : ${requestScope.memberInfo.mem_id }<br>
	<%
		request.setAttribute("memberInfo", memberInfo);
	%>
	<!-- 
		EL에서 Scope 영역을 포함하는 기본객체 접근시 Scope명 생략되면 
		pageScope -> requestScope -> sessionScope -> applicationScpe 
		(없으면 다음 scope 로 넘어가서 결과값을 수행, 마지막 어플까지간다...implicit 사용할때는 저장영역의 활용범위 고려해서 사용하기)  
	 -->
	
	implicit requestScope id : ${reqMemberInfo.mem_id  }<br>
	implicit requestScope pwd : ${reqMemberInfo.mem_pass  }<br>	
	</div>	
	<hr color="red">
	<h4>EL을 활용한 쿠키 접근</h4>
	쿠키 취득 : <%=request.getCookies()[0] %><br>
	EL id : ${cookie.mem_id.value }	
	<hr color="red">
	<h4>EL을 활용한 배열 또는 컬렉션 접근</h4>
	203호 : <%=hosils[2] %><br>
		
	<!-- 
		EL에 정의된 키워드와  Scope영역 외에 일반 객체 및 값의 접근은 Scope영역에 저장 후에 활용
	 -->
	EL : ${pageScope.hosils[2] }<br>
	
	<hr color="red">
	<h4>EL을 활용한 Null 처리</h4>
	<table border="1" width="600px">
		<tr>
			<td>표현언어</td>
			<td>결과값</td>
		</tr>
		<tr>
			<td><%=(pageContext.getAttribute("memberInfo")  != null) ? false : true %></td>
			<td>${memberInfo!= null }</td>
		</tr>
		<tr>
			<td>\${memberInfo!= null }</td>
			<td>${!empty memberInfo}</td>
		</tr>
		<tr>
			<td>\${memberInfo!= null }</td>
			<td>${not empty memberInfo}</td>
		</tr>
		<tr>
			<td>\${memberInfo == null }</td>
			<td>${ empty memberInfo }</td>
		</tr>
		<tr>
			<td>\${memberInfo == null }</td>
			<td>${ empty memberInfo ? '널' : '널아님'}</td>
		</tr>
	</table>
		
		
		
		
		
		
		
		
		
</body>
</html>