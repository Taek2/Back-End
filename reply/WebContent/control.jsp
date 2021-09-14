<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*, model.member.*, model.reply.*"
    errorPage="error.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/>
<jsp:useBean id="memberDAO" class="model.member.MemberDAO"/>
<jsp:useBean id="messageVO" class="model.message.MessageVO"/>
<jsp:useBean id="memberVO" class="model.member.MemberVO"/>
<jsp:useBean id="replyVO" class="model.reply.ReplyVO"/>
<jsp:useBean id="replyDAO" class="model.reply.ReplyDAO"/>
<jsp:useBean id="rreplyVO" class="model.reply.RReplyVO"/>
<jsp:useBean id="rreplyDAO" class="model.reply.RReplyDAO"/>
<jsp:setProperty property="*" name="messageVO"/>
 <jsp:setProperty property="*" name="memberVO"/>
 <jsp:setProperty property="*" name="replyVO"/>
  <jsp:setProperty property="*" name="rreplyVO"/>

<%
	// 컨트롤러를 호출했을 때의 action 파라미터에 따라 작업을 분할
	String action = request.getParameter("action");
	String url="control.jsp?action=list";
	//System.out.println(action); // log
	//System.out.println(session.getAttribute("memnum"));
	String mcntt=request.getParameter("mcnt");
	int mcnt=2;
	if(mcntt!=null){
		mcnt=Integer.parseInt(mcntt);
	}
	url= url+ "&mcnt="+mcnt;
	String selUser=request.getParameter("selUser");
	if(selUser!=null){
		url= url+ "&userID="+selUser;
	}
	
	if(action.equals("list")){
		ArrayList<MessageVO> datas = messageDAO.getDBList(selUser, mcnt);
		System.out.println(datas);
		ArrayList<MemberVO> newUsers=memberDAO.getDBList();
		request.setAttribute("datas", datas);
		request.setAttribute("newUsers", newUsers);
		request.setAttribute("selUser", selUser);
		request.setAttribute("mcnt", mcnt);
		pageContext.forward("list.jsp");
	}
	else if(action.equals("insert")){
		// 파일 경로, 이름
		 String realFolder = "";
		 String filename1 = "";
		 // 파일 크기 15MB로 제한
		 int maxSize = 1024*1024*15;
		 String encType = "euc-kr";
		 String savefile = "img";
		 
		 // 파일이 저장될 서버의 경로
		 ServletContext scontext = getServletContext();
		 realFolder = scontext.getRealPath(savefile);

		 System.out.println("realFolder = " + realFolder);
		 
		 try{
		  // 파일 업로드
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		     System.out.println("filename1 = " + filename1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
		 realFolder = "img";
		 String fullpath = realFolder + "/" + filename1;
		 System.out.println("fullpath = " + fullpath);
		 messageVO.setPath(fullpath);
	
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
	/*
	else if(action.equals("edit")){
		
		int memnum = (int)session.getAttribute("memnum");
		MsgSet data = messageDAO.getDBData(messageVO);
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
	*/
	// 로그인 기능
	else if(action.equals("login")){
		//MemberVO vo = memberDAO.login(memberVO);
		// System.out.println(vo.getMemnum());
		
		if(memberDAO.login(memberVO) != null){
			session.setAttribute("memnum", memberDAO.login(memberVO).getMemnum());
			session.setAttribute("userID", memberDAO.login(memberVO).getMid());
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
		MsgSet data = messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("read.jsp");	
	}
	else if(action.equals("addreply")){
		
		if(replyDAO.insert(replyVO)){
			System.out.println("성공");
		}
		else{
			System.out.println("실패");
		}
		pageContext.forward("control.jsp?action=read");
	}
	else if(action.equals("addrreply")){
			
			if(rreplyDAO.insert(rreplyVO)){
				System.out.println("성공");
			}
			else{
				System.out.println("실패");
			}
			pageContext.forward("control.jsp?action=read");
		}
	else{
		out.println("오류 발생!");
	}

%>


    

