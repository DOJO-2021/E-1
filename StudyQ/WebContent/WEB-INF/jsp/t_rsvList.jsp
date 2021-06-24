<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/lity/1.6.6/lity.css' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/lity/1.6.6/lity.js'></script>

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
		border-spacing: 3px;
	}
	table.content_checklist {
		float: left;
		border-spacing: 5px;
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
		height: 20px
	}
	td.column2 {
		width: 70px;
		height: 20px
	}
	td.column3 {
		width: 150px;
		height: 20px
	}
	td.column4 {
		width: 250px;
		height: 20px
	}
	td.column5 {
		width: 120px;
		height: 20px
	}
	td.column6 {
		width: auto;
		height: 20px
	}
	td.chn {
		font-size: 16px;
		height: 20px
	}
	tr {
		height: 22px;
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
			<td class="column_header1"> 対応状況 </td>
			<td class="column_header2"> カテゴリ </td>
			<td class="column_header3"> 件名 </td>
			<td class="column_header4"> 氏名 </td>
		</tr>
	</table>

	<%! int count1 = 0; %>
	<!-- タブの中身 -->
	<div class="content_body">
		<!-- 開くタブ -->
		<div class="content show">
		<div id="msg"> <!-- ここにjsonデータ --> </div>
		<c:forEach var="e" items="${sessionList}" >
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
						<td class="column6"> <a href="http://localhost:8080/StudyQ/TeacherReserveDList?session_id=${e.session_id}" name="session_id" data-lity="data-lity">詳細</a> </td>
					</tr>
				</table>
			</form>
			<% count1 += 1; %>
		</c:forEach>
		</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:学習内容 -->
			<div class="content">
			<div id="msg1"> <!-- ここにjsonデータ --> </div>
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category >= 0 && e.session_m_category <= 4}">
					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
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
								<td class="column6"> <a href="http://localhost:8080/StudyQ/TeacherReserveDList?session_id=${e.session_id}" name="session_id" data-lity="data-lity">詳細</a></td>

							</tr>
						</table>
					</form>
				</c:if>
			</c:forEach>
			</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:トラブル -->
			<div class="content">
			<div id="msg2"> <!-- ここにjsonデータ --> </div>
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category >= 5 && e.session_m_category <= 8}">

					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
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
								<td class="column6"><a href="http://localhost:8080/StudyQ/TeacherReserveDList?session_id=${e.session_id}" name="session_id" data-lity="data-lity">詳細</a></td>
							</tr>
						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
			<!-- 閉じるタブ -->
			<!-- カテゴリ:その他-->
			<div class="content">
			<div id="msg3"> <!-- ここにjsonデータ --> </div>
			<c:forEach var="e" items="${sessionList}">
				<c:if test="${e.session_m_category == 9}">
					<form method="GET" action="/StudyQ/TeacherReserveDList">
						<table>
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
								<td class="column6"> <a href="http://localhost:8080/StudyQ/TeacherReserveDList?session_id=${e.session_id}" name="session_id" data-lity="data-lity">詳細</a></td>
							</tr>
						</table>
					</form>

				</c:if>
			</c:forEach>
			</div>
		</div>

	<form>
		<input type="button" id="working_btn" value="対応中" onclick="return func2()">
		<input type="button" id="worked_btn" value="対応完了" onclick="return func1()">
	</form>

<a href="/StudyQ/TeacherTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>

