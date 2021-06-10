<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生|セッション予約完了</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="header.jsp"/>

<!-- メイン -->
<jsp:include page="menu.jsp"/>
<h2>セッション予約が完了しました</h2>
<p>○○さん</p>
<form>
	<table>
	<tr>
		<th>件名</th>
		<td></td>
	</tr>
	<tr>
		<th>ジャンル</th>
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
</form>
<a href="StudyQ/StudentTop.java">TOPへ戻る</a>
<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>