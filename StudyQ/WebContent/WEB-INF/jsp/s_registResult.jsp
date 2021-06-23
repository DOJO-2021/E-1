<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生|新規登録</title>
<link rel="stylesheet"  href="/StudyQ/css/login.css">
</head>
<body>
	<main>
		<div class="login_main">
		<h1>StudyQAっしょん</h1>
		<p>以下の内容で登録しました。</p>

		<input type="text" value="姓：　${Student.s_l_name}" readonly><br>
		<input type="text" value="名：　${Student.s_f_name}" readonly><br>
		<input type="text" value="ID：　${Student.s_id}" readonly><br>

			<br><p><span class="t_login_nav" style="letter-spacing: -0.2em;">———————  ロ グ イ ン ペ ー ジ に 戻 る  ————————</span></p>
			<button onclick="location.href='/StudyQ/StudentLogin'" class="s_regist_result_btn">研修生　ログイン</button>
		</div>
	</main>
</body>
</html>