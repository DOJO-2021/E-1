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
<form method="post" action="/StudyQ/TeacherFaqRegist">
<div class="faqlist_regist_body">
	<table>
		<tr>
			<th> FAQ質問 </th>
			<td><input type="text" name="faq_title"  > </td>
		</tr>
		<tr>
			<th> FAQカテゴリ </th>
			<td>
				<select name="faq_b_category"  >
				<option value=""> 学習内容 </option>
				<option value=""> トラブル </option>
				<option value=""> その他 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th> FAQ回答 </th>
			<td><input type="text" name="faq_ans"  > </td>
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