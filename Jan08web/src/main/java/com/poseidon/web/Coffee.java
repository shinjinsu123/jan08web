package com.poseidon.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.CoffeeDAO;
import com.poseidon.dto.CoffeeDTO;

@WebServlet("/coffee")
public class Coffee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Coffee() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DAO랑 연결
		CoffeeDAO dao = new CoffeeDAO();
		List<CoffeeDTO> list = dao.coffeeShow();  // 화면에 띄워주는 녀석
		
		request.setAttribute("list", list);
		// 서블릿을 통과해야 값이 나오는 이유 2)
		RequestDispatcher rd = request.getRequestDispatcher("coffee.jsp");
		rd.forward(request, response);
	}
	    
	    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		CoffeeDTO dto = new CoffeeDTO(); // dto에 값 저장
		dto.setMenu(request.getParameter("menu"));

		CoffeeDAO dao = new CoffeeDAO();
		int result = dao.coffeeSelect(dto);
		
		/*
		 * dto.setMenu(request.getParameter("menu"));
		 * 
		 * request.setAttribute("coffee", dto);
		 * 
		 * RequestDispatcher rd = request.getRequestDispatcher("coffee.jsp");
		 * rd.forward(request, response);
		 */
		response.sendRedirect("./coffee");
		
	}
}