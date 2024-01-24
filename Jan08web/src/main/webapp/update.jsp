<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<!-- menu.js로 들어가보면 location.url기능이 있다 -->

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- 13~19번 줄 코드 복붙 위치 https://summernote.org/getting-started/#include-jscss -->
</head>
<style>
#title{
	width: 100%;
	height: 30px;
	margin-bottom: 15px;
	font-size: 20px;
}

</style>


<body>
	<div class="container2">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>글 수정하기</h1>
					<div class="writeFORM">
						<form action="./update" method="post">
							<input type="text" id="title" name="title" value="${update.title }">
							<!-- name은 자바단에서만 사용할거
							id는 javascript에서 사용할거 -->
							<textarea id="summernote" name="content">${update.content }</textarea>
							<button type="submit">글쓰기</button>
							<input type="number" name="no" value="${update.no }">
						</form>
					</div>
					<article>
					가림방지용
					</article>
				</article>
			</div>
		</div>
		<footer>
		</footer>
	</div>
	<script type="text/javascript">
							$(document).ready(function() {
								$('#summernote').summernote({
								height: 400
									
								});

							});
						</script>
</body>
</html>