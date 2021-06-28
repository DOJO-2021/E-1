<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ検索結果</title>
	<!-- CSSの適用 -->
	<link rel="stylesheet" href="css/s_faqSearchResult.css">
	<link rel="stylesheet" href="css/common.css">

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
		.t_faqlist_item {
			margin: 0 0 60px 0;
   			border: 2px solid #fff;
		}

		dt {
   			border-top: 2px solid #fff;
   			background: #009900;
   			padding: 10px;
   			color: #fff;
		}

		dt:first-child {
   			border-top: none;
		}

		dd {
  			display: none;
  			background: #e0eff5;
  			padding: 0px;
  			color: #222;
		}

		.s_searchresult,.a{
			display: block;
    		margin: auto;
    		height: auto;
    		width: 1120px;
    		background-color: #ffffff;
		}

		#foot {
			display: block;
    		margin: auto;
    		height: auto;
    		width: 1120px;
		}

		input .query_item{
				font-size:16px;			/*フォントサイズ*/
				border:1px solid #999999;	/*ボーダー*/
				padding:2px;
		}

		input .answer_item{
			font-size:16px;			/*フォントサイズ*/
			border:1px solid #999999;	/*ボーダー*/
			padding:2px;
		}

	</style>
	<!--  ページャーのためのjavascript -->
	<script src="/StudyQ/jquery/jquery-3.6.0.min.js"></script>
	<script src="/StudyQ/js/paginathing.min.js" charset="utf-8"></script>
	<script type="text/javascript">
		jQuery(function($) {
			$('.a').paginathing({
				perPage: 5,
				prevText:'前へ',
				nextText:'次へ',
				firstLast: false,
				activeClass: 'navi-active',
			})
		});
	</script>
	<script>
		$(function(){
   			$('.t_faqlist_item > dt').on('click',function(){
     		$(this).next('dd').slideToggle();
   			});
		});
	</script>
	<script type="text/javascript" src="js/faqCheck.js"></script>
</head>
<body>
	<!-- ここからヘッダー -->
	<jsp:include page="teacher_header.jsp" />
	<jsp:include page="teacher_menu.jsp" />

	<!-- ここからメイン -->
	<section class="main1">
		<h3><span>FAQ検索結果</span></h3>
			<!-- ヒット数 -->
			<div class="s_searchresult">
				<p class="hitcount">◆ ”${search_word}” の検索結果 :　${hitcount} 件 ◆</p>
			</div>

		<!-- 変数 e, 引数 cardList を仮の値として設定する -->
		<!-- FAQリスト -->

			<ul class="accordion-area">
			<div class="a">
				<c:forEach var="e" items="${faqCategory}">
					<div class="t_faqlist_body">
						<form method="POST" action="/StudyQ/TeacherFaqDelete">
							<li>
								<section>
									<!-- のちにFAQのQ-Aをドロワー対応させるよう構成を変更する
									<dl class="t_faqlist_item">
										<dt><span></span><input type="hidden" name="faq_id" value="${e.faq_id}"></dt>
										<dt><span>Q　</span><input style="width:1000px;line-height:18px;" type="text" name="faq_title" value="${e.faq_title}"></dt>
										<dd><span>A　</span><input style="width:1000px;line-height:18px;" type="text" name="faq_ans" value="${e.faq_ans}"><br>

											<input type="submit" name="SUBMIT" value="更新" class="faq_edit_btn">
											<input type="submit" name="SUBMIT" value="削除" class="faq_delete_btn">
										</dd>
									</dl>-->
									<input type="hidden" name="faq_id" value="${e.faq_id}">
									<p class="title"><span class="s_question">Q. </span><textarea name="faq_title" style="min-width: 650px; min-height: 30px;">${e.faq_title}</textarea></p>
							    	<div class="box">
								    	<p><span class="s_answer">A.  </span><textarea name="faq_ans" style="min-width: 650px; min-height: 100px;"><c:out value="${e.faq_ans}"/></textarea></p>
							    		<div class="btn_edit"><input type="submit" name="SUBMIT" value="更新" class="faq_edit_btn" onClick="return check2()"></div>
										<div class="btn_delete"><input type="submit" name="SUBMIT" value="削除" class="faq_delete_btn" onClick="return check3()"></div>
									</div>
								</section>
							</li>
						</form>
					</div>
				</c:forEach>
				</div>
			</ul>
			<div class="pagetop">
				<a href="#"> うえへ戻る↑ </a>
			</div>

	</section>
<footer>
	<div id="foot">
	<!-- 最上部に戻る -->
	<!-- 保留 : "上に戻る"テキストはのちにimageに差し替える -->
	<p style="text-align:center;margin-top:25px;">Copyright&copy; 2021 StudyQ E1 Team All Right Reserved.</p>
	</div>
</footer>
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


</script>
</body>
</html>