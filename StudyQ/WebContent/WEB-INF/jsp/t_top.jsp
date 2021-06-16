<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師｜TOP</title>
</head>
<body>
	<jsp:include page="teacher_header.jsp"/>
	<!-- ここからメイン -->
	<main>
		<!-- ログアウトボタン -->
		<form method="POST" action="/StudyQ/TeacherLogin">
		<input type="submit" value="ログアウト"><br>
		</form>
		<!-- セッション待ち全体人数表示 -->
		<div class="session_view">
			<h3>ただいまの待ち人数</h3>
		</div>

		<ul>
			<!-- FAQページ遷移 -->
			<li><a href="/StudyQ/TeacherFaqEdit" class="t_faq_menu"><img src="image/" alt="FAQ" ></a></li>
			<!-- セッション予約リストページ遷移 -->
			<li><a href="/StudyQ/TeacherReserveList" class="t_top_menu"><img src="image/"  alt="セッション予約リスト"></a></li>
		</ul>

	</main>
	<jsp:include page="footer.jsp"/>
</body>
</html>