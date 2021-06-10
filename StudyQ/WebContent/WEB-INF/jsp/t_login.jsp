<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>講師｜ログイン</title>
</head>
<body>
	<!-- ここからメイン -->
	<main>
		<h2>ログイン</h2>

		<form method="POST" action="">

		<!-- 入力フォーム -->
		<input type="text" name="ID" placeholder="user ID"><br>
		<input type="password" name="PW" placeholder="password"><br>

		<!-- ログイン・リセットボタン -->
		<div>
			<input type="submit" name="login" value="ログイン">
			<input type="reset" id="reset" name="reset" value="リセット"><br>
		</div>

		<!-- 新規登録はこちら -->
		<a href="/StudyQ/StudentRegist.java">新規登録はこちら</a>

		<!-- 講師の方はこちら -->
		<a href="/StudyQ/TeacherLogin.java">講師の方はこちら</a>

		</form>
	</main>
</body>
</html>