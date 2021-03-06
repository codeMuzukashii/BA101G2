<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.equipment.model.*"%>
<%@ page import="com.emt_cate.model.*"%>
<%@ page import="com.motor.model.*"%>
<%@ page import="com.motor_model.model.*"%>
<%@ page import="com.rent_ord.model.*"%>
<%@ page import="com.motor_dispatch.model.*"%>
<!-- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
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
<!-- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->

<!DOCTYPE html>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<jsp:useBean id="mdSvc" scope="page"
	class="com.motor_dispatch.model.MotorDispatchService" />
<jsp:useBean id="motorSvc" scope="page"
	class="com.motor.model.MotorService" />
<jsp:useBean id="mmSvc" scope="page"
	class="com.motor_model.model.MotorModelService" />
<jsp:useBean id="roSvc" scope="page"
	class="com.rent_ord.model.RentOrdService" />
<jsp:useBean id="locSvc" scope="page"
	class="com.location.model.LocationService" />
<jsp:useBean id="now" scope="page" class="java.util.Date" />  


<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>據點車輛申請單查詢 - locMotorDispatchForm.jsp</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/js/locMotorDispatchForm_css.css">
<link rel="stylesheet"
	href="http://www.jacklmoore.com/colorbox/example1/colorbox.css">

<!-- JS -->
<script src="<%=request.getContextPath()%>/backend/Modified/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
<script
	src="${pageContext.request.contextPath}/backend/loc_motor_dispatch/js/locMotorDispatchForm_js.js"></script>
<script type="text/javascript"
	src="http://www.jacklmoore.com/colorbox/jquery.colorbox.js"></script>
</head>

<body>
<%--nav start --%>
<c:if test="<%=adminisVO!=null %>">
    <nav class="navbar navbar-default" role="navigation">
        <!-- logo區 -->
        <a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/backend/index.jsp" id="navA">AUTOBIKE</a>
        <!-- 左選單 -->
        <ul class="nav navbar-nav">
            <li><a href="#" id="navA">後端管理系統</a></li>
            <!-- 時鐘 -->
            <iframe scrolling="no" frameborder="no" clocktype="html5" style="overflow:hidden;border:0;margin:0;margin-top:5px;padding:0;width:120px;height:40px;" src="http://www.clocklink.com/html5embed.php?clock=004&timezone=CCT&color=yellow&size=120&Title=&Message=&Target=&From=2017,1,1,0,0,0&Color=yellow">
            </iframe>
        </ul>
        <!-- 右選單 -->
        
        <ul class="nav navbar-nav navbar-right">
        
			<li><a href="#" id="navA">哈囉! <%= adminisVO.getName() %></a></li>
			<li><a href="<%=request.getContextPath()%>/admin.do?action=logout" id="navA"><i
					class="glyphicon glyphicon-log-out"></i>登出</a></li>
		</ul>
    </nav>
<%--nav end --%>
	<div class="col-xs-12 col-sm-2 leftBar">
		<img id="logo"
			src="${pageContext.request.contextPath}/backend/images/android_logo2.jpg">
       		<%if(adminisVO.getAuthno().equals("AC01") || adminisVO.getAuthno().equals("AC07")){%>     
        <button class="accordion accordionMenu accordion accordionMenuMenu">總部管理系統</button> 
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/motorMgmtHqSelectPage.jsp"  role="button">車輛管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/motorDispatchMgmtHq.jsp"  role="button">車輛調度管理</a>           
			<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/backendRentOrd.jsp" role="button">租賃單管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/emtMgmtSelectPage.jsp" role="button">裝備管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/location/listAllLocation.jsp" role="button">據點管理</a>
        </div>
       		<%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">總部管理系統</button>		
        </div>
       		<%} %>
       		
     	<%if(adminisVO.getAuthno().equals("AC02") || adminisVO.getAuthno().equals("AC07")){%> 
        <button class="accordion accordionMenu"  style="background-color: #ddd;">據點管理系統</button>
        <div class="btn-group-vertical" style="display: block;">
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/motorMgmtLocSelectPage.jsp" role="button">據點車輛管理</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/locEmtMgmtSelectPage.jsp" role="button">據點裝備管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">交車管理</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">還車管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button" style="background-color: #ddd;">車輛調度申請</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button" >裝備申請</a>
         </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">據點管理系統</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC05") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">二手車管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp?who=${admins}" role="button">二手車輛管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/listAllSecOrd.jsp" role="button">二手交易管理</a>
<%--             <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp" role="button">二手車交易管理</a> --%>
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">二手車管理系統</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC03") || adminisVO.getAuthno().equals("AC07")){%>
       <button class="accordion accordionMenu">會員管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/backendMember.jsp" role="button">會員管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/addMember.jsp" role="button">新增會員</a>
         </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">會員管理系統</button>		
        </div>
       		<%} %>
       		
       		<%if(adminisVO.getAuthno().equals("AC06") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">活動企劃管理系統</button>
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/mes_board/listAllMesBoard.jsp" role="button">留言版管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/news/listAllNews.jsp" role="button">最新消息管理</a>
        </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">活動企劃管理系統</button>		
        </div>
       		<%} %>
       		
         <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">後端管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/adminis/listAllAdminis.jsp" role="button">後端權限管理</a>
<!--             <a class="btn btn-default" href="#" role="button">推薦景點管理</a> -->
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">後端管理系統</button>		
        </div>
       		<%} %>
        <div class="btn-group-vertical"></div>
    </div>
