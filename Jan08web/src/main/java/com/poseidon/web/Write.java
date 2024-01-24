package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dto.BoardDTO;
import com.poseidon.util.Util;

@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session.getAttribute("mname") == null) {
			response.sendRedirect("./login"); // url까지 변경해서 화면 보여줍니다.

		} else { // 로그인 못했을 때
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp"); // url 고정, 화면만 변환
			rd.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 한글 처리(글쓰기-게시판 제목 및 내용 한글로)
		request.setCharacterEncoding("UTF-8");

		// 세션에 들어있는 mid 가져오기 2024-01-15 / poseidon
		HttpSession session = request.getSession();

		// if문으로 로그인 되어 있는(=세션이 있는)사람만 아래 로직 수행하도록 변경하겠다.
		if (session.getAttribute("mid") == null || session.getAttribute("mname") == null) {
			// 로그인 하지 않았다면 login으로 가게 하겠습니다.
			response.sendRedirect("./login?login=nologin");
		} else {
			// 로그인 했다면 아래 로직을 수행하게 하겠습니다.
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			// html 태그를 특수기호로 변경하기
			title = Util.removeTag(title);

			System.out.println(title);
			System.out.println(content);

			// DAO에 write 메소드 만들기
			BoardDTO dto = new BoardDTO();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setMid((String) session.getAttribute("mid")); // 세션에서 mid 가져옵니다.
			dto.setIp(Util.getIP(request));

			BoardDAO dao = new BoardDAO();
			int result = dao.write(dto);
			System.out.println("글쓰기 결과는 : " + result);
			// 객체를 던진다.

			// 페이지 이동하기
			if (result == 1) {
				response.sendRedirect("./board");
			} else {
				response.sendRedirect("./error.jsp");
			}
		}

		// 주소와 함께 board창으로 넘어가야함
		// response.sendRedirect("./board");

	}

}
