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
<title>�Ҧ��G�⨮�q���� - listAllSecOrd.jsp</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='1260'>
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
<table border='1' bordercolor='#CCCCFF' width='1260'>
	<tr>
		<th>�G�⨮�q��s��</th>
		<th>�|���W��</th>
		<th>�t�P����</th>
		<th>�q�榨�߮ɶ�</th>
		<th>�q�檬�A</th>
	</tr>
<%-- 					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
	<c:forEach var="soVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
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
