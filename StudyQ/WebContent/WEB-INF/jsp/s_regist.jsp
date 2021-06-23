<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action="/StudyQ/StudentRegist" method ="POST" onsubmit="return check()" name="new_regist" id="regist_form">
		        <h1 class="header_title">新規登録</h1>
				<input name="s_l_name" type="text" class="s_registlist_item" placeholder="姓" required>
				<input name="s_f_name" type="text" class="s_registlist_item" placeholder="名" required>
			 	<input name="s_id" type="text" class="s_registlist_item" placeholder="ID" required>
				<input name="s_pw" type="password" class="s_registlist_item" placeholder="パスワード" required>
				<input type="password" name="s_pwc"   class="s_registlist_item" placeholder="確認用" required><br>
				<input type="submit" value="登録"><!-- <p id="output"></p><br><p id="regex"></p><br><p id="passc"></p> -->
			</form>
			<a href="/StudyQ/StudentLogin" class="s_transition_btn">アカウントをお持ちの方はこちら</a>
		</div>
		</main>

		<script type="text/javascript" src="js/s_regist.js"></script>
	</body>
</html>