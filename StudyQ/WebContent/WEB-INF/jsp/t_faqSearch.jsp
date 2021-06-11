<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ検索</title>
</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />

<!-- 検索バー＆検索ボタン -->
<form  method="get" action="/StudyQ/t_faqSearchResult.jsp">
<div class="t_search_body">
	<div class="t_search_bar">
		<input type="search">
	</div>
	<div class="t_search_btn">
		<input type="button" value="検索">
	</div>
</div>

<!-- FAQカテゴリ検索ボタン --> <!-- 保留 : 絞り込み検索機能 -->
<!-- 大カテゴリ -->
<div class="category_drawer_bar">
	<div class="category_drawer_bar_1">
		<span>・学習内容 </span>
	</div>
	<div class="category_drawer_bar_2">
	 	<span>・トラブル </span>
	</div>
	<div class="category_drawer_bar_3">
		<span> ・その他 </span>
	</div>
</div>
<!-- 中カテゴリ -->
<!-- 学習内容 -->
<div class=category_drawer_item_1>
	<div class="category_drawer_item_1a">
		<span> プログラミング言語 </span>
	</div>
	<div class="category_drawer_item_1b">
		<span> 段位認定 </span>
	</div>
	<div class="category_drawer_item_1c">
		<span> ドリル </span>
	</div>
	<div class="category_drawer_item_1d">
		<span> コードエラー </span>
	</div>
	<div class="category_drawer_item_1e">
		<span> その他 </span>
	</div>
</div>
<!-- トラブル -->
<div class=category_drawer_item_2>
	<div class="category_drawer_item_2a">
		<span> エディタ </span>
	</div>
	<div class="category_drawer_item_2b">
		<span> PC </span>
	</div>
	<div class="category_drawer_item_2c">
		<span> GitHub </span>
	</div>
	<div class="category_drawer_item_2d">
		<span> その他 </span>
	</div>
</div>
<!-- その他 -->
<div class=category_drawer_item_3>
	<div class="category_drawer_item_3a">
		<span> 相談 </span>
	</div>
	<div class="category_drawer_item_3b">
		<span> その他 </span>
	</div>
</div>
</form>

<!-- FAQ新規登録ボタン -->
<form action="/studyQ/t_faqRegist.jsp">
<div class="faq_regist_btn" >
	<input type="submit" value="FAQ新規登録する">
</div>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>