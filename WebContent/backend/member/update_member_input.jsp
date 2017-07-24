<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
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
	MemberVO memVO = (MemberVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"uncompleted","confirmed","unconfirmed","verifing"};
	String[] gender = {"Girl","Boy"};
	pageContext.setAttribute("memVO", memVO);
    pageContext.setAttribute("statusArray", statusArray);
	pageContext.setAttribute("gender", gender);

	Map<String, String> statusMap = new HashMap<String, String>();
	statusMap.put("uncompleted", "²�����U");
	statusMap.put("unconfirmed", "�٥��{��");
	statusMap.put("verifing", "���ݻ{��");
	statusMap.put("confirmed", "�{�ҦX��");					
%>	
<html>
<style>
.form-tag{
margin-top:10px;

}
.control-label {
  display: block;
  line-height:34px;
}
label{
	text-align:right;
	size:16px;
}
.form-control{
	size:16px;
}

input[type="file"] {
    display: none !important;
}
.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
    margin-left:20%;
}

#licenseTag{
	margin-left:10%;

}

#logoutBtn{
	float:right;
	margin-top:7px;
	margin-right:20px;
}
</style>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">    
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
	<title>�|����ƭק� - update_member_input.jsp</title>
</head>
<body>

<%--nav start --%>
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
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/listAllSecOrd.jsp" role="button">�G�⨮�q��޲z</a>
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
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/news/news_select_page.jsp" role="button">�̷s�����޲z</a>
        </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">���ʥ����޲z�t��</button>		
        </div>
       		<%} %>
       		
         <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">��ݺ޲z�t��</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/adminis/adm_select_page.jsp" role="button">����v���޲z</a>
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
<!----------------------------------------------- ��ݺ�����������  �M�v�����ު����n���q�{���X -->
    
    <div class="col-xs-12 col-sm-10 rightHTML" id="demo">

		<div class="topTitle">
            <h1>�|����ƺ޲z�t��</h1>
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
	
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do" name="form1" enctype="multipart/form-data">
				
				<div class="col-xs-12 col-sm-3">	
				
					<div class="form-group  col-xs-12 col-sm-12">
						<label for="memname" class="col-xs-12 col-sm-4 control-label">
							�m�W:
						</label>
						<div class="col-xs-12 col-sm-8">
						<input type="text" name="memname" 
						  value="${memVO.memname}" placeholder="��r" class="form-control" id="memname" style="width:100%"/>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="sex" class="col-xs-12 col-sm-4 control-label">
							�ʧO:
						</label>
						<div class="col-xs-12 col-sm-8">
						<input type="text" name="sex" 
						value="${memVO.sex}" placeholder="��r" class="form-control" id="sex" style="width:100%" readonly/>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="birth" class="col-xs-12 col-sm-4">
							�ͤ�:
						</label>
						<div class="col-xs-12 col-sm-8">
							<fmt:formatDate pattern = "yyyy/MM/dd" value ="${memVO.birth}" />
						</div>
					</div>		
													
					<div class="form-group col-xs-12 col-sm-12">
						<label for="birth" class="col-xs-12 col-sm-4">
							���U���:
						</label>
						<div class="col-xs-12 col-sm-8">
							<fmt:formatDate pattern = "yyyy/MM/dd" value = "${memVO.credate}"/>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="mail" class="col-xs-12 col-sm-4">
							�H�c:
						</label>
						<div class="col-xs-12 col-sm-8">
						<input type="email" name="mail"  class="form-control" style="width:100%"  value="<%=memVO.getMail()%>"/>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="phone" class="col-xs-12 col-sm-4">
							�q��:
						</label>
						<div class="col-xs-12 col-sm-8">
							<input type="tel" name="phone"  class="form-control"  style="width:100%"  value="<%=memVO.getPhone()%>"/>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="address" class="col-xs-12 col-sm-4">
							�a�}:
						</label>
						<div class="col-xs-12 col-sm-8">
						<textarea rows="4" name="address" class="form-control" style="width:100%" ><%=memVO.getAddr()%></textarea>
						</div>
					</div>
					
					<div class="form-group col-xs-12 col-sm-12">
						<label for="acc" class="col-xs-12 col-sm-4">
							�b��:
						</label>
						<div class="col-xs-12 col-sm-8">
							<input type="text" name="acc" class="form-control" style="width:100%" value="<%=memVO.getAcc()%>"/>
						</div>
					</div>

					<div class="form-group col-xs-12 col-sm-12">
						<label for="status" class="col-xs-12 col-sm-4">
							���A:
						</label>
						<div class="col-xs-12 col-sm-8">
							<select name="status"  class="form-control" style="width:100%">
								<c:forEach var="status_value" items="${statusArray}">
									<c:set scope="page" var="temp">
									 	<c:out value="${status_value}"/>
									</c:set>
									<% 
									  String key = String.valueOf(pageContext.getAttribute("temp"));
									%>								
									<option value="${status_value}" ${(memVO.status==status_value)? 'selected':''}><%=statusMap.get(key)%></option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			
				<div class="col-xs-12 col-sm-3">
					<label>������(����):</label><label for="myFile" class="custom-file-upload">
    				<i class="fa fa-cloud-upload"></i>�I�ڤW�ǹϤ�</label>
					<input type="file" name="idcard1" id="myFile"/>
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' 
					width='300px' height='300px' id="idcard1">
		        </div>
		        <div class="col-xs-12 col-sm-3">
					<label>������(�ϭ�):</label><label for="myFile1" class="custom-file-upload">
    				<i class="fa fa-cloud-upload"></i>�I�ڤW�ǹϤ�</label>
    				<input type="file" name="idcard2"  id="myFile1"/>
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2'
					 width='300px' height='300px' id="idcard2">
		        </div>
		        <div class="col-xs-12 col-sm-3">	
					<label id="licenseTag">�r��:</label><label for="myFile2" class="custom-file-upload">
    				<i class="fa fa-cloud-upload"></i>�I�ڤW�ǹϤ�</label>
    				<input type="file" name="license"  id="myFile2"/>
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license'
					 width='300px' height='300px' id="license">
				 </div>
			
				<input type="hidden" name="action" value="update_backend_verified">
				<input type="hidden" name="memno" value="${memVO.memno}">
				<input type="hidden" name="pwd" value="${memVO.pwd}">
				<input type="hidden" name="sex" value="${memVO.sex}">
				<input type="hidden" name="birth" value="<fmt:formatDate value="${memVO.birth}" pattern='yyyy-MM-dd HH:mm:ss'/>">
				<input type="hidden" name="credate" value="<fmt:formatDate value="${memVO.credate}" pattern='yyyy-MM-dd HH:mm:ss'/>">
				<div class="col-xs-12 col-sm-12">
					<p class="text-center">
						<button type="submit" class="btn btn-success btn-lg">
							<i class="glyphicon glyphicon-ok"></i>�e�X�ק�
						</button>
						<a onclick="history.back()" class="btn btn-danger btn-lg">
							<i class="glyphicon glyphicon-arrow-up"></i>��^�W��
						</a>
						
						
					</p>
				</div>
		</FORM>

    </div><!-- sm-10 rightHTML  -->

	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/motorKanli_js.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/indexNew.js"></script>
