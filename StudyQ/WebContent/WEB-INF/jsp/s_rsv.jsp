<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生|セッション予約</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="header.jsp"/>

<!-- メイン -->
<jsp:include page="menu.jsp"/>
<h2>セッション予約</h2>
<p>○○さん</p>
<form>
	<table>
	<tr>
		<th>件名</th>
		<td><input type="text" name="" class="" placeholder="件名を入力してください"></td>
	</tr>
	<tr>
		<th>ジャンル</th>
		<td>
		<select name="">
		    <option value ="">学習内容</option>
		    <option value ="">トラブル</option>
		    <option value ="">その他</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>質問内容</th>
		<td><input type="text" name="" class="" placeholder="質問内容を入力してください"></td>
	</tr>
	<tr>
		<th>添付ファイル</th>
		<td><input type="text" name="" class="" placeholder="件名を入力してください"><button type="button">参照</button></td>
	</tr>
	</table>
</form>
<input type="submit" name="REGIST" value="登録">


<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>