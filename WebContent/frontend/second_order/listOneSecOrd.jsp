<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.sec_ord.model.*"%>
<%@ page import="com.location.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO");%>

<%-- ���X ������LocationVO����--%>
<%
 // DeptService deptSvc = new DeptService();
 // DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
%>
<html>
<head>
<title>��� - listOneSecOrd.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>��� - ListOneSecOrd.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/second_order/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>
<select size="1"></select>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�G�⨮�q��s��</th>
		<th>�|���s��</th>
		<th>�����s��</th>
		<th>�س�ɶ�</th>
		<th>���A</th>
		
	</tr>
	<tr align='center' valign='middle'>
		<td><%=soVO.getSono()%></td>
		<td><%=soVO.getMemno()%></td>
		<td><%=soVO.getMotorno()%></td>
		<td><%=soVO.getBuildtime()%></td>
		<td><%=soVO.getStatus()%></td>
	
		
	</tr>
</table>

</body>
</html>
