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
	<h2>유기동물 리스트</h2>
	
	<form id="dataForm" action="" method="get">
		<h5>검색 날짜</h5>
		<span>시작</span><input type="text" name="start" id="date2" size="12" />
		<br/>
		<span>종료</span><input type="text" name="end" id="date3" size="12" />
		<input type="button" value="달력" onclick="$('#date3').datepicker('show');" />
	</form>

	<button type="button" id="searchDate">searchDate</button>
	<hr />
	<div>
	<c:forEach var="i" items="${li }">
		<div id="animalInfo">
			<%-- <img src="<c:out value="${i.getFilename() }"></c:out>" alt="사진" /> --%>
			<img src="<c:out value="${i.getPopfile() }"></c:out>" alt="사진" />
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
	</c:forEach>
	</div>
	
	<c:set var="start" value="${param.start}"/>
	<c:set var="end" value="${param.end}"/>        
                
					
	<div align="center">
		<div>
		<c:if test="${start==null}">   
			<c:if test="${pagingMaker.prev }">
				<a href="/animal/list${pagingMaker.makeUri(pagingMaker.startPage-1) }">
					<button type="button">◀</button>
				</a>
			</c:if>
			<c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum">
			 	<a href="/animal/list${pagingMaker.makeUri(pNum) }">
				 	<button type="button">${pNum }</button>
				 	<%-- <button type="button" class="<c:out value="${pagingMaker.pcri.page == pNum ? 'btn btn-theme' : 'btn btn-default' }" />">${pNum }</button> --%>
				</a>
			</c:forEach>
			<c:if test="${pagingMaker.next && pagingMaker.endPage > 0 }">
				<a href="/animal/list${pagingMaker.makeUri(pagingMaker.endPage+1) }">
					<button type="button" >▶</button>
				</a>
			</c:if>
		</c:if>
		
		
		<c:if test="${start!=null}">   
			<c:if test="${pagingMaker.prev }">
				<a href="/animal/list${pagingMaker.makeUri(pagingMaker.startPage-1, start, end) }">
					<button type="button">◀</button>
				</a>
			</c:if>
			<c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum">
			 	<a href="/animal/list${pagingMaker.makeUri(pNum, start, end) }">
				 	<button type="button">${pNum }</button>
				 	<%-- <button type="button" class="<c:out value="${pagingMaker.pcri.page == pNum ? 'btn btn-theme' : 'btn btn-default' }" />">${pNum }</button> --%>
				</a>
			</c:forEach>
			<c:if test="${pagingMaker.next && pagingMaker.endPage > 0 }">
				<a href="/animal/list${pagingMaker.makeUri(pagingMaker.endPage+1, start, end) }">
					<button type="button" >▶</button>
				</a>
			</c:if>
		</c:if>
		</div>
	</div>
</body>
</html>