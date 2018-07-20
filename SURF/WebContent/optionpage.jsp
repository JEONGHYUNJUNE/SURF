<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%-- <c:if test = "${loginUser.username eq null}">
    <jsp:forward page="index.html"/>
    </c:if>   --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" type="text/css" href="css/feed.css" />
<title>SURF</title> <!--아이콘은 헤더JSP를 통해 설정해둠  -->
<%@ include file="include/header.jsp" %> <!--include를 통해 상위 고정 공간  -->
<style>
.option-main{
   width: 80%;
   height: auto;
   min-height: 760px;
   background-color: #E9E7E7;
   float:left;
   text-align:center;
   overflow: auto;
}
.option-main-div{
width:600px;
height:auto;
min-height:760px;
display:inline-block;
text-align:left;

}
.option-main-text-div{
width:100px;
height:auto;
min-height:70px;
float:left;
display:inline-block;
margin-left:30px;
font-size:14px;
font-weight:bold;
color:black;
padding-top:2px;

}
.option-main-text{
width:370px;
height:auto;
min-height:70px;
float:left;
display:inline-block;
margin-left:70px;
border-bottom:1px solid #BDBDBD;
font-size:13px;
font-weight:bold;
}
.opbtn{
width:100px;
height:25px;
text-align:center;
padding-top:2px;
font-size:13px;
font-weight:bold;
background-color:white;
border:1px solid #bdbdbd;
margin-top:10px;
color:gray;
float:left;
cursor:pointer;
}
.opt-modal{
   display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 500; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
           text-align:center;
   
}
.opt-modal-text{
            display:inline-block;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 500px;
            height:550px;
            margin-top:80px;
            text-aling:center;
            background-color:white;
            padding:0;
}
.delmodal{
   display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 500; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
           text-align:center;
}
.delmodal-text{
         display:inline-block;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 500px;
            height:250px;
            margin-top:180px;
            text-aling:center;
            background-color:white;
            padding:0;
}
.modal-change-div{
width:100%;
height:548px;
position:relative;
bottom:20px;
text-align:left;
}
.pwmodalone{
text-align:center;
width:100%;
height:400px;

}
.optmodalinpt{
width:60%;
height:20px;
padding:10px;
color:gray;
font-size:18px;

}
.optmodalbtn{
background-color:#BDBDBD;
color:white;
display:inline-block;
text-align:center;
width:120px;
height:40px;
padding-top:7px;
font-size:20px;
border:1px solid gray;
}
.btn-x{
font-size:23px;
font-weight:bold;
position:relative;
left:170px;
bottom:20px;
color:gray;
}
.btn-x:hover{
color:black;
cursor:pointer;
}
.delmodal-text-text{
display:inline-block;
width:80%;
height:50px;
font-size:27px;
font-weight:bold;
margin-top:80px;
}
.delmodal-yesbtn{
display:inline-block;
width:100px;
height:30px;
background-color:#067DA1;
color:white;
padding-top:8px;
font-weight:bold;
font-size:17px;
margin-top:30px;
margin-left:50px;
cursor:pointer;
}
.delmodal-nobtn{
display:inline-block;
width:100px;
height:30px;
background-color:#bdbdbd;
color:white;
padding-top:8px;
font-size:17px;
font-weight:bold;
margin-top:30px;
cursor:pointer;
}
</style>
</head>

<body>
<!-- ------------변경모달시작------------------ -->
<input type="hidden" value="${loginUser.userpwd }" id="userpw">
<input type="hidden" value="${loginUser.userid }" id="userid">
<input type="hidden" value="${loginUser.username }" id="username">
<input type="hidden" value="${loginUser.phonenum }" id="userphone">
<input type="hidden" value="${loginUser.email }" id="useremail">

<div class="opt-modal" id="optmodal">
<div class="opt-modal-text">
<div>
<img alt="" src="img/surflogo.png" width="115px" height="35px" style="margin-left: 0.5%; margin-top: 1%;">
<span class="btn-x" id="closebtn">x</span>
<hr style="height:3px;background-color:#067DA1;">
</div>
<!--  ---------비밀번호변경 div------------ -->


               <div class="modal-change-div" id="pwmodal" style="display:none;">
               
               
               
