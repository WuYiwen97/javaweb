<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
<BODY>
	<Font size=4>
		<FORM action="" Method="post">
			<P>
				输入工人的姓名: <Input type=text name="name">
			<P>
				输入工人的工号: <Input type=text name="number">
			<P>
				输入工人的身高: <Input type=text name="height">
			<P>
				输入工人的体重: <Input type=text name="weight"> 
				<Input type=submit value="提交">
		</FORM> 
		<jsp:useBean id="zhang" class="ccc.Worker" scope="page">
		</jsp:useBean> 
		<% 
			request.setCharacterEncoding("UTF-8");
			double a = zhang.getHeight();
		%>
		<jsp:setProperty name="zhang" property="*" />
		<P>
			名字是：
			<jsp:getProperty name="zhang" property="name" />
		<P>
			工号是：
			<jsp:getProperty name="zhang" property="number" />
		<P>
			身高是：
			<jsp:getProperty name="zhang" property="height" />
			米
		<P>
			体重是：
			<jsp:getProperty name="zhang" property="weight" />
			公斤
	</FONT>
</BODY>
</HTML>
