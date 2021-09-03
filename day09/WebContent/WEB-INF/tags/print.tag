<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>

<%@ attribute name="fontSize" %>
<%@ attribute name="color" %>

<h1 style="color:${color}; font-size:${fontSize}"><jsp:doBody /></h1>
<h1 font-size="${fontSize}" color="${color}"><jsp:doBody /></h1>







