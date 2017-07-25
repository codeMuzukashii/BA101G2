<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<%@ page import="com.adminis.model.*"%>
<%  AdminisService as = new AdminisService();
	AdminisVO adminisVO= (AdminisVO)session.getAttribute("adminisVO");
	System.out.println("!!!!!!!!!!!"+adminisVO.getName());
     session.setAttribute("admins", adminisVO.getName());
     session.setAttribute("adminisVO", adminisVO);
     
 	Map<String, String> roStatusMap = new HashMap<String, String>();
 	roStatusMap.put("unpaid", "��ú�O");
 	roStatusMap.put("canceled", "����");
 	roStatusMap.put("unoccupied", "�ǳƥ樮");
 	roStatusMap.put("available", "�������");	
 	roStatusMap.put("noshow", "�O������");	
 	roStatusMap.put("noreturn", "���٨�");	
 	roStatusMap.put("overtime", "�O������");	
 	roStatusMap.put("abnormalclosed", "���`����");	
 	roStatusMap.put("closed", "���`����");	
 	roStatusMap.put("other", "��L"); 
     
%>
<!-- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3_theme.css"/>	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">        
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.min.css">
	
   <title>�|���޲z-AutoBike</title>
</head>

<style>

#myDiv {
  display: none;
  text-align: center;
}

th,td{
	height:20px;
}
td{
	vertical-align: middle!important;
	
}

table{
	border:1px;
}

/*�۩w*/
 th{
	/*������*/
	white-space:nowrap;
} 


form, input{
	padding:0px;
	border:0px;
	margin:0px;
}

#logoutBtn{
	float:right;
	margin-top:7px;
	margin-right:20px;
}
</style>

<body>

<%--nav start --%>
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
        </ul>
        <div id="logoutBtn">
	        <form method="post" action="<%=request.getContextPath()%>/admin.do?action=logout">
	        	<input type="submit" value="�n�X" class="btn btn-default">
				<b><%=adminisVO.getName() %></b>
	       </form>
       </div>
    </nav>
<%--nav end --%>
    
