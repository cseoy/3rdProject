<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/sidebar.jsp" %>
<!-- 유기동물 목록 및 정보 사이트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ANIMAL FARM</title>
<style type="text/css">
img {
	width:500px;
	height: 500px;
}
#animalInfo{
	border-right: 6px solid rgb(221, 221, 221);
	width:50%;
	overflow: auto;
	text-align: center;
}
#dataForm{
	margin-left: 10px;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> 

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script type="text/javascript">
	$(function() {

		//달력 옵션 설정
		$.datepicker.regional['ko'] = {
			  closeText: '닫기',
			  prevText: '이전달',
			  nextText: '다음달',
			  currentText: '오늘',
			  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			  dayNames: ['일','월','화','수','목','금','토'],
			  dayNamesShort: ['일','월','화','수','목','금','토'],
			  dayNamesMin: ['일','월','화','수','목','금','토'],
			  weekHeader: 'Wk',
			  dateFormat: 'yymmdd',
			  firstDay: 0,
			  isRTL: false,
			  duration:200,
			  showAnim:'show',
			  showMonthAfterYear: true,
			  yearSuffix:'년'
			 };
			 
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		// 실질적인 달력생성 부분
		$('#date3').datepicker({
	        changeMonth: false,
	        changeYear: false,
	        defaultDate:$('#date3').val()
	    });
		$('#date2').datepicker({
		        changeMonth: false,
		        changeYear: false,
		        defaultDate:$('#date2').val()
		});
		
		
		
		$("#searchDate").click(function(){
			
			var start = $("#date2").val();
			var end = $("#date3").val();
			
			
			var url = "/animal/list?start="+start+"&end="+end;
			
			$("#dataForm").attr("action",url);
			$("#dataForm").submit();
		});
	});
</script>
</head>
<body>
	<div id="colorlib-main">
		<section class="ftco-section-2">
		
			<!-- 원하는 날짜를 지정하여 유기동물을 검색 -->
			<form id="dataForm" action="" method="get">
				<h5>유기동물 조회</h5>
				<span>시작</span><input type="text" name="start" id="date2" size="12" placeholder="20190828"/>
				<span>종료</span><input type="text" name="end" id="date3" size="12" placeholder="20190828"/>
				<input type="button" value="달력" onclick="$('#date3').datepicker('show');" id="cal" class="btn btn-default"/>
				<button type="button" id="searchDate" class="btn btn-warning">searchDate</button>
			</form>
			<hr />
	
			<!-- 유기동물 정보 표출 -->
			<div class="photograhy">
				<div class="row no-gutters">
					<c:forEach var="i" items="${li }">
						<div id="animalInfo">
							<img src="<c:out value="${i.getPopfile() }"/>" alt="사진" />
							<div class="overlay"></div>
							<div class="text text-center">
								<h6>나이 : <c:out value="${i.getAge() }"></c:out></h6>
								<h6>성별 : <c:out value="${i.getSexCd() }"></c:out></h6>
								<h6>품종 : <c:out value="${i.getKindCd() }"></c:out></h6>
								<h6>색상 : <c:out value="${i.getColorCd() }"></c:out></h6>
								<h6>발견일 : <c:out value="${i.getHappenDt() }"></c:out></h6>
								<h6>발견장소 : <c:out value="${i.getHappenPlace() }"></c:out></h6>
								<h6>특징 : <c:out value="${i.getSpecialMark() }"></c:out></h6>
								<h6>상태 : <c:out value="${i.getProcessState() }"></c:out></h6>
								<h6>보호소이름 : <a href="/animal/map?careNm=${i.getCareNm()}"><c:out value="${i.getCareNm() }"/></a></h6>
								<h6>보호장소 : <c:out value="${i.getCareAddr() }"></c:out></h6>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- Paging 처리를 위해 파라미터 값을 변수처리 함 -->
			<c:set var="start" value="${param.start}"/>
			<c:set var="end" value="${param.end}"/>        
                
					
			<div align="center" style="margin-top: 45px; margin-bottom: 45px;">
			<div class="block-27">
				<!-- 날짜 지정 안했을 경우(default : 최근 한 달) -->
				<c:if test="${start==null}">   
					<c:if test="${pagingMaker.prev }">
						<a href="/animal/list${pagingMaker.makeUri(pagingMaker.startPage-1) }">
							<button type="button" class="btn btn-default">◀</button>
						</a>
					</c:if>
					<c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum">
					 	<a href="/animal/list${pagingMaker.makeUri(pNum) }">
						 	<button type="button" class="btn btn-default">${pNum }</button>
						 	<%-- <button type="button" class="<c:out value="${pagingMaker.pcri.page == pNum ? 'btn btn-theme' : 'btn btn-default' }" />">${pNum }</button> --%>
						</a>
					</c:forEach>
					<c:if test="${pagingMaker.next && pagingMaker.endPage > 0 }">
						<a href="/animal/list${pagingMaker.makeUri(pagingMaker.endPage+1) }">
							<button type="button" class="btn btn-default">▶</button>
						</a>
					</c:if>
				</c:if>
				
				<!-- 날짜 지정 했을 경우 -->
				<c:if test="${start!=null}">   
					<c:if test="${pagingMaker.prev }">
						<a href="/animal/list${pagingMaker.makeUri(pagingMaker.startPage-1, start, end) }">
							<button type="button" class="btn btn-default">◀</button>
						</a>
					</c:if>
					<c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum">
					 	<a href="/animal/list${pagingMaker.makeUri(pNum, start, end) }">
						 	<button type="button" class="btn btn-default">${pNum }</button>
						 	<%-- <button type="button" class="<c:out value="${pagingMaker.pcri.page == pNum ? 'btn btn-theme' : 'btn btn-default' }" />">${pNum }</button> --%>
						</a>
					</c:forEach>
					<c:if test="${pagingMaker.next && pagingMaker.endPage > 0 }">
						<a href="/animal/list${pagingMaker.makeUri(pagingMaker.endPage+1, start, end) }">
							<button type="button" class="btn btn-default">▶</button>
						</a>
					</c:if>
				</c:if>
			</div> <!-- div#btn-group end -->
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