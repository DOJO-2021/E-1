<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索結果</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<!-- ここからヘッダー -->
<jsp:include page="student_header.jsp"/>
<!-- ここからメイン -->
<jsp:include page="student_menu.jsp"/>
<h2 class="header_title">FAQ検索結果</h2>



  <input type="text" value="red" id="text1" maxlength="5" />
<input type="button" value="ボタン" onclick="clickBtn1()" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.4/css/all.css">

<div id="page_top"><a href="#"></a></div>

<!-- ここからフッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>