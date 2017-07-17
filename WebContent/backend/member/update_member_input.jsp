<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	String[] statusArray = {"uncompleted","confirmed","unconfirmed"};
	String[] gender = {"Girl","Boy"};
	pageContext.setAttribute("memVO", memVO);
    pageContext.setAttribute("statusArray", statusArray);
	pageContext.setAttribute("gender", gender);
%>
<%@ page import="com.adminis.model.*"%>
<%  
	AdminisService as = new AdminisService();
	AdminisVO adminisVO= (AdminisVO)session.getAttribute("adminisVO");
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
}
</style>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
	<title>�|����ƭק� - update_member_input.jsp</title>
</head>
<body>
    <nav class="navbar navbar-default" role="navigation">
        <!-- logo�� -->
        <a class="navbar-brand" href="#" id="navA">AUTOBIKE</a>
        <!-- ����� -->
        <ul class="nav navbar-nav">
            <li><a href="#" id="navA">��ݺ޲z�t��</a></li>
            <!-- ���� -->
            <iframe scrolling="no" frameborder="no" clocktype="html5" style="overflow:hidden;border:0;margin:0;padding:0;width:120px;height:40px;" src="http://www.clocklink.com/html5embed.php?clock=004&timezone=CCT&color=yellow&size=120&Title=&Message=&Target=&From=2017,1,1,0,0,0&Color=yellow">
            </iframe>
        </ul>
        <!-- �k��� -->
        <ul class="nav navbar-nav navbar-right">
        </ul>
        <form method="post" action="<%=request.getContextPath()%>/admin.do?action=logout">
        <input type="submit" value="�n�X" >
<!--           <input type="hidden" name="action1" value="logout" > -->
       </form>
       <b><%= adminisVO.getName() %></b>
    </nav>

    <div class="col-xs-12 col-sm-2 leftBar">
     	
        <img id="menuLogo" src="<%=request.getContextPath()%>/backend/images/android_logo2.jpg">
        <button class="accordion accordionMenu accordion accordionMenuMenu">�`���޲z�t��</button> 
        <div class="btn-group-vertical">
         <%if(adminisVO.getAuthno().equals("AC01") || adminisVO.getAuthno().equals("AC07")){%>     
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/motor/backendMotor.jsp"  role="button">������ƺ޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/motor_model/backendMotorModel.jsp"  role="button">���������޲z</a>           
            <a class="btn btn-default" href="#" role="button">�����ի�</a>
			<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/backendRentOrd.jsp" role="button">�����޲z</a>
            <a class="btn btn-default" href="#" role="button">�˳ƺ޲z</a>
            <a class="btn btn-default" href="#" role="button">�˳ƽի�</a>
            <a class="btn btn-default" href="#" role="button">���I�޲z</a>
         <%} %>  
        </div>
       
        <button class="accordion accordionMenu">���I�޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC02") || adminisVO.getAuthno().equals("AC07")){%> 
            <a class="btn btn-default" href="#" role="button">���I�����޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">�樮�޲z</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">�٨��޲z</a>
            <a class="btn btn-default" href="#" role="button">�����իץӽ�</a>
            <a class="btn btn-default" href="#" role="button">�����O�i/���׺޲z</a>
            <a class="btn btn-default" href="#" role="button">���I�˳ƺ޲z</a>
            <a class="btn btn-default" href="#" role="button">�˳ƥӽ�</a>
         <%} %>
        </div>
         
        <button class="accordion accordionMenu">�G�⨮�޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC05") || adminisVO.getAuthno().equals("AC07")){%>
            <a class="btn btn-default" href="#" role="button">�G�⨮���޲z</a>
            <a class="btn btn-default" href="#" role="button">�G�⨮�q��޲z</a>
            <a class="btn btn-default" href="#" role="button">�G�⨮����޲z</a>
         <%} %>
        </div>
       <button class="accordion accordionMenu">�|���޲z�t��</button>
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/backendMember.jsp" role="button">�|���޲z</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/addMember.jsp" role="button">�s�W�|��</a>
        </div>
        <button class="accordion accordionMenu">���ʥ����޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC06") || adminisVO.getAuthno().equals("AC07")){%>
            <a class="btn btn-default" href="#" role="button">�����޲z</a>
            <a class="btn btn-default" href="#" role="button">�d�����޲z</a>
            <a class="btn btn-default" href="#" role="button">�̷s�����޲z</a>
         <%} %>
        </div>
        <button class="accordion accordionMenu">��ݺ޲z�t��</button>
        <div class="btn-group-vertical">
        <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
            <a class="btn btn-default" href="#" role="button">����v���޲z</a>
            <a class="btn btn-default" href="#" role="button">���˴��I�޲z</a>
            <a class="btn btn-default" href="#" role="button">��ݵn�J�޲z</a>
         <%} %>
        </div>
        <div class="btn-group-vertical"></div>
    </div>
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
									<option value="${status_value}" ${(memVO.status==status_value)? 'selected':''}>${status_value}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			
			
			
				<div class="col-xs-12 col-sm-3">
					������(����):<input type="file" name="idcard1" />
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' 
					width='100%'>
		        </div>
		        <div class="col-xs-12 col-sm-3">
					������(�ϭ�):<input type="file" name="idcard2" />
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2'
					 width='100%'>
		        </div>
		        <div class="col-xs-12 col-sm-3">	
					�r��:<input type="file" name="license" size="45"/>
					<img src='<%=request.getContextPath()%>/backend/member/memReader.do?memno=${memVO.memno}&card=license'
					 width='100%'>
				 </div>
			
				<input type="hidden" name="action" value="update_backend_verified">
				<input type="hidden" name="memno" value="${memVO.memno}">
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

	<!--RWD����:�U�����ڮ����@��MJQuery������script, ���Mdatepicker�|�Ĩ�  -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/motorKanli_js.js"></script>
    <script src="<%=request.getContextPath()%>/backend/Modified/indexNew.js"></script>
</body>
</html>
