<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>

			<!-- 최종 후 마지막에 붙여넣어라 -->
			<!-- jsp:는 출력 결과만 화면에 나옵니다. -->
		</header>
		<div class="main">
			<div>
				<article>

					<c:set var="number" value="105" />

					<c:out value="${number }" />
					<br>

					<c:forEach begin="1" end="9" var="row" step="2">
						2 x ${row } = ${row * 2 }<br>
					</c:forEach>

					<c:if test="${number ge 105 }">
						number는 105입니다.<br>
						eq : 11 == 5            : 같아? = false<br>
						ne : 11 != 5            : 달라? = true<br>
						lt : 11〈5 (ㄴ한자키임)		      false<br>
						gt : 11〉5 						  true<br>
						le : 11〈= 5 					  false<br>
						ge : 11〉= 5					  true<br>
						&&<br>
						||<br>BoardDTO
						empty<br>
						not empty<br>

					</c:if>
					<hr>
					1~45까지 짝수만 출력하세요.<br>
					<c:forEach begin="1" end="45" var="even">
						<c:if test="${even % 2 eq 0 }">
					${even }
					</c:if>
					</c:forEach>
				</article>

				<article>
					<%-- <c:import url="menu.jsp"/> --%>
					<br>
					<c:forEach begin="1" end="10" var="row" varStatus="s">
						<!-- var = 변수이름 --> 
						${s.begin } / ${s.end } 
						<!-- varstatus = 현재 속성보는거 -->
					</c:forEach>
					<%-- <c:redirect url="./board"/> --%>
					<!-- 페이지 못봄 -->
				</article>

				<article>
					article
					<tr>

					</tr>
				</article>
			</div>


		</div>
		<footer>
			<c:import url="footer.jsp" />
		</footer>
	</div>
</body>
</html>