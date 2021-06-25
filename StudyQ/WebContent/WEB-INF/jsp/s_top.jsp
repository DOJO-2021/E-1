<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
	<title>研修生｜TOP</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/Top.css">
	<!-- 検索バーで必要 -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<!-- 待ち人数 -->
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="student_header.jsp"/>

		<!-- メイン -->
		<section class="main1">
			<!-- 検索バー -->
			<div class="seach_ber">
				<form method="POST" action="/StudyQ/StudentFaqSearch" class="search_container" style="margin: 0 0 0 auto;">
					<input type="text" size="25" name="search_word" placeholder="　調べたいことをキーワード検索">
					<input type="submit" value="&#xf002">
				</form>
			</div>
			<h3><span>スタディQAっしょんでできること</span></h3>

			<!-- セッションの待ち人数 -->
			<div class="wait_people">
				<div class="wp2">＼</div>
				<div class="wp1">ただいまの待ち人数</div>
				<div id = "counter"><!-- ここに待ち人数 --></div>
				<div class="wp2">人 ／</div>
			</div>

			<div class="student_top">
				<ul class="s_top_menu">
					<!-- FAQページ遷移 -->
					<li>
						<div class="container">
							<a href="/StudyQ/StudentFaqSearch" class="btn-border">
								<div><img src="image/icon2.png" width=100px height=auto alt="FAQ" ></div>
								<div class="tt1">-- FAQ --</div>
								<div class="tt2">研修生が講師によく聞く質問</div>
							</a>
						</div>
					</li>
					<!-- セッション予約ページ遷移 -->
					<li>
						<div class="container">
							<a href="/StudyQ/StudentReserve" class="btn-border">
								<div><img src="image/icon1.png" width=100px height=auto alt="セッション予約"></div>
								<div class="tt1">-- セッション予約 --<br></div>
								<div class="tt2">講師へ直接質問</div>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</section>

		<!-- footer -->
		<jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript">
//待ち人数カウント
$(function() {
		$.ajax({ //jsonデータを取り出す
			contentType : "Content-Type: application/json; charset=UTF-8",
			url : "json/session_data.json",
			type : "GET",
			datatype : "json",
			success: function(json){
				const len = Object.keys(json.ary).length;
				console.log(len);
				//"未対応""対応中"のデータを詰める配列の宣言
				let count = [];
				//一つずつ値を取り出し、"対応完了"をもつものをcount[]に詰める
				for( let i= 0; i < len; i++){
					if (json.ary[i].str == "未対応" || json.ary[i].str == "対応中") {
						count.push(json.ary[i].str);
					}
					console.log(json.ary[i].str);
				}
				document.getElementById("counter").innerHTML = count.length;
				console.log(count.length);
			}
		});
});
</script>
</html>