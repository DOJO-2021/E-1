'use strict'
function check(){


	const s_id = document.getElementById('regist_form').s_id.value;
    const s_pw = document.getElementById('regist_form').s_pw.value;
    const s_pwc = document.getElementById('regist_form').s_pwc.value;
    const idCheck = /^[0-9 a-z A-Z]{1,20}$/;
    const pwCheck = /^[0-9 a-z A-Z]{8,}$/;


    if(idCheck.test(s_id)==false&&s_id!==""){
      event.preventDefault();
      document.getElementById('regex').textContent = 'IDには、２０文字以内の英数字を設定してください。';
      return false;
    }else if(pwCheck.test(s_pw)==false&&s_pw!==""){
      event.preventDefault();
      document.getElementById('regex').textContent = 'パスワードには、8文字以上の英数字を設定してください';
      return false;
    }else if(!(s_pw === s_pwc)){
      event.preventDefault();
      document.getElementById('regex').textContent = 'パスワードが一致しません';
      return false;
    }else{
      window.confirm('この内容で登録しますがよろしいでしょうか？');
	  return true; // 送信を実行

    }




    /*}else {
      document.getElementById('regex').textContent = '';
    }

	if(flag){

      document.getElementById('output').textContent = ('必須項目を入力してください。');

      return false; // 送信を中止

    } else if(window.confirm('この内容で登録しますがよろしいでしょうか？')){

	  return true; // 送信を実行

	} else {
      return false;
    }*/

}