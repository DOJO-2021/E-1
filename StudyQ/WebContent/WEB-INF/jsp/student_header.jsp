<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- フレキシブルデザイン -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
<!-- ヘッダー -->
 <header>

	<section class="head">
		<!-- ロゴ -->
		<div class="logo">
			<a href="/StudyQ/StudentTop"><img src="image/logo.jpg" width=300px height=auto></a>
		</div>

		<!-- ログアウトボタン --><!-- ドロワーメニュー -->
		<div class="hidden">
			<a href="/StudyQ/Logout" class="btn btn--orange btn--radius">ログアウト</a>
		</div>
		<div class="page_name">
			<font><img src="image/people_icon.png" width=25px height=auto>研修生用ページ</font>
		</div>


		<!-- 研修生名の表示 -->
		<div class="name">
			<p>ようこそ<c:out value="${s_name}"/>さん！</p>
		</div>
		<!-- ナビゲーションバー -->
		<div class="hidden">
			<nav class="gnavi">
				<div class="gnavi_inner">
					<ul>
						<li><a href="/StudyQ/StudentTop"><span>TOP</span></a></li>
						<li><a href="/StudyQ/StudentFaqSearch"><span>FAQ</span></a>
							<ul class="two_dropdown">
								<li><a href="/StudyQ/StudentFaqSearch"><span>検索</span></a></li>
							</ul>
						</li>
						<li><a href="/StudyQ/StudentReserve" ><span>セッション予約</span></a></li>
						<li><a href="#" ><span>講師の紹介</span></a></li>
						<li><a href="#"><span>お問い合わせ</span></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</section>
<script type="text/javascript" src="js/header.js"></script>
</header>