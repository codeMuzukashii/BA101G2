<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sec_ord.model.*"%>
<%
SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO");
%>

<html>
<head>
<title>�s�W�G�⨮�q�� - addOrder.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�s�W�G�⨮�q��  - addSecOrd.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/frontend/secord/select_page.jsp"><img src="images/back1.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�s�W�q��:</h3>
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
		<td>�|��ID:</td>
		<td><input type="TEXT" name="memno" size="45" 
			value="<%= (soVO==null)? "MEM000000" : soVO.getMemno()%>" /></td>
	</tr>

	<tr>
		<td>�����s��:</td>
		<td><input type="TEXT" name="motno" size="45"
			value="<%= (soVO==null)? "M000001" : soVO.getMotorno()%>" /></td>
	</tr>
	
<!-- 	<tr> -->
<!-- 		<td>���A:</td> -->
<!-- 		<td><input type="TEXT" name="status" size="45" -->
<%-- 			value="<%= (soVO==null)? "other" : soVO.getStatus()%>" /></td> --%>
<!-- 	</tr> -->
	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
