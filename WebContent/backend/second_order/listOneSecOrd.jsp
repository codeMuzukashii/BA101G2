<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.sec_ord.model.*"%>
<%@ page import="com.location.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO");%>

<%-- ���X ������LocationVO����--%>
<%
 // DeptService deptSvc = new DeptService();
 // DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
%>
<html>
<head>
<title>��� - listOneSecOrd.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
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
	 			<a class="navbar-brand" href="#">�G�⨮�q����</a>
	 		</div>
	 		
	 		<!-- ������ÿ��� -->
	 		<div class="collapse navbar-collapse navbar-ex1-collapse">
	 			<!-- ����� -->
	 			<ul class="nav navbar-nav">
	 				<li class="active"><a href="#">�d�߯S�w�q��</a></li>
	 				<li><a href="<%=request.getContextPath()%>/backend/index.jsp">�^����</a></li>
	 			</ul>
	 		
	 			
	 		
	 			<!-- �k��� -->
	 			<c:if test="${not empty adminisVO}">
	 			<ul class="nav navbar-nav navbar-right">
	 				<li><a href="#">${adminisVO.name} �z�n</a></li>
	 				<li><a href="<%=request.getContextPath()%>/backend/member/member.do?action=logout"
              								data-toggle="modal">�n�X</a></li>
	 			</ul>
	 			</c:if>
	 			
	 		</div>
	 		<!-- ������ÿ��ϵ��� -->
	 	</div>
	 </nav> 
<table  border="1" class="table table-striped table-inverse table-hover" bordercolor='#CCCCFF' width='100%'>
	<tr>
		<th style="text-align:center">�G�⨮�q��s��</th>
		<th style="text-align:center">�|���s��</th>
		<th style="text-align:center">�����s��</th>
		<th style="text-align:center">�س�ɶ�</th>
		<th style="text-align:center">���A</th>
		
	</tr>
	<tr align='center' valign='middle'>
		<td><%=soVO.getSono()%></td>
		<td><%=soVO.getMemno()%></td>
		<td><%=soVO.getMotorno()%></td>
		<td><%=soVO.getBuildtime()%></td>
		<td><%=soVO.getStatus()%></td>
	
		
	</tr>
</table>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
