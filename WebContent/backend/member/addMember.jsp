<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%
MemberVO memVO = (MemberVO) request.getAttribute("memVO");
%>

<html>
<head>
<title>�|����Ʒs�W - addSpot.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='1600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|����Ʒs�W - addMember.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/backend/member/select_page.jsp"><img src="images/back1.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�s�W�|��:</h3>
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

<FORM METHOD="post" ACTION="member.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>�|���W��:</td>
		<td><input type="TEXT" name="memname" size="45" 
			value="<%= (memVO==null)? "�ڮa" : memVO.getMemname()%>" /></td>
	</tr>
	<tr>
		<td>�ʧO:</td>
		<td><select name="sex"><option value="male">�k
								<option value="female">�k
		</select></td>
	</tr>	
	<tr>
		<td>�ͤ�:</td>
		<td><input type="date" name="birth" size="45">
			</td>
	</tr>	
	<tr>
		<td>�H�c:</td>
		<td><input type="email" name="mail" size="45"/></td>
	</tr>	
	<tr>
		<td>�q��:</td>
		<td><input type="number" name="phone" size="45"/></td>
	</tr>
	<tr>
		<td>�a�}:</td>
		<td><input type="text" name="address" size="45"/></td>
	</tr>
	<tr>
		<td>�b��:</td>
		<td><input type="text" name="acc" size="45"/></td>
	</tr>
	<tr>
		<td>�K�X:</td>
		<td><input type="password" name="pwd" size="45"/></td>
	</tr>
	<tr>
		<td>������(����):</td>
		<td><input type="file" name="idcard1" size="45"/></td>
	</tr>
	<tr>
		<td>������(�ϭ�):</td>
		<td><input type="file" name="idcard2" size="45"/></td>
	</tr>
	<tr>
		<td>�r��:</td>
		<td><input type="file" name="license" size="45"/></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>
</html>
