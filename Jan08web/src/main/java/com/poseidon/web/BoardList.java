package com.poseidon.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.BoardDAO;
import com.poseidon.dao.LogDAO;
import com.poseidon.dto.BoardDTO;
import com.poseidon.util.Util;

@WebServlet("/board")
//http://localhost/Jan08web/board 로 접속할때 다른 이유
//서블릿을 통과해야 값이 나온다.
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page")!="") {
			page = Util.str2Int2(request.getParameter("page"));
		}
		
		// log
		Map<String, Object> log = new HashMap<String, Object>();
		log.put("ip", Util.getIP(request));
		log.put("url", "./board");
		log.put("data", "page="+page);
		LogDAO logDAO = new LogDAO();
		logDAO.write(log);
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//DAO랑 연결
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> list = dao.boardList(page);  // 화면에 띄워주는 녀석
		int totalCount = dao.totalCount();
		
		request.setAttribute("list", list);
		// 서블릿을 통과해야 값이 나오는 이유 2)
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("board.jsp");
		// forward랑 셋트
		// Dispatcher의 사용 이유는, url은 같은데 화면 내용만 바꿀때
		// 접속한건 board.jsp인데 화면에 나오는건 board가 나온다.
		// 서블릿을 통과해야 값이 나오는 이유 1)
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}
