<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY>
	<jsp:useBean id="girl" class="aaa.Circle" scope="application">
	</jsp:useBean>
	<P>
		圆的初始半径是：
		<%=girl.getRadius()%>
		<%
			girl.setRadius(1000);
		%>
	<P>
		修改后的圆的半径是：
		<%=girl.getRadius()%>
</BODY>
</HTML>