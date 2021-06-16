<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜TOP</title>
</head>
<body>
	<jsp:include page="student_header.jsp"/>
	<!-- ここからメイン -->
	<main>
		<!-- 検索バー -->
		<input type="text" name="search_word">
		<!-- 検索ボタン -->
		<button type="button">検索</button>
		<!-- ログアウトボタン -->
		<form method="POST" action="/StudyQ/StudentLogin">
		<input type="submit"  value="ログアウト"><br>
		</form>

		<!-- セッション待ち人数表示 -->
		<h3>ただいまの待ち人数</h3>

		<ul class="s_top_menu">
			<!-- FAQページ遷移 -->
			<li><a href="/StudyQ/StudentFaqSearch" class=""><img src="image/" alt="FAQ" ></a></li>
			<!-- セッション予約ページ遷移 -->
			<li><a href="/StudyQ/StudentReserve"><img src="image/"  alt="セッション予約"></a></li>
		</ul>

	</main>
	<jsp:include page="footer.jsp"/>
</body>
</html>