<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY bgcolor=cyan>
	<Font size=4> 
		<jsp:useBean id="girl" class="aaa.Circle" scope="session">
		</jsp:useBean>
		<P>
			圆的半径是：
			<%=girl.getRadius()%><BR>
			<A href="beans2.jsp">beans2.jsp </A>
		</P> 
	<Font/>
</BODY>
</HTML>