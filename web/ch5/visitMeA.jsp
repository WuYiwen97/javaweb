<%@ page contentType="text/html;charset=UTF-8"%>
<%--在BC中不能有--%>
<HTML>
<BODY bgcolor="#ffffff">
	<jsp:useBean id="count1" class="pagebean.Count" scope="request">
	</jsp:useBean>
	<jsp:useBean id="count2" class="pagebean.Count" scope="request">
	</jsp:useBean>
	<b>Count1：</b>
	<br>
	<%
		count1.increment();
	%>
	you have visited number<%=count1.getCount()%><p>
		<b>Count2:</b><br>
		<%
			count2.increment();
		%>
		you have visit number<%=count2.getCount()%>
	<p>

		<b>using include derictive:</b><br>
		<%@ include file="visitMeB.jsp"%>

		<b>using include action:</b><br>
		<jsp:include page="visitMeB.jsp" flush="true" />
	<p>

		<b>using include action again:</b><br>
		<jsp:include page="visitMeC.jsp" flush="true" />
	<p>
</BODY>
</HTML>