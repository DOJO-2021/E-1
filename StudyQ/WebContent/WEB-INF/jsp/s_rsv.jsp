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
<jsp:include page="student_header.jsp"/>

<!-- メイン -->
<jsp:include page="menu.jsp"/>
<h2>セッション予約</h2>
<p>○○さん</p>
<form method="POST" action="/studyQ/StudentReserveResult">
	<table>
	<tr>
		<th>件名</th>
		<td><input type="text" name="subject" class="" placeholder="件名を入力してください"></td>
	</tr>
	<tr>
		<th>カテゴリ</th>
		<td>
		<select name="">
			<option value ="">質問するカテゴリを選択</option>
			<optgroup label="学習内容">
		    	<option value ="">プログラミング言語</option>
		    	<option value ="">段位認定</option>
		    	<option value ="">ドリル</option>
		    	<option value ="">コードエラー</option>
		    	<option value ="">その他</option>
		    </optgroup>
			<optgroup label="トラブル">
		    	<option value ="">エディター</option>
		    	<option value ="">PC</option>
		    	<option value ="">Github</option>
		    	<option value ="">その他</option>
		    </optgroup>
		    <optgroup label="その他">
		    	<option value ="">相談</option>
		    </optgroup>

		</select>
		</td>
	</tr>
	<tr>
		<th>質問内容</th>
		<td><input type="text" name="question" class="" placeholder="質問内容を入力してください"></td>
	</tr>
	<tr>
		<th>添付ファイル</th>
		<td><input type="text" name="" class="" placeholder="件名を入力してください"><button type="button">参照</button></td>
	</tr>
	</table>
	<input type="submit" name="REGIST" value="登録">
</form>

<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>