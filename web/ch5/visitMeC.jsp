<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY bgcolor="#ffffff">
	<jsp:useBean id="count1" class="pagebean.Count" scope="request">
	</jsp:useBean>
	<jsp:useBean id="countC" class="pagebean.Count" scope="request">
	</jsp:useBean>
	<b>Count1:</b>
	<br>
	<%count1.increment();%>
	you have visited number<%=count1.getCount() %><p>
		<b>CountC:</b><br>
		<%countC.increment();%>
		you have visit number<%=countC.getCount()%>
	<p>
</BODY>
</HTML>