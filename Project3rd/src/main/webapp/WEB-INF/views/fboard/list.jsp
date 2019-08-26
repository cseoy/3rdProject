<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
   $(function(){
      $('#findBtn').click(function(){
         //console.log ("click"); 
         self.location = "list"+"${pagingMaker.makeUri(1)}"+ "&findType="
         				+ $("select option:selected").val()
         				+"&keyword="+$("#findword").val();
      });
      $("#writeBtn").click(function(){
    	 self.location="write"; 
      });
       
   });
</script>



<%@ include file="../include/header.jsp" %>


      <!--main content start-->
<section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Board LIST PAGE</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> Board LIST </h4>
                          <section id="unseen">
                          
                          <!-- find -->
                          <div> 
							<span class="col-md-12">
								<select name="findType" class="form-control" style="width: 30%; float: left;">
									<option value="N">
										<c:out value="${fCri.findType == null ? 'selected' : '' }" />
									--------</option>
									<option value="S">
										<c:out value="${fCri.findType == 'S' ? 'selected' : '' }" />
									제목</option>
									<option value="C">
										<c:out value="${fCri.findType == 'C' ? 'selected' : '' }" />
									내용</option>
									<option value="W">
										<c:out value="${fCri.findType == 'W' ? 'selected' : '' }" />
									작성자</option>
									<option value="SC">
										<c:out value="${fCri.findType == 'SC' ? 'selected' : '' }" />
									제목+내용</option>
									<option value="CW">
										<c:out value="${fCri.findType == 'CW' ? 'selected' : '' }" />
									내용+작성자</option>
									<option value="SCW">
										<c:out value="${fCri.findType == 'SCW' ? 'selected' : '' }" />
									제목+내용+작성자</option>
								</select>
								<span class="col-md-2">
									<input type="text" class="form-control" name="keyword" id="findword" value="${fCri.keyword }" />			
								</span>
								<button id="findBtn" class="btn btn-info">검색</button>
								<br /><br /><br />
							</span>
                          </div>
                          
                          
                          <!-- list -->
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
		                             	<td><a href="/fboard/readPage${pagingMaker.makeFind(pagingMaker.pcri.page) }&articleNo=${bvo.articleNo }">${bvo.title }</a></td>
		                             	<td>${bvo.writer }</td>
										<td><fmt:formatDate value="${bvo.date }" pattern="yyyy/MM/dd HH:mm" /></td>
		                             	<td class="numeric">${bvo.hit }</td>
		                             </tr>
		                             
                             	</c:forEach>
                             </tbody>
                            </table>
                           </section>
                        	</div> <!-- /content panel -->    	
		`		      <div class="showback" align="center">
						<div class="btn-group">
						<c:if test="${pagingMaker.prev }">
							<a href="list${pagingMaker.makeFind(pagingMaker.startPage-1) }">
						  <button type="button" class="btn btn-theme02">◀</button>
						  	</a>
						  </c:if>
						  
						<div>
							<button id="writeBtn" class="btn btn-primary">글쓰기</button>						
						</div>
							<br /><br />					
						  <c:forEach begin="${pagingMaker.startPage }" end="${pagingMaker.endPage }" var="pNum">
						  	<a href="list${pagingMaker.makeFind(pNum) }">
						  <button type="button" class="<c:out value="${pagingMaker.pcri.page == pNum ? 'btn btn-theme02' : 'btn btn-default' }"/>">${pNum }</button>
						  	</a>
						  </c:forEach>
						  <c:if test="${pagingMaker.next && pagingMaker.endPage > 0 }">
						  	<a href="list${pagingMaker.makeFind(pagingMaker.endPage+1) }">
						  <button type="button" class="btn btn-theme02">▶</button>
						  	</a>
						  </c:if>
						</div>
						
						  
	      				</div>
                       </div>
                     </div>	<!-- / row  -->
           		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <%@ include file="../include/footer.jsp" %>
