<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>研修生｜FAQ検索結果</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<!-- ここからヘッダー -->
<jsp:include page="student_header.jsp"/>
<!-- ここからメイン -->
<jsp:include page="student_menu.jsp"/>
<h2 class="header_title">FAQ検索結果</h2>



  <input type="text" value="red" id="text1" maxlength="5" />
<input type="button" value="ボタン" onclick="clickBtn1()" />

<!-- 保留
<script>
  function clickBtn1() {
    const t1 = document.getElementById("text1").value;
    document.getElementById("span1").textContent = t1;
  }
</script>

<script>
$(function(){
  var pagetop = $('#page_top');
  // ボタン非表示
  pagetop.hide();
  // 100px スクロールしたらボタン表示
  $(window).scroll(function () {
     if ($(this).scrollTop() > 100) {
          pagetop.fadeIn();
     } else {
          pagetop.fadeOut();
     }
  });
  pagetop.click(function () {
     $('body, html').animate({ scrollTop: 0 }, 500);
     return false;
  });
});
</script>
-->
<div id="page_top"><a href="#">TOP</a></div>
<!-- ここからフッター -->
<jsp:include page="footer.jsp"/>
</body>
</html>