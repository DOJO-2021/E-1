<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- common.cssを適用 -->
<link rel="stylesheet"  href="/StudyQ/css/common.css">



<!-- ドロワーボタン -->
<div id="wrapper" class="show">
	<div class="container">
		<div class="hamburger" id="open_nav">
		    <a class="menu-btn">
		        <span></span>
		        <span></span>
		        <span></span>
		    </a>
		 </div>
    </div>
</div><!-- wrapper -->

<!-- メニュー -->
<nav id="nav" class="show">
	<ul class="menu">
		<li id="menu_logo">&nbsp; &nbsp;MENU</li>
		<li><a href="/StudyQ/TeacherTop">TOP </a></li>
		<li><a href="/StudyQ/TeacherFaqEdit">FAQ </a></li>
		<li><a href="/StudyQ/TeacherReserveList">セッション予約リスト</a></li>
		<li><a href="/StudyQ/Logout">ログアウト</a></li>
		<li id="menu_space">&nbsp; </li>
	</ul>
</nav>


<!-- Java Script -->
<script src="/StudyQ/jquery/jquery-3.6.0.min.js"></script>
<script>
'use strict';

/* ドロワーメニューの表示 / 格納 */
$(function(){
	    $(".menu-btn").click(function(){
        $(".menu").slideToggle(400);
    });

    $(".menu li a").click(function(){
        \$(".menu").css({display:"none"});
    });
});
//メニュー以外をクリック→メニュー消す
$('.menu-btn').click(function() {
	    event.stopPropagation();
	});
	$(document).click(function(event) {
	    if (!$(event.target).closest('.menu').length) {
	        $('.menu').slideUp(400);
	    }
	});

</script>
