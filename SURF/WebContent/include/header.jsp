<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="img/vicon.ico" /><!--페이지 상단아이콘지정  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
z-index:30;
}

.alertmodal , .alertmodal2{
		display:none;
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
.alertmodal-text{
			 margin-left:25%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 600px;
            height:200px;
            margin-top:100px;
         text-aling:center;
}
.alarmpage::-webkit-scrollbar { 
    display: none; 
}
.friendsearchpage::-webkit-scrollbar { 
    display: none; 
}
.alarm{
         display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 50; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
         text-align:right;
}
.alarmpage{
         background-color: #fefefe;
            border: 1.5px solid #BDBDBD;
            width: 250px;
            height:300px;
            margin-top:37px;
            display:inline-block;
         margin-right:35px;
         overflow-y:scroll;
         
}
.friend-search{
         display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 50; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
         text-align:right;
}
.friendsearchpage{
            background-color: #fefefe;
            
            width: 170px;
            height:auto;
            min-height:-5px;
            max-height:210px;
            margin-top:40px;
            display:inline-block;
            margin-right:136px;
            overflow-y:scroll;
         
}
.pf1{
   border-radius: 50%;
   height: 40px;
   width: 40px;
   background-color: #EAEAEA;
   background-size :100%;
   background-position:center; 
   background-repeat : no-repeat;
   float:left;
   background-image : url(img/profile.png);
}
.pf2{
   border-radius: 50%;
   height: 30px;
   width: 30px;
   background-color: #EAEAEA;
   background-size :100%;
   background-position:center; 
   background-repeat : no-repeat;
   float:left;
   margin-left:10px;
   background-image : url(img/profile.png);
}
.td1:hover{
  background-color:#EAEAEA;
  cursor:pointer;
}
.ftd{
width:100%;
height:40px;
border-bottom:1px solid #BDBDBD;
}
.ftd:hover{
background-color:#EAEAEA;
  cursor:pointer;
}
</style>

</head>
<body>
<div class="alertmodal" id="alertmodal">
   <div class="alertmodal-text">
   <div style=" width:100%;height:50px;background-color:white;color:white;font-size:20px;font-weight:bold;text-align:center;padding:10px 0 5px 0"><img alt="" src="img/surflogo.png" width="115px" height="35px"
     style="margin-left: 0.5%; margin-top: 0.3%"></div>
     <h3>프로필 설정에서 서핑 지역을 먼저 설정해주세요!</h3>
   <div id="modalbtn" onclick="window.location='info.do?userid=${loginUser.userid }'" style=" display:inline-block; width:120px;height:30px;background-color:#067DA1;text-align:center;color:white;padding-top:7px;margin-top:20px;cursor:pointer;">확인</div>
   </div>
</div>
<div class="alertmodal2" id="alertmodal2">
   <div class="alertmodal-text">
   <div style=" width:100%;height:50px;background-color:white;color:white;font-size:20px;font-weight:bold;text-align:center;padding:10px 0 5px 0"><img alt="" src="img/surflogo.png" width="115px" height="35px"
     style="margin-left: 0.5%; margin-top: 0.3%"></div>
     <h3>지역을 선택해주세요!</h3>
   <div id="modalbtn" onclick="window.location='info.do?userid=${loginUser.userid }'" style=" display:inline-block; width:120px;height:30px;background-color:#067DA1;text-align:center;color:white;padding-top:7px;margin-top:20px;cursor:pointer;">확인</div>
   </div>
</div>
<script type="text/javascript">
function addr(){
	var userid =  $("#userid11").val();
	var randomuserid = $("#randomuserid").val();
	var surfaddress = $("#surfaddress").val();
	if(surfaddress=="설정안함"){
		   document.getElementById("alertmodal").style.display = "block";
		return false;
	}else{
		 $('.loding').css('display','block');
		setTimeout(function() {
			   $('.loding').css('display','none');
			   window.location='friendinfo.do?fuserid='+randomuserid+'&userid='+userid;
		      }, 1000)
		
	}
}
/* function aa(arg){
      if(arg.name=="img"){
         arg.src= "img/surfer_insta_.gif";
         arg.name= "img2";
      }else{
         arg.src= "img/surfer_insta.jpg";
         arg.name="img";
      }
} */
</script>

<div class="topdiv" style="z-index:20;"> <!--상위 메뉴 -->
<input id="userid11" value="${loginUser.userid}" type="hidden">
<input id="surfaddress" value="${loginUser.surfaddress}" type="hidden">
    <a href="feed.do?userid=${loginUser.userid}"><img alt="" src="img/surflogo.png" width="115px" height="35px"
     style="margin-left: 0.5%; margin-top: 0.3%"></a> 
<%
		int m = 0;
%>
     <c:forEach items="${randomfriend}" var="friend">
		<%  m ++;%> 
     </c:forEach>  
     <% if(m!=0){ %>
       <c:set var="length" value="<%=m%>"></c:set>
     <% int su = (new Random().nextInt(m)); %>
   
  <c:set var="num" value="<%=su%>"></c:set><% }%>
  
  <input id="randomuserid" value="${randomfriend[num].userid}" type="hidden">
     
    <a href="#" onclick="return addr();"><img onclick="aa(this)" name="img"  style="position:absolute; ;margin-left: 34%; margin-top: 2px; border-radius: 50%" src="img/surfer_insta.jpg" width="40" height="40"> 
     </a>
        
        <div style="float:right; border-radius:50%; width:34px;height:34px;background-image:url(img/알림icon.PNG);background-size :100%;background-position:center;background-repeat:no-repeat;margin-top:5px;margin-right:20px;cursor:pointer;" id="alarmicon"></div>
        <div style="float:right; z-index:10; border-radius:50%;width:17px;height:17px;background-color:red;color:white;text-align:center;position:relative;font-weight:bold;top:27px;left:35px;padding-bottom:3px;padding-right:2px;padding-left:2px;">
        1</div> <!--새로운 알람의 개수만큼 변경해줘야됨. -->
       <input class="searchb"   type="button" value="검색" style="float: right; color:skyblue; background-color: white; margin-top: 15px ;margin-right: 46px;outline: none; "> 
     <input class="search" type="text" placeholder="친구 검색" id="searchtext" style="border: 0px; border-bottom: 2.5px solid #C3C3C3 ; float: right ;margin-top: 15px ;margin-right: -5px" onkeyup="fsearch()" onfocus="fsearch()">
     </div>
         <!--  ------------------친구검색창---------------------> 
      <div class="friend-search" id="friendsearch">
           <div class="friendsearchpage">
              <table>
                 <tbody id="ajaxTable">
                 <tr>
                    <td style="text-align:center;padding-top:2px;"><p>결과가 없습니다.</p></td>
                 </tr>
                 </tbody>
              </table>
           </div>
        </div>
           
         <!--  ------------------친구검색창끝 ------------------->
         <!--  -------------------알림창-------------------- -->
     <div class="alarm" id="alarm">
        <div class="alarmpage">
        <table id="alarmtable">
           <tr>
           <td style="background-color:#eaeaea;"><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;"><b>황남욱</b>님이 게시물에  댓글을 남겼습니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물을 좋아합니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물에 댓글을 남겼습니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 댓글의 답글을 달았습니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물을 좋아합니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물을 좋아합니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물을 좋아합니다.</p>
           </div></td>
           </tr>
           <tr>
           <td><div style="width:100%;height:45px;border-bottom:1px solid #BDBDBD;text-align:left;">
           <div class="pf1"></div><p style="font-size:13px;padding-top:3px;margin-left:5px;"><b>황남욱</b>님이 게시물을 좋아합니다.</p>
           </div></td>
           </tr>
            
        </table>
        <div style="text-align:center;width:100%;height:auto;margin-top:130px;font-size:14px;font-weight:bold;color:#bdbdbd;display:none;">최근알람이 없습니다.</div>
        </div>
         <!--  ---------------------알림창------------------ -->
     
     </div> 
      <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
     <script>
     var alarmicon = document.getElementById("alarmicon");
     var alarm = document.getElementById("alarm");
     var fs = document.getElementById("friendsearch");
     var request = new XMLHttpRequest();
     function fsearch(){
       
         if(document.getElementById("searchtext").value==""){
            fs.style.display = "none"; 
         }
         else{
            fs.style.display = "block";
           request.open("Post","./fsearch.do?username="+encodeURIComponent(document.getElementById("searchtext").value),true);
           request.onreadystatechange = searchProcess;
           request.send(null);
           
         }
     }
     function searchProcess(){
        
        var table = document.getElementById("ajaxTable");
        var userid = document.getElementById("userid11").value;
        table.innerHTML = "";
        if(request.readyState == 4 && request.status == 200){
          
           var object = eval('('+request.responseText+')');
           var result = object.result;
           
           
           for(var i = 0; i<result.length; i++){
              
              var row = table.insertRow(0);
              var cell = row.insertCell(0);
              cell.innerHTML = "<a href='friendinfo.do?fuserid="+result[i][0]+"&userid="+userid+"' style='color:black;'><td class = 'ftd' id="+result[i][0]+" ><div  class='pf2' style='background-image:url("+result[i][2]+");'></div><b style=' font-size:17px;padding-top:3px;float:left;margin-left:15px;'>"+result[i][1]+"</b></td></a>";
           }
       
          }
        }   
     
   
     
     fs.onclick = function(){
        fs.style.display = "none";
     }
     alarmicon.onclick =function(){         
           alarm.style.display = "block";
      }
   
    alarm.onclick = function(){
          alarm.style.display = "none";
       
    }
     </script>
</body>
</html>