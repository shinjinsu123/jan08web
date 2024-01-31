<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 보드 게시판</title>
<link href="../css/admin.css?ver=0.13" rel="stylesheet" />
<link href="../css/adminBoard.css?ver=0.13" rel="stylesheet" />
<script type="text/javascript" src="../js/menu.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
//$(document).ready(function){}
$(function() {
		$('#searchBtn').click(function() {
			let search = $('#search').val();
			location.href = "./board?search=" + search;
		});
		$('.changeDel').click(function() {
			let eyes = $(this);
			let del = eyes.prev();
			let className = $(this).parents('tr');
			let no = className.children().first().text();
			$.ajax({
				url      : './board',
				type     : 'post',
				dataType : 'text',
				data     : {'no' : no, 'del' : del.val()},
				success  : function(result){
					if(result == 1){
						if(del.val() == 1){ // 1 -> 0
							className.attr('class','row0'); //className.css('backgroundColor', '#FFDC46');
							del.val(0);
							eyes.attr('class','xi-eye-off-o changeDel');
							
						} else { // 0 -> 1
							className.attr('class','row1'); //className.css('backgroundColor', '#ffffff');
							del.val(1);
							eyes.attr('class','xi-eye changeDel');
						}
							
					}else{
						alert("문제가 발생햇습니다.");
					}
				},
				error    : function(error){
					alert("에러 : " + error);
				}
			});
		
	});
	
});
</script>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<article>
				<h2>게시글 관리</h2>
				<div class="search">
					<input type="text" id="search"><button id="searchBtn">검색</button>
				</div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목(방문자)</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>댓글</th>
							<th>방문자</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
						<tr class="row${row.del }">
							<td class="d1">${row.no }</td>
							<td class="title">
							<a href="../detail?no=${row.no }">
							${row.title }
							<c:if test="${row.comment ne 0}">
							<small>(${row.comment })</small></c:if></a></td>
							<td class="d2">${row.write }</td>
							<td class="d2">${row.date }</td>
							<td class="d1">${row.ip }</td>
							<td class="d1">${row.count }</td>
							<td class="d1">
							<input type="hidden" id="del" value="${row.del }">
							<c:if test="${row.del eq 1 }"><i class ="xi-eye changeDel"></i></c:if>
							<c:if test="${row.del eq 0 }"><i class ="xi-eye-off-o changeDel"></i></c:if>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</article>
		</div>
	</div>
</body>
</html>