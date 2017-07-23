<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"unconfirmed","confirmed"};
	String[] gender = {"Girl","Boy"};
    pageContext.setAttribute("statusArray", statusArray);
	pageContext.setAttribute("gender", gender);
	pageContext.setAttribute("memVO", memVO);
%>
<html>
<head>
<title>�|����ƭק� - update_member_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>
<div  class="col-xs-12 col-sm-12">
<table border='1' cellpadding='5' cellspacing='0' width='100%'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ч�|����ƶ�g����A�H�K������������</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>
</div>
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
<div class="col-xs-12 col-sm-12">
<table border="1"  class="table table-striped">
	<tr>
		<th scope="row">�|���W��:<font color='red'>*</font></th>
		<td><input  type="TEXT" name="memname" size="45" 
			value="<%= (memVO==null)? "�ڮa" : memVO.getMemname()%>" /></td>
	</tr>
	<tr>
		<th scope="row">�ʧO:<font color='red'>*</font></th>
		<td><select name='sex'>
		<option value="Boy">�k
		<option value="Girl">�k
		</select></td>
	</tr>	
	<tr>
		<th scope="row">�ͤ�:<font color='red'>*</font></th>
		<td><input type="date" name="birth"></td>
	</tr>	
	<tr>
		<th scope="row">�H�c:</th>
		<td><input type="email" name="mail" size="45" readonly value="<%=memVO.getMail() %>"/></td>
	</tr>	
	<tr>
		<th scope="row">�q��:<font color='red'>*</font></th>
		<td><input  type="tel" name="phone" size="45"/></td>
	</tr>
	<tr>
		<th scope="row">�a�}:<font color='red'>*</font></th>
		<td><input  type="text" name="address" size="45"/></td>
	</tr>
	<tr>
		<th scope="row">�b��:</th>
		<td><input readonly value="<%=memVO.getAcc() %>" type="text" name="acc" size="45"/></td>
	</tr>
	<tr>
		<th scope="row">�K�X:</th>
		<td><input readonly value="<%=memVO.getPwd() %>" type="password" name="pwd" size="45"/></td>
	</tr>
	<tr>
		<th scope="row">������(����):</th>
		<td><input type="file" name="idcard1" size="45"/></td>
		<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='120' height='100'></td>	
	   
	</tr>
	<tr>
		<th scope="row">������(�ϭ�):</th>
		<td><input type="file" name="idcard2" size="45"/></td>
		<!-- �ϭ� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2' width='120' height='100'></td>
	</tr>
	<tr>
		<th scope="row">�r��:</th>
		<td><input type="file" name="license" size="45"/></td>
		<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license' width='120' height='100'></td>
	</tr>
	
	
    <tr>
        <th scope="row">�{�Ҫ��A:</th>
		<td><%=memVO.getStatus()%></td>
	</tr>
</table>

<input type="hidden" name="action" value="update">
<input type="hidden" name="memno" value="<%=memVO.getMemno()%>">
<input type="hidden" name="status" value="<%=memVO.getStatus()%>">
<input type="hidden" name="credate" value="<fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value = "${memVO.credate}" />">
<input type="submit" value="�e�X�ק�">
</div>
</FORM>

</body>
</html>
