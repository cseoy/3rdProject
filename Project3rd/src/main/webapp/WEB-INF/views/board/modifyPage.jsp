<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">

 	$(function(){
 		var frm = $('form[role="form"]');
 		$("#btn_save").click(){
 			frm.submit();
 		}
 		$("#btn_cancel").click(){
 			self.location="/board/pageList?page=${pcri.page}&numPerPage=${pcri.numPerPage}";
 		}
 	});
 
</script>
 <%@ include file="../include/header.jsp" %>   
 
 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>MODIFY PAGE</h3>

          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 수정 내용</h4>
                      <form class="form-horizontal style-form" method="post" role="form">
                          <input type="hidden" name="articleNo" value="${boardVO.articleNo }" />
                          <input type="hidden" name="page" value="${pcri.page }" />
                          <input type="hidden" name="numPerPage" value="${pcri.numPerPage }" />
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title"
                                  			value="${boardVO.title }">
                                 <!-- bbscontroller에서 이름을 지정안해서 BbsVO가 앞이 소문자로 바껴 bbsVO가 된다  -->
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                  <!-- <input type="text" class="form-control"> -->
                                  <textarea class="form-control" name="contents" rows="5" >${boardVO.contents }</textarea>
                                  <!-- input class와 이름을 맞춰주면 css가 같이 적용된다.  -->
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="writer" value="${boardVO.writer }"
                                  		readonly="readonly">
                              </div>
                          </div>
                           <div class="form-group">
                              <div class="col-sm-12" align="center">
									<button type="submit" id="btn_save" class="btn btn-theme">CONFIRM</button>
									<button type="reset" id="btn_cancel" class="btn btn-theme03" >CANCEL</button>
                              </div>
                          </div>
               
                      </form>
                  </div> <!-- basic form end -->
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
      </section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
 <%@ include file="../include/footer.jsp" %>   
