<%--==============================================================
 * 게시판 로그아웃
 * @author 정희수
 * @since  2018.03.09.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.09.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	session.invalidate();
//  	response.sendRedirect("/12/main.jsp?message=로그아웃되었습니다");
 	
 
 %>
 <c:redirect url="/12/main.jsp">
 	<c:param name="message"  value="로그아웃 되었습니다."></c:param>	
 </c:redirect>