<script>
function doFirst(){
	document.getElementById('myFile').onchange = fileChange;
	document.getElementById('myFile1').onchange = fileChange1;
	document.getElementById('myFile2').onchange = fileChange2;
}
function fileChange() {
	var file = document.getElementById('myFile').files[0];

	var readFile = new FileReader();
	readFile.readAsDataURL(file);
	readFile.addEventListener('load',function(){
		var image = document.getElementById('idcard1');
		image.src = this.result;
		image.style.maxWidth = '500px';
		image.style.maxHeight = '500px';
	},false);
}

function fileChange1() {
	var file = document.getElementById('myFile1').files[0];

	var readFile = new FileReader();
	readFile.readAsDataURL(file);
	readFile.addEventListener('load',function(){
		var image = document.getElementById('idcard2');
		image.src = this.result;
		image.style.maxWidth = '500px';
		image.style.maxHeight = '500px';
	},false);
}

function fileChange2() {
	var file = document.getElementById('myFile2').files[0];

	var readFile = new FileReader();
	readFile.readAsDataURL(file);
	readFile.addEventListener('load',function(){
		var image = document.getElementById('license');
		image.src = this.result;
		image.style.maxWidth = '500px';
		image.style.maxHeight = '500px';
	},false);
}
window.addEventListener('load',doFirst,false);
</script>

</body>
</html>
