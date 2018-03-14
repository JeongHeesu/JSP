<%--==============================================================
 * 파일 만들어서 파일들로 저장(엑셀,워드,한글)
 * @author 정희수
 * @since  2018.03.13.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.13. 	 정희수    	최초작성 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%-- <%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" --%>
<!--     pageEncoding="UTF-8"%> -->
<%-- <%@ page language="java" contentType="application/vnd.word; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="application/hwp; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	IMemberService service = IMemberServiceImpl.getInstance();	
	List<MemberVO> memberList = service.getMemberList();
	
	//파일 다운로드
	// Content-Disposition : attachment - 브라우저의 다울로드창 활성화를 통한 파일 다운로드
// 							 inline		- 브라우저 자체에 해당 파일의 컨텐츠를 직접 출력
// 	response.setHeader("Content-Disposition", "attachment;filename=members.xls");
// 	response.setHeader("Content-Discription", "Generate Excel File");
// 	response.setContentType("application/vnd.ms-excel");

// 	response.setHeader("Content-Disposition", "attachment;filename=members.doc");
// 	response.setHeader("Content-Discription", "Generate MSWord File");
// 	response.setContentType("application/vnd.ms-word");

	response.setHeader("Content-Disposition", "attachment;filename=members.hwp");
	response.setHeader("Content-Discription", "Generate HWP File");
	response.setContentType("application/hwp");
%>
<c:set var="memberList" value="<%=memberList %>"></c:set>
<table>
	<thead>
		<th>아이디</th>
		<th>이름</th>
		<th>주민번호1</th>
		<th>직업</th>
		<th>취미</th>
	</thead>

<tbody>
<c:forEach items="${memberList }" var="memberInfo">
	<tr>
		<td>${memberInfo.mem_id }</td>
		<td>${memberInfo.mem_name }</td>
		<td>${memberInfo.mem_regno1 }</td>
		<td>${memberInfo.mem_job }</td>
		<td>${memberInfo.mem_like }</td>
	</tr>
</c:forEach>
</tbody>
</table>