<script type="text/javascript">
document.cookie = "key=1";

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
const n1 = <%=count1 %>;
console.log(n1);
//対応状況リスト表示
$(function(e) {
			$.ajax({ //1: jsonデータを引っ張ってくる
				contentType : "Content-Type: application/json; charset=UTF-8",
				url : "json/session_data.json",
				type : "GET",
				datatype : "json",
				success: function(json){
					let data = "<table class='content_checklist'>";
					const len = Object.keys(json.ary).length;
					console.log(len);
					const n1 = <%=count1 %>;
					console.log(n1);
					if (len != n1) {
						e.exit;
					}
					console.dir(json);

					for( let i= 0; i < len; i++){
					    data += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg").innerHTML = data;

					//タブ2
					let data1 = "<table class='content_checklist'>";
					const len1 = 3
					for( let i= 0; i < len1; i++){
					    data1 += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn1'> " + "未対応" + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg1").innerHTML = data1;
					//タブ3
					let data2 = "<table class='content_checklist'>";
					const len2 = 4
					for( let i= 0; i < len2; i++){
					    data2 += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn2'> " + "未対応" + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg2").innerHTML = data2;
					//タブ4
					let data3 = "<table class='content_checklist'>";
					const len3 = 3
					for( let i= 0; i < len3; i++){
					    data3 += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn3'> " + "未対応" + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg3").innerHTML = data3;
				}
			});
});

//2-A. func1 : チェックしてボタン押下⇒対応状況が"対応完了"になる
function func1() {
      const elements = document.getElementsByName("options");
      console.log("--- 選択チェックボックスは以下の通りです ---");

      for (let i=0; i<elements.length; i++){
        if (elements[i].checked){
          console.log(elements[i].value);
		  document.getElementsByClassName("chn")[i].textContent = "対応完了";
        } else{

		}
      }
	  var chn = document.getElementsByClassName("chn")
	  console.log(chn);

	  var newJson = [];
      console.log("--- 以下書き換え後リスト ---");
	  for (let j=0; j<chn.length;j++) {
		  newJson.push({str:chn[j].innerHTML.trim()});
	  }
	console.log("newJson:" + newJson.length); //この時点で増殖が起きている
	console.log("newJson2:" + newJson.length);

	$.ajax({//更新jsonリスト送信
		contentType : "Content-Type: application/json; charset=UTF-8",
		url : "/StudyQ/SessionAjaxServlet",
		type : "GET",
		data : {
			newJson : JSON.stringify(newJson)
		},
		datatype : "json",
		success:
			function() {
			$.ajax({ //1: jsonデータを引っ張ってくる
				contentType : "Content-Type: application/json; charset=UTF-8",
				url : "json/session_data.json",
				type : "GET",
				datatype : "json",
				success: function(json){
					let data = "<table class='content_checklist'>";
					const len = Object.keys(json.ary).length;
					console.log(len);

					for( let i= 0; i < len; i++){
					    data += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
					}

					data += "</table>";
					document.getElementById("msg").innerHTML = data;
				}
			});
		}
	});
}

//2-B. func2 : チェックしてボタン押下⇒対応状況が"対応中"になる
function func2() {
      const elements = document.getElementsByName("options");
      console.log("--- 選択チェックボックスは以下の通りです ---");

      for (let i=0; i<elements.length; i++){
        if (elements[i].checked){
          console.log(elements[i].value);
		  document.getElementsByClassName("chn")[i].textContent = "対応中";
        } else{

		}
      }
	  var chn = document.getElementsByClassName("chn")
	  console.log(chn);

	  var newJson = [];
      console.log("--- 以下書き換え後リスト ---");
	  for (let j=0; j<chn.length;j++) {
		  newJson.push({str:chn[j].innerHTML.trim()});
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
			function() {
			$.ajax({ //1: jsonデータを引っ張ってくる
				contentType : "Content-Type: application/json; charset=UTF-8",
				url : "json/session_data.json",
				type : "GET",
				datatype : "json",
				success: function(json){
					let data = "<table class='content_checklist'>";
					const len = Object.keys(json.ary).length;

					for( let i= 0; i < len; i++){
					    data += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
					}
					data += "</table>";
					document.getElementById("msg").innerHTML = data;
				}
			});
		}
	});
}
//リロード時にjsonを取得
document.addEventListener("load", function() {
	   // 実行したい処理
	$.ajax({ //1: jsonデータを引っ張ってくる
		contentType : "Content-Type: application/json; charset=UTF-8",
		url : "json/session_data.json",
		type : "GET",
		datatype : "json",
		success: function(json){
			let data = "<table class='content_checklist'>";
			const len = Object.keys(json.ary).length;

			for( let i= 0; i < len; i++){
			    data += "<tr><td class='column1'><input type='checkbox' name='options'> </td> <td class='chn'> " + json.ary[i].str + "</td></tr>";
			}
			data += "</table>";
			document.getElementById("msg").innerHTML = data;
		}
	});
	});


</script>
</body>
</html>