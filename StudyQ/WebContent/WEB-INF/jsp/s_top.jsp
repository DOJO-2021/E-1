<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜TOP</title>
</head>
<body>
	<!-- ここからメイン -->
	<main>
		<!-- 検索バー -->
		<input type="text" name="search_word">
		<!-- 検索ボタン -->
		<button type="button">検索</button>
		<!-- ログアウトボタン -->
		<button type="button">ログアウト</button><br>

		<!-- セッション待ち人数表示 -->
		<h3>ただいまの待ち人数</h3>


		<!-- FAQページ遷移 -->
		<a href="/StudyQ/StudentFaqSearch.java"><img src="image/" alt="FAQ" ></a>
		<!-- セッション予約ページ遷移 -->
		<a href="/StudyQ/StudentReserve.java"><img src="image/"  alt="セッション予約"></a>

	</main>
</body>
</html>