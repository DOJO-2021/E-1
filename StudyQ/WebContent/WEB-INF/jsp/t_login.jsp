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

		<form method="POST" action="/StudyQ/TeacherLogin">

		<!-- 入力フォーム -->
		<input type="text" name="t_id" placeholder="user ID"><br>
		<input type="password" name="t_pw" placeholder="password"><br>

		<!-- ログイン・リセットボタン -->
		<div>
			<input type="submit" name="login" value="ログイン" class="login_btn">
			<input type="reset" name="reset" value="リセット" class="reset_btn"><br>
		</div>

		<!-- 研修生の方はこちら -->
		<a href="/StudyQ/StudentLogin" class="s_login_link">研修生の方はこちら</a>

		</form>
		<jsp:include page="footer.jsp"/>
	</main>
</body>
</html>