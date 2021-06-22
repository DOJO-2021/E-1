<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="/StudyQ/css/t_rsvListResult.css">
<title>講師|セッション予約リスト詳細</title>
</head>
<body>
<h2><span><c:out value="${ssnD.s_name}"/></span>さんの予約詳細</h2>
<table class="list">
	<tr>
		<th>件名</th>
		<td><c:out value="${ssnD.subject}"/></td>
	</tr>
	<tr>
		<th>カテゴリ</th>
		<td class="category">
			<c:choose>
					<c:when test="${ssnD.session_m_category == 0}"> プログラミング言語 </c:when>
					<c:when test="${ssnD.session_m_category == 1}"> 段位認定 </c:when>
					<c:when test="${ssnD.session_m_category == 2}"> ドリル </c:when>
					<c:when test="${ssnD.session_m_category == 3}"><img src="image/icon4.png" width=50px height=auto> コードエラー </c:when>
					<c:when test="${ssnD.session_m_category == 4}"> その他 </c:when>
					<c:when test="${ssnD.session_m_category == 5}"> エディタ </c:when>
					<c:when test="${ssnD.session_m_category == 6}"> PC </c:when>
					<c:when test="${ssnD.session_m_category == 7}"> GitHub </c:when>
					<c:when test="${ssnD.session_m_category == 8}"> その他 </c:when>
					<c:when test="${ssnD.session_m_category == 9}"> 相談等 </c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<th>質問内容</th>
		<td><c:out value="${ssnD.question}"/></td>
	</tr>
	<tr>
		<th>添付ファイル</th>
		<td><c:out value="${ssnD.file}"/></td>
	</tr>
</table>

</body>
</html>