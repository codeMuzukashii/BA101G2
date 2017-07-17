<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.sec_ord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	SecOrdService soSvc = new SecOrdService();
    String status = request.getParameter("status");
    String memno =request.getParameter("memno");
    List<SecOrdVO> list = null;
    List<SecOrdVO> list2 = new ArrayList<SecOrdVO>(); 
    if("all".equalsIgnoreCase(status) 
      || status==null)
    	list =  (List<SecOrdVO>) request.getAttribute("list");  
    else	
    {
    	for(SecOrdVO ord :soSvc.getAll(status))
    	{
    		if(ord.getMemno().equals(memno))
    			list2.add(ord);
    	}
    	 list = list2;
    	
    }
    System.out.println("���o�Ѽ�status:"+status);
	pageContext.setAttribute("list",list);

%>

<html>
<style>
#mamberTable{
	margin:0px;
	background-color: #fff!important;
	font-size:16px!important;
	
}

</style>
<head>
<title>�G�⨮�q�� -backSecOrdList.jsp</title>
</head>
<body>
<div  class="col-xs-12 col-sm-12">
<table  border='1' cellpadding='5' cellspacing='0' width='100%'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�G�⨮�q��aaa -backSecOrdList.jsp</h3>
	</td>
	</tr>
</table>
</div>
<div class="col-xs-12 col-sm-12">
<table class="table table-striped"  id="mamberTable">
	<tr>
		<th style="text-align:center">�G�⨮�q��s��</th>
		<th style="text-align:center">�|���W��</th>
		<th style="text-align:center">�t�P����</th>
		<th style="text-align:center">�q�榨�߮ɶ�</th>
		<th style="text-align:center">�q�檬�A</th>
		<th colspan="2" style="text-align:center">�ާ@</th>
	</tr>
	<c:forEach var="soVO" items="${list}" >
		<tr align='center' valign='middle'>
			<td>${soVO.sono}</td>
			<td>${soVO.memno}</td>
			<td>${soVO.motorno}</td>
			<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" value = "${soVO.buildtime}" /></td>
			<td>${soVO.status}</td>		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="sono" value="${soVO.sono}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<br>�����������|:baaaaaaack<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
   </div>
</body>
</html>
