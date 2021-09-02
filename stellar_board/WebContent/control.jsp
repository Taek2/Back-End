<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*, model.member.*"
    errorPage="error.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%> 

<%
	String condition = request.getParameter("condition");
	String content = request.getParameter("content");
%>

<!-- request로 날라온 애들을 객체에 맵핑 -->
<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/>
<jsp:useBean id="memberDAO" class="model.member.MemberDAO"/>
<jsp:useBean id="messageVO" class="model.message.MessageVO"/>
<jsp:useBean id="memberVO" class="model.member.MemberVO"/>
<jsp:setProperty property="*" name="messageVO"/>
 <jsp:setProperty property="*" name="memberVO"/>

<%
	// 컨트롤러를 호출했을 때의 action 파라미터에 따라 작업을 분할
	String action = request.getParameter("action");
	System.out.println(action); // log
	System.out.println(session.getAttribute("memnum"));
	
	if(action.equals("list")){
		ArrayList<MessageVO> datas = messageDAO.getDBList();
		request.setAttribute("datas", datas);
		request.setAttribute("flag", 0);
		pageContext.forward("list.jsp");
	}
	else if(action.equals("insert")){
		if(messageDAO.insertDB(messageVO)){
			// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	else if(action.equals("delete")){
		if(messageDAO.deleteDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
			System.out.println("delete 정상적으로 작동!");
		}
		else{
			throw new Exception("DB 삭제 오류 발생!");
		}
	}
	else if(action.equals("update")){
		if(messageDAO.updateDB(messageVO)){
			// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	else if(action.equals("edit")){
		
		// 비회원 일 경우
		if(session.getAttribute("memnum") == null){
			out.println("<script>alert('로그인 후 이용가능합니다!');history.go(-1);</script>");
			return;
		}
		
		// 로그인 했을 경우
		int memnum = (int)session.getAttribute("memnum");
		MessageVO data = messageDAO.getDBData(messageVO);
		System.out.println("data.getMemnum() = " + data.getMember());
		System.out.println("memnum = " + memnum);
		
		if(data.getMember() == memnum){
			request.setAttribute("data", data);
			pageContext.forward("edit.jsp");	
		}
		else{
			out.println("<script>alert('접근 권한이 없습니다!');history.go(-1);</script>");
		}
	}
	// 로그인 기능
	else if(action.equals("login")){
		//MemberVO vo = memberDAO.login(memberVO);
		// System.out.println(vo.getMemnum());
		
		if(memberDAO.login(memberVO) != null){
			session.setAttribute("memnum", memberDAO.login(memberVO).getMemnum());
			response.sendRedirect("control.jsp?action=list");
		}
		else{
		out.println("<script>alert('아이디 비밀번호를 확인하세요!');history.go(-1);</script>");
		}
	}
	// 회원가입 기능
	else if(action.equals("join")){
		if(memberDAO.insertDB(memberVO)){
			// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
			pageContext.forward("login.jsp");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}	
	}
	// 글 읽기
	else if(action.equals("read")){
		System.out.println(messageVO);
		MessageVO data = messageDAO.getDBData(messageVO);
		System.out.println(data);
		request.setAttribute("data", data);
		pageContext.forward("read.jsp");	
	}
	// 내 글 보기
	else if(action.equals("myList")){
		int memnum = (int)session.getAttribute("memnum");
		ArrayList<MessageVO> datas = messageDAO.getDBListByMember(memnum);
		request.setAttribute("datas", datas);
		request.setAttribute("flag", 1);
		pageContext.forward("list.jsp");
	}
	else if(action.equals("search")){
		
		ArrayList<MessageVO> datas = messageDAO.Search(condition, content);
		for(MessageVO data : datas){
			System.out.println(data);
		}
		request.setAttribute("datas", datas);
		request.setAttribute("flag", 1);
		pageContext.forward("list.jsp");
	}
	else{
		out.println("오류 발생!");
	}

%>


    

