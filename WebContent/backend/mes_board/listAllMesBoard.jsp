<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mes_board.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	MesBoardService mesboardSvc = new MesBoardService();
	List<MesBoardVO> list = mesboardSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="mesboardSvc1" scope="page" class="com.mes_board.model.MesBoardService" />

<html>
<head>
<title>�Ҧ��d���O���</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��d���O���</h3>
		<a href="<%=request.getContextPath()%>/backend/mes_board/mesboard_select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�d���O�s��</th>
		<th>�|���s��</th>
		<th>�d���ɶ�</th>
		<th>�d�����e</th>
		<th>�ۤ��ɮ�</th>
		<th>�d�������A</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="mesboardVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(mesboardVO.mesno==param.mesno) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${mesboardVO.mesno}</td>
			<td>${mesboardVO.memno}</td>
			<td>${mesboardVO.mesdate}</td>
			<td>${mesboardVO.cont}</td>
			<td><img src="<%=request.getContextPath()%>/backend/mes_board/mesboardread.do?mesno=${mesboardVO.mesno}" style= max-width:150px;max-height:150px;></td>
			<td>${mesboardVO.status}</td>			
			<td>
			  <FORM METHOD="post" ACTION="mesboard.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="mesno" value="${mesboardVO.mesno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
<%-- 			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller--> --%>
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="mesboard.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="mesno" value="${mesboardVO.mesno}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
<%-- 			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller--> --%>
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>