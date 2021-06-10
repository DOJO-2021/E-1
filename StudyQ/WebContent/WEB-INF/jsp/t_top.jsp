<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師｜TOP</title>
</head>
<body>
	<!-- ここからメイン -->
	<main>
		<!-- ログアウトボタン -->
		<input type="submit" class="t_top_logout">ログアウト<br>

		<!-- セッション待ち全体人数表示 -->
		<div class="session_view">
			<h3>ただいまの待ち人数</h3>
		</div>

		<ul>
			<!-- FAQページ遷移 -->
			<li><a href="/StudyQ/StudentFaqSearch.java" class="t_faq_menu"><img src="image/" alt="FAQ" ></a></li>
			<!-- セッション予約リストページ遷移 -->
			<li><a href="/StudyQ/StudentReserve.java" class="t_top_menu"><img src="image/"  alt="セッション予約リスト"></a></li>
		</ul>

	</main>
</body>
</html>