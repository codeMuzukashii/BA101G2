<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mes_board.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>�d���O</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�d���O</h3>
		<a href="<%=request.getContextPath()%>/backend/mes_board/mesboard_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�d���O�s��</th>
		<th>�|���s��</th>
		<th>�d���ɶ�</th>
		<th>�d�����e</th>
		<th>�ۤ��ɮ�</th>
		<th>�d�������A</th>
	</tr>
	<tr align='center' valign='middle'>
		<td>${mesboardVO.mesno}</td>
			<td>${mesboardVO.memno}</td>
			<td>${mesboardVO.mesdate}</td>
			<td>${mesboardVO.cont}</td>
			<td><img src="<%=request.getContextPath()%>/backend/mes_board/mesboardread.do?mesno=${mesboardVO.mesno}" style= max-width:150px;max-height:150px;></img></td>
			<td>${mesboardVO.status}</td>			
	</tr>
</table>

</body>
</html>