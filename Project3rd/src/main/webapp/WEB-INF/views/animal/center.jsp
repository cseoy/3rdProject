<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ include file="../include/sidebar.jsp" %>
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
	<div id="colorlib-main">
		<section class="ftco-section-2">
					<div class="photograhy">
				<div class="row no-gutters">
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
						</div>
						</section>
						<footer class="ftco-footer ftco-bg-dark ftco-section">
	      <div class="container px-md-5">
	        <div class="row">
	          <div class="col-md-12">

	            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	          </div>
	        </div>
	      </div>
	    </footer>
			</div>
</body>
</html>