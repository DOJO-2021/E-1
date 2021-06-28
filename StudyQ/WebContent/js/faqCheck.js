const check = () => {
	if(window.confirm('この内容で送信してよろしいですか？')){ // 確認ダイアログを表示

		return true; // 「OK」時は送信を実行

	}
	else{ // 「キャンセル」時の処理

		window.alert('キャンセルされました。'); // 警告ダイアログを表示
		return false; // 送信を中止

	}
}

const check2 = () => {

	if(window.confirm('この内容で更新してよろしいですか？')){ // 確認ダイアログを表示

		return true; // 「OK」時は送信を実行

	}
	else{ // 「キャンセル」時の処理

		window.alert('キャンセルされました。'); // 警告ダイアログを表示
		return false; // 送信を中止

	}
}

const check3 = () => {

	if(window.confirm('本当に削除してよろしいですか？')){ // 確認ダイアログを表示

		return true; // 「OK」時は送信を実行

	}
	else{ // 「キャンセル」時の処理

		window.alert('キャンセルされました。'); // 警告ダイアログを表示
		return false; // 送信を中止

	}
}
