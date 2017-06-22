<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spots.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	SpotService spSvc = new SpotService();
	List<SpotsVO> list = spSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ����I��� - listAllSpots.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ����I��� - ListAllSpots.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/spots/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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
<%@ include file="pages/page1.file" %> 
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>���I�s��</th>
		<th>���I�W��</th>
		<th>�g��</th>
		<th>�n��</th>
		<th>���I�s��</th>
	</tr>
	
	<c:forEach var="spotVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${spotVO.spno}</td>
			<td>${spotVO.spname}</td>
			<td>${spotVO.splong}</td>
			<td>${spotVO.splat}</td>
			<td>${spotVO.locno}</td>		
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="spno" value="${spotVO.spno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="spno" value="${spotVO.spno}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
