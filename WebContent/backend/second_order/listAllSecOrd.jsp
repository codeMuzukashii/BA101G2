<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.sec_ord.model.*"%>
<%@ page import="com.adminis.model.*" %>
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
<title>�G�⨮�q��޲z�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/google_family_kaushan_script.css" />
 	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3_theme.css"/>	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">    
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css"> 
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
			<h1>�G�⨮�q��޲z</h1>
		</div>
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
<%--       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" > --%>
<!--        <b><font color=orange>�|���s��:</font></b> -->
<!--        <input type="text" name="memno" placeholder="�|���s��"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getAll_For_Display_By_Memno"> -->
<!--      </FORM> -->
<%--       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" > --%>
<!--        <b><font color=orange>�|���m�W:</font></b> -->
<!--        <input type="text" name="memname" placeholder="�|���m�W"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getAll_For_Display_By_Memname"> -->
<!--      </FORM> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/second_order/SecOrd.do" > --%>
<!--        <b><font color=orange>�q��s��:</font></b> -->
<!--        <input type="text" name="memname" placeholder="�q��s��"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getAll_For_Display_By_Sono"> -->
<!--      </FORM> -->
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
</div>



<!-- <br>�����������|:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b> --%>
<script src="https://code.jquery.com/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/motorKanli_js.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/indexNew.js"></script>
</body>

</html>
