<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - ip관리</title>
<link href="../css/admin.css?ver=0.19" rel="stylesheet"/>
<link href="../css/member.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
   
   function drawChart() {
   
     var data = google.visualization.arrayToDataTable([
       ['Task', 'Hours per Day'],
       <c:forEach items="${list1 }" var="row1">
       ['${row1.iip }',     ${row1.connection_count }],
       </c:forEach>
     ]);
   
     var options = {
       title: 'My Daily Activities'
     };
   
     var chart = new google.visualization.PieChart(document.getElementById('piechart'));
   
     chart.draw(data, options);
   }
    </script>

<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        <c:forEach items="${list1 }" var="row1">
        ["${row1.iip }", ${row1.connection_count}, "#b87333"],
        </c:forEach>
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Density of Precious Metals, in g/cm^3",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
  </script>

</head>
<body>
	<div class="wrap">
		<!-- menu -->
		<%@ include file="menu.jsp" %>
		<div class="main">
			<article>
				<h2>IP관리</h2>
				0. 중복없이 ip리스트 뽑기는?<br>
				sql = SELECT DISTINCT iip FROM iplog;<br>
				
				1. 최다 접속 ip 5개 출력<br>
				sql = SELECT iip, COUNT(*) AS connection_count FROM iplog GROUP BY iip ORDER BY connection_count DESC LIMIT 5;<br>
				
				2. 그래프 그리기 (최다접속 10개로)<br>
				sql = SELECT iip, COUNT(*) AS connection_count FROM iplog GROUP BY iip ORDER BY connection_count DESC LIMIT 10;<br>
				
				<div class="nav-lists">
					<ul class="nav-lists-group">
						<li class="nav-lists-item" onclick="url('./ip?del=1')"><i class="xi-close-circle-o"></i> 보임</li>					
						<li class="nav-lists-item" onclick="url('./ip?del=0')"><i class="xi-close-circle-o"></i> 숨김</li>					
					</ul>
					<div class="search">
						<input type="text" id="search">
						<button id="searchBtn">검색</button>
					</div>
					<button onclick="location.href='./ip'">초기화</button>
				</div>
				<div>
				<table>
				<h2>최다 접속 IP 5개만 보이게 하기</h2>
					<thead>
						<tr>
							<th>IP</th>
							<th>COUNT(5)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list1 }" var="row1">
							<tr>
								<td class="d2">${row1.iip }</td>
								<td class="d2">${row1.connection_count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				</div>
				
				<h2>그래프</h2>
             <div id="piechart" style="width: 900px; height: 500px;"></div>
				
				<h2>막대 그래프</h2>			
				<div id="barchart_values" style="width: 700px; height: 150px;"></div>
				
				<hr>
				<div>
				<table>
				<h2>최다 접속 IP 10개만 보이게 하기</h2>
					<thead>
						<tr>
							<th>IP</th>
							<th>COUNT(10)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2 }" var="row2">
							<tr>
								<td class="d2">${row2.iip }</td>
								<td class="d2">${row2.connection_count }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				</div>
				
				<div>
				<table>
				<h2>가장 최근 접속한 ip 10개 보이게 하기(중복 없다)</h2>
					<thead>
						<tr>
							<th>IP</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list3 }" var="row3">
							<tr>
								<td class="d2">${row3.iip }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				</div>
				
				<div>
				<table>
				<h2>IP 전체</h2>
					<thead>
						<tr>
							<th>번호</th>
							<th>IP</th>
							<th>날짜</th>
							<th>URL</th>
							<th>기타</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row">
								<td class="d1">${row.ino }</td>
								<td class="d1"><a href="./ip?ip=${row.iip }">${row.iip }</a></td>
								<td class="d2">${row.idate }</td>
								<td class="d1">${row.iurl }</td>
								<td class="title">${row.idate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</article>
		</div>
	</div>
</body>
</html>