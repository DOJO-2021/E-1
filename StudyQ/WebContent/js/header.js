function MoveCheck() {
    if( confirm("ログアウトしますか？") ) {
        window.location.href = "/StudyQ/Logout";
    }
    else {
        alert("ログアウトを中止しました。");
        /*window.location.href = "/StudyQ/StudentTop";*/
    }
}/**
 *
 */