<p style="padding-left:30px;padding-top:20px;font-size:18px;font-weight:bold;color:black;">비밀번호 변경</p>
<!--  ---------비밀번호 div 1------------ -->
<div class="pwmodalone" id="pwmodalone" style="display:none;">
<h3 style="padding-top:50px;">회원님의 소중한 정보 보호를 위해<br>현재 비밀번호를 확인해 주세요.</h3>
<br><br>
<input type="password" class="optmodalinpt" placeholder="비밀번호(8~24자리)" id="pwoneinpt" onkeyup="pwonefull()">
<div style="width:100%;height:20px;color:red;font-size:14px;visibility:hidden" id="pwonetext">비밀번호가 일치하지않습니다.</div>
<br><br>
<div class="optmodalbtn" id="pwmodalbtnone" onclick="userpwcheck()">다 음</div>
</div>
<!--  ---------비밀번호 div 2------------ -->
<div class="pwmodalone" id="pwmodaltwo" style="display:block">
<h3 style="padding-top:50px;">새로운 비밀번호를 입력해주세요</h3>
<br>
<input type="password" class="optmodalinpt" placeholder="비밀번호(8~24자리)" id="pwtwoinpt" onkeyup="pwtwofull()">
<div style="color:red;font-size:13px;text-align:left;padding-left:90px;visibility:hidden;display:block;" id="pwtwotexterror">비밀번호는 8~24자리 입니다.</div>
<div style="color:green;font-size:13px;text-align:left;padding-left:90px;display:none;" id="pwtwotextsuc">안전한 비밀번호 입니다.</div>
<input type="password" class="optmodalinpt" placeholder="비밀번호 확인" id="pwtwoinptcheck" onkeyup="pwtwocheckfull()">
<div style="color:red;font-size:13px;text-align:left;padding-left:90px;visibility:hidden;display:block;" id="pwtwotextcheckerror">비밀번호가 일치하지 않습니다.</div>
<div style="color:green;font-size:13px;text-align:left;padding-left:90px;display:none;" id="pwtwotextchecksuc">비밀번호가 일치합니다.</div>
<br><br>
<div class="optmodalbtn" id="pwmodalbtntwo" onclick="optpwchange()">변 경</div>
</div>
</div>
<!--  ---------비밀번호변경 div 끝------------ -->
<!-- --------이름(닉네임)변경 div------------- -->



               <div class="modal-change-div" id="namemodal" style="display:none;">




<p style="padding-left:30px;padding-top:20px;font-size:18px;font-weight:bold;color:black;">이름(닉네임) 변경</p>
<div class="pwmodalone" id="namemodalone" style="display:block">
<h3 style="padding-top:50px;">새로운 이름(닉네임)을 입력해주세요</h3>
<br>
<input type="text" class="optmodalinpt" placeholder="이름(닉네임)" id="nameinpt" onkeyup="nameinptfull()">
<br><br><br><br><br><br>
<div class="optmodalbtn" id="namemodalbtn" onclick="optnamechange()">변 경</div>
</div>
</div>
<!-- --------이름(닉네임)변경 div 끝------------- -->
<!-- --------휴대폰 변경 div------------- -->



               <div class="modal-change-div" id="phonemodal" style="display:none;"> 



