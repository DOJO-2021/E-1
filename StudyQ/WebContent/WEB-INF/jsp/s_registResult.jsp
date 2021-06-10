<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生|新規登録</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<p>以下の内容で登録しました。</p>
	<form method="GET" action="/StudyQ/StudentRegist">
		<table>
			<tr>
				<th>姓</th><td><c:out></c:out></td>
			</tr>
			<tr>
				<th>名</th><td><c:out></c:out></td>
			</tr>
			<tr>
				<th>ID</th><td><c:out></c:out></td>
			</tr>
		</table>
		<a href="/StudyQ/StudentLogin.java" class="s_transition_btn">ログインはこちら</a>
		</form>
</body>
</html>