<%@ page contentType="text/html;charset=UTF-8"%>
<HTML>
	<BODY>
		<Font size=4>
			<FORM action="byname.jsp" Method="post">
				<P>
					成绩查询
					<P>
						输入姓名:
						<Input type=text name="name">
						<Input type=submit name="g" value="提交">
			</Form>
			<FORM action="byscore.jsp" Method="post">
				<P>
					根据分数查询名单:
					<BR>
					微机原理分数在
					<Input type=text name="wjylmin" value=0>
					和
					<Input type=text name="wjylmax" value=100>
					之间
					<BR>
					操作系统分数在
					<Input type=text name="czxtmin" value=0>
					和
					<Input type=text name="czxtmax" value=100>
					之间
					<BR>
					<Input type=submit value="提交">
			</Form>
	</BODY>
</HTML>
