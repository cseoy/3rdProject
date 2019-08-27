<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIND ANIMAL</title>
 

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->

<script type="text/javascript">
 
	
	 
 
	
	
</script>
</head>
<body>

	<div>
	<c:forEach var="i" items="${li }">
		<div>
			<h6>보호소 이름 : <c:out value="${i.getAnimalcnternm() }"></c:out></h6>
			<h6>보호소 주소: <c:out value="${i.getRdnmadr() }"></c:out></h6>
			<h6>보호소 오픈시간 : <c:out value="${i.getWeekdayoperopenhhmm() }"></c:out></h6>
			<h6>보호소 마감시간 : <c:out value="${i.getWeekdayopercolsehhmm() }"></c:out></h6>
			<h6>보호소 연락처 : <c:out value="${i.getPhonenumber() }"></c:out></h6>
			<h6>-----------------------------------------------------------------</h6>
		</div>
	</c:forEach>
	</div>
		
</body>
</html>