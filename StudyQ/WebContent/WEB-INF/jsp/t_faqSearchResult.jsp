<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ検索結果</title>
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
				perPage: 5,
				prevText:'前へ',
				nextText:'次へ',
				firstLast: false,
				activeClass: 'navi-active',
			})
		});
	</script>
</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />

<!-- ヒット数 -->
<div class="s_searchresult">
	<p> ヒット数 : <c:out value="${hitcount} "/>　件 </p>
</div>

<!-- 検索ワード表示 -->
<p>検索ワード：<c:out value="${search_word} "/></p>

<!-- 変数 e, 引数 cardList を仮の値として設定する -->
<!-- FAQリスト -->
<div class="a">
<c:forEach var="e" items="${faqCategory}">
<form method="POST" action="/StudyQ/TeacherFaqDelete">
<div class="t_faqlist_body">
	<!-- のちにFAQのQ-Aをドロワー対応させるよう構成を変更する -->
	<dl class="t_faqlist_item">
		<dt><span></span><input type="hidden" name="faq_id" value="${e.faq_id}"></dt>
		<dt><span>Q</span><input type="text" name="faq_title" value="${e.faq_title}"></dt>
		<dd><span>A</span><input type="text" name="faq_ans" value="${e.faq_ans}"></dd>
	</dl>
	<input type="submit" name="SUBMIT" value="更新" class="faq_edit_btn">
	<input type="submit" name="SUBMIT" value="削除" class="faq_delete_btn">
</div>
</form>
</c:forEach>
</div>

<!-- 最上部に戻る -->
<!-- 保留 : "上に戻る"テキストはのちにimageに差し替える -->
<a href="#"> 上に戻る </a>

</body>
</html>