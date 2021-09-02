<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>

<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<h1><jsp:doBody /></h1>

<hr>

<jsp:useBean id="dataBean" class="model.DataBean"/>
<table border="${border}" bgcolor="${bgcolor}">
	<% 
	for(String v:dataBean.getDataList()){
		out.println("<tr><td>"+v+"</td></tr>");
	}
	%>
</table>





