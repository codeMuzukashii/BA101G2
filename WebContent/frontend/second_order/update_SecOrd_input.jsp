<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sec_ord.model.*"%>
<%
	SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
<title>�G�⨮�q���ƭק� - update_SecOrd_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>��ƭק� - update_spot_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/second_order/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="SecOrd.do" name="form1">
<table border="0">
	<tr>
		<td>�q��s��:<font color=red><b>*</b></font></td>
		<td><%=soVO.getSono()%></td>
	</tr>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="memno" size="45" value="<%=soVO.getMemno()%>" /></td>
	</tr>
	
	
	



</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="sono" value="<%=soVO.getSono()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