<p style="padding-left:30px;padding-top:20px;font-size:18px;font-weight:bold;color:black;">휴대폰번호 변경</p>
<div class="pwmodalone" id="phonemodalone" style="display:block">
<div style="display:block;" id="phoneone"><!-- --------휴대폰 변경 div 1------------- -->
<h3 style="padding-top:50px;">새로운 휴대폰 번호를 입력해주세요</h3>
<br>
<input type="text" class="optmodalinpt" placeholder="휴대폰번호" style="width:45%;float:left;margin-left:80px;" id="phoneinpt" onkeyup="phoneinptfull()" onfocus="phoneinptdel()">
<div style="width:15%;height:33px;text-align:center;border:1px solid #BDBDBD;color:white;font-size:16px;margin-left:10px;padding-top:9px;font-weight:bold;background-color:#BDBDBD;float:left;" id="phonemodalbtn" onclick="optphonechange()">인증하기</div>
<br><br><br><div style="color:red;font-size:13px;text-align:left;padding-left:90px;visibility:hidden;display:block;" id="phoneerror">휴대폰 번호가 중복되었습니다.</div>
<div style="color:red;font-size:13px;text-align:left;padding-left:90px;display:none;" id="phoneerrortwo">올바르지 않은 번호입니다.</div>
</div>
<div style="display:none;" id="phonetwo"> <!-- --------휴대폰 변경 div 2------------- -->
<h3 style="padding-top:50px;">인증번호가 발송되었습니다.</h3>
<br>
<input type="text" class="optmodalinpt" placeholder="인증번호" style="width:45%;float:left;margin-left:80px;" id="phoneinpttwo" onkeyup="phoneinpttwofull()">   
<div style="width:15%;height:33px;text-align:center;border:1px solid #BDBDBD;color:white;font-size:16px;margin-left:10px;padding-top:9px;font-weight:bold;background-color:#BDBDBD;float:left;" id="phonemodalbtntwo" onclick="optphonecheck()">인증확인</div>
<br><br><br><div style="color:red;font-size:13px;text-align:left;padding-left:90px;visibility:hidden;display:block;" id="phonetwoerror">인증번호가 일치하지않습니다.</div>
<div style="color:green;font-size:13px;text-align:left;padding-left:90px;display:none;" id="phonetwosuc">인증되었습니다.</div>
<br><br><br><br><br>
<div class="optmodalbtn" id="phonemodalchangebtn" onclick="optphonech()">변 경</div>
</div>
</div>
</div>
<!-- --------휴대폰 변경 div 끝------------- -->
<!-- --------이메일 변경 div------------- -->



                     <div class="modal-change-div" id="emailmodal" style="display:none;">



<p style="padding-left:30px;padding-top:20px;font-size:18px;font-weight:bold;color:black;">이메일 변경</p>
<div class="pwmodalone" id="emailmodalone" style="display:block">
<h3 style="padding-top:50px;">새로운 이메일을 입력해주세요.</h3>
<br>
<input type="text" class="optmodalinpt" placeholder="이메일" id="emailinpt" onkeyup="emailinptfull()">
<div style="color:red;font-size:13px;text-align:left;padding-left:90px;visibility:hidden;display:block;" id="optemailerror">이메일 형식이 올바르지 않습니다.</div>
<br><br><br><br><br><br>
<div class="optmodalbtn" id="emailmodalbtn" onclick="optemailchange()">변 경</div>
</div>
</div>
<!-- --------이름(닉네임)변경 div 끝------------- -->
</div>
</div>
<div class="delmodal" id="delmodal">
<div class="delmodal-text">
<div class="delmodal-text-text">정말 탈퇴하실 꺼에요? ㅜ^ㅜ</div>
<div class="delmodal-nobtn" onclick="delbtn(1)">아니요</div>
<div class="delmodal-yesbtn" onclick="delbtn(2)">네</div>
</div>
</div>
<!-- ------------변경모달끝------------------ -->
<div class="option-main">
<div class="option-main-div">
<h3 style="margin-top:100px;padding-left:30px;">일반설정</h3><hr style="width:90%;background-color:#bdbdbd;">
<h4 style="color:gray;padding-left:30px;">계정설정</h4>
<div class="option-main-text-div">Surf 계정</div>
<div class="option-main-text">${loginUser.userid } <br><div class="opbtn" id="optpw">비밀번호 변경</div><div class="opbtn" style="margin-left:10px;width:75px;" onclick="window.location='./logout.do'">로그아웃</div></div><br><br><br><br>
<div class="option-main-text-div">이름(닉네임)</div>
<div class="option-main-text">${loginUser.username }<br><div class="opbtn" style="width:50px;" id="optname">변경</div></div><br><br><br><br>
<div class="option-main-text-div">휴대폰 번호</div>
<div class="option-main-text">${loginUser.phonenum }<br><div class="opbtn" style="width:50px;" id="optphone">변경</div></div><br><br><br><br>
<div class="option-main-text-div">이메일</div>
<div class="option-main-text">${loginUser.email }<br><div class="opbtn" style="width:50px;" id="optemail">변경</div></div><br><br><br><br>
<br>

