<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.spots.model.*"%>
<%
SpotsVO spotVO = (SpotsVO) request.getAttribute("spotVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>
<html>
<head>
<title>���I��� - listOneSpot.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���I��� - listOneSpot.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>���I�s��</th>
		<th>���I�s��</th>
		<th>¾��</th>
		<th>���Τ��</th>
		<th>�~��</th>
		<th>����</th>
		<th>����</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=spotVO.getSpotsNo()%></td>
		<td><%=spotVO.getEname()%></td>
		<td><%=spotVO.getJob()%></td>
		<td><%=spotVO.getHiredate()%></td>
		<td><%=spotVO.getSal()%></td>
		<td><%=empVO.getComm()%></td>
		<td><%=empVO.getDeptno()%></td>
	</tr>
</table>

</body>
</html>
