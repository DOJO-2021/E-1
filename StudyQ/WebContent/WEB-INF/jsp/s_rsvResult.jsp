<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="jquery/jquery-3.6.0.min.js"></script>
<title>研修生|セッション予約完了</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="student_header.jsp"/>

<!-- メイン -->
<jsp:include page="student_menu.jsp"/>
<h2>セッションの予約が完了しました</h2>
<!-- <p><c:out value=""/>さん</p> -->
<form method="GET" action="/StudyQ/StudentReserve">
<table>
<tr>
	<th>件名</th>
	<td><c:out value="${rsv.subject}"/></td>
</tr>
<tr>
	<th>カテゴリ</th>
	<td><c:out value="${rsv.session_m_category}"/></td>
</tr>
<tr>
	<th>質問内容</th>
	<td><c:out value="${rsv.question}"/></td>
</tr>
<tr>
	<th>添付ファイル</th>
	<td><c:out value="${rsv.file}"/></td>
</tr>
</table>
</form>
<a href="/StudyQ/StudentTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>