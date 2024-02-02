<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/board.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
			<!-- 일단 먼저 내거 파일 가져오고 자바 파일 실행 -->
		</header>
		<div class="main">
		<div class="mainStyle"><div>

				<article>
				<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<table>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>날짜</th>
									<th>읽음</th>
								</tr>
								<c:forEach items="${list }" var="row">
									<tr>
										<td class="w1">${row.no }</td>
										<td class="title">
										<a href="./detail?page=${page } &no=${row.no }">${row.title}
										<c:if test="${row.comment ne 0 }">
										<span> [${row.comment}]</span></c:if>
                                	    </a></td>
										<td class="w2">${row.write }</td>
										<td class="w1">${row.date }</td>
										<td class="w1">${row.count }</td>
									</tr>
								</c:forEach>
							</table>
							<c:set var="totalPage" value="${totalCount / 10 }"/>
							<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"/>
							<c:if test="${totalCount % 10 gt 0 }">
								<c:set var="totalPage" value="${totalPage + 1 }"/>
							</c:if>
							<c:set var="startPage" value="1"/>
							<c:if test="${page gt 5 }">
								<c:set var="startPage" value="${page - 5 }"/>
							</c:if>
							<c:set var="endPage" value="${startPage + 9 }"/>
							<!-- 한 화면에 10개 보여줄려고 --> 
							<c:if test="${endPage gt totalPage }">
								<c:set var="endPage" value="${totalPage }"/>
							</c:if>
							
							<div class="paging">
								<button onclick="paging(1)">⏮</button>  <!-- 1페이지로 이동 -->
								<button <c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if> onclick="paging(${page - 10 })">⏪</button>
								<c:forEach begin="${startPage }" end="${endPage }" var="p">
									<button
									<c:if test="${page eq p }"> class="currentBtn"</c:if>
									 onclick="paging(${p})">${p }</button>
								</c:forEach>
								<button <c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if> onclick="paging(${page + 10 })">⏩</button>
								<button onclick="paging(${totalPage })">⏭</button>  <!-- 마지막 페이지로 이동 -->
							</div>
						</c:when>
						<c:otherwise>
							<h1>출력할 값이 없습니다.</h1>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${sessionScope.mname ne null }">
						<button onclick="url('./write')">글쓰기</button>
						${sessionScope.mname }님 반갑습니다.
					</c:if>
					
				</article>
				<article>
					<%-- <fmt:requestEncoding value="UTF-8" />
					<fmt:setLocale value="ko_kr" />
					<fmt:formatNumber value="3.14" type="number" />
					<fmt:parseNumber value="3.14" integerOnly="true" />

					<c:set var="nowDate" value="<%=new Date()%>" />
					${nowDate } <br>
					<fmt:formatDate type="time" value="${nowDate }" />
					<br>
					<fmt:formatDate type="date" value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="short" timeStyle="short"
						value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"
						value="${nowDate }" />
					<br>
					<fmt:formatDate type="both" dateStyle="long" timeStyle="long"
						value="${nowDate }" />
					<br>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${nowDate }" /> --%>

				</article>
				<article>
					<%-- fn이용해서 자료형 데이터 길이 뽑아내기 ${fn:length(list) }<br> --%>


				</article>
			</div>
		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
	<script type="text/javascript">
		function paging(no) {
			location.href="./board?page="+no;
		}
	</script>
	
	</div>
</body>
</html>