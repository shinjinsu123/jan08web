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

</head>
<body>
<div class = "container">
   <header>
      <%@ include file="menu.jsp"%>
      <!-- jsp:는 출력 결과만 화면에 나옵니다. -->
   </header>
<div class="main">
         <div>
            <article>
               <h1>QNA</h1>
               <h2>2023-01-10</h2>
               <ul>
                  <li>톺아보기</li>
                  <li>각각 게시판 서블릿, jsp 20분까지 만들기</li>
                  <li>글쓰기</li>
                  <li>삭제하기</li>
                  <li>수정하기</li>
               </ul>
            </article>
         </div>
      </div>
      <footer>
		<c:import url="footer.jsp"/>
		</footer>
   </div>
</body>
</html>