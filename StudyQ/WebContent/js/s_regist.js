'use strict'
function check(){

	var flag = 0;
	const s_id = document.getElementById('regist_form').s_id.value;
    const s_pw = document.getElementById('regist_form').s_pw.value;
    const idCheck = /^[0-9 a-z A-Z]{1,20}$/;
    const pwCheck = /^[0-9 a-z A-Z]{8,}$/;

	// 設定開始

	if(document.new_regist.s_l_name.value == ""){ // 「姓」の入力をチェック
		flag = 1;
	}
	else if(document.new_regist.s_f_name.value == ""){ // 「名」の入力をチェック
		flag = 1;
	}
	else if(document.new_regist.s_id.value == ""){ // 「ID」の入力をチェック
		flag = 1;
	}
    else if(document.new_regist.s_pw.value == ""){ // 「パスワード」の入力をチェック
		flag = 1;
    }
    else if(document.new_regist.s_pwc.value == ""){ // 「確認用パスワード」の入力をチェック
		flag = 1;
    }
	// 設定終了
    if(idCheck.test(s_id)==false&&s_id!==""){
      event.preventDefault();
      document.getElementById('regex').textContent = 'IDには、２０文字以内の英数字を設定してください。';
    }else if(pwCheck.test(s_pw)==false&&s_pw!==""){
      event.preventDefault();
      document.getElementById('regex').textContent = 'パスワードには、8文字以上の英数字を設定してください';
    }else {
      document.getElementById('regex').textContent = '';
    }

	if(flag){

      document.getElementById('output').textContent = ('必須項目を入力してください。');

      return false; // 送信を中止

    } else if(window.confirm('この内容で登録しますがよろしいでしょうか？')){

	  return true; // 送信を実行

	} else {
      return false;
    }

}