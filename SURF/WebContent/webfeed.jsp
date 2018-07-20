<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
   <c:if test = "${loginUser.username eq null}">
    <jsp:forward page="index.html"/>
    </c:if>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" type="text/css" href="css/feed.css" />
<title>SURF</title> <!--아이콘은 헤더JSP를 통해 설정해둠  -->
<%@ include file="include/header.jsp" %> <!--include를 통해 상위 고정 공간  -->
<style>
.alertmodal{
      display:none;
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
.alertmodal-text{
          margin-left:25%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 600px;
            height:200px;
            margin-top:100px;
         text-aling:center;
}

.changemodal{
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
.changemodal-text{
         margin-left:25%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 600px;
            height:400px;
            margin-top:100px;
         text-aling:center;
}
.pwchangeinpt{
width:330px;
height:30px;
margin-top:18px;
font-size:12px;
padding:0 0 0 20px;
position:relative;
margin-left:65px;
right:50px;
}
.loding{
   display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 100; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
   
}
.loding-img{
           margin-left:40%;
            width: 70px;
            height:70px;
            margin-top:20%;
            border-radius:50%; 

}
.reply-pf{
background-size :100%;
   background-position:center; 
   background-repeat : no-repeat;
   background-image:url(file_upload/프로필.jpg);
}
.reply-td1{
width:100%;
}
.reply-pf:hover,#replyb:hover{
cursor:pointer;
}

.replyxbtn{
float:right;
font-size:15px;
font-weight:bold;
color:#bdbdbd;
position:relative;
display:none;
}
.replyxbtn:hover{
color:gray;
cursor:pointer;
}
</style>

</head>

<body> 
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yy/MM/dd" /></c:set> 
<input type="hidden" value="${loginUser.userid }" id="ajaxuserid">
<input type="hidden" value="${today }" id="ajaxtoday">
<input type="hidden" value="${loginUser.profilepic }" id="ajaxprofilepic">
<input type="hidden" value="${loginUser.username }" id="ajaxusername">
<c:set var="today1"><fmt:formatDate value="${now}" pattern="yyyy/MM/dd" /></c:set> 
<input type="hidden" value="${today1 }" id="today1">

<div class="loding">
   <img src="img/surfer_insta_.gif" class="loding-img"/>
</div>
<div class="changemodal" id="changemodal">
   <div class="changemodal-text">
   <div style="width:100.2%;height:50px;background-color:#067DA1;color:white;font-size:20px;font-weight:bold;text-align:center;padding:10px 0 5px 0">비밀번호 변경</div>
   <br><br><br><p><h3 style="float:left;margin-left:35px;">새로운 비밀번호</h3><input type ="password" id="newpwd" class="pwchangeinpt" placeholder="비밀번호(8~24자리)" onkeyup="newpwdcheck()"> 
   <br><small style="color:green;position:relative;right:123px;top:10px;visibility:hidden;" id="newpwdtext">안전한 비밀번호 입니다.</small><br><h3 style="float:left;margin-left:35px;">비밀번호 확인</h3><input type ="password" id="newpwdcheck" class="pwchangeinpt" style="margin-left:85px;" placeholder="비밀번호 확인" onkeyup="newpwdcheckcheck()"> <br><br>
   <small style="color:green;position:relative;right:37px;bottom:15px;visibility:hidden;" id="newpwdchecktext">비밀번호가 일치합니다.</small><br>
   <div id="modalbtn" onclick="modalhide()" style="display:inline-block; width:120px;height:30px;background-color:#067DA1;text-align:center;color:white;padding-top:7px;margin-top:20px;cursor:pointer;">확인</div>
   </div>
</div>
   <div class="divmain" id="mainContent"> <!-- 메인 피드의 게시물 내용이 담김  -->
      <div class="divmain-content" style="margin-top: 100px; padding-bottom: 10px"> <!--최상위는 글쓰기란  -->
      <input type="text" id="userpwd1" value="${loginUser.userpwd}" style="display:none;">
      
      <form name="uploadform" action="write.do" method="post" enctype="multipart/form-data"> <!--파일업로드에 필요한 타입 속성  -->
       <input name="userid"  style="display: none;" value="${loginUser.userid}">   
       <input name="username" style="display: none;" value="${loginUser.username}">
       
       
         <div class="divmain-content-mid" >
            <textarea name="contents" id="texta" class="texta" placeholder="당신의 감정을 공유하세요" rows="8" cols="78" ></textarea>
          <p style="display: none" id="linkpath"> 삽입 할 링크 주소 : <input name="link" placeholder="www.aaa.com" type="text" /></p>
            <img id="pictemp"  style="margin-left: 70px; margin-bottom: 10px" width="400" height="auto" src="" alt="" /><br>
      <div class="uploadcheck" style="width:600px;"><!--업로드 형식 선택 부분  -->
      
      <div class="pic"    onclick="picclick()" style="font-weight:bold;cursor:pointer ;border-left-radius: 2px; text-align: center;  display: inline-block;float:left;width:190px; height:50px; border: 1px solid lightgray; ">
<input type="file"  id="picfile"  onchange="getCmaFileView()" value=""  accept="image/gif, image/jpeg, image/png" name="picfile" style="display:none; size: 50% ">
      <img alt="" src="img/cam.png" width="25px" height="20px" style="margin-top: 7%">&nbsp;사진</div>
      <div class="cam"   onclick="videoclick()"         style="font-weight:bold;cursor:pointer ;border-top-radius: 2px; text-align: center; display: inline-block;float:left; width:190px; height:50px; border: 1px solid lightgray; ">
<input  type="file" name="videofile" accept="video/*"  id="videofile" style="display:none; size: 50% ">
      <img alt="" src="img/movie.png" width="25px" height="20px" style="margin-top: 7%">&nbsp;동영상</div>
      <div class="link"   onclick="linkpath()"         style="font-weight:bold;cursor:pointer ;border-right-radius: 2px; text-align: center; display: inline-block;float:left; width:190px; height:50px; border: 1px solid lightgray; ">
      <img alt="" src="img/link.png" width="25px" height="20px" style="margin-top: 7%">&nbsp;링크</div>
      </div>   
         <br><br>
         </div>
         <div class="Content-upload" style="margin-top: 10px" > 
            <input type="button" value="취소" class="replybtn" onclick="cancel()" style="float: right; margin-right: 40px ">
            <input type="submit" value="올리기" class="replybtn" onclick="" style="float: right; margin-right: 10px">
            <select  name="pub" class="replybtn" onclick="" style="width:120px; float: left; margin-left: 36px">
            <option value="1">전체공개</option>
            <option value="2">친구만 공개</option>
            </select>
         </div>
           </form>
      </div>
 <% int a = 0; %>
      <c:forEach items="${list}" var="dto"> <!--for 문을 통해 dto의 게시물 내용을 불러옴  -->
       <% a++; %>
      <input type="hidden" id="boarduserid<%=a %>" value="${dto.userid }">
      
         <div class="divmain-content">
            <div class="divmain-content-top">
          
           <div  class="pf" id="pf<%=a %>" style="background-image : url(img/profile.png);"></div> <!--프로필 사진 구역  -->
            
               <div class="namedate">
                 <a href="friendinfo.do?fuserid=${dto.userid}&userid=${loginUser.userid}" style="text-decoration: none;color: black"> <b>${dto.name}</b></a><br>
                  <c:choose>
                  <c:when test="${fn:split(dto.date,',')[0] eq today }">   <!--오늘 날짜와 비교  -->
                                    ${fn:split(dto.date,',')[1]} 
                  </c:when>
                  <c:otherwise>
                                 ${fn:split(dto.date,',')[0]} 
                  </c:otherwise>
                  </c:choose>
               </div>
       <c:if test="${dto.userid eq loginUser.userid}">
      <div id="${dto.userid}"  class="icon" onclick="return del(this)">
     <a  style="text-decoration: none;color:black;" href="delete.do?tnum=${dto.tnum}&userid=${loginUser.userid}"> <img src="img/휴지통2.png" style="width:25px;height:20px;" id="trash" onmouseover="this.src='img/휴지통1.png'" onmouseout="this.src='img/휴지통2.png'">
      </a></div>
      </c:if>
      </div>
            <div class="divmain-content-mid" style="word-break:break-all;">
                  <img id="${dto.tnum}" alt="" src="${dto.picrealname}"  style="margin-left: 70px; margin-bottom: 10px" width="400" height="auto">
           <video  width="500" height="360" controls="controls" id="video${dto.tnum}">
    <source id="v${dto.tnum}" src="${dto.videorealname}" type="video/mp4" />
    <br>
</video><br>
  ${dto.content} <br>
  <c:if test="${dto.link ne null }">
  <p id="linkinsert"> 삽입 링크 : <A id="linkexist" href="http://${dto.link}" target="_blank">${dto.link}</A></p>
  </c:if>
  <c:if test="${dto.link eq null }">
  <br>
  </c:if>
               <div class="mid-icon" >
                  <img src="img/like.png" id="like<%=a%>" class="like" onmouseover="this.src='img/like3.png'" onmouseout="this.src='img/like.png'"
                	  onclick="likeplus(<%=a%>)"      style="width: 90%; height: 90%;">
               </div>
            </div>
            <div class="divmain-content-bottom">  <!--게시글 하단 부분 덧글란이 존재  -->
            <div id="likecount<%=a %>" style="font-size:14px;width:60px;height:30px;float:left;margin-left:20px;"><b>좋아요</b><span style="padding-left:3px;" id="likeform<%=a%>">0</span></div>
            <div id="replycount<%=a %>" style="font-size:14px;width:60px;height:30px;float:left;padding-left:20px;"><b>댓글</b><span style="padding-left:3px;" id="replysu<%=a%>">0</span></div>
            <input type="hidden" value="0" id="replycountnum<%=a%>">
            <table id="replyform<%=a %>" width="280px">
            
            </table>
               <input type="hidden" value="${loginUser.userid }" id="replyuserid<%=a %>">
               <input type="hidden" value="${loginUser.username }" id="replyusername<%=a %>">
               <input type="hidden" value="${dto.tnum }" id="replybnum<%=a %>">
               <input type="text" placeholder="댓글을 입력하세요." id="replycontent<%=a %>" class="replyinpt">
               <input type="button" value="전송" class="replybtn" onclick="replywrite1(<%=a%>)">
            </div>
         </div>
      </c:forEach>
 
   </div>
   <input id="su" name="su" style="display: none;" value="<%=a%>">
  <%@ include file="include/rightspace.jsp" %> <!-- include를 통해 오른쪽 친구 목록 및 쪽지가 표시될 공간 고정  -->
 <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <script type="text/javascript" src="js/feed.js"></script>
            <script>
 var request1 = new XMLHttpRequest();
  var request2 = new XMLHttpRequest(); 
 var replynum = 0;
 var su = document.getElementById("su").value;
 var index = 1;
 var pfindex = 1;
 
 $(function(){
	
   for(var z = 1;z<=7;z++){
 	     replyajax(z);
  	 	likeajax(z);
  	 	
   }
   
 });

 function replywrite1(num){
    replynum = num;
    
    var replyuserid = document.getElementById("replyuserid"+num).value;
    var replyusername = document.getElementById("replyusername"+num).value;
    var replybnum = document.getElementById("replybnum"+num).value;
    var replycontent = document.getElementById("replycontent"+num).value;
    $.ajax({
         type:"GET",
         url:'replywrite.do?userid='+replyuserid+'&username='+replyusername+'&bnum='+replybnum+'&content='+replycontent,
         datatype:"TEXT",
         success:function(data){
            replyajax(num);   
            }
         });
    
 }

 function replyajax(num){
    
    var replybnum = document.getElementById("replybnum"+num).value;
    index = num;
       request1.open("Post","./replyview.do?bnum="+encodeURIComponent(replybnum),false);
       request1.onreadystatechange = writeProcess;
       request1.send(null);
       
     }
 
 
 
 var xbtnindex = 0;
 function writeProcess(){
    var table = document.getElementById("replyform"+index);
    table.innerHTML = "";
    if(request1.readyState == 4 && request1.status == 200){
       var object = eval('('+request1.responseText+')');
       var result = object.result;
       /* result.append("[\"" + userlist.get(i).getUserid()+"\",");
       result.append("\""+userlist.get(i).getUsername()+"\",");
       result.append("\""+userlist.get(i).getRdate()+"\",");
       result.append("\""+userlist.get(i).getRnum()+"\",");
       result.append("\""+userlist.get(i).getBnum()+"\",");
       result.append("\""+userlist.get(i).getRcontent()+"\"],"); */
       document.getElementById("replycountnum"+index).value = result.length;
       document.getElementById("replysu"+index).innerHTML = result.length;
       if(document.getElementById("replycountnum"+index).value == 0){
         document.getElementById("replycount"+index).style.display = "none";
      }else{
       document.getElementById("replycount"+index).style.display = "block"
      }
       document.getElementById("replycontent"+index).value = "";
       
       for(var i = 0; i<result.length; i++){
          xbtnindex += 1;
          var row = table.insertRow(0);
          var cell = row.insertCell(0);
          var realrdate = null;
          var rdate = result[i][2].split(",");
          if(rdate[0]==document.getElementById("today1").value){
             realrdate = rdate[1];
          }else{
             realrdate = rdate[0];
          }
          
          $.ajax({
              type:"GET",
              url:'profile.do?userid='+result[i][0],
              datatype:"TEXT",
              async: false,
              success:function(data){
                 
          cell.innerHTML = "<div style='width:600px;height:30px;' class='hoverdiv' onmouseover='xbtnshow("+xbtnindex+")' onmouseout='xbtnhide("+xbtnindex+")'><input type='hidden' value='"+result[i][0]+"' id='ruserid"+xbtnindex+"'><a href='friendinfo.do?fuserid="+result[i][0]+"&userid="+document.getElementById("ajaxuserid").value+"' style='text-decoration: none;color: black'><div class='reply-pf' style='background-image:url("+data+");border-radius:50%;height:35px;width:35px;float:left;margin-left:35px;font-size:13px;'></div><b style='float:left;padding-left:15px;font-size:14px' id='replyb'>"+result[i][1]+"</a><span style='cursor:auto;font-size:13px;color:#bdbdbd;position:relative;left:7px;'>"+realrdate+"</span></b><p style='float:left;font-size:13px;position:relative;top:7px;right:90px;'>"+result[i][5]+"</p><span class='replyxbtn' id='xbtn"+xbtnindex+"' onclick='delreply("+result[i][3]+")'>X</span></div>";

                 }
              });
       }
      }
    } 
 function delreply(num){
    $.ajax({
         type:"GET",
         url:'delreply.do?rnum='+num,
         datatype:"TEXT",
         async: false,
         success:function(data){
            for(var z = 1;z<=30;z++){
                 replyajax(z);
              }
            }
         });
    
 }
 function xbtnshow(num){
    if(document.getElementById("ajaxuserid").value == document.getElementById("ruserid"+num).value){
    document.getElementById("xbtn"+num).style.display = "block";
    }
    
 }
 function xbtnhide(num){
    
    document.getElementById("xbtn"+num).style.display = "none";
 }
 
 
 function likeplus(num){
	 
    var likeimg = document.getElementById("like"+num).src;
    var replyuserid = document.getElementById("replyuserid"+num).value;
    var tnum = document.getElementById("replybnum"+num).value;
    $.ajax({
    	
         type:"GET",
         url:'likeplus.do?userid='+replyuserid+'&tnum='+tnum,
         datatype:"TEXT",
         success:function(data){
            likeajax(num);   
            
            }
         });
 }

 
  function likeajax(num){
	  var like = document.getElementById("likeform"+num);
	    var tnum = document.getElementById("replybnum"+num).value;
	       $.ajax({
	           type:"GET",
	           url:"likeview.do?tnum="+encodeURIComponent(tnum),
	        	async: false,
	           datatype:"TEXT",
	           success:function(data){
	            like.innerHTML = data;
	              }
	           });
	       
	       
	     } 
 $(function(){
	 for(var a =1 ; a<=7 ; a++){
		 var liketext = document.getElementById("likecount"+a);
		if(document.getElementById("likeform"+a).innerHTML ==0){
			liketext.style.display = "none";
		} else{
			liketext.style.display = "block";
		}
	 }
 });
 </script>
</body>
</html>