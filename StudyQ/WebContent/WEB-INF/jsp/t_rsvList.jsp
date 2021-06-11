<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="menu.jsp"/>
<h2>セッション予約リスト</h2>
<form>
	<div id="tabs">
	  <ul>
	    <li><a href="#tabs-1">全体の質問</a></li>
	    <li><a href="#tabs-2">学習内容</a></li>
	    <li><a href="#tabs-3">トラブル</a></li>
	    <li><a href="#tabs-4">その他</a></li>
	  </ul>
	  <div id="tabs-1">
		<table>
		<tr>
			<th>対応状況</th>
			<th>カテゴリ</th>
			<th>件名</th>
			<th>氏名</th>
			<th>詳細</th>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		</table>
	  </div>
	  <div id="tabs-2">
		<table>
		<tr>
			<th>対応状況</th>
			<th>カテゴリ</th>
			<th>件名</th>
			<th>氏名</th>
			<th>詳細</th>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		</table>
	  </div>
	  <div id="tabs-4">
		<table>
		<tr>
			<th>対応状況</th>
			<th>カテゴリ</th>
			<th>件名</th>
			<th>氏名</th>
			<th>詳細</th>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="" value="">未対応</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td>〇〇</td>
			<td><a href="/StudyQ/TeacherReserveDList.java"></a><button type="button">詳細</button></td>
		</tr>
		</table>
	  </div>
	</div>
	<input type="submit" name="" value="対応中">
	<input type="submit" name="" value="対応完了">
</form>

<a href="StudyQ/TeacherTop">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
<script>
$(function() {
	  $( "#tabs" ).tabs();
	});
</script>
</body>
</html>