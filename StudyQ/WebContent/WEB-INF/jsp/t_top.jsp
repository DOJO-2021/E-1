<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師｜TOP</title>
<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/Top.css">
</head>
<body>
	<jsp:include page="teacher_header.jsp"/>
	<!-- ヘッダー -->
		<section class="head">
			<!-- ロゴ -->
			<div class="logo">
				<img src="image/logo.jpg" width=300px height=auto>
			</div>
			<!-- ログアウトボタン --><!-- ドロワーメニュー -->
			<a href="/StudyQ/TeacherLogin" class="btn btn--orange btn--radius">ログアウト</a>
			<!-- ログアウトボタン -->
		<!-- <form method="POST" action="/StudyQ/TeacherLogin">
		<input type="submit" value="ログアウト"><br>
		</form> -->
			<div class="page_name">
				<font><img src="image/people_icon.png" width=25px height=auto>講師用ページ</font>
			</div>
				<!-- ナビゲーションバー -->
			<nav class="gnavi">
				<div class="gnavi_inner">
					<ul>
						<li><a href="#"><span>TOP</span></a></li>
						<li><a href="#"><span>FAQ</span></a>
							<ul class="two_dropdown">
								<li><a href="#"><span>内容１</span></a></li>
								<li><a href="#"><span>内容２</span></a></li>
							</ul>
						</li>
						<li><a href="#"><span>セッション予約</span></a></li>
						<li><a href="#"><span>講師の紹介</span></a></li>
						<li><a href="#"><span>お問い合わせ</span></a></li>
					</ul>
				</div>
			</nav>
		</section>

	<!-- ここからメイン -->
    <section class="main1">
	<!-- セッション待ち全体人数表示 -->
		<h3>スタディQAっしょんでできること</h3>
	    <div class="student_top">
		<ul class="s_top_menu">
			<!-- FAQページ遷移 -->
			<li>
				<div class="container">
					<a href="/StudyQ/TeacherFaqEdit" class="btn-border">
						<div><img src="image/icon2.png" width=100px height=auto alt="FAQ" ></div>
						<div class="tt1">-- FAQ --</div>
						<div class="tt2">FAQの登録・編集</div>
					</a>
			    </div>
			</li>
			<!-- セッション予約リストページ遷移 -->
			<li>
				<div class="container">
					<a href="/StudyQ/TeacherReserveList" class="btn-border">
						<div><img src="image/icon1.png" width=100px height=auto  alt="セッション予約リスト"></div>
						<div class="tt1">-- セッション予約リスト --<br></div>
						<div class="tt2">予約リストの確認</div>
					</a>
				</div>
			</li>
		</ul>
		</div>
	</section>

	<section class="main2">
	<h3>ただいまの待ち人数</h3>
	<p>5人</p>
	</section>

	<jsp:include page="footer.jsp"/>
</body>
</html>