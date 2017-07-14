<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mes_board.model.*"%>
<%
	MesBoardVO mesboardVO = (MesBoardVO) request.getAttribute("mesboardVO");
%>

<html>
<head>
<title>�s�W�d��</title>
</head>

<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='400'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td>
				<h3>�s�W�d��</h3>
			</td>
			<td><a
				href="<%=request.getContextPath()%>/backend/mes_board/mesboard_select_page.jsp"><img
					src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
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

	<FORM METHOD="post" ACTION="mesboard.do" name="form1"
		enctype="multipart/form-data">
		<table border="0">

			<jsp:useBean id="mesboardSvc" scope="page"
				class="com.mes_board.model.MesBoardService" />
			<tr>
				<td>�|���s��:</td>
				<td><input type="TEXT" name="memno" size="45"
					value="<%=(mesboardVO == null) ? "" : mesboardVO.getMemno()%>" /></td>
			</tr>
			<tr>
				<td>�d�����e:</td>
				<td><input type="TEXT" name="cont" size="45"
					value="<%=(mesboardVO == null) ? "" : mesboardVO.getCont()%>" /></td>
			</tr>
			<tr>
				<td>�ۤ��Ϥ�:</td>
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
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
</body>

</html>