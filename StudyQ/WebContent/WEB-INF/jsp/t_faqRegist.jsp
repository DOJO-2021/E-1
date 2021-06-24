<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師 | FAQ登録</title>
<!-- css -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/t_faqRegist.css">
</head>
<body>
<jsp:include page="teacher_header.jsp" />
<jsp:include page="teacher_menu.jsp" />

<h1 style="text-align: center;">FAQ登録</h1>
<!-- FAQ登録テーブル -->
<form method="POST" action="/StudyQ/TeacherFaqRegist">
	<div class="faqlist_regist_body">
		<table class="faq_regist_table">
			<tr>
				<th> FAQ質問 </th>
				<td><textarea rows="5" cols="60" name="faq_title" ></textarea></td>
			</tr>
			<tr>
				<th> FAQ回答 </th>
				<td><textarea rows="5" cols="60" name="faq_ans" ></textarea></td>
			</tr>
		</table>

		<!-- FAQ登録ボタン -->
		<!-- CSSが効かなかったので直接記述しました -->
		<div class="t_faq_regist_btn">
			<input type="submit" name="" value="登録" class="btn_orange"

  style="
  margin        : 30px ;
  display       : inline-block;
  border-radius : 20%;          /* 角丸       */
  font-size     : 13pt;        /* 文字サイズ */
  text-align    : center;      /* 文字位置   */
  cursor        : pointer;     /* カーソル   */
  padding       : 12px 24px;   /* 余白       */
  background    : #FFAA00;     /* 背景色     */
  color         : #ffffff;     /* 文字色     */
  line-height   : 1em;         /* 1行の高さ  */
  transition    : .3s;         /* なめらか変化 */
  box-shadow    : 6px 6px 3px #666666;  /* 影の設定 */
  border        : 2px solid #FFAA00;"    /* 枠の指定 */
  onMouseOut="this.style.background='#FFAA00'" onMouseOver="this.style.background='#f56500';this.style.border='#f56500';
  ">
		</div>
	</div>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>