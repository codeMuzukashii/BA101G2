<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spots.model.*"%>
<%
SpotsVO spotVO = (SpotsVO) request.getAttribute("spotVO");
%>

<html>
<head>
<title>���I��Ʒs�W - addSpot.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���I��Ʒs�W - addSpot.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/frontend/spots/select_page.jsp"><img src="images/back1.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�s�W���I:</h3>
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

<FORM METHOD="post" ACTION="spot.do" name="form1">
<table border="0">

	<tr>
		<td>���I�W��:</td>
		<td><input type="TEXT" name="spname" size="45" 
			value="<%= (spotVO==null)? "�ڮa" : spotVO.getSpname()%>" /></td>
	</tr>

	
	<tr>
		<td>���I�s��:</td>
		<td><input type="TEXT" name="locno" size="45"
			value="<%= (spotVO==null)? "L000001" : spotVO.getLocno()%>" /></td>
	</tr>
	
	<tr>
		<td>�g��:</td>
		<td><input type="TEXT" name="longitude" size="45"
			value="<%= (spotVO==null)? "121.21" : spotVO.getSplong()%>" /></td>
	</tr>
	
	<tr>
		<td>�n��:</td>
		<td><input type="TEXT" name="latitude" size="45"
			value="<%= (spotVO==null)? "23.25" : spotVO.getSplat()%>" /></td>
	</tr>
	

	
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
