<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<%@ page import="com.adminis.model.*"%>
<%  AdminisService as = new AdminisService();
	AdminisVO adminisVO= (AdminisVO)session.getAttribute("adminisVO");
	System.out.println("!!!!!!!!!!!"+adminisVO.getName());
     session.setAttribute("admins", adminisVO.getName());
     session.setAttribute("adminisVO", adminisVO);
%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list",list);
	String prev = (String) request.getAttribute("prev");
%>

<html>
<head>
<title>�Ҧ��|�����</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body bgcolor='white'>
<div class="col-xs-12 col-sm-12">
<table border='1' cellpadding='5' cellspacing='0' width='100%'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��|�����</h3>
		<a href="<%=request.getContextPath()%>/backend/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^�W��</a>
		</td>
	</tr>
</table>
</div>
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

<div class="col-xs-12 col-sm-12">
<table class="table table-striped table-inverse" border='1' bordercolor='#CCCCFF' width='100%'>
	<tr>
		<th style="text-align:center">�|���s��</th>
		<th style="text-align:center">�|���W��</th>
		<th style="text-align:center">�ʧO </th>
		<th style="text-align:center">�ͤ�</th>
		<th style="text-align:center">Mail</th>
		<th style="text-align:center">�q��</th>
		<th style="text-align:center">�a�}</th>
		<th style="text-align:center">�b��</th>
		<th style="text-align:center">�K�X</th>
		<th style="text-align:center">�����ҥ���</th>
		<th style="text-align:center">�����Ҥϭ�</th>
		<th style="text-align:center">�r��</th>
		<th style="text-align:center">�[�J�ɶ�</th>
		<th style="text-align:center">�{�Ҫ��A</th>
		<th colspan="2" style="text-align:center">�ާ@</th>
	</tr>
<%-- 	begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td>${memVO.memno}</td>
			<td>${memVO.memname}</td>
			<td>${memVO.sex}</td>
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.birth}" /></td>
			<td>${memVO.mail}</td>
			<td>${memVO.phone}</td>	
			<td>${memVO.addr}</td>	
			<td>${memVO.acc}</td>
			<td>${memVO.pwd}</td>	
<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1'  width=200' height='180'></td>	
<!-- �ϭ� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2'  width=200' height='180'></td>				
<!-- �r�� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license'  width=200' height='180'></td>							
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.credate}" /></td>
			<td>${memVO.status}</td>
				
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="memno" value="${memVO.memno}">
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
</div>
<%@ include file="pages/page2.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
