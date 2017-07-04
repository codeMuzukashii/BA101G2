<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.rent_ord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	RentOrdService roSvc = new RentOrdService();
	String memno = (String)request.getAttribute("memno");
	List<RentOrdVO> list = roSvc.getAll();
	pageContext.setAttribute("list",list);
	pageContext.setAttribute("memno",memno);
%>

<html>
<head>
<title>�ڪ��q����</title>

</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='1550'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ڪ��q����</h3>
		<a href="<%=request.getContextPath()%>/backend/member/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
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
<%-- <%@ include file="pages/page1.file" %>  --%>
<table border='1' bordercolor='#CCCCFF' width='1600'>
	<tr>
		<th>�����s��</th>
		<th width='70'>�|���s��</th>
		<th width='50'>��������</th>
		<th>�������I</th>
		<th>�٨����I</th>
		<th>�_�l���{</th>
		<th>��p���{</th>
		<th>�U����</th>
		<th>�q��}�l�ɶ�</th>
		<th>�q�浲���ɶ�</th>
		<th>�٨��ɶ�</th>
		<th>FINE</th>
		<th>TOTAL</th>
		<th>RANK</th>
	</tr>
<%-- 	begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="roVO" items="${list}" >
		<tr align='center' valign='middle'>
			<td>${roVO.rentno}</td>
			<td>${roVO.memno}</td>
			<td>${roVO.motno}</td>
			<td>${roVO.slocno}</td>
			<td>${roVO.rlocno}</td>
			<td>${roVO.milstart}</td>	
			<td>${roVO.milend}</td>	
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${roVO.filldate}" /></td>
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${roVO.startdate}" /></td>
<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${roVO.enddate}" /></td>
			
<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${roVO.returndate}" /></td>				
<td>${roVO.fine}</td>
			<td>${roVO.total}</td>
				<td>${roVO.rank}</td>
				
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="memno" value="${roVO.memno}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="memno" value="${memVO.memno}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="pages/page2.file" %> --%>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
