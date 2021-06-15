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
<jsp:include page="student_menu.jsp"/>
<h2>セッション予約</h2>
<!-- <p><c:out value="${s_l_name}"/>さん</p> 保留 -->
<form method="POST" action="/StudyQ/StudentReserve" enctype="multipart/form-data">
	<table>
	<tr>
		<th>件名</th>
		<td><input type="text" name="subject"  class="" placeholder="件名を入力してください"></td>
	</tr>
	<tr>
		<th>カテゴリ</th>
		<td>
		<select name="session_m_category">
			<option value ="">質問するカテゴリを選択</option>
			<optgroup label="学習内容">
		    	<option value ="0">プログラミング言語</option>
		    	<option value ="1">段位認定</option>
		    	<option value ="2">ドリル</option>
		    	<option value ="3">コードエラー</option>
		    	<option value ="4">その他</option>
		    </optgroup>
			<optgroup label="トラブル">
		    	<option value ="5">エディター</option>
		    	<option value ="6">PC</option>
		    	<option value ="7">Github</option>
		    	<option value ="8">その他</option>
		    </optgroup>
		    <optgroup label="その他">
		    	<option value ="9">相談</option>
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
		<td><input type="text" class="" placeholder="件名を入力してください"><button type="button">参照</button></td>
	</tr>
	</table>
	<input type="submit" name="REGIST" value="登録">
</form>

<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>