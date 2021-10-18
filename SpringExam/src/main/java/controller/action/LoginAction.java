package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberVO;

public class LoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		// 1. uVO�� ������ִ� ���ڵ��� get()
		// 2. �α��� ����,���п��� �Ǵ�
		// 3. ����: ���Ǽ��� / ����: ��ũ��Ʈ ���
		MemberDAO uDAO=new MemberDAO();
		MemberVO uVO=new MemberVO();
		uVO.setId(request.getParameter("id"));
		uVO.setPassword(request.getParameter("password"));
		
		
		if(uDAO.getMember(uVO) != null) {
			uVO = uDAO.getMember(uVO);
			HttpSession session=request.getSession();
			session.setAttribute("userID", uVO.getId());
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("main.do");
		}
		else {
			PrintWriter out=response.getWriter();
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8"); 
			out.println("<script>alert('���̵� ��й�ȣ�� Ȯ���ϼ���!');history.go(-1);</script>");
		}
		
		return forward;
	}

}
