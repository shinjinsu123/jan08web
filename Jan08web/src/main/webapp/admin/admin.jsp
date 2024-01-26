<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 입니다.</title>
<link href="../css/admin.css" rel="stylesheet">
<script type="text/javascript" src="../js/menu.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<!-- 2024-01-26 관리자 페이지 만들기 -->
	<!-- 틀 -->
	<div class="wrap">
		<!-- menu -->
		<div class="menu">
			<nav>
				<ul>
					<li onclick="url('./members')"><i class="xi-profile"></i> 회원 관리</li>
					<li onclick="url('./board')"><i class="xi-document"></i> 게시글 관리</li>
					<li onclick="url('./comments')"><i class="xi-comment-o"></i> 댓글 관리</li>
					<li onclick="url('./info')"><i class="xi-lock-o"></i> 주인님</li>
					<li></li>
					<li></li>
				</ul>
			</nav>
		</div>
		<!-- 본문 내용 -->
		<div class="main">
			<!-- 이 페이지에 오는 모든 사람은 관리자인지 아닌지 검사합니다.
			관리자의 경우 보여주고, 로그인하지 않았거나, 일반 사용자는 로그인 페이지로 이동시킨다. -->
			<article>
			
				<div class="info">
					왼쪽 메뉴를 서택하세요.
				</div>
				
			</article>
		
		</div >
		
	</div>
</body>
</html>