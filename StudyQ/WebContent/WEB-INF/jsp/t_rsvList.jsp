<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

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
	table.content_sessionlist {
		margin-left: 95px;

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
		<div id="msg">ここに結果</div>
		<c:forEach var="e" items="${sessionList}">
			<form method="GET" action="/StudyQ/TeacherReserveDList">
				<table class="content_sessionlist">
					<tr>
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
						<td class="column6"> <button type="submit" name="session_id"  value="${e.session_id}">詳細</button> </td>
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
								<td class="column1">  </td> <!-- 保留 -->
								<td class="column2">

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
								<td class="column6"> <button type="submit" name="session_id"  value="${e.session_id}">詳細</button></td>

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
								<td class="column1">   </td> <!-- 保留 -->
								<td class="column2">

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
								<td class="column6"><button type="submit" name="session_id"  value="${e.session_id}">詳細</button></td>
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
								<td class="column1">  </td> <!-- 保留 -->
								<td class="column2">

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
								<td class="column6"> <button type="submit" name="session_id"  value="${e.session_id}">詳細</button></td>
							</tr>
						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
		</div>

	<form>
		<input type="button" id="working_btn" value="対応中">
		<input type="button" id="worked_btn" value="対応完了" onclick="return func1()">
	</form>

<a href="StudyQ/TeacherTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>

<script type="text/javascript">
//タブ切り替え
\$(function() {
	  let tabs = \$(".tab"); // tabのクラスを全て取得し、変数tabsに配列で定義
	  \$(".tab").on("click", function() { // tabをクリックしたらイベント発火
	    \$(".active").removeClass("active"); // activeクラスを消す
	    \$(this).addClass("active"); // クリックした箇所にactiveクラスを追加
	    const index = tabs.index(this); // クリックした箇所がタブの何番目か判定し、定数indexとして定義
	    \$(".content").removeClass("show").eq(index).addClass("show"); // showクラスを消して、contentクラスのindex番目にshowクラスを追加
	  })
	})

//対応完了チェック
$(function() {
			$.ajax({ //1: jsonデータを引っ張ってくる
				contentType : "Content-Type: application/json; charset=UTF-8",
				url : "json/session_data.json",
				type : "GET",
				datatype : "json",
				success: function(json){
					let data = "<table>";
					const len = Object.keys(json.ary).length;
					console.log(len);
					for( let i= 0; i < len; i++){
					    data += "<tr><td><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg").innerHTML = data;
				}
			});
});

//2: チェックされた部分の値を"changed"に更新する
function func1() {
      const elements = document.getElementsByName("options");
      console.log("--- 選択チェックボックスは以下の通りです ---");

      for (let i=0; i<elements.length; i++){
        if (elements[i].checked){
          console.log(elements[i].value);
		  document.getElementsByClassName("chn")[i].textContent = "対応完了";
        } else{
		  document.getElementsByClassName("chn")[i].textContent="未対応";
		}
      }
	  var chn = document.getElementsByClassName("chn")
	  console.log(chn);

	  var newJson = [];
      console.log("--- 以下書き換え後リスト ---");
	  for (let j=0; j<chn.length;j++) {
		  newJson.push({str:chn[j].innerHTML});
	  }
	  console.dir(newJson);

	$.ajax({//更新jsonリスト送信
		contentType : "Content-Type: application/json; charset=UTF-8",
		url : "/StudyQ/SessionAjaxServlet",
		type : "GET",
		data : {
			newJson : JSON.stringify(newJson)
		},
		datatype : "json",
		success:
			function(json) {
			let data = "<table>";
			const len = Object.keys(json.ary).length;
			console.log(newJson);
			for( let i= 0; i < len; i++){
			    data += "<tr><td><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
			}
			data += "</table>";
			document.getElementById("msg").innerHTML = data;
		}
	});
}
</script>
</body>
</html>