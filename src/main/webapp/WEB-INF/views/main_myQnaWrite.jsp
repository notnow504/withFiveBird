<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우정게 알려준다. - ANSI(euc-kr), UTF-8 -->
    <meta charset="utf-8" />
    <!-- 스마트 장치에서의 해상도 균일화 처리 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,    minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" />
    <!-- IE의 호환성 보기 모드 금지 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


    <!-- Bootstrap -->
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
    <script src="assets/bootstrap/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- 외부 CSS 받아오기 -->
    <link rel="stylesheet" type="text/css" href="assets/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main_myQnaWrite.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
     <link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />

    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@1,600&display=swap" rel="stylesheet"/>

    <title>main_qnaWrite</title>
    <style type="text/css">
    	.container {
    			padding: 0;
    			width: 100%;
   		 }
	</style>
</head>
<body>
    <div class="container">
		<!-- 헤더 영역-->
		<%@ include file = "assets/inc/header.jsp" %>
		<div id="section" class="clearfix">
         <a href="#" class="pull-left" onclick="history.go(-1); return false;"> 
            <span id="back"><img src="assets/img/icon/back.png" /></span>
         </a>
         <div class="title pull-left">Q&amp;A</div>   
      </div>
 	<!-- 내용영역 -->
    <div id="content">
    	<form  name="qna_form" method="post" id="qna_form">
    	<fieldset>
      		<div id="qna_w">
      			<div id="qna_title" class="qna_title clearfix">
      				<label for="user_title" class="qna_w_title pull-left">제목</label>
      				<input type="text" name="user_title" id="user_title" class="form-control pull-left" placeholder="제목을 입력하세요."/>
      		    </div>
      		<div id="qna_w_content">
      			<textarea rows="10" name="user_content" id="user_content" class="form-control" placeholder="내용을 입력하세요."></textarea>
      		</div>
      		<div id="qna_w_btn">
      			<input type="submit" id="btn_up" class="btn btn-warning" value="등록" />
      			<button type="button" id="btn_cancel" class="btn btn-light" onclick="history.go(-1); return false;">취소</button>
      		</div>
      		</div>
      	</fieldset>
      	</form>
   </div>
<!-- 하단 영역 -->
		<%@ include file = "assets/inc/footer.jsp" %>
		</div>
    
    <script src="assets/js/menu.js"></script>
    <script src="assets/js/scroll.js"></script>
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="assets/plugins/validate/jquery.validate.min.js"></script>
    <script src="assets/plugins/validate/additional-methods.min.js"></script>
<!--     <script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script> -->
    <script type="text/javascript">   
    $(function() {
    	$("#content #btn_up").click(function(e) {
			e.preventDefault();
			var hasText = $("#content #user_title").val();
			if(!hasText) {
				swal("제목", "제목을 입력해주세요.", "error").then(function(result) {
					$("#content #user_title").focus();
				});
				return;
			}else if(hasText.length < 4) {
				swal("", "제목은 4글자 이상 입력해주세요.", "warning").then(function(result) {
					$("#content #user_title").focus();
				});
				return;
			}else {
				var hasContent = $("#content #user_content").val();
				if(!hasContent) {
					swal("내용", "내용을 입력해주세요.", "error").then(function(result) {
						$("#content #user_content").focus();
					});
					return;
				}else if(hasContent.length < 10) {
    				swal("", "내용은 10글자 이상 입력해주세요.", "warning").then(function(result) {
    					$("#content #user_title").focus();
    				});
    				return;
				}
			}
			
			swal("", "문의가 등록되었습니다." ,"success").then(function(result) {
	        	window.location = 'main_qnaList.jsp';
		    });
		});
    	    	
		});
    </script>
	
	
</body>

</html>