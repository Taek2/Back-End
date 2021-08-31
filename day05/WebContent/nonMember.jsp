<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	// 컨트롤러 페이지에게 list.jsp를 보여달라고 요청
	// action=list
	// -> 컨트롤러를 거쳐 데이터를 받아서 list.jsp로 가기 위함.
	pageContext.forward("control.jsp?action=list");

%>
