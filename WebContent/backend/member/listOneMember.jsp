<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%MemberVO memVO = (MemberVO) request.getAttribute("memVO");

%>

<%-- ���X ������LocationVO����--%>
<%
//  DeptService deptSvc = new DeptService();
//  DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
%>
<html>
<head>
<title>�|����� - listOneMember.jsp</title>

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
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='1600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|����� - ListOneMember.jsp</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
		<th>�|���s��</th>
		<th width='100' >�|���W��</th>
		<th width='50'>�ʧO </th>
		<th>�ͤ�</th>
		<th>Mail</th>
		<th>�q��</th>
		<th>�a�}</th>
		<th>�b��</th>
		<th>�K�X</th>
		<th>�����ҥ���</th>
		<!-- <th>�v��</th> -->
		<th>�����Ҥϭ�</th>
		<th>�r��</th>
		<th  width='150'>�[�J�ɶ�</th>
		<th>�{�Ҫ��A</th>
		<th colspan="2" align="center">�ާ@</th>
	
	</tr>
    </thead>
            <tr align='center' valign='middle'>
			<td>${memVO.memno}</td>
			<td width='100'>${memVO.memname}</td>
			<td width='50'>${memVO.sex}</td>
			<td  width='150'><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.birth}" /></td>
			<td>${memVO.mail}</td>
			<td>${memVO.phone}</td>	
			<td   width='200'>${memVO.addr}</td>	
			<td>${memVO.acc}</td>
			<td>${memVO.pwd}</td>
<!-- ���� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='200' height='180'></td>	
<!-- �v�� --><!-- <td><video src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='200' height='180' controls></video></td> -->				
<!-- �ϭ� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2'  width='200' height='180'></td>				
<!-- �r�� --><td><img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license'  width='200' height='180'></td>							
			<td><fmt:formatDate pattern = "yyyy�~MM��dd��" 
         value = "${memVO.credate}" /></td>
			<td>${memVO.status}</td>
			<td class="text-center"><a class='btn btn-info btn-xs' href="<%=request.getContextPath()%>/backend/member/member.do?action=getOne_For_Update&memno=${memVO.memno}&status=${memVO.memno}"><span class="glyphicon glyphicon-edit"></span> Edit</a></td>
			<td class="text-center"><a href="<%=request.getContextPath()%>/backend/member/member.do?action=delete&memno=${memVO.memno}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>	


<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do"> --%>
<!-- 			     <input type="submit" value="�ק�">  -->
<%-- 			     <input type="hidden" name="memno" value="${memVO.memno}"> --%>
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
    </table>
    </div>
</div>
<button type="button" onclick="loadDoc()" >���ڬݧڪ��q��</button>
<div id="demo"></div>


</body>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 function loadDoc() {
    var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("demo").innerHTML=this.responseText;
	    }
	 };
	  
	  xhttp.open("GET","<%=request.getContextPath()%>/frontend/second_order/SecOrd.do?action=getAll_For_Display_By_Memno&memno=${memVO.memno}", true);
	
	  xhttp.send();
	}
 
 
 
 function toggle() {
	    var xhttp = new XMLHttpRequest();
	    var ss = document.getElementById("mystatus").value;
		xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
		     document.getElementById("demo").innerHTML=this.responseText;
		    }
		 };
		  
		  xhttp.open("GET","<%=request.getContextPath()%>/frontend/second_order/SecOrd.do?action=getAll_For_Display_By_Memno_Status&memno=${memVO.memno}&status="+ss, true);
		
		  xhttp.send();
		} 
 
 
 
</script>
</html>
