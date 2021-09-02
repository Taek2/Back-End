<%@ tag language="java" pageEncoding="UTF-8"%>

<jsp:useBean id="Product" class="model.ProductBean" scope="session" />
	<select name="name">
		<% 
			for(String v : Product.getNames()){ %>
			<option><%=v %></option>
		<% 
			} 
		%>
	</select>