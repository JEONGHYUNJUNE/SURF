<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
  <c:if test = "${loginUser.userid eq null}">
    <jsp:forward page="feed.do?userid=${loginUser.userid }"/>
    </c:if> 
<link href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
      <link rel="stylesheet" type="text/css" href="css/mypage.css" />
<title>SURF</title> <!--아이콘은 헤더JSP를 통해 설정해둠  -->
<%@ include file="include/header.jsp" %> <!--include를 통해 상위 고정 공간  -->

</head>
<body> 
<c:set var="today"><fmt:formatDate value="${now}" pattern="yy/MM/dd" /></c:set> 
<input type="hidden" value="${loginUser.userid }" id="ajaxuserid">
<input type="hidden" value="${today }" id="ajaxtoday">
<input type="hidden" value="${loginUser.profilepic }" id="ajaxprofilepic">
<c:set var="now" value="<%=new java.util.Date()%>" />


<div class="loding">
   <img src="img/surfer_insta_.gif" class="loding-img"/>
</div>
<!-- <div class="picmodal" id="picmodal">
   <div class="picmodal-text">
      <div class="picmodaltext" style="width:101%;height:28px;text-align:center;font-size:14px;font-weight:bold;border-bottom:1px solid #BDBDBD;padding-top:7px;" onclick="picclick()">사진 업로드</div>
      <div class="picmodaltext" style="width:101%;height:30px;text-align:center;font-size:14px;font-weight:bold;padding-top:7px;" onclick="asd1()">기본 이미지</div>   
  
   </div>
</div> -->
<div class="picfullmodal" id="picfullmodal">
   <div class="picfullmodal-text">
     <span id="picx" style="font-size:27px;float:right;margin-right:20px;color:white;font-weight:bold;cursor:pointer;">x</span>
   </div>
</div>

   <div class="divmain" id="mainContent"> <!-- 메인 피드의 게시물 내용이 담김  -->
   <div class="myinfo"  style="color: white; background-image: url(${loginUser.profilebg});"> <!-- 내 배경 프로필 및 정보  -->
        <img src="${loginUser.profilepic}" width="80" height="80" style="cursor:pointer;    background-size :cover;  margin-left:3%;  border-radius: 50%;border: 1.5px solid white " onclick = "picfullmodal(this)">
         <span style="font-size: 30px;position: absolute; margin-top: 1%;margin-left: 1.5%;" >${loginUser.username}</span>
<div class="camera" id="camera" style="top:-30px;"></div>  
<div class="picchoice" id="picchoice" style="width:100px;height:70px;background-color:white;z-index:30;position:relative;left:95px;top:-40px;color:black;border:0.5px solid #bdbdbd;z-index:5;visibility:hidden;'" >
<div class="picmodaltext" style="width:101%;height:28px;text-align:center;font-size:14px;font-weight:bold;border-bottom:1px solid #BDBDBD;padding-top:7px;" onclick="picclick()">사진 업로드</div>
      <div class="picmodaltext" style="width:101%;height:30px;text-align:center;font-size:14px;font-weight:bold;padding-top:7px;" onclick="asd1()">기본 이미지</div>   
</div> 
             
         <form action="picupdate.do" method="post" enctype="multipart/form-data">
               <input type="file" name="picfile" onchange="asd()" value="" id="picfile" style=" size: 50% ;display:none;"> <!--파일변경시 바로 서블릿 적용  -->
<!--  <p class="pfchange" onclick="picclick()" >프로필 수정</p> <br> -->
   
 <input type="submit" id="picchangego" value="기본이미지로" style=display:none; >
 <input name="userid" value="${loginUser.userid}" style="display: none">
 </form>
         <form action="bgupdate.do" method="post" enctype="multipart/form-data">
         <div style="margin-top: 187px">
       <input type="file" name="bgfile" onchange="asd2()" value="" id="bgfile" style=" size: 50% ;display:none;"> <!--파일변경시 바로 서블릿 적용  -->
         <input type="button" class="bgchange" onclick="bgclick()" value="배경 사진 변경">
          <input name="userid" value="${loginUser.userid}" style="display: none">
           <input type="submit" id="bgchangego" style=display:none; >
         </div>
         </form>
   </div>
   <script type="text/javascript">
   function asd(){ //파일 변경시 바로 서브밋 버튼 클릭하여 디비변경
      $("#picchangego").click();
   }
   function asd1(){ //파일 변경시 바로 서브밋 버튼 클릭하여 디비변경
      msg = "프로필을 기본이미지로 변경하시겠습니까?";
       if(confirm(msg)!=0){
         $("#picchangego").click();       }
   else 
      return false;
      
   } 
   function asd2(){ //파일 변경시 바로 서브밋 버튼 클릭하여 디비변경
      $("#bgchangego").click();
   }
   </script>
   
   <div class="info">
   
      <c:forEach items="${list}" var="dto"> <!--for 문을 통해 dto의 게시물 내용을 불러옴  -->
      <%! int a = 0; %>
      <c:if test="${dto.userid eq loginUser.userid}">
         <div class="divmain-content" style="float: left;">
            <div class="divmain-content-top">
               <div class="pf" id="pf" style="background-image : url(${loginUser.profilepic}) "></div><!--프로필 사진 구역  -->
               <div class="namedate">
                  <b>${dto.name}</b><br>
                     <c:choose>
                  <c:when test="${fn:split(dto.date,',')[0] eq today }">   <!--오늘 날짜와 비교  -->
                                    ${fn:split(dto.date,',')[1]} 
                  </c:when>
                  <c:otherwise>
                                 ${fn:split(dto.date,',')[0]} 
                  </c:otherwise>
                  </c:choose>
               </div>
     <div id="${dto.userid}"  class="icon" onclick="return del(this)">
  <a  style="text-decoration: none;color:black;" href="delete.do?tnum=${dto.tnum}&userid=${loginUser.userid}"> <img src="img/휴지통2.png" style="width:25px;height:20px;" id="trash" onmouseover="this.src='img/휴지통1.png'" onmouseout="this.src='img/휴지통2.png'">      </a></div>
            </div>
            <div class="divmain-content-mid" style="word-break:break-all;">
                  <img id="${dto.tnum}" alt="" src="${dto.picrealname}"  style="margin-left: 70px; margin-bottom: 10px" width="400" height="auto">
           <video  width="500" height="360" controls="controls" id="video${dto.tnum}">
    <source id="v${dto.tnum}" src="${dto.videorealname}" type="video/mp4" />
    <br>
