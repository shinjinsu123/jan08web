package com.poseidon.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.AdminDAO;
import com.poseidon.dto.BoardDTO;
import com.poseidon.util.Util;

@WebServlet("/admin/board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Board() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//System.out.println("search : " + request.getParameter("search"));
		
		// 데이터를 담는다.
		AdminDAO dao = new AdminDAO();
		
		if(request.getParameter("search") == null) {
			List<BoardDTO> list = dao.boardList();
			request.setAttribute("list", list);  // 속성 값 넣기
		}else {
			List<BoardDTO> list = dao.boardList(request.getParameter("search"));
			request.setAttribute("list", list);  // 속성 값 넣기
		}

		RequestDispatcher rd = request.getRequestDispatcher("/admin/board.jsp");
	    rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("no"));
		System.out.println(request.getParameter("del"));
		
		AdminDAO dao = new AdminDAO();
		BoardDTO dto = new BoardDTO();
		dto.setNo(Util.str2Int(request.getParameter("no")));
		dto.setDel(Util.str2Int(request.getParameter("del")) == 1 ? 0 : 1);  //1일땐, 0으로  (0일땐, 1로)
		int result = dao.boardDel(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
