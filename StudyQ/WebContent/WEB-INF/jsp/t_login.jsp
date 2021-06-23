<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>講師｜ログイン</title>
	<link rel="stylesheet"  href="/StudyQ/css/login.css">
</head>
<body>
	<!-- ここからメイン -->
	<main>
	<div class="login_main">
		<h1>StudyQAっしょん</h1>

		<form method="POST" action="/StudyQ/TeacherLogin">

		<!-- 入力フォーム -->
		<input type="text" name="t_id" placeholder="user ID"><br>
		<input type="password" name="t_pw" placeholder="password"><br>

		<!-- ログイン・リセットボタン -->
		<div>
			<input type="submit" name="login" value="ログイン" class="login_btn">
		</div>

		<!-- 研修生の方はこちら -->
		<a href="/StudyQ/StudentLogin" class="s_login_link">研修生の方はこちら</a>

		</form>
	</div>
	</main>

</body>
</html>