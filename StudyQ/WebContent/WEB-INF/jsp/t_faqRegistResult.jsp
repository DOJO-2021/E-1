<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ登録結果</title>
<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/t_faqRegistResult.css">

</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />
<!-- サブタイトル -->


<h3><span>登録完了</span></h3>
<h4>以下の内容で登録しました。</h4>

<!-- FAQ登録結果テーブル -->
<!-- <form method="GET" action="/StudyQ/TeacherFaqRegistResult"> -->
<div class="faqlist_registresult_body">
	<table class="list">
		<tr>
			<th> FAQタイトル </th>
			<td><c:out value="${faq_title}"/></td>
		</tr>

		<tr>
			<th> FAQ詳細 </th>
			<td><c:out value="${faq_ans}"/></td>
		</tr>
	</table>
</div>
<!--</form> -->

<!-- FAQ検索ページへ戻る -->
<div class="teacher_top">
<a href="/StudyQ/TeacherFaqEdit"> FAQ検索ページへ戻る </a>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>