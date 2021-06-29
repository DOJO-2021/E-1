<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜ログイン</title>
	<link rel="stylesheet"  href="/StudyQ/css/login.css">
</head>
<body>
	<header></header>
	<!-- ここからメイン -->
	<main>
		<div class="login_main">
			<h1><img src="image/studyQlogo1.png" width=200px height=auto></h1>

			<form method="POST" action="/StudyQ/StudentLogin" id="form">

				<!-- 入力フォーム -->
				<input type="text" name="s_id" placeholder="user ID" class="login_id"><br>
				<input type="password" name="s_pw" placeholder="password" class="login_pw"><br>

				<!-- ログイン・リセットボタン -->
				<div>
					<input type="submit" name="login" value="ログイン" class="login_btn">
				</div>
			</form>
			<!-- 新規登録はこちら -->
			<a href="/StudyQ/StudentRegist" class="s_regist_link" >新規登録はこちら</a><br>

			<p><span class="t_login_nav" style="letter-spacing: -0.2em;">——————— 　講 師 の 方 は こ ち ら　 ————————</span></p>
			<!-- 講師の方はこちら -->
				<button onclick="location.href='/StudyQ/TeacherLogin'" class="t_login_btn">講師用ログイン</button>
		</div>
	</main>
<!-- フッター -->
<script type="text/javascript" src="js/login.js"></script>
</body>
</html>