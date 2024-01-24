package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.MemberDAO;
import com.poseidon.dto.MemberDTO;

@WebServlet("/join")  // 회원가입
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//id name pw1 pw2 -> 값 잡아야 함.
		if(request.getParameter("name") != null && request.getParameter("id") != null && request.getParameter("pw1") != null) {
			
			MemberDTO dto = new MemberDTO();
			dto.setMname(request.getParameter("name"));
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw1"));
			
			MemberDAO dao = new MemberDAO();
			int result = dao.join(dto);
			
			if(result == 1) {
				response.sendRedirect("./login");
			}else {
				response.sendRedirect("./login?error=4567");
			}
		// db에 보내주세요.
			
		
		// 정상적으로 데이터 입력을 완료했다면 로그인 페이지로,
				
		// 비정상적이라면 에러로 보내주세요.
	}
	}
}
