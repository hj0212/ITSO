<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--   ---------CDN 모음 --------------------------
----------------  -->
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
 href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<!-- Bootstrap core CSS -->
<link
 href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"
 rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
 href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css"
 rel="stylesheet">

<!--   ---------CDN 모음 끝------------------------------------------  -->
<style>
@font-face {
 font-family: 'NanumbarunpenR';
 src: url('nanumbarunpenr.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumbarunpenB';
 src: url('nanumbarunpenb.ttf') format('truetype');
}

body {
 font-family: 'NanumbarunpenR';
 margin: 0px;
 box-sizing: border-box;
}

nav {
 background-color: #1B0946;
 font-size: large;
}

#logo {
 width: 50px;
}

/*-------------------------------------*/
#collectionarea {
 text-align: center;
}

@media ( max-width : 575px) {
 .collectionItem {
  width: 80%;
 }
}

@media ( min-width : 576px) and (max-width: 991px) {
 .collectionItem {
  width: 50%;
  float: left;
 }
}

@media ( min-width : 991px) {
 .collectionItem {
  width: 30%;
 }
}

.collectionItem {
 display: inline-block;
 margin: 0 auto !important;
 background: white;
}

.collectionItem:hover {
 transform: scale(1.05);
 transition: all 0.1s ease-in-out;
}


.collectionPhoto td {
 overflow: hidden;
}


.btn-itso {
 background: #1B0946;
 color: white;
}

.btn-outline-itso {
 border: 2px solid #1B0946;
 background: white;
 color: #1B0946;
}

/*체크아이콘*/
.check {
 width: 136px;
 height: 136px;
 background: #e5e5e5;
 -moz-border-radius: 50%;
 -webkit-border-radius: 50%;
 border-radius: 50%;
 position: absolute;
 top: 50%;
 left: 50%;
 -moz-transform: translateX(-50%) translateY(-50%);
 -ms-transform: translateX(-50%) translateY(-50%);
 -webkit-transform: translateX(-50%) translateY(-50%);
 transform: translateX(-50%) translateY(-50%);
 -moz-box-shadow: 0px -4px 4px 0px rgba(255, 255, 255, 0.75), inset 0px
  4px 4px 0px rgba(0, 0, 0, 0.08);
 -webkit-box-shadow: 0px -4px 4px 0px rgba(255, 255, 255, 0.75), inset
  0px 4px 4px 0px rgba(0, 0, 0, 0.08);
 box-shadow: 0px -4px 4px 0px rgba(255, 255, 255, 0.75), inset 0px 4px
  4px 0px rgba(0, 0, 0, 0.08);
 cursor: pointer;
}

.check:before {
 content: "";
 background: #fff;
 position: absolute;
 -moz-border-radius: 50%;
 -webkit-border-radius: 50%;
 border-radius: 50%;
 top: 9%;
 left: 9%;
 right: 9%;
 bottom: 9%;
 -moz-box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.08);
 -webkit-box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.08);
 box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.08);
}

.check:after {
 content: "";
 position: absolute;
 -moz-border-radius: 50%;
 -webkit-border-radius: 50%;
 border-radius: 50%;
 top: 0;
 left: 0;
 right: 0;
 bottom: 0;
 border-color: #60b247;
 border-width: 0;
 border-style: solid;
}

.check .check-icon {
 position: absolute;
 z-index: 3;
 top: 31%;
 left: 28%;
 width: 45%;
 fill: #e5e5e5;
}

.check.active:after {
 -moz-transition: ease-out 0.1s all;
 -o-transition: ease-out 0.1s all;
 -webkit-transition: ease-out 0.1s all;
 transition: ease-out 0.1s all;
 border-width: 68px;
}

.check.active .check-icon {
 fill: #fff;
 -moz-animation: bounce 0.2s;
 -webkit-animation: bounce 0.2s;
 animation: bounce 0.2s;
 -moz-animation-delay: 0.08s;
 -webkit-animation-delay: 0.08s;
 animation-delay: 0.08s;
}

@
-moz-keyframes bounce { 0% {
 transform: scale(1);
}

50%
{
transform








:




 




scale








(1
.2








);
}
100%
{
transform








:




 




scale








(1);
}
}
@
-webkit-keyframes bounce { 0% {
 transform: scale(1);
}

50%
{
transform








:




 




scale








(1
.2








);
}
100%
{
transform








:




 




scale








(1);
}
}
@
keyframes bounce { 0% {
 transform: scale(1);
}
50%
{
transform








:




 




scale








(1
.2








);
}
100%
{
transform








:




 




scale








(1);
}
}
</style>
</head>
<body>

 <!-- saveModal -->
 <div class="modal fade" id="saveModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
   <!--Content-->
   <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
     <p class="heading lead mb-0">...</p>
     <button type="button" class="close" data-dismiss="modal"
      aria-label="Close">
      <span aria-hidden="true">&times;</span>
     </button>
    </div>

    <!--Body-->
    <div class="modal-body">
    <input type="hidden" name="user_seq" value="1">
    <input type="hidden" name="target_seq" value="2">
     <div id="modalbtnarea">
      <button class="btn btn-itso" data-toggle="modal"
       data-target="#createModal">사용자 신고</button>
      <button class="btn btn-itso" data-toggle="modal"
       data-target="#createModal2">이 사용자 차단하기</button>
      <button class="btn btn-outline-itso waves-effect"
       data-dismiss="modal" style="color:black;">취소</button>
     </div>


    </div>
   </div>
   <!--/.Content-->
  </div>
 </div>


 <!-- reportModal 신고-->
 <form action="reported.do" method="post">
 <div class="modal fade" id="createModal" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
   <!--Content-->
   <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
     <p class="heading lead mb-0" >신고</p>
     <button type="button" class="close" data-dismiss="modal"
      aria-label="Close">
      <span aria-hidden="true">&times;</span>
      <!-- <input type="hidden" name="user_seq" value="${id}"> -->
     </button>
    </div>

    <!--Body-->
    
    <div class="modal-body">
     <div>이 계정을 신고하는 이유를 선택하세요. 신고자 정보는 ${id} 님에게
      공개되지 않습니다.</div>
     <div>

