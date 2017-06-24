<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
   
%>
<html>
<head>
<title>�|����ƭק� - update_member_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='1600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|����ƭק� - update_member_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/member/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
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

<FORM METHOD="post" ACTION="member.do" name="form1">
<table border="0">
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemno()%></td>
	</tr>
	<tr>
		<td>�|���W��:</td>
		<td><%=memVO.getMemname()%></td>
	</tr>
	<tr>
		<td>�ʧO:</td>
		<td><%=memVO.getSex()%></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><%=memVO.getMail()%></td>
	</tr>
	<tr>
		<td>Phone:</td>
		<td><%=memVO.getPhone()%></td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><%=memVO.getSex()%></td>
	</tr>

    <tr>
		<td>�ͤ�:</td>
		<td><%=memVO.getBirth()%></td>
	</tr>
	
	<tr>
		<td>�b��:</td>
		<td><%=memVO.getAcc()%></td>
	</tr>
	<tr>
		<td>�K�X:</td>
		<td><%=memVO.getPwd()%></td>
	</tr>
	<tr>
	<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='120' height='100'></td>	
	</tr>
	<tr>	
<!-- �ϭ� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2' width='120' height='100'></td>				
</tr>	
<tr>
<!-- �r�� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license' width='120' height='100'></td>							
</tr>
<tr>
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.credate}" /></td>
         </tr>
         <tr>
			<td>${memVO.status}</td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memno" value="<%=memVO.getMemno()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
