<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.sec_ord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	SecOrdService soSvc = new SecOrdService();
	List<SecOrdVO> list = soSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��G�⨮�q���� - listAllSecOrd.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��G�⨮�q���� - ListAllSecOrds.jsp</h3>
		<a href="<%=request.getContextPath()%>/frontend/second_order/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
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
<span><font color=blue><b>�q�檬�A</b></font>
<select name="status" onchange="loadOrder(this.value)" >
	<option value="unpaid">���I��</option>
	<option value="paid">�w�I��</option>
	<option value="closed">�w����</option>
	<option value="other">��L</option>
</select>
</span>
<script type="text/javascript">
function loadOrder() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("demo").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "table.jsp", true);
	xhttp.send();
}

</script>
<div id="demo"></div>
<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�G�⨮�q��s��</th>
		<th>�|���W��</th>
		<th>�t�P����</th>
		<th>�q�榨�߮ɶ�</th>
		<th>�q�檬�A</th>
	</tr>
	
	<c:forEach var="soVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${soVO.sono}</td>
			<td>${soVO.memno}</td>
			<td>${soVO.motorno}</td>
			<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" 
         value = "${soVO.buildtime}" /></td>
			<td>${soVO.status}</td>		
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="sono" value="${soVO.sono}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="sono" value="${soVO.sono}">
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
