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
<title>�ڪ��������</title>
<style type="text/css">

.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body bgcolor='white'>
<div  class="col-xs-12 col-sm-12">
<table  border='1' cellpadding='5' cellspacing='0' width='100%'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ڪ��q�� </h3>
	</td>
	</tr>
</table>
</div>
<%-- ���~��C --%>
<%-- <c:if test="${not empty errorMsgs}"> --%>
<!-- 	<font color='red'>�Эץ��H�U���~: -->
<!-- 	<ul> -->
<%-- 		<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 			<li>${message}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->
<!-- 	</font> -->
<%-- </c:if> --%>
<div class="col-xs-12 col-sm-12">
<%-- <%@ include file="pages/page1.file" %>  --%>

<table border='1' class="table table-striped custab">
	<thead>
	<tr align='center'>
	
		<th>�����s��</th>
		<th>�|���s��</th>
		<th>��������</th>
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
		<th>Status</th>
		<th>Note</th>
	
	</tr>
	</thead>
<%-- 	begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="roVO" items="${list}" >
	 <c:if test="${memno==roVO.memno}">
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
			<td>${roVO.status}</td>
			<td>${roVO.note}</td>	
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do"> --%>
<!-- 			     <input type="submit" value="�ק�">  -->
<%-- 			     <input type="hidden" name="memno" value="${roVO.memno}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  --> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do"> --%>
<!-- 			    <input type="submit" value="�R��"> -->
<%-- 			    <input type="hidden" name="memno" value="${memVO.memno}"> --%>
<%-- 			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
		</c:if>
	</c:forEach>
</table>
<%-- <%@ include file="pages/page2.file" %> --%>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</div>



</body>
<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