</video><br>
  ${dto.content} <br>
  <p id="linkinsert"> 삽입 링크 : <A id="linkexist" href="http://${dto.link}" target="_blank">${dto.link}</A></p>
               <div class="mid-icon" >
                  <img src="img/like.png" id="like" class="like" onmouseover="this.src='img/like3.png'" onmouseout="this.src='img/like.png'"
                     style="width: 90%; height: 90%;">
               </div>
            </div>
            <div class="divmain-content-bottom">  <!--게시글 하단 부분 덧글란이 존재  -->
               <input type="text" placeholder="댓글을 입력하세요." class="replyinpt">
               <input type="button" value="전송" class="replybtn" onclick="">
            </div>
            
         </div>
         <%a++ ;%>
         </c:if>
      </c:forEach>
      <input id="su" name="su" style="display: none;" value="<%=a%>">
    <div class="myinfo2" >
    <div style="position: absolute; padding: 10px;"><strong>정보</strong> 
     <hr size="3" width="150px" color="gray">
     
    <P style="font-size: 16x;font-family:fantasy; text-align: center;"> 나의 서핑 지역  
    </P><center id="locinfo" style="font-size:50px ;font-family: 'Nanum Pen Script', cursive;">${loginUser.surfaddress}</center>
         <hr  size="1" width="150px" color="lightgray">
         <form action="addresschange.do">
          <input name="userid" value="${loginUser.userid}" style="display: none">
      <select class="location" id="location" name="loc">
      <option value="">서핑 지역 변경</option>
      <option value="설정안함">설정안함</option>
      <option value="서울">서울</option>
      <option value="인천">인천</option>
      <option value="경기">경기</option>
      <option value="부산">부산</option>
      <option value="제주">제주</option>
      <option value="기타">기타</option>
      </select>&nbsp;<input type="submit" onclick="return locch()" value="변경">
    </form>
    </div>
    </div>
 <!--    <link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>

      <video width="600" height="360" controls="controls">

    <source src="img/exx.mp4" type="video/mp4" />

</video> -->


   </div>
  </div>
   
  <%@ include file="include/rightspace.jsp" %> <!-- include를 통해 오른쪽 친구 목록 및 쪽지가 표시될 공간 고정  -->
 <script type="text/javascript" src="js/mypage.js"></script>
 <script type="text/javascript">
$(function(){ //사진 혹은 동영상을 올리지 않았을때 숨김
   var a = document.getElementById("su").value;
   for(var i = 1;i<=30000; i++){
     $("#"+i).each(function() {
          var p = $(this).attr("src");
            if(p=="no"){
               document.getElementById(i).style.display='none';
            }
           });
     $("#v"+i).each(function() {
          var v = $(this).attr("src");
            if(v=="no"){
               document.getElementById("video"+i).style.display='none';
            }
           });}
})

function locch(){
   var loc = document.getElementById("location").value;
   if(loc !=""){
    $('#locinfo').text(loc);
    return true;
   }else{
      document.getElementById("alertmodal2").style.display = "block";
   return false}
}

var fullmodal =document.getElementById("picfullmodal");
var fullmodaltext =document.getElementById("picfullmodal-text");
var camera =document.getElementById("camera");
var picx = document.getElementById("picx");
var picchoice = document.getElementById("picchoice");
var picnum = 0;
var picnum2 = 0;
$('body').click(function(){
   if(picnum==1){
   if(picnum2==0){
      picchoice.style.visibility = "visible";
      picnum2 = 1;
   }else{
   picchoice.style.visibility = "hidden";
   picnum = 0;
   picnum2 = 0;
   }
   }
});
camera.onclick = function(){      //카메라를 클릭
    picchoice.style.visibility = "visible"; 
    picnum = 1;
}


function picfullmodal(arg){
   if(arg.src != "http://localhost:8090/SURF/img/profile.png"){
   fullmodal.style.display = "block";
   $('.picfullmodal-text').css('background-image','url('+arg.src+')')
   }
   }

fullmodal.onclick = function(){
   fullmodal.style.display = "none";
}
picx.onclick = function(){
   fullmodal.style.display = "none";
}


</script>

</body>
</html>