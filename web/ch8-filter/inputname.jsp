<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY>
	<P>输入姓名：
	<FORM action="" method="post">
		<Input Type=text name="number"> 
		<Input Type=submit value="提交">
	</FORM>
</BODY>
<%
	String str = request.getParameter("number");
%>
<%=str %>
</HTML>
