<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/sidebar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var result = '${result}';
	
	if(result == 'Success'){
		alert('정상 처리 되었습니다.');
	}

	$(function() {
		$("#wrt_btn").click(function() {
			location.href="/board/write";
		});
	});
	
</script>

<body>

      <!--main content start-->
<div id="colorlib-main">
			<section class="ftco-section bg-light ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text align-items-center">
	          <div>
	            <p class="breadcrumbs"><span class="mr-2"><a href="/animal/list">Home</a></span> <span>Board</span></p>
	            <h1 class="mb-3 bread">Board List</h1>
	            <p>등록되지 않은 유기동물을 제보해주십세요</p>
	          </div>
	        </div>
				</div>
			</section>
			
		<section id="main-content">	
		<section class="ftco-section">
			<!-- <h3><i class="fa fa-angle-right"></i> BOARD LIST PAGE</h3> -->
	    	<div class="container">
	    		<div class="row">
			    			 <!-- <h4><i class="fa fa-angle-right"></i> BOARD LIST </h4> -->
			    			 <div>
			    			  <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed" >
                              <thead>
                              <tr>
                                  <th>글번호</th>
                                  <th>유형</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  <th class="numeric">조회수</th>
                              </tr>
                             </thead>
                             <tbody>
                             <c:forEach var="bvo" items ="${list }">
                             		<tr>
										<td>${bvo.articleNo }</td>
										<td>${bvo.articleType }</td>
		                             	<td><a href="/board/read?articleNo=${bvo.articleNo }">${bvo.title }</a></td>
		                             	<td>${bvo.writer }</td>
										<td><fmt:formatDate value="${bvo.date }" pattern="yyyy/MM/dd HH:mm" /></td>
		                             	<td class="numeric">${bvo.hit }</td>
		                             </tr>
		                             
                             	</c:forEach>
                             </tbody>
                            </table>
                           </section>
                           </div>
                           <div>
                           <section class="ftco-section">
                           <div style="text-align: center">
                           		<input type="button" class="btn btn-success" value="글쓰기" id="wrt_btn" />
                           </div>
                           </section>
                           </div>
<!-- 			    				<div class="blog-entry ftco-animate">
										<div class="text text-2 pt-2 mt-3">
				              <h3 class="mb-2"><a href="single.html">The Photography Technique</a></h3>
				              <div class="meta-wrap">
												<p class="meta">
				              		<span>Dec 14, 2018</span>
				              		<span><a href="single.html">Photography</a></span>
				              		<span>5 Comment</span>
				              	</p>
			              	</div>
				              <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
				            </div>
									</div> -->
    			</div>
   			</div>
		</section>
		</section>
			    			
<%-- 	<section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> BOARD LIST PAGE</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> BOARD LIST </h4>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed" >
                              <thead>
                              <tr>
                                  <th>글번호</th>
                                  <th>유형</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  <th class="numeric">조회수</th>
                              </tr>
                             </thead>
                             <tbody>
                             <c:forEach var="bvo" items ="${list }">
                             		<tr>
										<td>${bvo.articleNo }</td>
										<td>${bvo.articleType }</td>
		                             	<td><a href="/board/read?articleNo=${bvo.articleNo }">${bvo.title }</a></td>
		                             	<td>${bvo.writer }</td>
										<td><fmt:formatDate value="${bvo.date }" pattern="yyyy/MM/dd HH:mm" /></td>
		                             	<td class="numeric">${bvo.hit }</td>
		                             </tr>
		                             
                             	</c:forEach>
                             </tbody>
                            </table>
                           </section>
                           <div style="text-align: center">
                           		<input type="button" class="btn btn-success" value="글쓰기" id="wrt_btn" />
                           </div>
                        </div> <!-- /content panel -->
                       </div>
                     </div>	<!-- / row  -->
           		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT --> --%>
</div>
<!-- <footer class="ftco-footer ftco-bg-dark ftco-section">
	      <div class="container px-md-5">
	        <div class="row">
	          <div class="col-md-12">

	            <p>Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
	          </div>
	        </div>
	      </div>
	    </footer> -->
</body>
      <!--main content end-->
