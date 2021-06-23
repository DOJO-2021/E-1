<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="/test/Upload" enctype="multipart/form-data" method="post">
   <input type="file" name="files" multiple><br>
   <input type="submit" value="送信">
  </form>
<%
    String upload_files = (String) request.getAttribute("upload_files");
    if (upload_files != null) {
%>
<br>
<span style="color: #FF0000;">以下のファイルがアップロードされました。</span><br>
<%= upload_files %>
<% } %>
</body>
</html>