<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="img/vicon.ico" />
<link rel="stylesheet" type="text/css" href="css/joinform.css" />
<title>SURF</title> <!--아이콘은 헤더JSP를 통해 설정해둠  -->
<style>
.joinmodal{
   display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
           text-align:center;
   
}
.joinmodal-text{
         margin-left:37%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 380px;
            height:200px;
            margin-top:200px;
         text-aling:center;
}
.pfimg{
border-radius:50%;
width:150px;
height:150px;
background-color:#dbdbdb;
background-position:center; 
background-repeat : no-repeat;
background-size: cover;
background-image : url(img/profile.png);
}
</style>
</head>
<body>
<div class="joinmodal" id="joinmodal">
   <div class="joinmodal-text">
   <p style="margin-top:60px;font-size:18px;font-weight:bold;" id="joinerrortext">비밀번호는 8~24자리 입니다.</p>
   <div id="modalbtn" onclick="modalhide()" style="display:inline-block; width:120px;height:30px;background-color:#067DA1;text-align:center;color:white;padding-top:7px;margin-top:30px;cursor:pointer;">확인</div>
   </div>
</div>
<div class="Top"><a href="index.html"><img alt="" src="img/surflogo.png" width="115px" height="35px" style="margin-left: 0.5%; margin-top: 1%"></a></div>
<div class="main">
<div class="mainTapdiv">
<div class="mainTap" style="border-top-left-radius:7px; border-bottom-left-radius:7px; margin-left:0.5px;background-color:gray;" id="agree1">약관동의</div>
<div class="mainTap" id="agree2">정보입력</div>
<div class="mainTap" style="border-top-right-radius:7px; border-bottom-right-radius:7px;" id="agree3">가입완료</div>
<!-- ----------------------------약관동의 페이지--------------------------------- -->
<div class="agreepage" style="width:100%;height:auto;display:block;">
<div class="agree"><p style="font-size:15px;float:left;padding:0 0 0 20px;">개인 정보 수집 및 이용 동의</p><p style="color:#003399;float:left;font-size:15px;">　(필수)</p>
               <div style="border-radius:50%;border:1px solid #D5D5D5;float:right;margin-right:20px;margin-top:9px;padding:0 7px 0 7px;font-size:18px; font-weight:bold; cursor:pointer" onclick="checkbox()" id="checkbox">∨</div>
               <div style="border-radius:30%; border:1px solid #D5D5D5;float:right;margin-right:20px;margin-top:9px;padding:3px;font-size:14px;cursor:pointer;" onclick="showagree()" id="show">보기</div>
</div>
<div class ="agreeopen" style="display:none">
<p style="font-weight:bold; padding: 0 0 0 20px;">개인 정보 수집 및 이용 동의</p>
<small class="agreeText" style="position:relative; bottom:13px;">Surf는 개인정보를 안전하게 취급하는데 최선을 다합니다.</small><br><br>

<small class="agreeText">[필수]서비스 기본기능 제공</small>
<table border="0">
   <tr>
      <th>목적</th>
      <th>항목</th>
      <th style="border-right:0;">보유기간</th>
   </tr>
   <tr>
      <td>Surf 서비스 내 이용자 식별 및 회원관리<br>프로필 정보 연동</td>
      <td>아이디,비밀번호,이름(닉네임),프로필사진
      <td rowspan="3" style="border-right:0;">회원탈퇴 후 지체 없이 삭제</td>
   </tr>
   <tr>
      <td>Surf 서비스 내 친구등록 및 친구추천<br> 친구에게 알림 기능 제공</td>
      <td>Surf 서비스 친구목록</td>
   </tr>
   <tr>
      <td>Surf 서비스 내 맞춤형 컨텐츠 제공<br>서비스 부정 이용 방지</td>
      <td>아이디,이름(닉네임),프로필사진,<br>Surf 서비스 친구목록,Surf 서비스 이용 내역<br>Surf서비스 내 구매 및 결제 내역</td>
   </tr>
      
</table><br>
<small class="agreeText">서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다.</small><br><Br>
<small class="agreeText">더 자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.</small>
</div>

</div>
<!-- ----------------------------약관동의 페이지 끝---------------------- -->
<!-- ----------------------------회원가입 폼---------------------- -->
<div class="joinForm" style="display:none;">
<form action="post" method="join.do">
<h3>Surf계정 정보입력</h3><hr>
<p>Surf 계정아이디</p>         <input type="text" name="userid" id="join1"class="joininpt" placeholder="아이디를 입력해주세요" style="margin-left:80px;float:left;" onkeyup="fullcheck();idcheck1()"> 
                     <input type="button" value="중복 체크" style="width:80px;height:34px;margin-top:3px;margin-left:10px;border: 0;background-color:#067DA1;color:white;" onclick="idsame()" ><br>
