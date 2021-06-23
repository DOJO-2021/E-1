<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>研修生｜TOP</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/Top.css">
	<!-- 検索バーで必要 -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="student_header.jsp"/>

		<!-- メイン -->
		<section class="main1">
			<!-- 検索バー -->
			<div class="seach_ber">
				<form method="get" action="" class="search_container" style="margin: 0 0 0 auto;">
					<input type="text" size="25" name="search_word" placeholder="　調べたいことをキーワード検索">
					<input type="submit" value="&#xf002">
				</form>
			</div>
			<h3><span>スタディQAっしょんでできること</span></h3>


			<div class="student_top">
				<ul class="s_top_menu">
					<!-- FAQページ遷移 -->
					<li>
						<div class="container">
							<a href="/StudyQ/StudentFaqSearch" class="btn-border">
								<div><img src="image/icon2.png" width=100px height=auto alt="FAQ" ></div>
								<div class="tt1">-- FAQ --</div>
								<div class="tt2">研修生が講師によく聞く質問</div>
							</a>
						</div>
					</li>
					<!-- セッション予約ページ遷移 -->
					<li>
						<div class="container">
							<a href="/StudyQ/StudentReserve" class="btn-border">
								<div><img src="image/icon1.png" width=100px height=auto alt="セッション予約"></div>
								<div class="tt1">-- セッション予約 --<br></div>
								<div class="tt2">講師へ直接質問</div>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</section>

		<section class="main2">
			<h4>ただいまセッションの待ち人数</h4>
			<p>5人</p>
		</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>