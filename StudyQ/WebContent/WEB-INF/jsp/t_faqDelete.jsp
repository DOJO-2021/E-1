<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>講師用｜FAQ更新結果</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/t_faqRegistResult.css">
	<link rel="stylesheet" href="css/s_faqSearchResult.css">
</head>

<body>
	<jsp:include page="teacher_header.jsp" />
	<jsp:include page="teacher_menu.jsp" />

	<!-- メイン -->
	<section class="main1">
		<h3><span><c:out value="${result.title}" /></span></h3>
		<h4><c:out value="${result.message}" /></h4>

		<ul class="accordion-area">
				<li>
					<section>
				    	<p class="title"><span class="s_question">Q. </span><c:out value="${faq_title}"/></p>
				    	<div class="box">
					    	<p><span class="s_answer">A. </span><c:out value="${faq_ans}"/></p>
				    	</div>
					</section>
				</li>
		</ul>
		<div class="pagetop">
		<a href="${result.backTo}"> FAQ検索ページへ戻る</a>
		</div>
	</section>

	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<!-- jQuery -->
<script src="/StudyQ/jquery/jquery-3.6.0.min.js"></script>
<!-- アコーディオンで必要 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
'use strict';
//アコーディオンをクリックした時の動作
$('.title').on('click', function() {//タイトル要素をクリックしたら
	  var findElm = $(this).next(".box");//直後のアコーディオンを行うエリアを取得
	  $(findElm).slideToggle();//アコーディオンの上下動作

	  if($(this).hasClass('close')){//タイトル要素にクラス名closeがあれば
	    $(this).removeClass('close');//クラス名を除去し
	  }else{//それ以外は
	    $(this).addClass('close');//クラス名closeを付与
	  }
	});
//ページが読み込まれた際にopenクラスをつけ、openがついていたら開く動作※不必要なら下記全て削除
$(window).on('load', function(){
	$('.accordion-area li:first-of-type section').addClass("open"); //accordion-areaのはじめのliにあるsectionにopenクラスを追加
	$(".open").each(function(index, element){	//openクラスを取得
		var Title =$(element).children('.title');	//openクラスの子要素のtitleクラスを取得
		$(Title).addClass('close');				//タイトルにクラス名closeを付与し
		var Box =$(element).children('.box');	//openクラスの子要素boxクラスを取得
		$(Box).slideDown(500);					//アコーディオンを開く
	});
});

</script>
</body>
</html>