<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY bgcolor=cyan>
	<Font size=4> 
		<jsp:useBean id="girl" class="aaa.Circle"
			scope="session">
		</jsp:useBean>
		<P>
			圆的半径是：
			<%=girl.getRadius()%>
			<%
				girl.setRadius(400);
			%>
		<P>
			修改后的圆的半径是：
			<%=girl.getRadius()%>
			<A href="beans1.jsp"><BR>beans2.jsp </A>
</BODY>
</HTML>
