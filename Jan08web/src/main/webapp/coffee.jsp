<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>커피하우스 입니다.</h1><br>
	<h2>메뉴를 선택하세요.</h2>
	<div class="coffeMain">
			<div>
			<div>커피</div>
			<form action="./coffee" method="post">
				<input type="radio" id="coffee1" name="menu" value="아아">
				<label for="coffee1">아이스 아메리카노</label>
				
				<input type="radio" id="coffee2" name="menu" value="뜨아">
				<label for="coffee2">따듯한 아메리카노</label>
				
				<input type="radio" id="coffee3" name="menu" value="바닐라라떼">
				<label for="coffee3">바닐라라떼</label>
				
				<input type="radio" id="coffee4" name="menu" value="카페모카">
				<label for="coffee4">카페모카</label>
				
				<input type="radio" id="coffee5" name="menu" value="카페라떼">
				<label for="coffee5">카페라떼</label><hr>
				
			<div>티</div>
				<input type="radio" id="tea1" name="menu" value="복숭아티(ice)">
				<label for="tea1">복숭아티(아이스)</label>
				
				<input type="radio" id="tea2" name="menu" value="복숭아티(hot)">
				<label for="tea2">복숭아티(따뜻한거)</label>
				
				<input type="radio" id="tea3" name="menu" value="허브티(ice)">
				<label for="tea3">허브티(아이스)</label>
				
				<input type="radio" id="tea4" name="menu" value="허브티(hot)">
				<label for="tea4">허브티(따뜻한거)</label>
				
				<input type="radio" id="tea5" name="menu" value="자몽티(ice)">
				<label for="tea5">자동티(아이스)</label>
				
				<input type="radio" id="tea6" name="menu" value="자몽티(hot)">
				<label for="tea6">자몽티(따뜻한거)</label>
				
				<input type="radio" id="tea7" name="menu" value="유자차(ice)">
				<label for="tea7">유자차(아이스)</label>
				
				<input type="radio" id="tea8" name="menu" value="유자차(hot)">
				<label for="tea8">유자차(따뜻한거)</label>
			</div>
			
			<button type="submit">선택</button><hr>
			</form>

			<table>
				<thead>
					<tr>
						<th>id</th>
						<th>menu</th>
					</tr>
				</thead>
					<tbody>
						<c:forEach items="${list }" var="coff">
							<tr>
								<td>${coff.id }</td>
								<td>${coff.menu }</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			
	</div>
</body>
</html>