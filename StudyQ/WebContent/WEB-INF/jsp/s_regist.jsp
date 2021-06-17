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
		<jsp:include page="student_header.jsp"/>
		<main>
		<form action="/StudyQ/StudentRegist" method ="POST" onsubmit="return check()" name="new_resist" id="resist_form">
        <h1 class="header_title">新規登録</h1>
		<input name="s_l_name" type="text" class="s_registlist_item" placeholder="姓">
		<input name="s_f_name" type="text" class="s_registlist_item" placeholder="名">
	 	<input name="s_id" type="text" class="s_registlist_item" placeholder="ID">
		<input name="s_pw" type="text" class="s_registlist_item" placeholder="パスワード">
		<input type="text" name="s_pwc" class="s_registlist_item" placeholder="確認用"><br>
		<input type="submit" value="登録"><p id="output"></p><br><p id="regex"></p>
		</form>
		<a href="/StudyQ/StudentLogin" class="s_transition_btn">既にアカウントをお持ちの方はこちら</a>
		</main>
		<footer><jsp:include page="footer.jsp"/></footer>
		<script type="text/javascript" src="js/s_regist.js"></script>
	</body>
</html>