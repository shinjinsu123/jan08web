package com.poseidon.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.AdminDAO;

@WebServlet("/admin/ip")   // url의 경로 = 실제 파일과 다르게 호출할 url을 지정합니다.
public class Ip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ip() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("ip"));
		
		AdminDAO dao = new AdminDAO();
		
		/*
		 * List<Map<String, Object>> list = dao.ipList();
		 * request.setAttribute("list", list);
		 */
		request.setAttribute("list", dao.ipList());
		
		/*
		 * List<Map<String, Object>> list1 = dao.ipList1();
		 * request.setAttribute("list1", list1);
		 */
		request.setAttribute("list1", dao.ipList1());
		
		/*
		 * List<Map<String, Object>> list2 = dao.ipList2();
		 * request.setAttribute("list2", list2);
		 */
		request.setAttribute("list2", dao.ipList2());
		
		/*
		 * List<Map<String, Object>> list3 = dao.latestIplist();
		 * request.setAttribute("list3", list3);
		 */
		request.setAttribute("list3", dao.latestIplist());
		List<Map<String, Object>> list = null;
		
		if(request.getParameter("ip") != null && !request.getParameter("ip").equals("")) { // ip가 올때
			list = dao.ipList(request.getParameter("ip"));	
			System.out.println(request.getParameter("ip"));
		}else { // ip가 안올때
			list = dao.ipList();
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/ip.jsp");  // 파일이 있는 경로
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
