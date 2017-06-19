<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>BA101G2 Spots: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Spot: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for BA101G2 Spots: Home</p>

<h3>��Ƭd��:</h3>
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

<ul>
  <li><a href='<%=request.getContextPath()%>/frontend/spots/listAllSpot.jsp'>List</a> all Spots. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
        <b>��J���I�s�� (�pSP000001):</b>
        <input type="text" name="spno">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="spSvc" scope="page" class="com.spots.model.SpotService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
       <b>��ܴ��I�s��:</b>
       <select size="1" name="spno">
         <c:forEach var="spotVO" items="${spSvc.all}" > 
          <option value="${spotVO.spno}">${spotVO.spno}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
       <b>��ܴ��I�W��:</b>
       <select size="1" name="spno">
         <c:forEach var="spotVO" items="${spSvc.all}" > 
          <option value="${spotVO.spno}">${spotVO.spname}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
  
  <!-- �o���ɭԥ[�J ��L��table -->
  


<h3>���I�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/frontend/spots/addSpot.jsp'>Add</a> a new Spot.</li>
</ul>



</body>

</html>
