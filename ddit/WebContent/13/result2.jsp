<%--==============================================================
 * 브라우저 파일 다운로드2
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
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper(request); ->파일 업로드시 필터가 하니까 필요 없다.
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;
	String mem_id = wrapper.getParameter("mem_id");
	String mem_pass =wrapper.getParameter("mem_pass");
	String mem_name =wrapper.getParameter("mem_name");

	out.println("mem_id : " + mem_id + "<br>");
	out.println("mem_pass : " + mem_pass + "<br>");
	out.println("mem_name : " + mem_name + "<br>");
	
	String savePath = GlobalConstant.SAVE_PATH;
	
	FileItem[] items = wrapper.getFileitemValues("files");
	for(FileItem item : items){
// 		String fileName = item.getName().substring(item.getName().lastIndexOf("\\")+1);
		String fileName = FilenameUtils.getName(item.getName());
		String baseName = FilenameUtils.getBaseName(fileName);
		String extensionName = FilenameUtils.getExtension(fileName);
		
		out.println("fileName : " + fileName + " |  baseName : " + baseName + " | extension : " + extensionName);
		
		pageContext.setAttribute("fileName", fileName);
		
		File saveFile = new File(savePath, fileName);
		
		item.write(saveFile);
	}
	
%>
<html>
<body>
<img src="/image/${fileName }" alt="힝" width="200" 
	onclick="javascript:location.href='${pageContext.request.contextPath}/13/fileDownload.jsp?fileName=${fileName }';" }/>
</body>
</html>