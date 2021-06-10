<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>研修生|</title>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<h2 class="header_title">新規登録</h2>
		<p class="s_sub_title">以下の項目にご記入の上、「登録」ボタンを押してください。</p>
		<form action="">
		<table>
			<tr>
				<th>姓</th><td><input type="text"></td>
			</tr>
			<tr>
				<th>名</th><td><input type="text"></td>
			</tr>
			<tr>
				<th>ID</th><td><input type="text"></td>
			</tr>
			<tr>
				<th>パスワード</th><td><input type="text"></td>
			</tr>
			<tr>
				<th>確認用</th><td><input type="text"></td>
			</tr>
		</table>
		</form>
		<input type="submit">
		<a>既にアカウントをお持ちの方はこちら</a>
		<jsp:include page="footer.jsp"/>
	</body>
</html>