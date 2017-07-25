<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.motor.model.*"%>
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
<%
	MotorService motorSvc = new MotorService();
	List<MotorVO> list = motorSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="now" scope="page" class="java.util.Date" />  

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>所有車輛資料- listAllMotor.jsp</title>

<!-- CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/backend/motor_model/js/listAllMotorModel_css.css">
<style type="text/css">
#pageDiv {
	margin-left: 300px;
}
</style>

<!-- JS -->
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/backend/motor/js/motorMgmtHqSelectPage_js.js"></script>

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
	<!------------------------------- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
		<img id="logo" src="${pageContext.request.contextPath}/backend/images/android_logo2.jpg">
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
        <button class="accordion accordionMenu">據點管理系統</button>
        <div class="btn-group-vertical">
        	<a class="btn btn-default" href="#" role="button">據點車輛管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">交車管理</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">還車管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button">車輛調度申請</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button">裝備申請</a>
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
			<h1>車輛資料管理</h1>
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
			<div class="searchBar">
				<table>
					<tr>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backend/motor/motor4H.do" name="formSearch">
								<input type="text" name="fuzzyValue" id="searchText" value="" placeholder="輸入關鍵字搜尋">
								<input type="submit" id="searchBtn" class="btn btn-default" value="搜尋" >
								<input type="hidden" name="action" value=fuzzyGetAll>
							</Form>
							
						</td>

						<td><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backend/motor/listAllMotor.jsp">
								<input type="submit" name="serchAllMotor" value="搜尋全部車輛"
									class="btn btn-default" role="button">
							</FORM></td>

						<td><input type="button" name="insert" id="addMotor"
							class="btn btn-default" role="button"
							onclick="location.href='${pageContext.request.contextPath}/backend/motor/addMotor.jsp';"
							value="新增車輛"></td>
						<td><FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backend/motor_model/listAllMotorModel.jsp">
								<input type="submit" name="serchAllMotorModel" value="搜尋全部車型"
									class="btn btn-default" role="button"> <input
									type="hidden" name="action" value="listAllMotorModel">
							</FORM></td>
						<td><input type="button" name="insert" id="addModel"
							class="btn btn-default" role="button"
							onclick="location.href='${pageContext.request.contextPath}/backend/motor_model/addMotorModel.jsp';"
							value="新增車型"></td>
					</tr>
				</table>
			</div>
			<br>

			<table
				class="table table-hover table-condensed table-striped table-bordered">
				<thead>
					<th>車輛編號</th>
					<th>車輛型號</th>
					<th>車輛廠牌</th>
					<th>車輛名稱</th>
					<th>排氣量</th>
					<th>租賃價格</th>
					<th>車牌號碼</th>
					<th>里程數</th>
					<th>所在據點</th>
					<th>引擎號碼</th>
					<th>出廠日期</th>
					<th>出售價格</th>
					<th>狀態</th>
					<th>修改/刪除</th>
				</thead>
				<%@ include file="pages/page1.file"%>
				<c:forEach var="motorVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<tr
						${(motorVO.motno == param.motno) ? 'style="background-color:#84d8d1;"':''}>
						<jsp:useBean id="motorModelSvc" scope="page" class="com.motor_model.model.MotorModelService" />
						<td>${motorVO.motno}</td>
						<td>${motorVO.modtype}</td>
						<td><c:forEach var="motorModelVO" items="${motorModelSvc.all}"><c:if test="${motorVO.modtype==motorModelVO.modtype}">${motorModelVO.brand}</c:if></c:forEach></td>
						<td><c:forEach var="motorModelVO" items="${motorModelSvc.all}"><c:if test="${motorVO.modtype==motorModelVO.modtype}">${motorModelVO.name}</c:if></c:forEach></td>
						<td><c:forEach var="motorModelVO" items="${motorModelSvc.all}"><c:if test="${motorVO.modtype==motorModelVO.modtype}">${motorModelVO.displacement}c.c.</c:if></c:forEach></td>
						<td><c:forEach var="motorModelVO" items="${motorModelSvc.all}"><c:if test="${motorVO.modtype==motorModelVO.modtype}">${motorModelVO.renprice}元/日</c:if></c:forEach></td>
						<td>${motorVO.plateno}</td>
						<td>${motorVO.mile}</td>
						<td>${motorVO.locno}</td>
						<td>${motorVO.engno}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${motorVO.manudate}"/></td>
						<td><c:forEach var="motorModelVO" items="${motorModelSvc.all}"><c:if test="${motorVO.modtype==motorModelVO.modtype}">${motorModelVO.saleprice}元</c:if></c:forEach></td>
						
						<td>
							<c:choose>
  								<c:when test="${motorVO.status=='leasable'}">
  									可租賃<br>
  									leasable
  								</c:when>
  								<c:when test="${motorVO.status=='unleasable'}">
  									暫停租賃<br>
  									unleasable
  								</c:when>
  								<c:when test="${motorVO.status=='reserved'}">
  									已預約<br>
  									reserved
  								</c:when>
  								<c:when test="${motorVO.status=='occupied'}">
  									出租中<br>
  									occupied
  								</c:when>
  								<c:when test="${motorVO.status=='dispatching'}">
  									調度中<br>
  									dispatching
  								</c:when>
  								<c:when test="${motorVO.status=='seconsale'}">
  									二手車-上架中<br>
  									seconsale
  								</c:when>
  								<c:when test="${motorVO.status=='secpause'}">
  									二手車-下架中<br>
  									secpause
  								</c:when>
  								<c:when test="${motorVO.status=='secreserved'}">
  									二手車-已預約<br>
  									secreserved
  								</c:when>
  								<c:when test="${motorVO.status=='secsaled'}">
  									二手車-已出售<br>
  									secaled
  								</c:when>
  								<c:when test="${motorVO.status=='other'}">
  									其他<br>
  									other
  								</c:when>
  							</c:choose>
						</td>

						<td>
							<FORM METHOD="post" style="display: inline;"
								ACTION="<%=request.getContextPath()%>/backend/motor/motor4H.do">
								<input type="submit" name="fix" value="修改"
									class="btn btn-default" role="button"> <input
									type="hidden" name="motno" value="${motorVO.motno}"> <input
									type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="whichPage" value="<%=whichPage%>">
								<input type="hidden" name="action" value="getOne_For_Update">
							</FORM>

							<FORM METHOD="post" style="display: inline;"
								ACTION="<%=request.getContextPath()%>/backend/motor/motor4H.do">
								<input type="submit" name="del" value="刪除"
									class="btn btn-default" role="button"> <input
									type="hidden" name="motno" value="${motorVO.motno}"> <input
									type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>">
								<!--送出本網頁的路徑給Controller-->
								<input type="hidden" name="whichPage" value="<%=whichPage%>">
								<input type="hidden" name="action" value="delete">
							</FORM>
						</td>
					</tr>
				</c:forEach>

			</table>

			<%@ include file="pages/page2.file"%>

		</div>
	</div>
</body>
</html>