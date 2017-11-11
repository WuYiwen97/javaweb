<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<jsp:useBean id="girl" class="aaa.Circle" scope="page" />
	<p>
		圆的半径是：
		<%=girl.getRadius()%>
		<%
				girl.setRadius(100);
			%>
	</p>
	<p>
		圆的半径是：
		<%=girl.getRadius()%>
	</p>
	<p>
		圆的周长是
		<%=girl.circlLength()%>
	</p>
	<p>
		圆的面积是：
		<%=girl.circleArea()%>
	</p>
</body>
</html>