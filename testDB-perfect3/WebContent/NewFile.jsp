<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String jdbc_driver="com.mysql.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost:3307/kimdb";
	Connection conn=null;	
	PreparedStatement pstmt=null;
	
	try{
		Class.forName(jdbc_driver);
		conn=DriverManager.getConnection(jdbc_url,"root","1234");
		String sql="insert into test values(?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("a"));
		pstmt.setInt(2,Integer.parseInt(request.getParameter("b")));
		if(request.getParameter("a")!=null){
			pstmt.executeUpdate(); // ☆☆☆
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="NewFile.jsp" method="post">
	문자열 a: <input type="text" name="a"> <br>
	정수 b: <input type="text" name="b"> <br>
	<input type="submit" value="DB에 데이터 추가하기">
</form>
<hr>
<h3>DB에 저장된 데이터 목록</h3>
<%
	ResultSet rs=null;
	try{
		String sql="select * from test";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int i=1;
		while(rs.next()){
			out.println(i+". "+rs.getString("a")+" "+rs.getInt("b")+"<br>");
			i++;
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
	finally{
		rs.close();
		pstmt.close();
		conn.close();
	}

%>

</body>
</html>