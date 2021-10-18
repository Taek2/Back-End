package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.member.MemberDAO;
import model.member.MemberVO;

public class JoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		ActionForward forward = null;
	
		MemberDAO uDAO=new MemberDAO();
		MemberVO uVO=new MemberVO();
		uVO.setName(request.getParameter("name"));
		uVO.setId(request.getParameter("id"));
		uVO.setPassword(request.getParameter("password"));
		uVO.setRole(request.getParameter("role"));
		System.out.println(uVO);
		
		if(uDAO.insertMember(uVO)) {
			out.println("<script>alert('회원가입 완료!');</script>");
			out.println("<script>window.close();</script>");
		}
		else {
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}
		return forward;
	}

}
