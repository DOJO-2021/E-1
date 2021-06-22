<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ヘッダー -->
 <header>

	<section class="head">
		<!-- ロゴ -->
		<div class="logo">
			<a href="/StudyQ/TeacherTop"><img src="image/logo.jpg" width=300px height=auto></a>
		</div>
		<!-- ログアウトボタン --><!-- ドロワーメニュー -->
		<a href="/StudyQ/Logout" class="btn btn--orange btn--radius">ログアウト</a>
			<div class="page_name">
				<font><img src="image/people_icon.png" width=25px height=auto>講師用ページ</font>
			</div>
				<!-- ナビゲーションバー -->
			<nav class="gnavi">
				<div class="gnavi_inner">
					<ul>
						<li><a href="/StudyQ/TeacherTop"><span>TOP</span></a></li>
						<li><a href="/StudyQ/TeacherFaqEdit"><span>FAQ</span></a>
							<ul class="two_dropdown">
								<li><a href="/StudyQ/TeacherFaqEdit"><span>検索</span></a></li>
								<li><a href="/StudyQ/TeacherFaqRegist"><span>登録</span></a></li>
							</ul>
						</li>
						<li><a href="/StudyQ/TeacherReserveList" ><span>セッション予約リスト</span></a></li>
						<li><a href="#" ><span>クラス一覧</span></a></li>
						<li><a href="#"><span>お問い合わせ</span></a></li>
					</ul>
				</div>
			</nav>
		</section>

</header>