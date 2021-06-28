<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/s_rsv.css">
<title>研修生|セッション予約</title>
</head>

<body>
<!-- ヘッダー -->
<jsp:include page="student_header.jsp"/>

<!-- メイン -->
<jsp:include page="student_menu.jsp"/>
<section class="main1">
	<h3><span>セッション予約</span></h3>
	<form method="POST" action="/StudyQ/StudentReserve" enctype="multipart/form-data">
		<div class="Form">

			 <!-- 件名 -->
			 <div class="Form-Item">
			 	<p class="Form-Item-Label">
			 		<span class="Form-Item-Label-Required">必須</span>件名
			 	</p>
			 	<input type="text" class="Form-Item-Input" placeholder="件名を入力してください" name="subject">
			</div>

			<!-- カテゴリ -->
			 <div class="Form-Item">
			 	<p class="Form-Item-Label">
			 		<span class="Form-Item-Label-Required">必須</span>カテゴリ
			 	</p>
				<select name="session_m_category">
					<option value =""><span class="category">質問するカテゴリを選択</span></option>
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
						<option value ="9">相談等</option>
					</optgroup>
				</select>
			</div>
			<div class="Form-Item">
				<p class="Form-Item-Label isMsg"><span class="Form-Item-Label-Required">必須</span>質問内容</p>
				<textarea class="Form-Item-Textarea" name="question"></textarea>
			</div>
			<div class="Form-Item">
				<p class="Form-Item-Label">　　　添付ファイル</p>
				<input type="file" class="file" name="file">
			</div>
			<input type="submit" value="登録" class="btn_orange"

	  style="
	  margin        : 0px 30px 30px 30px;
	  margin-left   : 370px;
	  display       : inline-block;
	  border-radius : 20%;          /* 角丸       */
	  font-size     : 20pt;        /* 文字サイズ */
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
	</form>
</section>

<!-- フッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>