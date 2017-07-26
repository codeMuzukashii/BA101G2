<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.location.model.*"%>
<%
	LocationVO locationVO = (LocationVO) request.getAttribute("locationVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<html>
<head>
	<title>location</title>
</head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body>

<FORM METHOD="post" ACTION="location.do" name="form1" enctype="multipart/form-data">
<table border="1" width='500' align='center' valign='middle'>
	<tr>
		<td>���I�s��:<font color=red><b>*</b></font></td>
		<td><%=locationVO.getLocno()%></td>
	</tr>
	<tr>
		<td>���I�W��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="locname" size="45" value="<%=locationVO.getLocname()%>" /></td>
	</tr>
	<tr>
		<td>���I�q��:<font color=red><b>*</b></font></td>
		<td><input type="TEL" name="tel" size="45"	value="<%=locationVO.getTel()%>" /></td>
	</tr>
	

	<tr>
		<td>���I�a�}:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="addr" size="45"	value="<%=locationVO.getAddr()%>" /></td>
	</tr>
	<tr>
		<td>���I�Ӥ�:</td>
		<td><input type="FILE" name="pic" size="45" value="<%=locationVO.getPic()%>" /></td>
	</tr>
	<tr>
		<td>���I�a�Ϻ��:</td>
		<td><input type="TEXT" name="lon" size="45" value="<%=locationVO.getLon()%>" /></td>
	</tr>
	<tr>
		<td>���I�a�Ͻn��:</td>
		<td><input type="TEXT" name="lat" size="45" value="<%=locationVO.getLat()%>" /></td>
	</tr>
	<tr>
		<td>���I���A:<font color=red><b>*</b></font></td>
		<td><select id="selectStatus" name="status"><%=locationVO.getStatus()%>
		<option value="open">open</option>
		<option value="closed">closed</option></select></td>
	</tr>
</table>
<input type="hidden" name="action" value="update">
<input type="hidden" name="locno" value="<%=locationVO.getLocno()%>">
<input type="submit" value="�e�X�ק�"><br>

</FORM>

<script>
window.onload =
	function init(){
		var sta = "<%=locationVO.getStatus()%>";
		console.log("sta= "+sta);
		var selectOpts = document.querySelectorAll("#selectStatus > option");
		for(var i = 0;  i < selectOpts.length; i++){
			if( selectOpts[i].value ==  sta ){
				selectOpts[i].selected = "selected";
			}
			if(	selectOpts[i].value.equal("preparing")){
				selectOpts[i].selected = "close";
			}
		}
	}
</script>


</body>
</html>
