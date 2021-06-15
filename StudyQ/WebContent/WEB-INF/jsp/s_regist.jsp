<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>研修生|新規登録</title>
	</head>
	<body>
		<jsp:include page="student_header.jsp"/>
		<h2 class="header_title">新規登録</h2>
		<p class="s_sub_title">以下の項目にご記入の上、「登録」ボタンを押してください。</p>
		<form action="/StudyQ/StudentRegist" method ="POST">
		<table>
			<tr>
				<th>姓</th><td><input name="s_l_name" type="text" class="s_registlist_item"></td>
			</tr>
			<tr>
				<th>名</th><td><input name="s_f_name" type="text" class="s_registlist_item"></td>
			</tr>
			<tr>
				<th>ID</th><td><input name="s_id" type="text" class="s_registlist_item"></td>
			</tr>
			<tr>
				<th>パスワード</th><td><input name="s_pw" type="text" class="s_registlist_item"></td>
			</tr>
			<tr>
				<th>確認用</th><td><input type="text" class="s_registlist_item"></td>
			</tr>
		</table>
		<input type="submit" value="登録"><br>
		</form>
		<a href="/StudyQ/StudentLogin" class="s_transition_btn">既にアカウントをお持ちの方はこちら</a>
		<jsp:include page="footer.jsp"/>
	</body>
</html>