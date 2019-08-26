<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">

 	$(function(){
 		var frm = $('form[role="form"]');
 		$('#btn_modify').click(function(){
 			frm.attr('action', '/board/modifyPage'); // 컨트롤러로 보낸다.
 			frm.attr('method','get');
 			frm.submit();
 		});
 		
 		$('#btn_delete').click(function(){
 			frm.attr('action', '/board/deletePage'); // 컨트롤러로 보낸다.
 			frm.submit();
 		});
 		$('#btn_list').click(function(){
		 	//self.location="/bbs/pageList";
		 	frm.attr('method','get');
		 	frm.attr('action','/board/pageList');
		 	frm.submit();
 		});
 	});
 
</script>
 <%@ include file="../include/header.jsp" %>   
 
 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>READ PAGE</h3>

          	<form method="get" role="form">
          		<input type="hidden" name="articleNo" value="${boardVO.articleNo }" />
          		<input type="hidden" name="page" value="${pcri.page }" />
          		<input type="hidden" name="numPerPage" value="${pcri.numPerPage }" />
          	</form>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> 조회 내용</h4>
                      <form class="form-horizontal style-form" method="post">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">제목</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="title"
                                  			value="${boardVO.title }" readonly="readonly">
                                 <!-- bbscontroller에서 이름을 지정안해서 BbsVO가 앞이 소문자로 바껴 bbsVO가 된다  -->
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">내용</label>
                              <div class="col-sm-10">
                                  <!-- <input type="text" class="form-control"> -->
                                  <textarea class="form-control" name="contents" rows="5" readonly="readonly">${boardVO.contents }</textarea>
                                  <!-- input class와 이름을 맞춰주면 css가 같이 적용된다.  -->
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">작성자</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="writer" readonly="readonly" value="${boardVO.writer }">
                              </div>
                          </div>
                           <div class="form-group">
                              <div class="col-sm-12" align="center">
									<button type="button" id="btn_modify" class="btn btn-theme">MODIFY</button>
									<button type="button" id="btn_delete" class="btn btn-theme02">DELETE</button>
									<button type="button" id="btn_list" class="btn btn-theme03" >GO LIST</button>
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
