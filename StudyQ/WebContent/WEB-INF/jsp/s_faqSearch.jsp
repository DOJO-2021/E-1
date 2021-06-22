<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<!-- 検索バーで必要 -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<!-- ここからヘッダー -->
	<jsp:include page="student_header.jsp"/>

	<!-- メイン -->
	<jsp:include page="student_menu.jsp"/>

	<section class="main1">
		<h2 class="header_title">FAQ検索</h2>
			<!-- 検索バー -->
			<form method="get" action="" class="search_container">
				<input type="text" size="25" name="search_word" placeholder="　調べたいことをキーワード検索">
				<input type="submit" value="&#xf002">
			</form>

		<br><br>


		<!-- ボタン１個目 -->
		  <select class="s_categorysearch_btn "name=”category” onChange="top.location.href=value">
		    <option value=”study”>学習内容</option>
		    <option value=””>プログラミング言語</option>
		    <option value=””>段位認定</option>
		    <option value=””>ドリル</option>
		    <option value=””>コードエラー</option>
		    <option value=””>その他</option>
		  </select>

		<!-- ボタン２個目 -->
		  <select class="s_categorysearch_btn" name=”trouble” onChange="top.location.href=value">
		    <option value=”trouble”>トラブル</option>
		    <option value=””>エディター</option>
		    <option value=””>PC</option>
		    <option value=””>Github</option>
		    <option value=””>その他</option>
		  </select>

		<!-- ボタン３個目 -->
		  <select class="s_categorysearch_btn" name=”other” onChange="top.location.href=value">
		    <option value=”other”>その他</option>
		    <option value=””>相談</option>
		  </select>


		<!-- FAQ一覧表示 -->
		<br>
		<h2 class="header_title">FAQ一覧</h2>
		<p>aaa</p>
		<c:forEach var="e" items="${faqList}" >
		<form method="GET" action="/StudyQ/StudentFaqSearch">
		<table >
		  <tr>
		    <td>質問 <c:out value="${e.faq_title}"/></td>
		    <td>回答 <c:out value="${e.faq_ans}"/> </td>
		  </tr>
		</table>
		</form>
		</c:forEach>
	</section>


	<!-- ここからフッター -->
	<jsp:include page="footer.jsp"/>
	<!--  <script type="text/javascript" src="js/s_faqSearch.js"></script>-->
</body>
</html>