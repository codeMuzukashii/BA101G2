<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.motor.model.*" %>
<%@ page import="com.motor_model.model.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="java.util.*" %>
<% 
   MotorVO motorVO = (MotorVO) request.getAttribute("motorVO");
   MotorModelVO mmVO = (MotorModelVO) request.getAttribute("mmVO");
   String memno = (String) session.getAttribute("memno");
   String memname = (String) session.getAttribute("memname");
   MemberService memSvc = new MemberService();
   MemberVO memVO = memSvc.getOneMember(memno);
   pageContext.setAttribute("memVO", memVO);
   pageContext.setAttribute("motorVO", motorVO);
   pageContext.setAttribute("mm", mmVO);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
	
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
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
<table border='1' bordercolor='#CCCCFF' width='100%'>
	<tr>
<!-- 		<th>�����s��</th> -->
<!-- 		<th>�����s��</th> -->
<!-- 		<th>���P���X</th> -->
		<th style="text-align:center">�Ϥ�</th>
		<th style="text-align:center">�t�P</th>
		<th style="text-align:center">����</th>
		<th style="text-align:center" width="50px">�Ʈ�q(cc)</th>
		<th style="text-align:center">����</th>
<!-- 		<th>�����s��</th> -->
<!-- 		<th>�X�t���</th> -->
<!-- 		<th>���{��</th> -->
		<th style="text-align:center">���(NTD)</th>
		<th  style="text-align:center">�ʶR</th>
<!-- 		<th>status</th> -->
<!-- 		<th>note</th> -->
	</tr>
<%-- 					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>

		<tr align='center' valign='middle'>
		
<%-- 			<td>${motorVO.motno}</td> --%>
<%-- 			<td>${motorVO.modtype}</td> --%>
<%-- 			<td>${motorVO.plateno}</td> --%>
			<td><img src="<%=request.getContextPath()%>/backend/motor_model/mmReader.do?modtype=${motorVO.modtype}" width='200' height='180'></td>
           
<%-- 			<td>${motorVO.engno}</td> --%>
<%-- 			<td><fmt:formatDate value="${motorVO.manudate}" pattern="yyyy�~MM��dd��"/></td>		 --%>
<%-- 			<td>${motorVO.mile}</td> --%>
		
			   <td>${mm.brand}</td>	
			   <td width="80">${mm.name}</td>	
			   <td>${mm.displacement}</td>
			    <td height="200"><span>${mm.intro}</span></td>	
			   <td>${mm.saleprice}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			     <input class="btn btn-success" type="submit" value="�ڭn�R"> 
			     <input type="hidden" name="motno" value="${motorVO.motno}">
			     <input type="hidden" name="memno" value="${memVO.memno}">
			     <input type="hidden" name="location"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="DEAL"></FORM>
			</td>
		</tr>


</table>



<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>