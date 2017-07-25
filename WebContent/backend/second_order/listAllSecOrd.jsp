<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.sec_ord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	SecOrdService soSvc = new SecOrdService();
    String status = request.getParameter("status");
    String status2 = request.getParameter("status");
    List<SecOrdVO> list = null;
    if("all".equalsIgnoreCase(status) 
      || "all".equalsIgnoreCase(status2)
      || status==null
      || status2==null)
    	list = soSvc.getAll();  
    else	
    {
    
    	 list = soSvc.getAll(status);
    	if(status!=null)
			list = soSvc.getAll(status2);
    	
    }
    System.out.println("���o�Ѽ�status:"+status);
    System.out.println("���o�Ѽ�status2:"+status2);
	pageContext.setAttribute("list",list);

%>

<html>
<head>
<title>�Ҧ��G�⨮�q����</title>
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
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" >
       <b><font color=orange>�q�檬�A:</font></b>
       <span><select size="1" name="status">
     
       	   <option  ${status == 'all' ? 'selected="selected"' : ''}  value="all">����
       	   <option ${status == 'unpaid' ? 'selected="selected"' : ''} value="unpaid">���I��
       	   <option ${status == 'paid' ? 'selected="selected"' : ''} value="paid">�w�I��
       	   <option ${status == 'closed' ? 'selected="selected"' : ''} value="closed">�w����
      
       	</select></span>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="listSecOrd_ByStatus">
     </FORM>
      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" >
       <b><font color=orange>�|���s��:</font></b>
       <input type="text" name="memno" placeholder="�|���s��">
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getAll_For_Display_By_Memno">
     </FORM>
      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" >
       <b><font color=orange>�|���m�W:</font></b>
       <input type="text" name="memname" placeholder="�|���m�W">
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getAll_For_Display_By_Memname">
     </FORM>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" >
       <b><font color=orange>�q��s��:</font></b>
       <input type="text" name="memname" placeholder="�q��s��">
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getAll_For_Display_By_Sono">
     </FORM>
<table  border="1" class="table table-striped table-inverse table-hover" bordercolor='#CCCCFF' width='100%'>
	<tr >
		<th style="text-align:center">�G�⨮�q��s��</th>
		<th style="text-align:center">�|���s��</th>
		<th style="text-align:center">�|���m�W</th>
		<th style="text-align:center">�t�P����</th>
		<th style="text-align:center">�q�榨�߮ɶ�</th>
		<th style="text-align:center">�q�檬�A</th>
		<th style="text-align:center" colspan="2">�ާ@</th>
	</tr>
	<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"></jsp:useBean>
<%-- 					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="soVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr align='center' valign='middle'>
			<td>${soVO.sono}</td>
			<td>${soVO.memno}</td>
		    <c:forEach var="memVO" items="${memSvc.all}">
		       <c:if test="${memVO.memno==soVO.memno}">
		        <td>${memVO.memname}</td>
		       </c:if>
		    </c:forEach>
			<td>${soVO.motorno}</td>
			<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" 
         value = "${soVO.buildtime}" /></td>
          <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do">
			<td><select  name="Order_Status">
	       	   <option ${soVO.status == 'unpaid' ? 'selected="selected"' : ''} value="unpaid">���I��
	       	   <option ${soVO.status == 'paid' ? 'selected="selected"' : ''} value="paid">�w�I��
	       	   <option ${soVO.status == 'closed' ? 'selected="selected"' : ''} value="closed">�w�樮
			    </select></td>		 
			
			<td>
			 
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="sono" value="${soVO.sono}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			     <input type="hidden" name="action"	value="getOne_For_Update">
			</td>
			</FORM>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do"> --%>
<!-- 			    <input type="submit" value="�R��"> -->
<%-- 			    <input type="hidden" name="sono" value="${soVO.sono}"> --%>
<%-- 			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<!-- 			    <input type="hidden" name="action"value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<!-- <br>�����������|:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b> --%>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>
