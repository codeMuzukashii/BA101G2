<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.sec_ord.model.*"%>
<%@ page import="java.util.*" %> 
<%
    String status = (String)request.getAttribute("status");
	SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"paid","unpaid","closed","other"};
	request.setAttribute("statusArray", statusArray);
	session.setAttribute("soVO", soVO);
	pageContext.setAttribute("status", status);
%>
<html>
<head>
<title>�q���ƭק� </title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<nav class="navbar navbar-default" role="navigation">
	 	<div class="container">
	 		<div class="navbar-header">
	 			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
	 				<span class="sr-only">������</span>
	 				<span class="icon-bar"></span>
	 				<span class="icon-bar"></span>
	 				<span class="icon-bar"></span>
	 			</button>
	 			<a class="navbar-brand" href="#">�G�⨮�����</a>
	 		</div>
	 		
	 		<!-- ������ÿ��� -->
	 		<div class="collapse navbar-collapse navbar-ex1-collapse">
	 			<!-- ����� -->
	 			<ul class="nav navbar-nav">
	 				<li class="active"><a href="#">��ܧA���w����</a></li>
	 				<li><a href="<%=request.getContextPath()%>/backend/index.jsp">�^����</a></li>
	 			</ul>
	 		
	 			
	 		
	 			<!-- �k��� -->
	 			<c:if test="${not empty memVO}">
	 			<ul class="nav navbar-nav navbar-right">
	 				<li><a href="#">${memVO.memname} �z�n</a></li>
	 				<li><a href="<%=request.getContextPath()%>/backend/member/member.do?action=logout"
              								data-toggle="modal">�n�X</a></li>
	 			</ul>
	 			</c:if>
	 			
	 		</div>
	 		<!-- ������ÿ��ϵ��� -->
	 	</div>
	 </nav> 
<h3>�q���ƭק�:</h3>
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

<FORM METHOD="post" ACTION="SecOrd.do" name="form1">
<div class="col-xs-12 col-sm-6 col-sm-offset-3"></div>
<table class="table table-hover" border='1' bordercolor='#CCCCFF' >
	<tr>
		<td>�q��s��:<font color=red><b>*</b></font></td>
		<td>${soVO.sono}</td>
	</tr>
	<tr>
		<td>�|���s��:</td>
		<td>${soVO.memno}</td>
	</tr>
	
	<tr>
		<td>�����s��:</td>
		<td>${soVO.motorno}</td>
	</tr>
	
	<tr>
		<td>�q��ɶ�:</td>
		<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" 
         value = "${soVO.buildtime}" /></td>
	</tr>
	<tr>
		<td>�q�檬�A:</td>
		<td><input readonly type="text" value="${status}"></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="status" value="${status}">
<input type="hidden" name="memno" value="${soVO.memno}">
<input type="hidden" name="motno" value="${soVO.motorno}">
<input type="hidden" name="sono" value="${soVO.sono}">
<input type="hidden" name="sodate" value="<fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" 
value = "${soVO.buildtime}" />">
<input type="submit" value="�T�{�ק�"></FORM>

</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script language="JavaScript" src="js/calendarcode.js"></script>
</html>
