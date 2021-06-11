<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師|セッション予約リスト詳細</title>
</head>
<body>
<!-- ヘッダー -->
<jsp:include page="teacher_header.jsp"/>

<!-- メイン -->
<jsp:include page="menu.jsp"/>
<h2>○○さんの予約詳細</h2>
<table>
<tr>
	<th>件名</th>
	<td></td>
</tr>
<tr>
	<th>カテゴリ</th>
	<td>

		学習内容
		トラブル
		その他

	</td>
</tr>
<tr>
	<th>質問内容</th>
	<td></td>
</tr>
<tr>
	<th>添付ファイル</th>
	<td></td>
</tr>
</table>
<a href="StudyQ/TeacherReserveList">セッション予約リストへ戻る</a>

<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>