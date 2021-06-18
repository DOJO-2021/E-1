<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索結果</title>

</head>
<body>
<!-- ここからヘッダー -->
<jsp:include page="student_header.jsp"/>
<!-- ここからメイン -->
<jsp:include page="student_menu.jsp"/>

<!-- ヒット数 -->
<div class="s_searchresult">
	<p> ヒット数 : <c:out value="${hitcount} "/>　件 </p>
</div>

<!-- 検索ワード表示 -->
    <p>検索ワード：<c:out value="${search_word} "/></p>

<!-- FAQ検索機能 -->
<h2 class="header_title">FAQ検索結果</h2>
<c:forEach var="e" items="${faqList}" >
<table>
  <tr>
    <td>質問<c:out value="${e.faq_title}"/></td><br>
    <td>回答<c:out value="${e.faq_ans}"/> </td>
  </tr>
</table>
</c:forEach>


<!-- 最上部に戻る -->
<div id="page_top"><a href="#"></a></div>

<!-- ここからフッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>