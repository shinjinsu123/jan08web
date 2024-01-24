<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style type="text/css">
.work{
	width: 100%;
	height: auto;
}
.did, .left{
	width: calc(50% - 8px);
	float: left;
}
.did h1, .left h1{
	margin:0;
	padding: 0;
	height: 50px;
	background-color: gray;
	line-height: 50px;
	text-align: center;
}
.did{
	height:100%;
	border: 2px solid red;
}
.left{
	height:100%;
	border: 2px solid green;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			
			<nav>
				<ul>
					<li onclick="url('./index')">홈</li>
					<li onclick="url('./board')">게시판</li>
					<li onclick="url('./qna')">문의게시판</li>
					<li onclick="url('./notice')">공지사항</li>
					<li onclick="url('./bootstrap')">부트스트랩</li>
					<li onclick="url('./info')">info</li>
					<li onclick="url('./team')">팀</li>
					<li onclick="url('./login')">로그인</li>
				</ul>
			</nav>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="work">
						<div class="left">
							<h1>남은 것</h1>
							<ul>
								<li>xml / json</li>
								<li>관리자페이지</li>
								<li>파일업로드</li>
								<li>MVC패턴</li>
								<li>스프링-레거시</li>
								<li>lombok</li>
								<li>mybaris</li>
								<li>스프링-부트</li>
								<li>thymeleaf</li>
								<li>jpa</li>
								<li>리눅스</li>
								<li>aws</li>
								<li>vue</li>
							</ul>
						</div>
						<div class="did">
							<h1>한 것</h1>
							<h2>2024-01-23 프레임워크 프로그래밍 / 정처기 시험접수</h2>
							<ul>
								<li>읽은 글 보기</li>
								<li>IP</li>
								<li>제목, 댓글에 html 막기</li>
								<li>댓글에 < b r > 처리하기</li>
							</ul>
							<h2>2024-01-22 프레임워크 프로그래밍</h2>
							<ul>
								<li>댓글출력</li>
								<li>댓글달기</li>
								<li>댓글삭제</li>
							</ul>
							<h2>2024-01-19</h2>
							<ul>
								<li>postman</li>
								<li>database development</li>
								<li>dbeaver</li>
								<li>aquerytool</li>
								<li>댓글달기 관계도 그리기</li>
								<li>댓글 테이블 만들기</li>
								<li>댓글달기</li>
							</ul>
							<h2>2024-01-18</h2>
							<ul>
								<li>페이징</li>
								<li>bootstrap</li>
								<li>jquery</li>
								<li>회원가입</li>
								<li>AJAX</li>
							</ul>
							<h2>2024-01-17</h2>
							<ul>
								<li>페이징</li>
								<li>bootstrap</li>
								<li>jquery</li>
								<li>회원가입</li>
								<li>AJAX</li>
								<li>관리자모드 - 회원관리</li>
								<li>관리자모드 - 글관리</li>
							</ul>
							<h2>2024-01-16</h2>
							<ul>
								<li>세션 사용해서 수정, 삭제 막기</li>
								<li>내 정보 보기</li>
								<li>페이징</li>
							</ul>
							<h2>2024-01-15</h2>
							<ul>
								<li>세션으로 로그인 만들기</li>
								<li>board테이블 변경</li>
							</ul>
							<h2>2024-01-10 / 웹 서버프로그램 구현</h2>
							<ul>
								<li>각각 게시판 서블릿, jsp 20분까지</li>
								<li>톺아보기</li>
								<li>글쓰기</li>
								<li>삭제하기</li>
								<li>수정하기</li>
							</ul>
						</div>
					</div>
      </div>
      <footer>
		<c:import url="footer.jsp"/>
		</footer>
   </div>
</body>
</html>