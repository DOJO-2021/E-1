<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ検索結果</title>

</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />

<!-- ヒット数 -->
<div class="s_searchresult">
	<!-- resultCount : 検索件数を格納する仮変数名 -->
	<p> ヒット数 : <c:out value="${resultCount} "/>　件 </p>
</div>

<!-- 変数 e, 引数 cardList を仮の値として設定する -->
<!-- FAQリスト -->
<c:forEach var="e" items="${cardlList} "/>
	<div class="s_faqlist_body">
		<!-- のちにFAQのQ-Aをドロワー対応させるよう構成を変更する -->
		<table>
			<tr>
				<th>
					<span> Q </span> <c:out value="${e.faq_title}"/>
				</th>
				<td>
					<span> A </span><c:out value="${e.faq_ans}"/>  <br>
					<input type="submit" name="SUBMIT" value="更新" class="faq_edit_btn">
					<input type="submit" name="SUBMIT" value="削除" class="faq_delete_btn">
				</td>
			</tr>
		</table>
	</div>

<!-- 最上部に戻る -->
<!-- 保留 : "上に戻る"テキストはのちにimageに差し替える -->
<a href="#"> 上に戻る </a>

</body>
</html>