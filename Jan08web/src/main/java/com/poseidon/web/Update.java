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

@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Update() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// 로그인했어?
		HttpSession session = request.getSession();
		// 세션이 있을 때 = 정상작업하기
		if (session.getAttribute("mid") != null) {
			int no = Util.str2Int(request.getParameter("no"));

			// 데이터베이스에 질의하기
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.detail(no);

			// 정상 출력>
			// 내용 가져오기
			// 아래 3줄 : 정상적으로 돌아갈 때 돌아간다.
			System.out.println(dto.getMid());

			if (((String) session.getAttribute("mid")).equals(dto.getMid())) {
				request.setAttribute("update", dto);
				RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("./error.jsp");
			}

			// System.out.println(dto.getTitle());
			// System.out.println(dto.getContent() == null);
		} else {
			response.sendRedirect("./login?login=nologin");
		}

		// 오픈방식으로 호출
		// no 잡기

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// String title = request.getParameter("title");
		// String content = request.getParameter("content");
		// String no = request.getParameter("no");
		// System.out.println(title);
		// System.out.println(content);
		// System.out.println(no);

		if (request.getParameter("title") != null && request.getParameter("content") != null
				&& Util.intCheck(request.getParameter("no")) && session.getAttribute("mid") != null) {
			// 진짜 수정.
			BoardDTO dto = new BoardDTO();
			dto.setContent(request.getParameter("content"));
			dto.setTitle(request.getParameter("title"));
			dto.setNo(Util.str2Int(request.getParameter("no")));
			dto.setMid((String) session.getAttribute("mid"));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.update(dto);
			// System.out.println("수정 결과 : " + result);
			if (result == 1) {
				response.sendRedirect("./detail?no=" + request.getParameter("no"));
			} else {
				// error
				response.sendRedirect("./error.jsp");

			}

		}
	}
}
