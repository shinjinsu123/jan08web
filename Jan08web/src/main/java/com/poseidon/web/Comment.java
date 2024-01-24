package com.poseidon.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.CommentDAO;
import com.poseidon.dao.MemberDAO;
import com.poseidon.dto.CommentDTO;
import com.poseidon.util.Util;

@WebServlet("/comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Comment() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // 저장하는게 post
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); // 댓글 작성한사람 ID를 알아야한다.
		// 오는 값 받기
		String commentcontent = request.getParameter("commentcontent"); // 댓글 내용
		
		// HTML에서 태그를 특수기호로 변경하기
		commentcontent = Util.removeTag(commentcontent);
		
		// 엔터 처리 ->      /r /n  /nr 을 엔터로 변경해준다 (util에 메소드 잇음)
		commentcontent = Util.addBR(commentcontent);
				
		String bno = request.getParameter("bno"); // 글번호 / parameter는 string으로 밖에 못받음.
		// System.out.println(commentcontent + " : " + bno);

		if (session.getAttribute("mid") != null && commentcontent != null && bno != null) {
			// 저장해주세요.
			CommentDTO dto = new CommentDTO(); // dto에 값 저장
			dto.setComment(commentcontent); // dto에 setComment메소드를 호출하여 commentcontent를 넣음
			// dto.setBoard_no(Util.str2Int2(bno));
			dto.setBoard_no(Integer.parseInt(bno));
			dto.setMid((String) session.getAttribute("mid"));
			dto.setIp(Util.getIP(request));   // request는 http에접속된 자의 ip를 의미하고, 그IP를
			// util 클래스의 getIP메소드를 통과시켜서 통과된IP를 얻고, 그것을 dto에 set(넣는다) 

			CommentDAO dao = new CommentDAO();
			int result = dao.commentWrite(dto);

			if (result == 1) {
				response.sendRedirect("./detail?no=" + bno);
			} else {
				response.sendRedirect("./error.jsp");
			}

		} else {
			response.sendRedirect("./error.jsp");
		}
	}
}