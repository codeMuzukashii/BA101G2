<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mes_board.model.*"%>
<%
	MesBoardVO mesboardVO = (MesBoardVO) request.getAttribute("mesboardVO"); //NewsServlet.java (Concroller), �s�Jreq��newsVO���� (�]�A�������X��newsVO, �]�]�A��J��ƿ��~�ɪ�newsVO����)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�d���ק�</title>
</head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�d���ק�</h3> <a
				href="<%=request.getContextPath()%>/backend/mes_board/mesboard_select_page.jsp"><img
					src="images/back1.gif" width="100" height="32" border="0">�^����</a>
			</td>
		</tr>
	</table>

	<h3>�d���ק�:</h3>
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

	<FORM METHOD="post" ACTION="mesboard.do" name="form1"
		enctype="multipart/form-data">
		<table border="0">
			<tr>
				<td>�d���O�s��:<font color=red><b>*</b></font></td>
				<td><%=mesboardVO.getMesno()%></td>
			</tr>

			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><input type="TEXT" name="memno" size="45"
					value="<%=(mesboardVO == null) ? "" : mesboardVO.getMemno()%>" /></td>
			</tr>
			<tr>
				<td>�d�����e:</td>
				<td><input type="TEXT" name="cont" size="45"
					value="<%=(mesboardVO == null) ? "CONT" : mesboardVO.getCont()%>" /></td>
			</tr>
			<tr>
				<td>�d���Ϥ��ק�:</td>
				<td><input type="file" name="pic"></td>
				<br>
				<!--         <input type="file" name="upfile2"> -->
			</tr>
			<tr>
				<td>�d�����A:<font color=red><b>*</b></font></td>
				<td><select size="1" name="status">
						<option value="normal">���`���</option>
						<option value="hid">����</option>
				</select></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="newsno" value="<%=mesboardVO.getMesno()%>">
		<input type="hidden" name="requestURL"
			value="<%=request.getParameter("requestURL")%>">
		<!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
		<input type="hidden" name="whichPage"
			value="<%=request.getParameter("whichPage")%>">
		<!--�u�Ω�:istAllEmp.jsp-->
		<input type="hidden" name="mesno" value="<%=mesboardVO.getMesno()%>">
		<input type="submit" value="�e�X�ק�">
	</FORM>
</body>
</html>
