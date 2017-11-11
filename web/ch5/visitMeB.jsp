<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY bgcolor="#ffffff">
	<jsp:useBean id="countB" class="pagebean.Count" scope="request">
	</jsp:useBean>

	<b>CountB:</b>
	<br>
	<%countB.increment();%>
	you have visited number<%=countB.getCount()%><p>
</BODY>
</HTML>