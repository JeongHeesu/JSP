<%--==============================================================
 * application 저장매체 확인
 * @author 정희수
 * @since  2018.02.22.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22. 	 정희수    	최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     _jspServic(request, response){ -->
<!--     ~~~~ 다있음 -->
<%
//내장객체임	
// pageContext.getServletContext();
	System.out.println("콘솔 방향의 로그 작성 ");
	//실제 서버 배포후 서비스 중에 apllication의 log() 출력되는 메시지는
	//서버 설치 폴더 /logs/파일로 출력
	application.log("출력 정보 레벨의 로그 작성 : ");
	
	out.println("oracleDriver : " + application.getInitParameter("oracleDirver")+"<br>");
	out.println("oracleURL : " + application.getInitParameter("oracleURL")+"<br>");
	out.println("mySqlDriver : " + application.getInitParameter("mysqlDriver")+"<br>");
	out.println("mysqlURL : " + application.getInitParameter("mysqlURL")+"<br>");
	
	out.println("어플리케이션 배포 위치 : " + application.getRealPath("")+"<br>");
	out.println("서블릿 버전 : " + application.getMajorVersion()+"."+application.getMinorVersion()+"<br>");
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String buffer ="";
	BufferedReader reader = new BufferedReader(
									new InputStreamReader(
											new FileInputStream(
													application.getRealPath("/04/readme.txt")),"UTF-8"));
	while((buffer = reader.readLine())!=null){
%>
	<%= buffer %> <br>
	
<%		
	}
	
	String dummy = "";
	//http://localhost/ddit/04/readme.txt
	URL url = application.getResource("/04/readme.txt");
	
	BufferedReader urlReader = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
	while((dummy = urlReader.readLine() ) != null){
%>
		<%= dummy %><br>
<%
	}
	
%>
</body>
</html>