<!------------------------------- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
    <div class="col-xs-12 col-sm-2 leftBar">
     	
        <img id="menuLogo" src="<%=request.getContextPath()%>/backend/images/android_logo2.jpg">
        <button class="accordion accordionMenu accordion accordionMenuMenu">�`���޲z�t��</button> 
        <div class="btn-group-vertical">
         <%if(adminisVO.getAuthno().equals("AC01") || adminisVO.getAuthno().equals("AC07")){%>     
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/motorMgmtHqSelectPage.jsp"  role="button">�����޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/motorDispatchMgmtHq.jsp"  role="button">�����ի׺޲z</a>           
			<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/backendRentOrd.jsp" role="button">�����޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/emtMgmtSelectPage.jsp" role="button">�˳ƺ޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/location/listAllLocation.jsp" role="button">���I�޲z</a>
         <%} %>  
        </div>
       
        <button class="accordion accordionMenu">���I�޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC02") || adminisVO.getAuthno().equals("AC07")){%> 
            <a class="btn btn-default" href="#" role="button">���I�����޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">�樮�޲z</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">�٨��޲z</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button">�����իץӽ�</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button">�˳ƥӽ�</a>
         <%} %>
        </div>
         
        <button class="accordion accordionMenu">�G�⨮�޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC05") || adminisVO.getAuthno().equals("AC07")){%>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp?who=${admins}" role="button">�G�⨮���޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/listAllSecOrd.jsp" role="button">�G�⨮�q��޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp" role="button">�G�⨮����޲z</a>
         <%} %>
        </div>
       <button class="accordion accordionMenu">�|���޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC03") || adminisVO.getAuthno().equals("AC07")){%>
             <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/backendMember.jsp" role="button">�|���޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/addMember.jsp" role="button">�s�W�|��</a>
         <%} %>
        </div>
        <button class="accordion accordionMenu">���ʥ����޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC06") || adminisVO.getAuthno().equals("AC07")){%>
<!--             <a class="btn btn-default" href="#" role="button">�����޲z</a> -->
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/mes_board/listAllMesBoard.jsp" role="button">�d�����޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/news/news_select_page.jsp" role="button">�̷s�����޲z</a>
         <%} %>
        </div>
        <button class="accordion accordionMenu">��ݺ޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
           <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/adminis/adm_select_page.jsp" role="button">����v���޲z</a>
<!--             <a class="btn btn-default" href="#" role="button">���˴��I�޲z</a> -->
         <%} %>
        </div>
        <div class="btn-group-vertical"></div>
    </div>
<!----------------------------------------------- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
    
    
    
    <div class="col-xs-12 col-sm-10 rightHTML">
		<div class="topTitle">
            <h1>�|����ƺ޲z�t�Ρ@�С@�����d��</h1>
        </div>
         		<div class="container-fluid"> 
       		
<div  class="col-xs-12 col-sm-12">
<jsp:useBean id="roSvc" scope="page" class="com.rent_ord.model.RentOrdService"/>
<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>
<jsp:useBean id="locSvc" scope="page" class="com.location.model.LocationService"/>  
<h4><mark>�d�߷|��:${memno}&nbsp;${memSvc.getOneMember(memno).memname}</mark></h4>
<table id="dataTable" class="table table-striped stripe hover">
	<thead>
		<tr>
		<th>���Ӭd��</th>		
		<th>�����s��</th>
		<th>��������</th>
		<th>�������I</th>
		<th>�٨����I</th>
		<th>�_�l���{</th>
		<th>�������{</th>
		<th>�}�l�ɶ�</th>
		<th>�٨��ɶ�</th>
		<th>�@��</th>
		<th>����</th>
		<th>����</th>
		<th>���檬�A</th>
		<th>�Ƶ�</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="roVO" items="${roSvc.all}" >
			<c:if test="${memno==roVO.memno}">
				<tr align='center' valign='middle'>
					<td>
						<form method="POST" target="print_popup" 
      				  		  action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" 
       						  onsubmit="window.open('about:blank','print_popup','width=1000,height=900');">
							<input type="hidden" name="rentno" value="${roVO.rentno}">
							<input type="hidden" name="action" value="query_for_member">
							<input type="submit" class="btn btn-default" value="�d��">
						</form>	
					</td>				
					<td>${roVO.rentno}</td>
					<td>${roVO.motorVO.motno}</td>
					<td>${locSvc.getOneLocation(roVO.slocno).locname}</td>
					<td>${locSvc.getOneLocation(roVO.rlocno).locname}</td>
					<td>${roVO.milstart}</td>	
					<td>${roVO.milend}</td>	
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value = "${roVO.startdate}" /></td>
					<td><fmt:formatDate pattern = "yyyy/MM/dd" value = "${roVO.returndate}" /></td>				
					<td>${roVO.fine}</td>
					<td>${roVO.total}</td>
					<td>${roVO.rank}</td>
					
					<%-- show readable-status with map --%>
					<c:set scope="page" var="temp"><c:out value="${roVO.status}"/></c:set>
					<% String key = String.valueOf(pageContext.getAttribute("temp")); %>
					<td><%=roStatusMap.get(key)%></td>
					<td>${roVO.note}</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
			<p class="text-center">
				<a onclick="history.back()" class="btn btn-danger btn-lg">
					<i class="glyphicon glyphicon-arrow-up"></i>��^�W��
				</a>
			</p>
</div>
</div>
</div>	
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>	
	<script src="<%=request.getContextPath()%>/js/dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/rentOrdNew.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/motorKanli_for_ro.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/datepicker_for_ro.js"></script>
<script>
//table
	$(document).ready(function(){
		var datatableInstance = $('#dataTable').DataTable({
		});
		$('.showHideColumn').on('click',function(){
			var tableColumn = datatableInstance.column($(this).attr('data-columnindex'));
			tableColumn.visible(!tableColumn.visible());
		})
	});
</script>
</body>
</html>


