<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ登録結果</title>

</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />
<!-- サブタイトル -->
<h3> 以下の内容で登録しました。 </h3>

<!-- FAQ登録結果テーブル -->
<!-- <form method="get" action="/StudyQ/TeacherFaqRegistResult.java"> -->
<div class="faqlist_registresult_body">
	<table>
		<tr>
			<th> FAQタイトル </th>
			<td><c:out value="${faq_title}"/> </td>
		</tr>
		<tr>
			<th> FAQカテゴリ </th>
			<td>
			<!-- ここにselect結果の値を表示させたい -->
				<c:out value="${faq_category}"  />
			</td>
		</tr>
		<tr>
			<th> FAQ詳細 </th>
			<td><c:out value="${faq_ans}"/> </td>
		</tr>
	</table>
</div>
<!--</form>  -->

<!-- FAQ検索ページへ戻る -->
<a href="/StudyQ/TeacherTop.java"> FAQ検索ページへ戻る </a>
<jsp:include page="footer.jsp" />
</body>
</html>