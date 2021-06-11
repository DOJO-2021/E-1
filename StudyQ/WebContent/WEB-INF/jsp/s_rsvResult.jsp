<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生|セッション予約完了</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="student_header.jsp"/>

<!-- メイン -->
<jsp:include page="menu.jsp"/>
<h2>セッション予約が完了しました</h2>
<p><c:out value="${}"/>さん</p>
<table>
<tr>
	<th>件名</th>
	<td></td>
</tr>
<tr>
	<th>カテゴリ</th>
	<td>

		学習内容
		トラブル
		その他

	</td>
</tr>
<tr>
	<th>質問内容</th>
	<td></td>
</tr>
<tr>
	<th>添付ファイル</th>
	<td></td>
</tr>
</table>
<a href="StudyQ/StudentTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>