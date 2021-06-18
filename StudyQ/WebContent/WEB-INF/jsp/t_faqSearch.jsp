<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- CSS適用 -->
	<link rel="stylesheet"  href="/StudyQ/css/common.css">

	<title>講師 | FAQ検索</title>
</head>
<body>
	<!-- ここからヘッダー -->
	<jsp:include page="teacher_header.jsp" />

	<!-- ここからメイン -->
	<jsp:include page="teacher_menu.jsp" />

	<!-- 検索バー -->
	<form  method="POST" action="/StudyQ/TeacherFaqEdit">

			<input type="search" placeholder="キーワードを入力">
			<input type="submit" value="検索">


	<!-- FAQカテゴリ検索ボタン -->
	<div class="category_search">
			<section>
				<div name="category_bar1">
					<h3 class="title">学習内容</h3>
					<ul class="hidden">
						<div class="box">
							<li><a href="">プログラミング言語</a></li>
							<li><a href="">段位認定</a></li>
							<li><a href="">ドリル</a></li>
							<li><a href="">コードエラー</a></li>
							<li><a href="">その他</a></li>
						</div>
					</ul>
				</div>
			</section>
			<section>
				<div name="category_bar2">
					<h3>トラブル</h3>
					<ul class="hidden">
						<div class="box">
							<li><a href="">エディター</a></li>
							<li><a href="">PC</a></li>
							<li><a href="">Github</a></li>
							<li><a href="">その他</a></li>
						</div>
					</ul>
				</div>
			</section>
			<section>
				<div name="category_bar3">
					<h3>その他・相談</h3>
					<ul class="hidden">
						<div class="box">
							<li><a href="">相談等</a></li>
						</div>
					</ul>
				</div>
			</section>
	</div><!-- category_search -->

</form>

	<!-- FAQ新規登録ボタン -->
	<div class="faq_regist_btn" >
		<a href="/StudyQ/TeacherFaqRegist">FAQ新規登録する</a>
	</div>

	<!-- 先頭ページへ戻る -->
	<div id="page_top"><a href="#"></a></div>

	<!-- ここからフッター -->
	<jsp:include page="footer.jsp" />
<!-- 	<script>
		jQuery(function() {
		  var appear = false;
		  var pagetop = $('#page_top');
/*		  $(window).scroll(function () {
		    if ($(this).scrollTop() > 100) {  //100pxスクロールしたら
		      if (appear == false) {
		        appear = true;
		        pagetop.stop().animate({
		          'bottom': '50px' //下から50pxの位置に
		        }, 300); //0.3秒かけて現れる
		       }
		     } else {
		      if (appear) {
		        appear = false;
		        pagetop.stop().animate({
		          'bottom': '-50px' //下から-50pxの位置に
		        }, 300); //0.3秒かけて隠れる
		      }
		    }
		  });*/
		  pagetop.click(function () {
		    $('body, html').animate({ scrollTop: 0 }, 500); //0.5秒かけてトップへ戻る
		    return false;
		  });
		});
	</script> -->
<script src="/StudyQ/jquery/jquery-3.6.0.min.js"></script>
<script>
'use strict';

$(document).ready(function(){
	$('.category_bar1 h3').on('click', function(){
		$(this).next().toggleClass('hidden');
	});
});
</script>

</body>
</html>