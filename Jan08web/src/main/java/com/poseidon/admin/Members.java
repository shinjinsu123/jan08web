package com.poseidon.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.AdminDAO;
import com.poseidon.dto.MemberDTO;
import com.poseidon.util.Util;

@WebServlet("/admin/members")
public class Members extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public Members() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      AdminDAO dao = new AdminDAO();
      List<MemberDTO> list = null;
      if (request.getParameter("grade") == null || request.getParameter("grade").equals("")) {
         list = dao.membersList();
      } else {
         list = dao.membersList(Util.str2Int(request.getParameter("grade")));
      }

      request.setAttribute("list", list);
      RequestDispatcher rd = request.getRequestDispatcher("/admin/members.jsp");
      rd.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // System.out.println(request.getParameter("mno"));
      // System.out.println(request.getParameter("grade"));

      // db에 변경 (mno와 grade를 변경한 값으로)
      AdminDAO dao = new AdminDAO();

      int result = dao.gradeUpdate(Util.str2Int(request.getParameter("grade")),
            Util.str2Int(request.getParameter("mno")));

      // 페이지 이동
      if (request.getParameter("currentgrade") == null || request.getParameter("currentgrade").equals("")) {
         response.sendRedirect("./members");
      } else {
         response.sendRedirect("./members?grade=" + request.getParameter("currentgrade"));
      }

   }

}