<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/s_faqSearchResult.css">
	<link rel="stylesheet" href="css/common.css">

	<!-- 検索バーで必要 -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

	<!-- アコーディオンパネルで必要 -->
	<link rel="stylesheet" type="text/css" href="https://coco-factory.jp/ugokuweb/wp-content/themes/ugokuweb/data/reset.css">

	<!-- ページャのデザイン -->
	<style>
		.pagination-container{
			margin-top: 15px;
			padding-top: 40px;
			border-top: 1px dashed #ccc;
		}
		.pagination-container ul{
			width: 100%;
			display: flex;
			justify-content: center;
		}
		.pagination-container li + li{ margin-left: -1px; }
		.pagination-container a{
			padding: 10px 20px;
			display: block;
			color: #0076BF;
			border: 1px solid #ccc;
			text-decoration: none;
			background: #fff;
		}
		.pagination-container .navi-active a{
			font-weight: bold;
			background: #fafafa;
		}
		.pagination-container a:hover{
			color: #fff;
			background: #0076bf;
		}
	</style>

	<!--  ページャーのためのjavascript -->
	<script src="/StudyQ/jquery/jquery-3.6.0.min.js"></script>
	<script src="/StudyQ/js/paginathing.min.js" charset="utf-8"></script>
	<script type="text/javascript">
		jQuery(function($) {
			$('.a').paginathing({
				perPage: 3,
				prevText:'前へ',
				nextText:'次へ',
				firstLast: false,
				activeClass: 'navi-active',
			})
		});
	</script>
</head>

<body>
	<!-- ここからヘッダー -->
	<jsp:include page="student_header.jsp"/>

	<!-- メイン -->
	<jsp:include page="student_menu.jsp"/>

	<section class="main1">
		<h2 class="header_title">FAQ検索</h2>
			<!-- 検索バー -->
			<form method="POST" action="/StudyQ/StudentFaqSearch" class="search_container">
				<input type="text" size="25" id="text" name="search_word" placeholder="　調べたいことをキーワード検索">
				<input type="submit" value="&#xf002">
			</form>

		<br>

		<!-- ボタンを押すと検索バーに値を設定 -->
		<!-- HTMLボタン -->
		<input type="button" value="HTML" onclick="clickBtn1()" />
		<script>
		  function clickBtn1() {
		    document.getElementById("text").value = "HTML";
		  }
		</script>

		<!-- CSSボタン -->
		<input type="button" value="CSS" onclick="clickBtn2()" />
		<script>
		  function clickBtn2() {
		    document.getElementById("text").value = "CSS";
		  }
		</script>

		<!-- javascriptボタン -->
		<input type="button" value="javascript" onclick="clickBtn3()" />
		<script>
		  function clickBtn3() {
		    document.getElementById("text").value = "javascript";
		  }
		</script>

		<!-- javaボタン -->
		<input type="button" value="java" onclick="clickBtn4()" />
		<script>
		  function clickBtn4() {
		    document.getElementById("text").value = "java";
		  }
		</script>

		<!-- SQLボタン -->
		<input type="button" value="SQL" onclick="clickBtn5()" />
		<script>
		  function clickBtn5() {
		    document.getElementById("text").value = "SQL";
		  }
		</script>

		<br>
		<br>

		<!-- eclipseボタン -->
		<input type="button" value="eclipse" onclick="clickBtn6()" />
		<script>
		  function clickBtn6() {
		    document.getElementById("text").value = "eclipse";
		  }
		</script>

		<!-- データベースボタン -->
		<input type="button" value="データベース" onclick="clickBtn7()" />
		<script>
		  function clickBtn7() {
		    document.getElementById("text").value = "データベース";
		  }
		</script>

		<!-- DAOボタン -->
		<input type="button" value="DAO" onclick="clickBtn8()" />
		<script>
		  function clickBtn8() {
		    document.getElementById("text").value = "DAO";
		  }
		 </script>

		  <!-- JSPボタン -->
			<input type="button" value="JSP" onclick="clickBtn9()" />
			<script>
			  function clickBtn9() {
			    document.getElementById("text").value = "JSP";
			  }
			</script>

			<!-- サーブレットボタン -->
			<input type="button" value="サーブレット" onclick="clickBtn10()" />
			<script>
		  		function clickBtn10() {
		    	document.getElementById("text").value = "サーブレット";
		  		}
			</script>


<!-- FAQ一覧表示 -->
<br>
<h2 class="header_title">FAQ一覧</h2>
	<c:forEach var="e" items="${faqList}" >
		<form method="GET" action="/StudyQ/StudentFaqSearch">
			<ul class="accordion-area">
				<li>
					<section>
					    <p class="title">Q.  <c:out value="${e.faq_title}"/></p>
					    <div class="box">
						    <p>A.  <c:out value="${e.faq_ans}"/> </p>
					    </div>
					</section>
				</li>
			</ul>
			</form>
		</c:forEach>
</section>

<!-- ここからフッター -->
<jsp:include page="footer.jsp"/>
<!--  <script type="text/javascript" src="js/s_faqSearch.js"></script>-->

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

	//ページが読み込まれた際にopenクラスをつけ、openがついていたら開く動作
	$(window).on('load', function(){
	  $('.accordion-area li:first-of-type section').addClass("open"); //accordion-areaのはじめのliにあるsectionにopenクラスを追加
	  $(".open").each(function(index, element){ //openクラスを取得
	    var Title =$(element).children('.title'); //openクラスの子要素のtitleクラスを取得
	    $(Title).addClass('close');       //タイトルにクラス名closeを付与
	    var Box =$(element).children('.box'); //openクラスの子要素boxクラスを取得
	    $(Box).slideDown(500);          //アコーディオンを開く
	  });
	});
</script>


</body>
</html>