<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.location.model.*"%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<%@ page import="com.adminis.model.*"%>
<%  
	AdminisService as = new AdminisService();
	AdminisVO adminisVO= (AdminisVO)session.getAttribute("adminisVO");
	
	if(adminisVO==null){
		request.getRequestDispatcher("/backend/index.jsp").forward(request, response);
	}else{
		System.out.println("!!!!!!!!!!!"+adminisVO.getName());
	    session.setAttribute("admins", adminisVO.getName());     
	    session.setAttribute("adminisVO", adminisVO);
	}
%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<%
LocationVO locationVO = (LocationVO) request.getAttribute("locationVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����
%>
<html>
<head>

<title>���I�޲z</title>
</head>
<body bgcolor='white'>
<table border='1' bordercolor='#CCCCFF' width='500' align='center' valign='middle'>
		<tr>
		<td>���I�s��</td>
		<td><%=locationVO.getLocno()%></td>
		</tr>
		<tr>
		<td>���I�W��</td>
		<td><%=locationVO.getLocname()%></td>
		</tr>
		<tr>
		<td>���I�q��</td>
		<td><%=locationVO.getTel()%></td>
		</tr>
		<tr>
		<td>���I�a�}</td>
		<td><%=locationVO.getAddr()%></td>
		</tr>
		<tr>
		<td>���I�Ӥ�</td>
		<td><img src="<%=request.getContextPath()%>/frontend/location/locReader.do?locno=${locationVO.locno}&card=pic" height="300" width="300"></td>
		</tr>
		<tr>
		<td>���I�a�Ϻ��</td>
		<td><%=locationVO.getLon()%></td>
		</tr>
		<tr><td>���I�a�Ͻn��</td>
		<td><%=locationVO.getLat()%></td>
		</tr>
		<tr>
		<td>���I���A</td>
		<td><%=locationVO.getStatus()%></td>
		</tr>
</table>

</body>
</html>
