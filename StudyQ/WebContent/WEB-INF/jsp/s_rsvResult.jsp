<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/t_faqRegistResult.css">
<script type="text/javascript" src="jquery/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>研修生|セッション予約完了</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="student_header.jsp"/>

<!-- メイン -->
<jsp:include page="student_menu.jsp"/>
	<h3><span>セッション予約</span></h3>
	<h4>以下の内容で予約しました。</h4>

	<form method="GET" action="/StudyQ/StudentReserve">
		<table class="list">
		<tr>
			<th>件名</th>
			<td><c:out value="${rsv.subject}"/></td>
		</tr>
		<tr>
			<th>カテゴリ</th>
			<td>
			<c:choose>
				<c:when test="${rsv.session_m_category == 0}"> プログラミング言語 </c:when>
				<c:when test="${rsv.session_m_category == 1}"> 段位認定 </c:when>
				<c:when test="${rsv.session_m_category == 2}"> ドリル </c:when>
				<c:when test="${rsv.session_m_category == 3}"> コードエラー </c:when>
				<c:when test="${rsv.session_m_category == 4}"> その他 </c:when>
				<c:when test="${rsv.session_m_category == 5}"> エディタ </c:when>
				<c:when test="${rsv.session_m_category == 6}"> PC </c:when>
				<c:when test="${rsv.session_m_category == 7}"> GitHub </c:when>
				<c:when test="${rsv.session_m_category == 8}"> その他 </c:when>
				<c:when test="${rsv.session_m_category == 9}"> 相談等 </c:when>
			</c:choose>
			</td>
		</tr>
		<tr>
			<th>質問内容</th>
			<td><c:out value="${rsv.question}"/></td>
		</tr>
		<tr>
			<th>添付ファイル</th>
			<td><a href="${filePath}"  download ="${filenames}"><c:out value="${filenames}"/></a></td>
		</tr>
		</table>
	</form>
	<div class="main1">
		<a href="/StudyQ/StudentTop">TOPへ戻る</a>
	</div>
<!-- フッター -->
<jsp:include page="footer.jsp"/>

<script type="text/javascript">
$.ajax({ //jsonデータを取り出す
	contentType : "Content-Type: application/json; charset=UTF-8",
	url : "json/session_data.json" + '?date=' + new Date().getTime(),
	type : "GET",
	datatype : "json",
	success: function(json){
		const len = Object.keys(json.ary).length;
		console.log(len);
		let newJson = [];
		for( let i= 0; i < len; i++){
		    newJson[i] = {str:json.ary[i].str};
		}
		console.log(newJson);
		newJson.push({str:"未対応"});
		console.log(newJson);

		$.ajax({//更新jsonリスト送信
			contentType : "Content-Type: application/json; charset=UTF-8",
			url : "/StudyQ/SessionAjaxServlet",
			type : "GET",
			data : {
				newJson : JSON.stringify(newJson)
			},
			datatype : "json",
			cache: false,
			success:
				function() {
				console.log("success");
			}
		});
	}
});
</script>
</body>
</html>