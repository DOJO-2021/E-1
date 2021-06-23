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
	<form method="POST" action="/StudyQ/TeacherFaqEdit" class="search_container">
		<input type="text" size="25" id="text" name="search_word" placeholder="　調べたいことをキーワード検索">
		<input type="submit" value="検索">
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