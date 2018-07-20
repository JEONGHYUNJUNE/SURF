<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>SURF</title>
      <link rel="stylesheet" type="text/css" href="css/bg.css" />
      <link rel="stylesheet" type="text/css" href="css/backgroundTransition.css" />
      <link rel="shortcut icon" type="image/x-icon" href="img/vicon.ico" /><!--페이지 상단아이콘지정  -->
      <style>
@media (min-height: 500px)  {  /* 미디어 쿼리를 이용해 윈도우 창 변경에 따른 css 적용 */
         .footer_info{ /* 하단 카피라이트  */
               width:100%;
               position:absolute;
             bottom: 2px;
            color: white;
         text-align: center;
      }
}
@media  (max-height: 500px) {
      .footer_info{ /* 하단 카피라이트  */
      margin-top: 100px; 
      position: absolute;
      }
}
      .inpt{
      margin-left:10%;
      margin-top:5px;
      float:center;
      width:78%;
      height:30px;
      padding:0 0 0 8px;
      }
      
      .btn-login{               /* 로그인 버튼 */
      margin-left:10%;
      margin-top:10px;
      float:center;
      width:81%;
      height:50px;
      background-color: #067da1 ;
      color:white;
      font-size:15px;
      font-weight:bold;
      border-radius: 4%;
      border: 0;
      cursor: pointer;
      }
      .intro-wrap{ 
      margin-left:10%;
      width:81%;
      height:120px;
      
      }
     
      .find{
      margin-top:10px;
      width:81%;
      height:20px;
      margin-left:10%;
      
      }
      .find a{
       text-decoration:none; 
       color:white;
       font-size:12px;
      }
      .find :hover{
       text-decoration:underline;
       color:white;
       font-size:12px;
      }

      .footer_info a{
      color: white;
       text-decoration:none
      }
       .footer_info a:hover{
      color: white;
       text-decoration:underline;
      }
      .msg{
            margin-left:10%;
      margin-top:5px;
      float:center;
      width:77%;
      height:48px;
      padding: 5px 8px 0 8px;
      font-family: sans-serif;
      font-size: 13.5px;
      
      }
      
      </style>
  </head>
  <body>
      <div class="backgroundTransition">
      <div class="logoimg">
   <img src="img/surfwhite.png" width="115px" height="35px" style="margin-left: 1%; margin-top: 1%">
   </div>
          <div class="content" id="contentdiv">
<div class="intro-wrap">
   <div id="rolling_img">       
        <img src="img/msg01.png">
        <img src="img/msg02.png">
</div>
           </div>
           <form action="login.do" method="post">
             <input type="text" name="userid" class="inpt" placeholder="아이디"><br>
             <input type="password" name="userpwd" class="inpt" placeholder="비밀번호"><br>
             <div class="msg" id="msggg" style="color:white;background-color:black; display:none">${message}</div>
             <input type="submit" class="btn-login" value="로그인"> <!-- onclick="location.href='http://localhost:8090/SURF/feed.do'" -->
          </form>
          <div class="find"><a href="joinForm.jsp" target="_blank" style="float:left;">회원가입</a><a href="Find.jsp?name=pw" target="_blank" style="float:right; margin-left:5px;">비밀번호찾기</a><a href="Find.jsp?name=id" target="_blank" style="float:right;">아이디찾기 |</a></div>
          </div>
     <div class="footer_info"  >
<small class="txt_copyright" >Copyright &copy; <a href="#">SURF Corp.</a> All rights reserved.</small>
  </div>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/backgroundTransition.js"></script>
<script type="text/javascript">
$(function(){   //로그인 안내 메시지 띄우기
        $('#msggg').fadeIn('slow');
});

$(function(){ //시간이 지나면 메시지가 사라짐
   setTimeout(function() {
        $('#msggg').fadeOut('slow');
   }, 3500)
});

$(document).ready(function(){  // 로그인 글귀 슬라이드 
    var rolling_time = 3670;
    var effect_time = 0;
    var $rolling_img = $("#rolling_img > img");
    $rolling_img.not(":first").hide();
    setInterval(rolling, rolling_time);
    function rolling()
    {
        $visible_img = $rolling_img.filter(":visible");
        $visible_img.fadeOut(effect_time);
 
        $next_img = $visible_img.next();
        if ($next_img.length === 0) {
            $next_img = $rolling_img.filter(":first");
        }
        $next_img.fadeIn(effect_time);
    }
});

  $(document).ready(function(){ //배경이미지 슬라이드
     $('.backgroundTransition').backgroundTransition({
        backgrounds:[
           { src: 'img/bg1.jpg' },
           { src: 'http://www.blueb.co.kr/SRC2/_image/05.jpg' },
           { src: 'http://www.blueb.co.kr/SRC2/_image/04.jpg' }
        ],
        transitionDelay: 3,
        animationSpeed: 800
     });
    
  });
  $(function(){
      var height1 = document.getElementById("contentdiv");
       $('#contentdiv').css('margin-top',(window.screen.height-280)/5.5);
     });
</script>
</body>
</html>