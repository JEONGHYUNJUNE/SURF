<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/find.css" />
<link rel="shortcut icon" type="image/x-icon" href="img/vicon.ico" />
<title>SURF</title> <!--아이콘은 헤더JSP를 통해 설정해둠  -->
<%
 String url = request.getParameter("name");
%>
<style>
.findmodal{
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
.findmodal-text{
         margin-left:37%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 380px;
            height:200px;
            margin-top:200px;
         text-aling:center;
}
</style>
</head>
<body>
<input type="hidden" value="<%=url %>" id="url">
<div class="findmodal" id="findmodal">
   <div class="findmodal-text">
   <p style="margin-top:60px;font-size:18px;font-weight:bold;" id="finderrortext">비밀번호는 8~24자리 입니다.</p>
   <div id="modalbtn" onclick="modalhide()" style="display:inline-block; width:120px;height:30px;background-color:#067DA1;text-align:center;color:white;padding-top:7px;margin-top:30px;cursor:pointer;">확인</div>
   </div>
</div>
<div class="Top"><a href="index.html"><img alt="" src="img/surflogo.png" width="115px" height="35px" style="margin-left: 0.5%; margin-top: 1%"></a></div>
<div class="main">
<div class="mainTapdiv">
<div class="mainTap" id="goId" style="margin-left:0.5px;background-color:#067DA1; color:white;" onclick="goId()">아이디 찾기</div>
<div class="mainTap"  id="goPw" onclick="goPw()">비밀번호 찾기</div>
<!-- -------------------아이디 찾기 폼 시작---------------------- -->
<div class="idfind" style="display:block;">
<div class="idForm" style="display:block;">
<h3 style="padding:0;">아이디 찾기</h3><hr>
<h4 style="padding:0 0 0 20px;">계정 정보 입력</h4>
<div class="idfindForm">
<h4 style="padding:0 0 0 50px; color:#067DA1;">Surf계정 이름</h4>
<input type="text" name="name" class="findinpt" id="find1" placeholder="이 름" onkeyup="fullfind()">
<h4 style="padding:0 0 0 50px; color:#067DA1; position:relative; bottom:25px;">Surf계정 휴대폰 번호</h4>
<input type="text" name="phone" class="findinpt" id="find2" style="bottom:35px;" placeholder="휴대폰 번호" onkeyup="fullfind()">
</div>
<div class="btn"><div class="btnbutton" id="btn"  onclick="idSuc()">확인</div></div>
</div>
<div class="idSuc" style="display:none;">
<h3 style="padding:0;">아이디 찾기 결과</h3><hr>
<h4 style="padding:0 0 0 20px;">계정 정보</h4>
<div class="idfindForm" style="text-align:center;">
<h3 style="color:#067DA1;">아이디 찾기 결과</h3><br>
<p style="font-size:17px;" id="useridfind">papakang22</p>
</div>
<div class="btn"><div class="btnbutton" id="btn" onclick="location.href='index.html'">확인</div></div>
</div>
</div>
<!-- -------------------아이디 찾기 폼 끝---------------------- -->
<!-- -------------------비밀번호 찾기 폼 시작---------------------- -->
<div class="pwfind" style="display:none;">
<h3 style="padding:0;">비밀번호 찾기</h3><hr>
<h4 style="padding:0 0 0 20px;">계정 정보 입력</h4>
<div class="pwfindForm">
<h4 style="padding:0 0 0 50px; color:#067DA1;">Surf계정 아이디</h4>
<input type="text" name="userid" class="findinpt" id="pwfind" placeholder="이 름" onkeyup="pwfullfind()">
<h4 style="padding:0 0 0 50px; color:#067DA1; position:relative; bottom:25px;">Surf계정 이름</h4>
<input type="text" name="name" class="findinpt" id="pwfind1" placeholder="이 름" onkeyup="pwfullfind()" style="bottom:35px;">
<h4 style="padding:0 0 0 50px; color:#067DA1; position:relative; bottom:50px;">Surf계정 이메일</h4>
<input type="text" name="email" class="findinpt" id="pwfind2" style="bottom:70px;" placeholder="이메일" onkeyup="pwfullfind()">
</div>
<div class="btn1"><div class="btnbutton1" id="btn1" onclick="return cc()">확인</div></div>
</div>
</div>
</div>
<div class="bottom">
<small class="txt_copyright" >Copyright &copy; <a href="#">SURF Corp.</a> All rights reserved.</small>
</div>
<script src="https://smtpjs.com/smtp.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
var modalbtn = document.getElementById("modalbtn");
var findmodal1 =document.getElementById("findmodal");

function modalhide(){
   
   findmodal1.style.display = "none";
   
}
</script>
<script type="text/javascript" src="js/find.js"></script>

</body>
</html>