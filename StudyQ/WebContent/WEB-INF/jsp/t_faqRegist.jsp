<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ登録</title>
</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />

<!-- FAQ登録テーブル -->
<form method="POST" action="/StudyQ/TeacherFaqRegist">
	<div class="faqlist_regist_body">
		<table>
			<tr>
				<th> FAQ質問 </th>
				<td><input type="text" name="faq_title" ></td>
			</tr>
			<tr>
				<th> FAQカテゴリ </th>
				<td>
					<select name="faq_m_category" >
						<option value="">カテゴリを選択</option>
						<optgroup label="学習内容">
							<option value="0">プログラミング言語</option>
							<option value="1">段位認定</option>
							<option value="2">ドリル</option>
						</optgroup>
						<optgroup label="トラブル">
							<option value="3">コードエラー</option>
							<option value="4">その他</option>
							<option value="5">エディター</option>
							<option value="6">PC</option>
							<option value="7">Github</option>
						</optgroup>
						<optgroup label="その他・相談">
							<option value="8">その他</option>
							<option value="9">相談等</option>
						</optgroup>
					</select>
				</td>
			</tr>
			<tr>
				<th> FAQ回答 </th>
				<td><input type="text" name="faq_ans" > </td>
			</tr>
		</table>

		<!-- FAQ登録ボタン -->
		<div class="t_faq_regist_btn">
			<input type="submit" name="" value="登録">
		</div>
	</div>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>