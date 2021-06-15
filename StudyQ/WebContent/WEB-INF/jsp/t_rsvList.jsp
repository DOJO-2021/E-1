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
		<div class="tab_active">
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
			<td> チェック </td>
			<td> カテゴリ </td>
			<td> 件名 </td>
			<td> 氏名 </td>
		</tr>
	</table>


	<!-- タブの中身 -->
	<div class="content_body">
		<!-- 開くタブ -->
		<div class="content_show">
		<c:forEach var="e" items="${sessionList}">
			<form method="POST" action="/StudyQ/TeacherReserveDList">
				<table>
					<tr>
						<td> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
						<td> <c:out value="${e.state}"/> </td>
						<td>
						<c:choose>
							<c:when test="${e.m_faq_category == 0}"> プログラミング言語 </c:when>
							<c:when test="${e.m_faq_category == 1}"> 段位認定 </c:when>
							<c:when test="${e.m_faq_category == 2}"> ドリル </c:when>
							<c:when test="${e.m_faq_category == 3}"> コードエラー </c:when>
							<c:when test="${e.m_faq_category == 4}"> その他 </c:when>
							<c:when test="${e.m_faq_category == 5}"> エディタ </c:when>
							<c:when test="${e.m_faq_category == 6}"> PC </c:when>
							<c:when test="${e.m_faq_category == 7}"> GitHub </c:when>
							<c:when test="${e.m_faq_category == 8}"> その他 </c:when>
							<c:when test="${e.m_faq_category == 9}"> 相談等 </c:when>
						</c:choose>
						</td>
						<td> <c:out value="${e.subject}"/> </td>
						<td> <c:out value="${e.s_name}"/> </td>
						<td> <input type="submit" value="詳細"> </td>
					</tr>
				</table>
			</form>
		</c:forEach>
		</div>

		<!-- 閉じるタブ -->
		<!-- 学習内容 -->
		<div class="content">
			<c:if test="${e.m_faq_category >= 0 && e.m_faq_category <= 4}">
				<c:forEach var="e" items="${sessionList}">
					<form method="POST" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td> <c:out value="${e.state}"/> </td>
								<td>
								<c:choose>
									<c:when test="${e.m_faq_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.m_faq_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.m_faq_category == 2}"> ドリル </c:when>
									<c:when test="${e.m_faq_category == 3}"> コードエラー </c:when>
									<c:when test="${e.m_faq_category == 4}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 5}"> エディタ </c:when>
									<c:when test="${e.m_faq_category == 6}"> PC </c:when>
									<c:when test="${e.m_faq_category == 7}"> GitHub </c:when>
									<c:when test="${e.m_faq_category == 8}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td> <c:out value="${e.subject}"/> </td>
								<td> <c:out value="${e.s_name}"/> </td>
								<td> <input type="submit" value="詳細"> </td>
							</tr>
						</table>
					</form>
				</c:forEach>
			</c:if>
		</div>
		<!-- 閉じるタブ -->
		<!-- トラブル -->
		<div class="content">
			<c:if test="${e.m_faq_category >= 5 && e.m_faq_category <= 8}">
				<c:forEach var="e" items="${sessionList}">
					<form method="POST" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td> <c:out value="${e.state}"/> </td>
								<td>
								<c:choose>
									<c:when test="${e.m_faq_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.m_faq_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.m_faq_category == 2}"> ドリル </c:when>
									<c:when test="${e.m_faq_category == 3}"> コードエラー </c:when>
									<c:when test="${e.m_faq_category == 4}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 5}"> エディタ </c:when>
									<c:when test="${e.m_faq_category == 6}"> PC </c:when>
									<c:when test="${e.m_faq_category == 7}"> GitHub </c:when>
									<c:when test="${e.m_faq_category == 8}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td> <c:out value="${e.subject}"/> </td>
								<td> <c:out value="${e.s_name}"/> </td>
								<td> <input type="submit" value="詳細"> </td>
							</tr>
						</table>
					</form>
				</c:forEach>
			</c:if>
		</div>
		<!-- 閉じるタブ -->
		<div class="content">
			<c:if test="${e.m_faq_category == 9}">
				<c:forEach var="e" items="${sessionList}">
					<form method="POST" action="/StudyQ/TeacherReserveDList">
						<table>
							<tr>
								<td> <input type="checkbox" name="" value="">  </td> <!-- 保留 -->
								<td> <c:out value="${e.state}"/> </td>
								<td>
								<c:choose>
									<c:when test="${e.m_faq_category == 0}"> プログラミング言語 </c:when>
									<c:when test="${e.m_faq_category == 1}"> 段位認定 </c:when>
									<c:when test="${e.m_faq_category == 2}"> ドリル </c:when>
									<c:when test="${e.m_faq_category == 3}"> コードエラー </c:when>
									<c:when test="${e.m_faq_category == 4}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 5}"> エディタ </c:when>
									<c:when test="${e.m_faq_category == 6}"> PC </c:when>
									<c:when test="${e.m_faq_category == 7}"> GitHub </c:when>
									<c:when test="${e.m_faq_category == 8}"> その他 </c:when>
									<c:when test="${e.m_faq_category == 9}"> 相談等 </c:when>
								</c:choose>
								</td>
								<td> <c:out value="${e.subject}"/> </td>
								<td> <c:out value="${e.s_name}"/> </td>
								<td> <input type="submit" value="詳細"> </td>
							</tr>
						</table>
					</form>
				</c:forEach>
			</c:if>
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
$(function() {
	  let tabs = $(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
	  $(".tab").on("click", function() { // tabをクリックしたらイベント発火
	    $(".active").removeClass("active"); // activeクラスを消す
	    $(this).addClass("active"); // クリックした箇所にactiveクラスを追加
	    const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
	    $(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
	  })
	})
</script>
</body>
</html>