<a href="#" style="padding-left:200px;color:gray;text-decoration:none;font-size:14px;font-weight:bold;" onclick="Surfmemberdel()">Surf 탈퇴하기</a>

</div>
<div style="display:none;">
<form action="pfupdate.do" method="get" name="optfrm">
<input type="text" name="userid" id="frmuserid">
<input type="text" name="userpw" id="frmuserpw">
<input type="text" name="username" id="frmusername">
<input type="text" name="useremail" id="frmuseremail">
<input type="text" name="userphone" id="frmuserphone">
<input type="text" name="attr" id="frmattr" value="일반">
</form>
</div>
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
<div style="display:none">
<form method="post" name="delfrm" action="delmember.do">
<input type="text" name="userid" value="${loginUser.userid }">
</form>
</div>
</div> 
  <%@ include file="include/rightspace.jsp" %> <!-- include를 통해 오른쪽 친구 목록 및 쪽지가 표시될 공간 고정  -->
 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
  <script type="text/javascript" src="js/feed.js">
  
</script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
var optmodal = document.getElementById("optmodal");

var optpw = document.getElementById("optpw");
var optname = document.getElementById("optname");
var optphone = document.getElementById("optphone");
var optemail = document.getElementById("optemail");

var optpwmodal = document.getElementById("pwmodal");
var optnamemodal = document.getElementById("namemodal");
var optphonemodal = document.getElementById("phonemodal");
var optemailmodal = document.getElementById("emailmodal");

var closebtn = document.getElementById("closebtn");

var pwmodalbtnone = document.getElementById("pwmodalbtnone");
var pwmodalbtntwo = document.getElementById("pwmodalbtntwo");
var namemodalbtn = document.getElementById("namemodalbtn");
var phonemodalbtn = document.getElementById("phonemodalbtn");
var emailmodalbtn = document.getElementById("emailmodalbtn");

var frmuserid = document.getElementById("frmuserid");
var frmuserpw = document.getElementById("frmuserpw");
var frmusername = document.getElementById("frmusername");
var frmuseremail = document.getElementById("frmuseremail");
var frmuserphone = document.getElementById("frmuserphone");
var frmattr = document.getElementById("frmattr");

var random = 1;


closebtn.onclick = function(){
   optmodal.style.display = "none";   
}
optpw.onclick=function(){
   var pwmodalone = document.getElementById("pwmodalone");
   var pwmodaltwo = document.getElementById("pwmodaltwo");
   optmodal.style.display = "block";
   optpwmodal.style.display = "block";
   optnamemodal.style.display = "none";
   optphonemodal.style.display = "none";
   optemailmodal.style.display = "none";
   pwmodalone.style.display = "block";
   pwmodaltwo.style.display = "none";
}
optname.onclick=function(){
   optmodal.style.display = "block";
   optpwmodal.style.display = "none";
   optnamemodal.style.display = "block";
   optphonemodal.style.display = "none";
   optemailmodal.style.display = "none";
}
optphone.onclick=function(){
   optmodal.style.display = "block";
   optpwmodal.style.display = "none";
   optnamemodal.style.display = "none";
   optphonemodal.style.display = "block";
   optemailmodal.style.display = "none";
}
optemail.onclick=function(){
   optmodal.style.display = "block";
   optpwmodal.style.display = "none";
   optnamemodal.style.display = "none";
   optphonemodal.style.display = "none";
   optemailmodal.style.display = "block";
}

function pwonefull(){
   var pwoneinpt = document.getElementById("pwoneinpt");
   var pwonetext = document.getElementById("pwonetext");
   
   if(pwoneinpt.value == ""){
      $('#pwmodalbtnone').css('background-color','#BDBDBD');
      $('#pwmodalbtnone').css('cursor','auto');
      pwonetext.style.visibility = "hidden";
   }else{
     $('#pwmodalbtnone').css('background-color','#067DA1');
     $('#pwmodalbtnone').css('cursor','pointer');
     pwonetext.style.visibility = "hidden";
   }
   if(window.event.keyCode == 13){
      userpwcheck();
   }
}