<div id="msgone" style="font-size:12px;color:green;position:relative;left:80px;visibility:hidden;display:block;">-----는 사용할 수 있는 아이디 입니다.</div>
<div id="msgtwo" style="font-size:12px;color:red;position:relative;left:80px;display:none;">-----는 사용할 수 없는 아이디 입니다.</div>
<p>비밀번호(8~24자리)</p>      <input type="password" name="pwd" id="join2"class="joininpt" placeholder="비밀번호를 입력해주세요(8~24자리)" onblur="fullcheck()"><br><br>
<p>비밀번호 재입력</p>         <input type="password" name="pwdcheck" id="join3" class="joininpt" placeholder="비밀번호확인" style="margin-left:78px;" onkeyup="fullcheck()"><br><br>
<p>이  름(닉네임)</p>         <input type="text" name="name" class="joininpt" id="join4" placeholder="이름(닉네임)" style="margin-left:98px;" onkeyup="fullcheck()"><br><br>
<p>이메일</p>               <input type="text" name="email" class="joininpt" id="join5" placeholder="이메일" style="margin-left:143px;float:left;" onkeyup="fullcheck()"><br><br><br>
<p>휴대폰 번호</p>            <input type="text" name="phone" class="joininpt" id="join6" placeholder="휴대폰 번호를 입력하세요.(-생략)" style="margin-left:108px;float:left;width:185px;" onkeyup="fullcheck()">
                     <input type="text" placeholder="인증 번호" class="joininpt" style="margin-left:20px;width:100px;float:left;" disabled='disabled' onkeyup="fullcheck()" id="phonecheck">
                     <input type="button" value="전송 하기" style="width:80px;height:34px;margin-top:3px;margin-left:10px;border: 0;background-color:#067DA1;color:white;float:left;display:block;" onclick="return smssend()" id="smsbtn1">
                     <input type="button" value="인증 확인" style="width:80px;height:34px;margin-top:3px;margin-left:10px;border: 0;background-color:#067DA1;color:white;float:left;display:none;" onclick="smscheck()" id="smsbtn2">

</form>
</div>

<!-- --------------------------회원가입 폼 끝------------------------------------>
<!-- --------------------------회원가입  성공 폼 시작------------------------------------>
<div class="joinsuccess" id="joinsuccess" style="display:none;">
<h3>Surf계정 가입 완료</h3><hr>
<div class="joinsuccessText">
<h2>Surf계정 가입을 환영합니다!</h2>
<small>Surf계정으로 로그인 하시면 Surf의 다양한 서비스를 이용하실수 있습니다.</small>
<br><br>
<center>
   <div class="pfimg" onclick="profilechange()"></div><br><input type="file" onchange="profilechange1()" style="display:none;" id="profilechange">
   <div class="userinfo">
      <p style="color:#067DA1; font-size:22px;" id="joinsucid">papakang22(예시)</p>
      <p style="position:relative; bottom:12px;color:GRAY;" id="joinsucname">황남욱(예시)</p>
      <p style="position:relative; bottom:30px;color:gray;" id="joinsucemail">papakang22@naver.com(예시)</p>
   </div>
</center>
</div>
</div>
</div>
<div class="nextbtn" onclick="nextbtn()" id="nextbtn">다음</div>
</div>
<div class="bottom">
<small class="txt_copyright" >Copyright &copy; <a href="#">SURF Corp.</a> All rights reserved.</small>
</div>
<!-- ------------------문자발송--------------------- -->
<div style="display:none">
<form method="post" name="smsForm" action="smssend.jsp">
        <input type="hidden" name="action" value="go"> 발송타입
        <textarea name="msg" cols="30" rows="10" style="width:455px;" id="msgtext"></textarea>
        <input type="text" name="rphone" value="011-111-1111" id="rphone"> 받는번호
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="2873">
        <input type="hidden" name="sphone3" value="1430">
        <input type="text" name="nointeractive" maxlength="1" value="1">
        <input type="submit" value="전송">
       
 
    </form>
</div>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
var modalbtn = document.getElementById("modalbtn");
var joinmodal1 =document.getElementById("joinmodal");

function modalhide(){
   
   joinmodal1.style.display = "none";
   
}
function profilechange(){
   $('#profilechange').click();
}

$(function() { //이미지 미리보기
    $("#profilechange").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('.pfimg').css('background-image', 'url('+e.target.result+')');
        }
      reader.readAsDataURL(input.files[0]);
    }
}

</script>
<script type="text/javascript" src="js/joinform.js"></script>
</body>
</html>