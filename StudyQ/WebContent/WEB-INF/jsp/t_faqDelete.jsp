<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>講師用｜FAQ更新結果</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
</head>

<body>
	<jsp:include page="teacher_header.jsp" />
	<jsp:include page="teacher_menu.jsp" />

	<!-- メイン -->
	<section class="main1">
		<h3><span><c:out value="${result.title}" /></span></h3>
		<h4><c:out value="${result.message}" /></h4>

		<ul class="accordion-area">
				<li>
					<section>
				    	<p class="title">Q.<c:out value="${faq_title}"/></p>
				    	<div class="box">
					    	<p>A.<c:out value="${faq_ans}"/></p>
				    	</div>
					</section>
				</li>
		</ul>
	</section>
	<a href="${result.backTo}"> FAQ検索ページへ戻る</a>
</body>
</html>