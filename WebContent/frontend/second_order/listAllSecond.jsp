<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.motor.model.*" %>
<%@ page import="com.motor_model.model.*" %>
<%@ page import="java.util.*" %>
<% MotorService moSvc = new MotorService();
   List<MotorVO> list = moSvc.getAll();
   MotorModelService mmSvc = new MotorModelService();
   List<MotorModelVO> mlist = mmSvc.getAll();
   pageContext.setAttribute("list", list);
   pageContext.setAttribute("mlist", mlist);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>


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
	 				<li><a href="<%=request.getContextPath()%>/index.jsp">�^����</a></li>
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
<table class="table table-hover" border='1' bordercolor='#CCCCFF' width='100%'>
	<tr>
		<th style="text-align:center">�ۤ�</th>
<!-- 		<th style="text-align:center">�����s��</th> -->
<!-- 		<th style="text-align:center">���P���X</th> -->
<!-- 		<th style="text-align:center">�����s��</th> -->
<!-- 		<th style="text-align:center">�X�t���</th> -->
<!-- 		<th style="text-align:center">���{��</th> -->
<!-- 		<th style="text-align:center">���I�s��</th> -->
<!-- 		<th style="text-align:center">���A</th> -->

	
	</tr>
<%-- 					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="motorVO" items="${list}" >
	  <c:if test="${ motorVO.status=='seconsale'}">
		<tr align='center' valign='middle'>
		
			<td><img style="width:300px" src="<%=request.getContextPath()%>/backend/motor_model/mmReader.do?modtype=${motorVO.modtype}"></td>
<%-- 			<td>${motorVO.motno}</td> --%>
<%-- 			<td>${motorVO.plateno}</td> --%>
<%-- 			<td>${motorVO.engno}</td> --%>
<%-- 			<td><fmt:formatDate value="${motorVO.manudate}" pattern="yyyy�~MM��dd��"/>		</td> --%>
			
<%-- 			<td>${motorVO.mile}</td>	 --%>
<%-- 			<td>${motorVO.locno}</td>	 --%>
<%-- 			<td>${motorVO.status}</td>	 --%>
			
			<td valign='middle'>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			     <input class="btn btn-success" type="submit" value="�ڦ�����"> 
			     <input type="hidden" name="motno" value="${motorVO.motno}">
			     <input type="hidden" name="location"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="I_WANT_IT"></FORM>
			</td>
		</tr>
		</c:if>
	</c:forEach>
</table>



<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>