<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.spots.model.*"%>
<%@ page import="com.location.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%SpotsVO spotVO = (SpotsVO) request.getAttribute("spotVO");%>

<%-- ���X ������LocationVO����--%>
<%
 // DeptService deptSvc = new DeptService();
 // DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
%>
<html>
<head>
<title>���I��� - listOneSpot.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���I��� - ListOneSpot.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/second_order/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>���I�s��</th>
		<th>���I�W��</th>
		<th>�g��</th>
		<th>�n��</th>
		<th>���I�s��</th>
		
	</tr>
	<tr align='center' valign='middle'>
		<td><%=spotVO.getSpno()%></td>
		<td><%=spotVO.getSpname()%></td>
		<td><%=spotVO.getSplong()%></td>
		<td><%=spotVO.getSplat()%></td>
		<td><%=spotVO.getLocno()%></td>
	
		
	</tr>
</table>

</body>
</html>
