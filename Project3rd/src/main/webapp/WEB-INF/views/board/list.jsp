<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">

	var result = '${result}';
	
	if(result == 'Success'){
		alert('정상 처리 되었습니다.');
	}

</script>

      <!--main content start-->
<section id="main-content">
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
                        </div> <!-- /content panel -->
                       </div>
                     </div>	<!-- / row  -->
           		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <%@ include file="../include/footer.jsp" %>
