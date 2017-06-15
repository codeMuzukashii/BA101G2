<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="../../Modified/main.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="Modified/new.js"></script>
<title></title>
</head>
<body>


	<!--block1 -->
	<div id="block1" class="block">
		<fieldset>
			<!--form�\�� �s�W  -->
			<legend>�s�W����</legend>
			<form method="post" action="motor.do">
				<div class="InputForm">
					<label class="title">��������</label> 
						<select name="modtype">
<%-- 							<c:forEach var="mmVO" items="${motorModelSvc.all}">
								<option value="${mmVO.modtype}">
									${mmVO.brand} ${mmVO.name}
								</option>
							</c:forEach> --%>
						</select><br />
				</div>
				<div class="InputForm">
					<label class="title">���P���X</label><input type="text"
						name="plateno" maxlength="8" placeholder="�p8��r���A��4�X�� - ��" /><br>
				</div>
				<div class="InputForm">
					<label class="title">�������X</label><input type="text"
						name="plateno" maxlength="15" placeholder="�п�J�������X" /><br>
				</div>
				<div class="InputForm">
					<label class="title">�X�t���:</label><input type="text" name="manudate"
						id="datepicker" /><br>
				</div>
				
				<div class="InputForm">
					<label class="title">���{��</label><input type="text" name="engno"/><br>
				</div>
								
				<div class="InputForm">
					<label class="title">���I�s��</label><input type="text"
						name="locno" maxlength="10" placeholder="�������IDAO�A�ο��" /><br>
				</div>
				<div class="InputForm">
					<label class="title">�������A</label> 
						<select name="status">
								<option value="unleasable">���i��
								<option value="leasable">�i�X��
								<option value="dispatching">�իפ�
								<option value="secpause">�G�⥼�W�[
								<option value="secreserved">�G��w�w��
								<option value="other">�䥦(�Ƶ�)								
						</select><br />
				</div>								
				<div class="InputForm">
					<label class="title">�Ƶ�:</label>
					<textarea name="note" rows="1" cols="20" placeholder="�Цb�o�̿�J"></textarea>
					<br />
				</div>
				<div class="InputForm">
					<input type="hidden" name="action" value="insert">
					<input type="submit" value="submit" class="click" /> 
					<input type="reset" name="reset" value="reset" class="click" />
				</div>

			</form>
			<!--end: form�\�� �s�W -->
		</fieldset>
	</div>
	<!--end block1 -->

	<!--block2 -->
	<div id="block2" class="block">

		<!--form�\�� �ק�  -->

		<fieldset>
			<legend>�ק���</legend>
			<form method="post" action="motor.do">
				<div class="InputForm">
					<label class="title">�����s��</label> 
						<select name="modno">
<%-- 							<c:forEach var="motorVO" items="${motorlSvc.all}">
								<option value="${motorVO.motno}">
									${motorVO.motno}
								</option>
							</c:forEach> --%>
						</select><br />
				</div>			
				<div class="InputForm">
					<label class="title">���{��s</label><input type="text" name="engno"/><br>
				</div>			
				<div class="InputForm">
					<label class="title">���I�s��</label><input type="text"
						name="locno" maxlength="10" placeholder="�������IDAO�A�ο��" /><br>
				</div>	
				<div class="InputForm">
					<label class="title">�������A</label> 
						<select name="status">
								<option value="unleasable">���i��
								<option value="leasable">�X���w�W�[
								<option value="reserved">�X���w�w��
								<option value="occupied">�X����								
								<option value="dispatching">�իפ�
								<option value="secpause">�G�⨮���W�[
								<option value="seconsale">�G�⨮�W�[��
								<option value="secreserved">�G�⨮�w�w��
								<option value="secsaled">�G�⨮�w��X
								<option value="other">�䥦(�Ƶ�)								
						</select><br />
				</div>	
				<div class="InputForm">
					<label class="title">�Ƶ�:</label>
					<textarea name="note" rows="1" cols="20" placeholder="�Цb�o�̿�J"></textarea>
					<br />
				</div>
				<div class="InputForm">
					<input type="hidden" name="action" value="update">
					<input type="submit" value="submit" class="click" /> 
				</div>			
			</form>
		</fieldset>

		<!--end: form�\�� �ק� -->


		<fieldset>
			<legend>�R�����</legend>
			<!--form�\�� �R��  -->
			<form method="post" action="motor.do">
				<div class="InputForm">
					<label class="title">�ݧR����</label> 
						<select name="modno">
 							<c:forEach var="motorVO" items="${motorlSvc.all}">
								<option value="${motorVO.motno}">
									${motorVO.motno}
								</option>
							</c:forEach> 
						</select><br />
				</div>
				<div class="InputForm">
					<input type="hidden" name="action" value="delete">
					<input type="submit" value="submit" class="click" /> 
				</div>	
			</form>
		</fieldset>
	</div>
	<!--end: block2 -->
	<!--block3 -->



		<!-- �d�� -->
	<jsp:useBean id="motorSvc" scope="page" class="com.motor.model.MotorService"/>

	<div id="block3" class="block">
	<table id="QueryTable">
	  <thead>	
		<tr class="QueryTable_TR">
			<th>�����s��</th>
			<th>�����s��</th>		
			<th>���P���X</th>
			<th>�������X</th>				
			<th>�X�t���</th>
			<th>�֭p���{</th>
			<th>���I�s��</th>
			<th>�������A</th>				
			<th>�Ƶ�</th>
		</tr>
	  </thead>
	  <tbody><!-- notice: javaBean offered from index.jsp, line10 -->			
<%--  		<c:forEach var="MotorVO" items="${motorSvc.all}">
			<tr class="QueryTable_TR">
				<td>${MotorVO.motno}</td>
				<td>${MotorVO.modtype}</td>
				<td>${MotorVO.plateno}</td>
				<td>${MotorVO.engno}</td>
				<td>${MotorVO.manudate}</td>
				<td>${MotorVO.mile}</td>
				<td>${MotorVO.locno}</td>
				<td>${MotorVO.status}</td>
				<td>${MotorVO.note}</td>							
			</tr>
		</c:forEach> --%>
	  </tbody>	 										
	</table>
	<script src="../../Modified/QueryTablePagination.js"></script> 
	</div>
	<!--end: block3 -->
</body>
</html>