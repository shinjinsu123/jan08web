<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>톺아보기</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<!-- menu.js로 들어가보면 location.url기능이 있다 -->
<link href="./css/detail.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- xeicon 에 접속해서 붙여넣기 https://xpressengine.github.io/XEIcon/started.html -->
<script type="text/javascript" src="./js/menu.js"></script>

<!-- J query쓰려고 한다 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
function del() {
	//alert("삭제를 눌렀습니다.");
	var ch = confirm("글을 삭제하시겠습니까?");
	
	if(ch){
	location.href="./delete?no=${detail.no }";
	}
}
function update(){
	
	if(confirm("글을 수정하시겠습니까?")){
		location.href="./update?no=${detail.no }";
	}
	
}

/* function commentDel(cno) {
    if(confirm("댓글을 삭제하시겠습니까?")){
       location.href='./commentDel?no=${detail.no}&cno='+cno;
    }
 }
 */
$(document).ready(function(){
	
	// 댓글 수정하기 버튼을 눌렀다. commentEdit
	$(".commentEdit").click(function(){
		if(confirm('수정하시겠습니까?')){
            //필요한 값 cno 잡기 / 수정한 내용 + 로그인 --> 서블릿에서 정리
            let cno = $(this).siblings(".cno").val();
            let comment = $(this).parents(".chead").next(); //나중에 html변경 태그는 무조건 object라고 뜸
            //alert(cno + ":" + comment);
            
            $(this).prev().hide();
			$(this).hide();
			comment.css('height','110');
			comment.css('padding-top','10px');
			comment.css('backgroundColor','#c1c1c1');
			//comment.css("resize", none);
			//let commentChange = comment.html().replaceAll("<br>", "\r\n");
            
            function addBR(str) {
                return str.replaceAll("<br>", "\r\n");
            }
            
            let recommentBox = '<div class="recommentBox">';
            recommentBox += '<form action="./cedit" method="post">';
            recommentBox += '<textarea class="commentcontent" name="comment">' + addBR(comment.html()) + '</textarea>';
            recommentBox += '<input type ="hidden" name = "cno" value ="' +cno+ '">';
            recommentBox += '<button class="comment-btn" type = "submit">댓글 수정</button>';
            recommentBox += '</form></div>';
            
            comment.html(recommentBox);
            
            
         }
	});

	// 댓글 삭제 버튼을 눌렀다. commentDelete
	$(".commentDelete").click(function(){
		//alert("삭제버튼을 눌렀습니다.");
		//부모 객체 찾아가기 (삭제번호=?) = this() : 자식(나)생성자 ======= super() : 부모 생성자
		//$(this).parent(".cname").css('color', 'green');          //나의 부모(cname)
		//$(this).parent(".cname").text("변경가능");   // 위는 색상, 밑에는 글자를 변경
		let text = $(this).parent(".cname").text();   // val() , text, html() ?
		
		// 부모 요소 아래 자식 요소 찾기 children()
		//let cno = $(this).parent(".cname").children(".cno").val();
		//let cno = $(this).parent().children(".cno").val();
		//alert(cno);	
		
		// 형제 요소 찾기 .siblings() .prev() 바로 이전   .next()바로 다음
		let cno = $(this).siblings(".cno").val();
		//alert(cno);
		
		if(confirm("삭제 하겠습니까?")){
		// AJax
		let point = $(this).closest(".comment");
		$.ajax({
			url : './commentDel',  // 주소
			type : 'post',         // get, post  / commentDel은 현재 get에 있다.
			dataType : 'text',     // 수신 타입 json
			data: {no : cno},        // 보낼 값
			success: function(result){ // 0,1
				//alert("서버에서 온 값 : " + result);
				if(result == 1){
					// 정상 삭제 : this의 부모(.comment)를 찾아서 remove하겠다.
					//$(this).closest(".comment").hide();
					point.remove();
				}else{
					alert("삭제할 수 없습니다. 관리자에게 문의하세요.");
				}
				
			},
			error:function(request, status, error){ //통신 오류
				alert("문제가 발생했습니다.");
			}
		});  // end AJax
			
		}
		
	});
	
		// 2024-01-24
		// 댓글쓰기 버튼을 누르면 댓글 창 나오게 하기
		$(".comment-write").hide(); // 원래는 ready아래에 두는 것을 추천
		$(".xi-comment-o").click(function(){
			$(".xi-comment-o").hide();	
			//$(".comment-write").show();
			$(".comment-write").slideToggle('slow');
		});
		
	   //alert("준비되었습니다");
	   $("#comment-btn").click(function(){
	      let content = $("#commentcontent").val();
	      let bno = ${detail.no }; //여기는 글번호
	      //alert("content : " + content + " no : " + no);
	      //가상 form 만들기 = 동적생성
	      //전송 ---> content가 5글자 이상인 경우 실행하겠습니다.
	      if(content.length < 5){
	         alert("댓글은 다섯글자 이상으로 적어주세요.");
	         $("#commentcontent").focus();
	         //return false;
	      } else {
	    	  let form = $('<form></form>');
	          form.attr('name', 'form');
	          form.attr('method', 'post');
	          form.attr('action', './comment');
	          
	          form.append($('<input/>', {type:'hidden', name:'commentcontent', value:content}));  // json
	          form.append($('<input/>', {type:'hidden', name:'bno', value:bno}));
	          
	          form.appendTo("body");
	          form.submit();
	    	  
	         /* let form = document.createElement('form');
	         form.name='form';
	         form.method='post';
	         form.action='./comment';
	         //붙이기
	         let text = document.createElement('input');
	         text.setAttribute("type", "hidden");
	         text.setAttribute("name", "commentcontent");
	         text.setAttribute("value", content);
	         //붙이기
	         let no = document.createElement('input');
	         no.setAttribute("type", "hidden");
	         no.setAttribute("name", "bno");
	         no.setAttribute("value", ${detail.no});
	         //form에다가 붙이기
	         form.appendChild(text);
	         form.appendChild(no);
	         //전송하기
	         document.body.appendChild(form);
	         form.submit(); */
	      }
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
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailTITLE">${detail.title }</div>
						<div class="detailWRITECOUNT">
							<!-- 글작성자 정보 -->
							<div class="detailWRITE">
								${detail.write }
								<c:if
									test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid }">
									<!-- 쓴사람 / 쓴사람 id / 접속한사람 id -->
									<img alt="delete" src="./img/delete01.png" ondblclick="del()">
									<img alt="edit" src="./img/modify01.png" onclick="update()">
								</c:if>

							</div>
							<div class="detailCOUNT">${detail.ip }/ ${detail.count }</div>
						</div>
						<div class="detailCONTENT">
							<!-- 본문 내용 -->
							${detail.content }
						</div>
					</div>

					<c:if test="${sessionScope.mid ne null }">
						<!-- 2024-01-24 -->
						<button class="xi-comment-o">댓글 쓰기</button>
						<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다.
					댓글 내용, 누가, 어느, 2024-01-22 -->
						<div class="comment-write">
							<div class="comment-form">
								<textarea id="commentcontent" name="commentcontent"></textarea>
								<button id="comment-btn">댓글쓰기</button>
							</div>
						</div>
					</c:if>
					<!-- 댓글 출력 창 -->
					<div class="comments">
						<c:forEach items="${commentList }" var="co">
							<div class="comment">
							
								<div class="chead">
									<div class="cname">${co.mname }님
										<c:if
											test="${sessionScope.mname ne null && co.mid eq sessionScope.mid }">
											<!-- 쓴사람 / 쓴사람 id / 접속한사람 id -->
											<input type="hidden" class="cno" value="${co.cno }">
											<img alt="delete" src="./img/delete02.png" class="commentDelete">
											<img alt="edit" src="./img/modify02.png" class="commentEdit">
										</c:if>
									</div>
									<div class="cdate">${co.ip }/ ${co.cdate }</div>
								</div>
								
								<div class="ccomment">${co.comment }</div>    
							</div>
						</c:forEach>
					</div>
					<article>하단 foot때문에 안 보이나면 추가</article>
					<button onclick="url('./board?page=${param.page}')">게시판으로</button>

				</article>
			</div>
		</div>

		<script type="text/javascript">
			
			
		</script>
	</div>
</body>
</html>