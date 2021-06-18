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
<h3>以下の内容で登録しました。</h3>

<!-- FAQ登録結果テーブル -->
<!-- <form method="GET" action="/StudyQ/TeacherFaqRegistResult"> -->
<div class="faqlist_registresult_body">
	<table>
		<tr>
			<th> FAQタイトル </th>
			<td><c:out value="${faqRegist.faq_title}"/> </td>
		</tr>
		<tr>
			<th> FAQカテゴリ </th>
			<td>
			<!-- ここにselect結果の値を表示させたい -->
				<c:choose>
							<c:when test="${faqRegist.faq_m_category == 0}"> プログラミング言語 </c:when>
							<c:when test="${faqRegist.faq_m_category == 1}"> 段位認定 </c:when>
							<c:when test="${faqRegist.faq_m_category == 2}"> ドリル </c:when>
							<c:when test="${faqRegist.faq_m_category == 3}"> コードエラー </c:when>
							<c:when test="${faqRegist.faq_m_category == 4}"> その他 </c:when>
							<c:when test="${faqRegist.faq_m_category == 5}"> エディタ </c:when>
							<c:when test="${faqRegist.faq_m_category == 6}"> PC </c:when>
							<c:when test="${faqRegist.faq_m_category == 7}"> GitHub </c:when>
							<c:when test="${faqRegist.faq_m_category == 8}"> その他 </c:when>
							<c:when test="${faqRegist.faq_m_category == 9}"> 相談等 </c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th> FAQ詳細 </th>
			<td><c:out value="${faqRegist.faq_ans}"/> </td>
		</tr>
	</table>
</div>
<!--</form> -->

<!-- FAQ検索ページへ戻る -->
<a href="/StudyQ/TeacherTop"> FAQ検索ページへ戻る </a>
<jsp:include page="footer.jsp" />
</body>
</html>