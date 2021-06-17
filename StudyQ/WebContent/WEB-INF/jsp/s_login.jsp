<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜ログイン</title>
	<link rel="stylesheet"  href="/StudyQ/css/login.css">
</head>
<jsp:include page="student_header.jsp"/>
<body>
	<!-- ここからメイン -->
	<main>
		<h1>ログイン</h1>

		<form method="POST" action="/StudyQ/StudentLogin" id="form">

		<!-- 入力フォーム -->
		<input type="text" name="s_id" placeholder="user ID" class="login_id"><br>
		<input type="password" name="s_pw" placeholder="password" class="login_pw"><br>

		<!-- ログイン・リセットボタン -->
		<div>
			<input type="submit" name="login" value="ログイン" class="login_btn">
			<input type="reset" id="reset" name="reset" value="リセット" class="reset_btn"><p id="output"></p><br>
		</div>

		<!-- 新規登録はこちら -->
		<a href="/StudyQ/StudentRegist" class="s_regist_link">新規登録はこちら</a>

		<!-- 講師の方はこちら -->
		<a href="/StudyQ/TeacherLogin" class="t_login_link">講師の方はこちら</a>

		</form>
	</main>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>