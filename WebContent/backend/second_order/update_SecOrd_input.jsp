<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.sec_ord.model.*"%>
<%@ page import="com.adminis.model.*" %>
<%@ page import="java.util.*" %> 
<%
    String status = (String)request.getAttribute("status");
	SecOrdVO soVO = (SecOrdVO) request.getAttribute("soVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"paid","unpaid","closed","other"};
	request.setAttribute("statusArray", statusArray);
	session.setAttribute("soVO", soVO);
	pageContext.setAttribute("status", status);
	
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
<html>
<head>
<title>�q���ƭק� </title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/google_family_kaushan_script.css" />
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3_theme.css"/>	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">    
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css"> 
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
    <link rel="stylesheet" type="text/css" href="js/calendar.css">
  
</head>

<body bgcolor='white'>

<c:if test="<%=adminisVO!=null %>">
    <nav class="navbar navbar-default" role="navigation">
        <!-- logo�� -->
        <a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/backend/index.jsp" id="navA">AUTOBIKE</a>
        <!-- ����� -->
        <ul class="nav navbar-nav">
            <li><a href="#" id="navA">��ݺ޲z�t��</a></li>
            <!-- ���� -->
            <iframe scrolling="no" frameborder="no" clocktype="html5" style="overflow:hidden;border:0;margin:0;margin-top:5px;padding:0;width:120px;height:40px;" src="http://www.clocklink.com/html5embed.php?clock=004&timezone=CCT&color=yellow&size=120&Title=&Message=&Target=&From=2017,1,1,0,0,0&Color=yellow">
            </iframe>
        </ul>
        <!-- �k��� -->
        
        <ul class="nav navbar-nav navbar-right">
        
			<li><a href="#" id="navA">���o! <%= adminisVO.getName() %></a></li>
			<li><a href="<%=request.getContextPath()%>/admin.do?action=logout" id="navA"><i
					class="glyphicon glyphicon-log-out"></i>�n�X</a></li>
		</ul>
    </nav>
<%--nav end --%>
    
<!------------------------------- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
    <div class="col-xs-12 col-sm-2 leftBar">
     	<img id="menuLogo" src="<%=request.getContextPath()%>/backend/images/android_logo2.jpg">
       		<%if(adminisVO.getAuthno().equals("AC01") || adminisVO.getAuthno().equals("AC07")){%>     
        <button class="accordion accordionMenu accordion accordionMenuMenu">�`���޲z�t��</button> 
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/motorMgmtHqSelectPage.jsp"  role="button">�����޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/motorDispatchMgmtHq.jsp"  role="button">�����ի׺޲z</a>           
			<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/backendRentOrd.jsp" role="button">�����޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/emtMgmtSelectPage.jsp" role="button">�˳ƺ޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/location/listAllLocation.jsp" role="button">���I�޲z</a>
        </div>
       		<%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">�`���޲z�t��</button>		
        </div>
       		<%} %>
       		
     	<%if(adminisVO.getAuthno().equals("AC02") || adminisVO.getAuthno().equals("AC07")){%> 
        <button class="accordion accordionMenu">���I�޲z�t��</button>
        <div class="btn-group-vertical">
        	<a class="btn btn-default" href="#" role="button">���I�����޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">�樮�޲z</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">�٨��޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button">�����իץӽ�</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button">�˳ƥӽ�</a>
         </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">���I�޲z�t��</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC05") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">�G�⨮�޲z�t��</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp?who=${admins}" role="button">�G�⨮���޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/listAllSecOrd.jsp" role="button">�G�����޲z</a>
<%--             <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp" role="button">�G�⨮����޲z</a> --%>
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">�G�⨮�޲z�t��</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC03") || adminisVO.getAuthno().equals("AC07")){%>
       <button class="accordion accordionMenu">�|���޲z�t��</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/backendMember.jsp" role="button">�|���޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/addMember.jsp" role="button">�s�W�|��</a>
         </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">�|���޲z�t��</button>		
        </div>
       		<%} %>
       		
       		<%if(adminisVO.getAuthno().equals("AC06") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">���ʥ����޲z�t��</button>
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/mes_board/listAllMesBoard.jsp" role="button">�d�����޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/news/listAllNews.jsp" role="button">�̷s�����޲z</a>
        </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">���ʥ����޲z�t��</button>		
        </div>
       		<%} %>
       		
         <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">��ݺ޲z�t��</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/adminis/listAllAdminis.jsp" role="button">����v���޲z</a>
<!--             <a class="btn btn-default" href="#" role="button">���˴��I�޲z</a> -->
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">��ݺ޲z�t��</button>		
        </div>
       		<%} %>
        <div class="btn-group-vertical"></div>
    </div>
</c:if> 

 <div class="col-xs-12 col-sm-10 rightHTML" id="demo">
	<div class="topTitle">
			<h1>�ק�q��</h1>
	</div>
	
	<FORM METHOD="post" ACTION="SecOrd.do" name="form1">
<div class="col-xs-12 col-sm-6 col-sm-offset-3"></div>
<table class="table table-hover" border='1' bordercolor='#CCCCFF' >
	<tr>
		<td>�q��s��:<font color=red><b>*</b></font></td>
		<td>${soVO.sono}</td>
	</tr>
	<tr>
		<td>�|���s��:</td>
		<td>${soVO.memno}</td>
	</tr>
	
	<tr>
		<td>�����s��:</td>
		<td>${soVO.motorno}</td>
	</tr>
	
	<tr>
		<td>�q��ɶ�:</td>
		<td><fmt:formatDate pattern = "yyyy-MM-dd hh:mm" 
         value = "${soVO.buildtime}" /></td>
	</tr>
	<tr>
		<td>�q�檬�A:</td>
		<td><input readonly type="text" value="${status}"></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="status" value="${status}">
<input type="hidden" name="memno" value="${soVO.memno}">
<input type="hidden" name="motno" value="${soVO.motorno}">
<input type="hidden" name="sono" value="${soVO.sono}">
<input type="hidden" name="sodate" value="<fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" 
value = "${soVO.buildtime}" />">
<input type="submit" value="�T�{�ק�"></FORM>
	
	
	
</div>




</body>
<script src="https://code.jquery.com/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/motorKanli_js.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/indexNew.js"></script>
</html>