<!--       <div class="custom-control custom-radio ml-2"> -->
<!--        <input type="radio" class="custom-control-input" id="1" -->
<!--         name="report_reason" value="1"> <label class="custom-control-label" -->
<!--         for="Group1">그냥 마음에 들지 않습니다.</label> -->
<!--       </div> -->

<!--       <div class="custom-control custom-radio ml-2"> -->
<!--        <input type="radio" class="custom-control-input" id="2" -->
<!--         name="report_reason" value="2"> <label class="custom-control-label" -->
<!--         for="Group1">스팸입니다.</label> -->
<!--       </div> -->
<!--       <div class="custom-control custom-radio ml-2"> -->
<!--        <input type="radio" class="custom-control-input" id="3" -->
<!--         name="report_reason" value="3"> <label class="custom-control-label" -->
<!--         for="Group1">신체 노출, 나체 게시물 및 음란물</label> -->
<!--       </div> -->

      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
        <label class="form-check-label" for="exampleRadios1">
          그냥 마음에 들지 않습니다.
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
        <label class="form-check-label" for="exampleRadios2">
          스팸입니다.
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
        <label class="form-check-label" for="exampleRadios3">
          신체 노출, 나체 게시물 및 음란물
        </label>
      </div>
      
      <div class="form-check">
        <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios4" value="option4">
        <label class="form-check-label" for="exampleRadios4">
         편파적 발언 및 상징
        </label>
      </div>
      
      
      <div class="md-form">
       <textarea name="report_reason" type="text" id="form7" class="md-textarea form-control"
        rows="3"></textarea>
       <label for="form7">기타</label>
      </div>




     </div>
    </div>
    
<!--Footer-->
    <div class="modal-footer justify-content-center">
     <button class="btn btn-itso" data-toggle="modal"
      data-target="#modal">제출</button>
     <button class="btn btn-outline-itso"
      data-dismiss="modal" style="color:black;">취소</button>
    </div>
 </div>
 <!--/.Content-->
</div>
</div>
</form>

 <!-- createModal2 차단 -->
 <div class="modal fade" id="createModal2" tabindex="-1" role="dialog"
  aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
   <!--Content-->
   <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
     <p class="heading lead mb-0">${ID}님을 차단하시겠어요?</p>
     <button type="button" class="close" data-dismiss="modal"
      aria-label="Close">
      <span aria-hidden="true">&times;</span>
     </button>
    </div>

    <!--Body-->
    <div class="modal-body">
      <label
       for="rddisabled" class="disabled">상대방은 ITSO에서 회원님의 프로필,게시물 을 찾을 수 없습니다.
       ITSO는 회원님이 차단한 사실을 상대방에게 알리지 않습니다.</label>
    </div>

    <!--Footer-->
    <div class="modal-footer justify-content-center">
     <button class="btn btn-itso" data-toggle="modal"
      data-target="#modal">차단</button>
     <button class="btn btn-outline-itso waves-effect"
      data-dismiss="modal" style="color:black;">취소</button>
    </div>
   </div>





   <!--/.Content-->

  </div>
 </div>

 <!-- Button trigger modal -->
 <div class="text-center">
  <a href="" class="btn btn-itso btn-rounded" data-toggle="modal"
   data-target="#saveModal">...</a>
 </div>

</body>
<script>
 $("#nav2").hide();

 $("#menu").on('click', 'a', function(event) {
  var val = ($(this).html()).split("<")[0];
  var item = $("#navbar2>ul>li:first-of-type>a").html();
  console.log(val + ":" + item);
  console.log($("#nav2").css("display"));
  if ($("#nav2").css("display") == "none") {
   $("#nav2").show();
   if (val == '게시판') {
    $("#navbar2 > ul:first-of-type").hide();
    $("#navbar2 > ul:nth-of-type(2)").show();
   } else {
    $("#navbar2 > ul:first-of-type").show();
    $("#navbar2 > ul:nth-of-type(2)").hide();
   }
  } else {
   if (val == '게시판') {
    $("#navbar2 > ul:first-of-type").hide();
    $("#navbar2 > ul:nth-of-type(2)").show();
   } else {
    $("#navbar2 > ul:first-of-type").show();
    $("#navbar2 > ul:nth-of-type(2)").hide();
   }
  }
 })

 $("#collectionarea").on("click", ".collectionItem", function() {
  /*$(this).css("background", "black");*/
  $(this).children(".check").toggleClass('active');
 })

 $("#createModal").on('show.bs.modal', function() {
  $("#saveModal").hide();
 });

 $("#createModal").on('hidden.bs.modal', function() {
  $("#saveModal").show();
 });
</script>
 <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/css/mdb.min.css" rel="stylesheet">
<!-- Bootstrap tooltips -->
<script type="text/javascript"
 src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
 src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
 src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.4/js/mdb.min.js"></script>

</html>