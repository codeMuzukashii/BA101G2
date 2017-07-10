<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.rent_ord.model.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>  	
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">     
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
	
    <title>車輛查詢-AutoBike</title>
</head>
<body>

	<%
		RentOrdVO roQueryVO = (RentOrdVO)request.getAttribute("roQueryVO");
	%>
	租賃單號:<c:out value="${roQueryVO.rentno}" default="無資料"/><br>
	會員編號:<c:out value="${roQueryVO.memno}" default="無資料"/><br>
	車輛編號:<c:out value="${roQueryVO.motno}" default="無資料"/><br>
	交車據點:<c:out value="${roQueryVO.slocno}" default="無資料"/><br>
            還車據點:<c:out value="${roQueryVO.rlocno}" default="無資料"/><br>
	起始里程:<c:out value="${roQueryVO.milstart}" default="無資料"/><br>
	結束里程:<c:out value="${roQueryVO.milend}" default="無資料"/><br>
	填表日期:<fmt:formatDate pattern = "yyyy-MM-dd" value = "${roQueryVO.filldate}" /><br>
	起始時間:<fmt:formatDate pattern = "yyyy-MM-dd" value = "${roQueryVO.startdate}" /><br>
	結束日期:<fmt:formatDate pattern = "yyyy-MM-dd" value = "${roQueryVO.enddate}" /><br>
	還車日期:<fmt:formatDate pattern = "yyyy-MM-dd" value = "${roQueryVO.returndate}" /><br>
	        罰金:<c:out value="${roQueryVO.fine}" default="無資料"/><br>
	    總金額:<c:out value="${roQueryVO.total}" default="無資料"/><br>
	        評價:<c:out value="${roQueryVO.rank}" default="無資料"/><br>
	        狀態:<c:out value="${roQueryVO.status}" default="無資料"/><br>
	        備註:<c:out value="${roQueryVO.note}" default="無資料"/><br>
	        
        <c:if test="${(roQueryVO.status == 'unpaid')}">					
				<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">	
					<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
					<input type="hidden" name="status" value="unpaid">
					<input type="hidden" name="action" value="leaseform_default">	
					<input type="submit" value="尚未繳費" class="btn btn-primary"/>
				</form>								
		</c:if>
		<c:if test="${(roQueryVO.status =='unoccupied')}">					
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">	
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="status" value="unoccupied">
				<input type="hidden" name="action" value="leaseform_default">	
				<input type="submit" value="完成繳費" class="btn btn-success"/>
			</form>								
		</c:if>
		<c:if test="${roQueryVO.status == 'available'}">
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">						
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="status" value="available">
				<input type="hidden" name="action" value="leaseform_available">
				<input type="submit" value="等待取車" class="btn btn-warning"/>
			</form>					
		</c:if>	
		<c:if test="${roQueryVO.status == 'canceled'}">
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank" target="_blank">						
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="status" value="canceled">
				<input type="hidden" name="action" value="leaseform_noshow">
				<input type="submit" value="訂單取消" class="btn btn-info"/>
			</form>					
		</c:if>			
		<c:if test="${roQueryVO.status =='noshow'}">
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">						
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="status" value="noshow">
				<input type="hidden" name="action" value="leaseform_noshow">	
				<input type="submit" value="逾期未取" class="btn btn-danger"/>
			</form>					
		</c:if>
		<c:if test="${roQueryVO.status =='noreturn'}">
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">						
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="comeFrom" value="noreturn">
				<input type="hidden" name="action" value="returnform_noreturn">								
				<input type="submit" value="等待還車" class="btn btn-warning"/>
			</form>					
		</c:if>
		<c:if test="${roQueryVO.status =='overtime'}">
			<form method="post" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" target="_blank">						
				<input type="hidden" name="rentno" value="${roQueryVO.rentno}">
				<input type="hidden" name="comeFrom" value="overtime">
				<input type="hidden" name="action" value="returnform_overtime">	
				<input type="submit" value="逾期未還" class="btn btn-danger"/>
			</form>					
		</c:if>	

    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/motorKanli_for_ro.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/datepicker_for_ro.js"></script>	
</body>
</html>