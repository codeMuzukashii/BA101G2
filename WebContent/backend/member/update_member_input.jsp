<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"unconfirm","confirmed"};
	pageContext.setAttribute("statusArray", statusArray);
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
		<a href="<%=request.getContextPath()%>/backend/member/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do" name="form1" enctype="multipart/form-data">
<table border="0">
	<tr>
		<td>�|���W��:</td>
		<td><input readonly type="TEXT" name="memname" size="45" 
			value="<%= (memVO==null)? "�ڮa" : memVO.getMemname()%>" /></td>
	</tr>
	<tr>
		<td>�ʧO:</td>
		<td><%=memVO.getSex()%></td>
	</tr>	
	<tr>
		<td>�ͤ�:</td>
		<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.birth}" /></td>
	</tr>	
	<tr>
		<td>�H�c:</td>
		<td><input type="email" name="mail" size="45" readonly value="<%=memVO.getMail() %>"/></td>
	</tr>	
	<tr>
		<td>�q��:</td>
		<td><input value="<%=memVO.getPhone() %>" type="tel" name="phone" size="45"/></td>
	</tr>
	<tr>
		<td>�a�}:</td>
		<td><input readonly value="<%=memVO.getAddr() %>" type="text" name="address" size="45"/></td>
	</tr>
	<tr>
		<td>�b��:</td>
		<td><input readonly value="<%=memVO.getAcc() %>" type="text" name="acc" size="45"/></td>
	</tr>
	<tr>
		<td>�K�X:</td>
		<td><input value="<%=memVO.getPwd() %>" type="password" name="pwd" size="45"/></td>
	</tr>
	<tr>
		<td>������(����):</td>
		<td><input type="file" name="idcard1" size="45"/></td>
		<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='120' height='100'></td>	
	</tr>
	<tr>
		<td>������(�ϭ�):</td>
		<td><input type="file" name="idcard2" size="45"/></td>
		<!-- �ϭ� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2' width='120' height='100'></td>
	</tr>
	<tr>
		<td>�r��:</td>
		<td><input type="file" name="license" size="45"/></td>
		<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license' width='120' height='100'></td>
	</tr>
<tr>
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.credate}" /></td>
         </tr>
         <tr>
			<td><select name="status">
			<option disabled selected value="${memVO.status}">${memVO.status}
			<c:forEach var="s" items="${statusArray}">
			<c:if test="${memVO.status!=s}">
			<option  value="${s}">${s}
			</c:if>
			 
			</c:forEach>
			
			
			
			</select></td>
	</tr>
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memno" value="<%=memVO.getMemno()%>">
<input type="hidden" name="sex" value="<%=memVO.getSex()%>">
<input type="hidden" name="birth" value="<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" 
         value = "${memVO.birth}" />">
<input type="hidden" name="credate" value="<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" 
         value = "${memVO.credate}" />">
<input type="submit" value="�e�X�ק�"></FORM>

</body>
</html>
