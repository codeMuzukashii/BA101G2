<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>�d���O</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>�d���O</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

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
  <li><a href="listAllMesBoard.jsp">List</a> all MesBoard. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="mesboard.do" >
        <b>��J�d���O�s�� (�pMB001):</b>
        <input type="text" name="mesno">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

   <jsp:useBean id="mesboardSvc" scope="page" class="com.mes_board.model.MesBoardService" />
   
  <li>
     <FORM METHOD="post" ACTION="mesboard.do" >
       <b>��ܯd���O�s��:</b>
       <select size="1" name="mesno">
         <c:forEach var="mesboardVO" items="${mesboardSvc.all}" > 
          <option value="${mesboardVO.mesno}">${mesboardVO.mesno}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
       
    </FORM>
  </li>
</ul>


<h3>�̷s�d���޲z</h3>

<ul>
  <li><a href="addMesBoard.jsp">Add</a> a new Mes.</li>
</ul>

</body>

</html>
