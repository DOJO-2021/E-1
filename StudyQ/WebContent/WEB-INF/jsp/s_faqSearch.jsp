<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script type="text/javascript" src="s_faqSearch.js"></script>
</head>
<body>
<!-- ここからヘッダー -->
<jsp:include page="student_header.jsp"/>
<!-- ここからメイン -->
<jsp:include page="menu.jsp"/>
<h2 class="header_title">FAQ検索</h2>
<form method="POST" action="/StudyQ/StudentFaqSearch.java">
<input type="text" id="text1" maxlength="5" placeholder="キーワードを入力">
<input type="button" value="検索" onclick="clickBtn1()" />


  <br><br>
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

<!-- ボタン１個目 -->
  <select class="s_categorysearch_btn "name=”category” onChange="top.location.href=value">
    <option value=”study”>学習内容</option>
    <option value=””>プログラミング言語</option>
    <option value=””>段位認定</option>
    <option value=””>ドリル</option>
    <option value=””>コードエラー</option>
  </select>

<!-- ボタン２個目 -->
  <select class="s_categorysearch_btn" name=”trouble” onChange="top.location.href=value">
    <option value=”trouble”>トラブル</option>
    <option value=””>エディター</option>
    <option value=””>PC</option>
    <option value=””>Github</option>
  </select>

<!-- ボタン３個目 -->
  <select class="s_categorysearch_btn" name=”other” onChange="top.location.href=value">
    <option value=”other”>その他</option>
    <option value=””>相談</option>
  </select>

</form>
<br>
<h2 class="header_title">FAQ一覧</h2>


<div class="qa-list mts">
<dl class="qa">
<dt>ここに質問が入ります</dt>
<dd>
<p>ここに回答が入ります</p>
</dd>
</dl>
<dl class="qa">
<dt>ここに質問が入ります</dt>
<dd>
<p>ここに回答が入ります</p>
</dd>
</dl>
<dl class="qa">
<dt>ここに質問が入ります</dt>
<dd>
<p>ここに回答が入ります</p>
</dd>
</dl>
</div>


<!-- ここからフッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>