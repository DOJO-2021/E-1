<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/themes/smoothness/jquery-ui.css">
<style>
	.tab_area {
		display: flex;
  		cursor: pointer;
	}
	.tab {
		width: 300px;
	    height: 30px;
	    line-height: 30px;
	    text-align: center;
	    color: white;
	    border-right: 1px solid #50637b;
	    border-left: 1px solid #222e3e;
	}
	.tab.active {
		background-color: #ccc;
	    color: #222e3e;
	    border: none;
	}
	content_body {
		font-size: 30px;
	  	text-align: center;
	}
	.content {
		display: none;
	}
	.content.show {
		display: block;
	}

	td.column_header1 {
		width: 93px;
	}
	td.column_header2 {
		width: 150px;
	}
	td.column_header3 {
		width: 250px;
	}
	td.column_header4 {
		width: auto;
	}

	td.column1 {
		width: auto;
	}
	td.column2 {
		width: 70px;
	}
	td.column3 {
		width: 150px;
	}
	td.column4 {
		width: 250px;
	}
	td.column5 {
		width: 120px;
	}
	td.column6 {
		width: auto;
	}
</style>

<title>講師|セッション予約リスト</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="teacher_header.jsp"/>

<!-- メイン -->
<jsp:include page="teacher_menu.jsp"/>
<h2>セッション予約リスト</h2>

	<!-- タブのタイトル -->
	<div class="tab_area">
		<div class="tab active">
			全体の質問
		</div>
		<div class="tab">
			学習内容
		</div>
		<div class="tab">
			トラブル
		</div>
		<div class="tab">
			その他
		</div>
	</div>
	<!-- テーブル項目 -->
	<table>
		<tr>
			<td class="column_header1"> チェック </td>
			<td class="column_header2"> カテゴリ </td>
			<td class="column_header3"> 件名 </td>
			<td class="column_header4"> 氏名 </td>
		</tr>
	</table>


	<!-- タブの中身 -->
	<div class="content_body">
		<!-- 開くタブ -->
		<div class="content show">
		<c:forEach var="e" items="${sessionList}">

			<form method="GET" action="/StudyQ/TeacherReserveDList">
				<table>
					<tr>
						<td class="column1"> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
						<td class="column2">
						 <c:choose>
						 	<c:when test="${e.state == 0}"> 未対応 </c:when>
						 	<c:when test="${e.state == 1}"> 対応中 </c:when>
						 	<c:when test="${e.state == 2}"> 対応完了 </c:when>
						 </c:choose>
						</td>
						<td class="column3">
						<c:choose>
							<c:when test="${e.session_m_category == 0}"> プログラミング言語 </c:when>
							<c:when test="${e.session_m_category == 1}"> 段位認定 </c:when>
							<c:when test="${e.session_m_category == 2}"> ドリル </c:when>
							<c:when test="${e.session_m_category == 3}"> コードエラー </c:when>
							<c:when test="${e.session_m_category == 4}"> その他 </c:when>
							<c:when test="${e.session_m_category == 5}"> エディタ </c:when>
							<c:when test="${e.session_m_category == 6}"> PC </c:when>
							<c:when test="${e.session_m_category == 7}"> GitHub </c:when>
							<c:when test="${e.session_m_category == 8}"> その他 </c:when>
							<c:when test="${e.session_m_category == 9}"> 相談等 </c:when>
						</c:choose>
						</td>
						<td class="column4"> <c:out value="${e.subject}"/> </td>
						<td class="column5"> <c:out value="${e.s_name}"/> </td>
						<td class="column6"> <input type="submit" value="詳細"> </td>
					</tr>
				</table>
			</form>

		</c:forEach>
		</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:学習内容 -->
			<div class="content">
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category >= 0 && e.session_m_category <= 4}">

					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td class="column1"> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td class="column2">
									<c:choose>
									 	<c:when test="${e.state == 0}"> 未対応 </c:when>
									 	<c:when test="${e.state == 1}"> 対応中 </c:when>
									 	<c:when test="${e.state == 2}"> 対応完了 </c:when>
									</c:choose>
								</td>
								<td class="column3">
								<c:choose>
									<c:when test="${e.session_m_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.session_m_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.session_m_category == 2}"> ドリル </c:when>
									<c:when test="${e.session_m_category == 3}"> コードエラー </c:when>
									<c:when test="${e.session_m_category == 4}"> その他 </c:when>
									<c:when test="${e.session_m_category == 5}"> エディタ </c:when>
									<c:when test="${e.session_m_category == 6}"> PC </c:when>
									<c:when test="${e.session_m_category == 7}"> GitHub </c:when>
									<c:when test="${e.session_m_category == 8}"> その他 </c:when>
									<c:when test="${e.session_m_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td class="column4"> <c:out value="${e.subject}"/> </td>
								<td class="column5"> <c:out value="${e.s_name}"/> </td>
								<td class="column6"> <input type="submit" value="詳細"> </td>
							</tr>

						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:トラブル -->
			<div class="content">
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category >= 5 && e.session_m_category <= 8}">

					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td class="column1"> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td class="column2">
									<c:choose>
									 	<c:when test="${e.state == 0}"> 未対応 </c:when>
									 	<c:when test="${e.state == 1}"> 対応中 </c:when>
									 	<c:when test="${e.state == 2}"> 対応完了 </c:when>
									</c:choose>
								</td>
								<td class="column3">
								<c:choose>
									<c:when test="${e.session_m_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.session_m_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.session_m_category == 2}"> ドリル </c:when>
									<c:when test="${e.session_m_category == 3}"> コードエラー </c:when>
									<c:when test="${e.session_m_category == 4}"> その他 </c:when>
									<c:when test="${e.session_m_category == 5}"> エディタ </c:when>
									<c:when test="${e.session_m_category == 6}"> PC </c:when>
									<c:when test="${e.session_m_category == 7}"> GitHub </c:when>
									<c:when test="${e.session_m_category == 8}"> その他 </c:when>
									<c:when test="${e.session_m_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td class="column4"> <c:out value="${e.subject}"/> </td>
								<td class="column5"> <c:out value="${e.s_name}"/> </td>
								<td class="column6"> <input type="submit" value="詳細"> </td>
							</tr>
						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:その他-->
			<div class="content">
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category == 9}">

					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td class="column1"> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td class="column2">
									<c:choose>
									 	<c:when test="${e.state == 0}"> 未対応 </c:when>
									 	<c:when test="${e.state == 1}"> 対応中 </c:when>
									 	<c:when test="${e.state == 2}"> 対応完了 </c:when>
									</c:choose>
								</td>
								<td class="column3">
								<c:choose>
									<c:when test="${e.session_m_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.session_m_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.session_m_category == 2}"> ドリル </c:when>
									<c:when test="${e.session_m_category == 3}"> コードエラー </c:when>
									<c:when test="${e.session_m_category == 4}"> その他 </c:when>
									<c:when test="${e.session_m_category == 5}"> エディタ </c:when>
									<c:when test="${e.session_m_category == 6}"> PC </c:when>
									<c:when test="${e.session_m_category == 7}"> GitHub </c:when>
									<c:when test="${e.session_m_category == 8}"> その他 </c:when>
									<c:when test="${e.session_m_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td class="column4"> <c:out value="${e.subject}"/> </td>
								<td class="column5"> <c:out value="${e.s_name}"/> </td>
								<td class="column6"> <input type="submit" value="詳細"> </td>
							</tr>
						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
		</div>

	<form>
		<input type="submit" name="" value="対応中">
		<input type="submit" name="" value="対応完了">
	</form>

<a href="StudyQ/TeacherTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>

<script>
\$(function() {
	  let tabs = \$(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
	  \$(".tab").on("click", function() { // tabをクリックしたらイベント発火
	    \$(".active").removeClass("active"); // activeクラスを消す
	    \$(this).addClass("active"); // クリックした箇所にactiveクラスを追加
	    const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
	    \$(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
	  })
	})
</script>
</body>
</html>