function pwtwofull(){
   var pwtwoinpt = document.getElementById("pwtwoinpt");
   var pwtwotexterror = document.getElementById("pwtwotexterror");
   var pwtwotextsuc = document.getElementById("pwtwotextsuc");
   var pwtwoinptcheck = document.getElementById("pwtwoinptcheck");
   if(pwtwoinptcheck.value != ""){
      pwtwocheckfull();
   }
   if(pwtwoinpt.value == ""){
      pwtwotexterror.style.visibility = "hidden";
      pwtwotexterror.style.display="block";
      pwtwotextsuc.style.display="none";
   }
   else if(pwtwoinpt.value.length>=8&&pwtwoinpt.value.length<=24){
      pwtwotexterror.style.visibility = "hidden";
      pwtwotexterror.style.display="none";
        pwtwotextsuc.style.display="block";
   }else{
      pwtwotexterror.style.visibility = "visible";
      pwtwotexterror.style.display="block";
         pwtwotextsuc.style.display="none";
   }
}

function pwtwocheckfull(){
   var pwtwoinpt = document.getElementById("pwtwoinpt");
   var pwtwoinptcheck = document.getElementById("pwtwoinptcheck");
   var pwtwotextcheckerror = document.getElementById("pwtwotextcheckerror");
   var pwtwotextchecksuc = document.getElementById("pwtwotextchecksuc");
   
   if(pwtwoinptcheck.value != "" && pwtwoinpt.value !=""){
      $('#pwmodalbtntwo').css('background-color','#067DA1');
        $('#pwmodalbtntwo').css('cursor','pointer');
   }else{
      $('#pwmodalbtntwo').css('background-color','#BDBDBD');
        $('#pwmodalbtntwo').css('cursor','auto');
   }
   if(pwtwoinptcheck.value ==""){
      pwtwotextcheckerror.style.visibility = "hidden";
      pwtwotextcheckerror.style.display="block";
      pwtwotextchecksuc.style.display="none";
   }
   else if(pwtwoinpt.value == pwtwoinptcheck.value){
      pwtwotextcheckerror.style.visibility = "hidden";
      pwtwotextcheckerror.style.display="none";
        pwtwotextchecksuc.style.display="block";
   }
   else{
      pwtwotextcheckerror.style.visibility = "visible";
      pwtwotextcheckerror.style.display="block";
       pwtwotextchecksuc.style.display="none";
   }
   if(window.event.keyCode == 13){
      optpwchange();
   }

}
function userpwcheck(){
   var pwoneinpt = document.getElementById("pwoneinpt");
   var userpw = document.getElementById("userpw");
   var pwonetext = document.getElementById("pwonetext");
   var pwmodalone = document.getElementById("pwmodalone");
   var pwmodaltwo = document.getElementById("pwmodaltwo");
   if(pwoneinpt.value == userpw.value){
      pwmodalone.style.display = "none";
      pwmodaltwo.style.display = "block";
      
   }else{
      pwonetext.style.visibility = "visible";   
      
   }
}
function optpwchange(){
   
   var pwtwoinpt = document.getElementById("pwtwoinpt");
   var userid = document.getElementById("userid");
   var userpw = document.getElementById("userpw");
   var userphone = document.getElementById("userphone");
   var useremail = document.getElementById("useremail");
   var username = document.getElementById("username");
   var pwtwotextchecksuc = document.getElementById("pwtwotextchecksuc");
   var pwtwotextsuc = document.getElementById("pwtwotextsuc");

   
   if(pwtwotextchecksuc.style.display=="block" && pwtwotextsuc.style.display=="block"){
      frmuserid.value = userid.value;
      frmuserpw.value = pwtwoinpt.value;
      frmuserphone.value = userphone.value;
      frmuseremail.value = useremail.value;
      frmusername.value = username.value;
      frmattr.value = "비밀번호";
      optfrm.submit();
   
   }else{
      alert("비밀번호 양식을 확인해주세요.");
   }
}
function optnamechange(){
   var nameinpt = document.getElementById("nameinpt");
   var userid = document.getElementById("userid");
   var userpw = document.getElementById("userpw");
   var userphone = document.getElementById("userphone");
   var useremail = document.getElementById("useremail");
   var username = document.getElementById("username");
   var pwtwotextchecksuc = document.getElementById("pwtwotextchecksuc");
   var pwtwotextsuc = document.getElementById("pwtwotextsuc");
   
   if(nameinpt.value != ""){
      frmuserid.value = userid.value;
      frmuserpw.value = userpw.value;
      frmuserphone.value = userphone.value;
      frmuseremail.value = useremail.value;
      frmusername.value = nameinpt.value;
      frmattr.value = "이름";
      optfrm.submit();
   }
}
function nameinptfull(){

   var nameinpt = document.getElementById("nameinpt");
   if(nameinpt.value != ""){
      $('#namemodalbtn').css('background-color','#067DA1');
        $('#namemodalbtn').css('cursor','pointer');
   }else{
      $('#namemodalbtn').css('background-color','#BDBDBD');
        $('#namemodalbtn').css('cursor','auto');
   }
   if(window.event.keyCode == 13){
      document.getElementById("namemodalbtn").click();
   }
}
function phoneinptfull(){
   
   var phoneinpt = document.getElementById("phoneinpt");
   var phoneerror = document.getElementById("phoneerror");
   var phoneerrortwo = document.getElementById("phoneerrortwo");
   phoneerror.style.visibility = "hidden";
   phoneerror.style.display = "block";
   phoneerrortwo.style.display = "none";
   if(phoneinpt.value == ""){
        $('#phonemodalbtn').css('background-color','#BDBDBD');
        $('#phonemodalbtn').css('cursor','auto');
        
   }else{
        $('#phonemodalbtn').css('background-color','#067DA1');
        $('#phonemodalbtn').css('cursor','pointer');
   }
   if(window.event.keyCode == 13){
      document.getElementById("phonemodalbtn").click();
   }
}