</c:if> 
<!----------------------------------------------- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
	<div class="col-xs-12 col-sm-10 rightHTML">
		<div class="topTitle">
			<h1>據點車輛調度查詢</h1>
		</div>
		<div class="container">
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font color='red'>請修正以下錯誤:
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li>${message}</li>
						</c:forEach>
					</ul>
				</font>
			</c:if>
			<!--搜尋列 -->
			<div class="searchBar">
				<table>
					<tr>
						<td>
							<FORM METHOD="post" style="display: inline;"
								ACTION="${pageContext.request.contextPath}/backend/motor_dispatch/md.do">
								<div class="form-group" style="display: inline;">
									<div class="col-sm-4">
										<label class="control-label" for="locno">選取所在據點：</label>
									</div>
									<div class="col-sm-7">
										<select class="form-control" name="locno" id="locSelect"
											style="display: inline;">
											<c:forEach var="locVO" items="${locSvc.getAll()}">
												<option value="${locVO.locno}"
													${(locVO.locno==param.locno)?'selected':'' }>${locVO.locname}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">
										<input type="submit" class="btn btn-default" value="確認">
										<input type="hidden" name="action" value="chooseLoc">
										<input type="hidden" name="locno" value="${locVO.locno}">
										<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>">
									</div>
								</div>
							</form>

							<FORM METHOD="post" style="display: inline;"
								ACTION="${pageContext.request.contextPath}/backend/motor_dispatch/md.do">
								<div class="form-group" style="display: inline;">
									<div class="col-sm-4">
										<label class="control-label" for="locno">查詢所在據點申請單據：</label>
									</div>
									<div class="col-sm-7">
										<select class="form-control" name="locno"
											id="locMotorDispListSelect" style="display: inline;">
											<c:forEach var="locVO" items="${locSvc.getAll()}">
												<option value="${locVO.locno}"
													${(locVO.locno==param.locno)?'selected':'' }>${locVO.locname}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">
										<input type="submit" class="btn btn-default" value="查詢">
										<input type="hidden" name="action" value="chooseLocForList">
										<input type="hidden" name="locno" value="${locVO.locno}">
										<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>">
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<!--搜尋列結束 -->
			<div class="accordion ">
					<table class="table">
						<tr>
							<td>調度單號</td>
							<td>填單日期</td>
							<td>結案日期</td>
							<td>申請數量</td>
							<td>處理進度</td>
							<td>取消</td>
						</tr>
					</table>
				</div>
			<c:forEach var="mdVO" items="${getByLocnoByHib}">
				<div class="accordion accordionDispTable" >
					<table class="table">
						<tr>
							<td>${mdVO.mdno}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mdVO.filldate}"/></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${mdVO.closeddate}"/></td>
							<td>
								<%! int count=0;%>
								<c:forEach var="mdListVO" items="${mdVO.motorDispLists}">
									<% count++;%>
								</c:forEach>
								<%= count %>輛
							</td>
								<%  count=0;%>
							<td>
							<c:choose>
  								<c:when test="${mdVO.prog=='request'}">
  									待審核<br>
  									request
  								</c:when>
  								<c:when test="${mdVO.prog=='rejected'}">
  									否決<br>
  									rejected
  								</c:when>
  								<c:when test="${mdVO.prog=='canceled'}">
  									已取消<br>
  									canceled
  								</c:when>
  								<c:when test="${mdVO.prog=='dispatching'}">
  									調度中<br>
  									dispatching
  								</c:when>
  								<c:when test="${mdVO.prog=='dispatched'}">
  									調度完成<br>
  									dispatched
  								</c:when>
  								<c:when test="${mdVO.prog=='closed'}">
  									已結案<br>
  									closed
  								</c:when>
  								<c:when test="${mdVO.prog=='other'}">
  									其他<br>
  									other
  								</c:when>
  							</c:choose>
							</td>
							<td>
								<c:choose>
  								<c:when test="${mdVO.prog eq 'request'}">
  									<FORM METHOD="post" style="display: inline;"
										ACTION="${pageContext.request.contextPath}/backend/motor_dispatch/md.do">
   									<input type="submit" class="btn btn-default" value="取消">
									<input type="hidden" name="action" value="cancel">
									<input type="hidden" name="mdno" value="${mdVO.mdno}">
									<input type="hidden" name="locno" value="${mdVO.locno}">
									<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>">
									</FORM>
  								</c:when>
  								<c:when test="${mdVO.prog eq 'dispatching'}">
  									<FORM METHOD="post" style="display: inline;"
										ACTION="${pageContext.request.contextPath}/backend/motor_dispatch/md.do">
   									<input type="submit" class="btn btn-default" value="確認領收">
									<input type="hidden" name="action" value="update">
									<input type="hidden" name="mdno" value="${mdVO.mdno}">
									<input type="hidden" name="locno" value="${mdVO.locno}">
									<input type="hidden" name="filldate" value="${mdVO.filldate}">
									<input type="hidden" name="closeddate" value="null">
									<input type="hidden" name="prog" value="dispatched">
									<c:forEach var="mdListVO" items="${mdVO.motorDispLists}">
										<input type="hidden" name="motno" value="${mdListVO.motorVO.motno}">
									</c:forEach>
									<input type="hidden" name="requestURL"
											value="<%=request.getRequestURI()%>">
									</FORM>
  								</c:when>
  							    <c:otherwise>
    								<input type="button" class="btn btn-default" value="取消" disabled>
 								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</div>
				
				
				<div class="btn-group-vertical">
					<c:forEach var="mdListVO" items="${mdVO.motorDispLists}">
					<div class="btn btn-default" role="button">
						${mdListVO.motorVO.motorModelVO.modtype}(${mdListVO.motorVO.motorModelVO.brand}-${mdListVO.motorVO.motorModelVO.name})：${mdListVO.motorVO.motno}
					</div>
					</c:forEach>
				</div>
				
			</c:forEach>

		</div>
		<!--container結束-->
	</div>
	<!--右邊HTML區塊結束 -->



</body>

</html>
