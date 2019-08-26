<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ include file="../include/header.jsp" %>   
 
 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>WRITE PAGE</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 입력 사항</h4>
                      <form class="form-horizontal style-form" method="post">
                      	 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">유형</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="articleType">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                  <!-- <input type="text" class="form-control"> -->
                                  <textarea class="form-control" name="contents" rows="5"></textarea>
                                  <!-- input class와 이름을 맞춰주면 css가 같이 적용된다.  -->
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="writer">
                              </div>
                          </div>
                           <div class="form-group">
                              <div class="col-sm-12" align="center">
									<button type="submit" class="btn btn-theme">등록하기</button>
									<button type="reset" class="btn btn-theme" >RESET</button>
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