function phoneinptdel(){
   var phoneinpt = document.getElementById("phoneinpt");
   var phoneerror = document.getElementById("phoneerror");
   var phoneerrortwo = document.getElementById("phoneerrortwo");
   if((phoneinpt != "" && phoneerror.style.visibility=="visible")||phoneerrortwo.style.display=="block"){
      phoneinpt.value = "";
      phoneerror.style.visibility = "hidden";
      phoneerror.style.display = "block";
      phoneerrortwo.style.display = "none";
   }
}
function optphonechange(){
   var phoneerror = document.getElementById("phoneerror");
   var phoneerrortwo = document.getElementById("phoneerrortwo");
   var phoneinpt = document.getElementById("phoneinpt");
   var phoneone = document.getElementById("phoneone");
   var phonetwo = document.getElementById("phonetwo");
   var ran1 = Math.floor(Math.random()*(999999-100002))+100001;
   var rphone = document.getElementById("rphone");
   
   if (isNaN(phoneinpt.value)||phoneinpt.value==""||phoneinpt.value.length!=11){
           phoneerror.style.display = "none";
         phoneerrortwo.style.display = "block";
       } 
   else{
      $.ajax({
   
           
           type:"GET",
           url:'phonecheck.do?phone='+phoneinpt.value,
           datatype:"TEXT",
           success:function(data){
              if(data=="fail"){
              phoneerror.style.visibility = "visible";
              phoneerror.style.display = "block";
            phoneerrortwo.style.display = "none";
              }
              else if(data=="success"){
               phoneone.style.display = "none";
               phonetwo.style.display = "block";
               rphone.value = phoneinpt.value;
               document.getElementById("msgtext").innerHTML = "[SURF]회원가입 인증 번호입니다. "+ran1;
               random = ran1;
               winpopup();
               
              }
              
           }});
   }
   
       
}
function phoneinpttwofull(){
   
   var phoneinpttwo = document.getElementById("phoneinpttwo");
   var phonetwosuc = document.getElementById("phonetwosuc");
   var phonetwoerror = document.getElementById("phonetwoerror");
   phonetwoerror.style.visibility = "hidden";
   phonetwoerror.style.display = "block";
   phonetwosuc.style.display = "none";
   if(phoneinpttwo.value == ""){
        $('#phonemodalbtntwo').css('background-color','#BDBDBD');
        $('#phonemodalbtntwo').css('cursor','auto');
        
   }else{
        $('#phonemodalbtntwo').css('background-color','#067DA1');
        $('#phonemodalbtntwo').css('cursor','pointer');
   }
   if(window.event.keyCode == 13){
      document.getElementById("phonemodalbtntwo").click();
   }
}
function optphonecheck(){
   var phoneinpttwo = document.getElementById("phoneinpttwo");
   var phonetwosuc = document.getElementById("phonetwosuc");
   var phonetwoerror = document.getElementById("phonetwoerror");
   if(phoneinpttwo.value == random){
      phonetwosuc.style.display = "block";
      phonetwoerror.style.display="none";
      phonetwoerror.style.visibility = "hidden";
      $('#phoneinpttwo').attr('disabled',true);
      $('#phonemodalchangebtn').css('background-color','#067DA1');
      $('#phonemodalchangebtn').css('cursor','pointer');
      
   }else{
      phonetwosuc.style.display = "none";
      phonetwoerror.style.display="block";
      phonetwoerror.style.visibility = "visible";
      
   }
}
function optphonech(){
   var nameinpt = document.getElementById("nameinpt");
   var userid = document.getElementById("userid");
   var userpw = document.getElementById("userpw");
   var userphone = document.getElementById("userphone");
   var useremail = document.getElementById("useremail");
   var username = document.getElementById("username");
   var phoneinpt = document.getElementById("phoneinpt");
   var btn = document.getElementById("phonemodalchangebtn");
   var phonetwosuc = document.getElementById("phonetwosuc");
   var phonetwoerror = document.getElementById("phonetwoerror");
   if(btn.style.cursor == "pointer"){
      frmuserid.value = userid.value;
      frmuserpw.value = userpw.value;
      frmuserphone.value = phoneinpt.value;
      frmuseremail.value = useremail.value;
      frmusername.value = username.value;
      optfrm.submit();
   }else{
      phonetwosuc.style.display = "none";
      phonetwoerror.style.display="block";
      phonetwoerror.style.visibility = "visible";
   }
}
function emailinptfull(){
   
   var emailinpt = document.getElementById("emailinpt");
   var optemailerror = document.getElementById("optemailerror");
   if(optemailerror.style.visibility =="visible"){
         emailinpt.value = "";
         optemailerror.style.visibility = "hidden";
   }
   if(emailinpt != ""){
      $('#emailmodalbtn').css('background-color','#067DA1');
      $('#emailmodalbtn').css('cursor','pointer');
   }else{
      $('#emailmodalbtn').css('background-color','#BDBDBD');
      $('#emailmodalbtn').css('cursor','auto');
   }
   
   if(window.event.keyCode == 13){
      document.getElementById("emailmodalbtn").click();
   }
}
function optemailchange(){
   var nameinpt = document.getElementById("nameinpt");
   var userid = document.getElementById("userid");
   var userpw = document.getElementById("userpw");
   var userphone = document.getElementById("userphone");
   var useremail = document.getElementById("useremail");
   var username = document.getElementById("username");
   var emailinpt = document.getElementById("emailinpt");
   var optemailerror = document.getElementById("optemailerror");
   var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
   
   if(!regex.test(emailinpt.value)){
      optemailerror.style.visibility = "visible";
   }else{
      frmuserid.value = userid.value;
      frmuserpw.value = userpw.value;
      frmuserphone.value = userphone.value;
      frmuseremail.value = emailinpt.value;
      frmusername.value = username.value;
      optfrm.submit();
   }
}
function delbtn(num){
   if(num==1){
      document.getElementById("delmodal").style.display = "none";
   }else{
      delfrm.submit();
   }
   
}
function Surfmemberdel(){
   document.getElementById("delmodal").style.display = "block";
}
function winpopup(){
      window.open("smssend.jsp","pop","width=500,height=300,scrollbars=no");
      document.smsForm.target = "pop";
      document.smsForm.action = "smssend.jsp";
      document.smsForm.submit();
   }
</script>
</body>
</html>