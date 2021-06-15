<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜ログイン</title>
</head>
<body>
	<!-- ここからメイン -->
	<main>
		<h2>ログイン</h2>

		<form method="POST" action="/StudyQ/StudentLogin">

		<!-- 入力フォーム -->
		<input type="text" name="s_id" placeholder="user ID" class="login_id"><br>
		<input type="password" name="s_pw" placeholder="password" class="login_pw"><br>

		<!-- ログイン・リセットボタン -->
		<div>
			<input type="submit" name="login" value="ログイン" class="login_btn">
			<input type="reset" id="reset" name="reset" value="リセット" class="reset_btn"><br>
		</div>

		<!-- 新規登録はこちら -->
		<a href="/StudyQ/StudentRegist" class="s_regist_link">新規登録はこちら</a>

		<!-- 講師の方はこちら -->
		<a href="/StudyQ/TeacherLogin" class="t_login_link">講師の方はこちら</a>

		</form>
	</main>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>