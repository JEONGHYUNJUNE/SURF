<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.message1::-webkit-scrollbar { 
    display: none; 
}
.memlist::-webkit-scrollbar { 
    display: none; 
}
.textarea1::-webkit-scrollbar { 
    display: none; 
}


.friendlist{
width:100%;
height:450px;
overflow-x:hidden;
padding:0 0 0 10px;
}
.addfriend{
width:100%;
height:450px;
overflow-x:hidden;
padding:0 0 0 10px;
}
.message1{
width:100%;
height:450px;
overflow-x:hidden;
padding:0 0 0 10px;
}
table{
width:100%;
}
td{
border-bottom:1px soild gray;

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
   margin-left:10px;
   background-image : url(img/profile.png);
}
.pfname{
  float:left;
  margin-top:10px;
  margin-left:12px;
  font-size:15px;
  font-weight:bold;
}
.messagewrite{
   width:50%;
   margin-left:25%;
   border:1px solid #BDBDBD; 
   text-align:center; 
   margin-top:10px; 
   font-size:15px; 
   font-weight:bold;
   background-color:#E0E0E0;
   padding:1px;
}
.messagewrite:hover{
   background-color:#D5D5D5;
   cursor:pointer;
}
.recieve:hover{
background-color:#E0E0E0;
cursor:pointer;
}

/* ------------------모달------------------ */
 .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 150; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            text-align:center;
        }
        /* Modal Content/Box */
        @media (min-width: 800px)  {  /* 미디어 쿼리를 이용해 윈도우 창 변경에 따른 css 적용 */
             .modal-content {
            z-index:200;
            margin-left:40%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 350px;
            height:500px;
            margin-top:100px;
             /* Could be more or less, depending on screen size */                          
        }
           .modal-messageView {
            z-index:200;
              margin-left:40%;
           display:inline-block;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 350px;
            height:500px;
            margin-top:100px;
             /* Could be more or less, depending on screen size */                          
        }
           .memlist{
           display:none;
           z-index:201;
           margin-left:42%;
           width:300px;
           height:auto;
           min-height:35px;
           max-height:100px;
           margin-top:180px;
           background-color:white;
           position:absolute;
           overflow-y:auto;
           }
           .msg-write-success{
           display:block;
           z-index:201;
           margin-left:42%;
           width:300px;
           height:120px;
           margin-top:280px;
           background-color:white;
           position:absolute;
           text-align:center;
           }
      }
      @media  (max-width: 800px) {
       .modal-content {
        z-index:200;
           margin-left:20%;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 350px;
            height:500px;
            margin-top:100px;
             /* Could be more or less, depending on screen size */                          
        }
           .modal-messageView {
            z-index:200;
              margin-left:20%;
           display:inline-block;
            background-color: #fefefe;
            border: 1px solid #888;
            width: 350px;
            height:500px;
            margin-top:100px;
             /* Could be more or less, depending on screen size */                          
        }
        .memlist{
        display:none;
           z-index:201;
           margin-left:22%;
           width:300px;
           height:auto;
           min-height:35px;
           max-height:100px;
           margin-top:180px;
           background-color:white;
           position:absolute;
           overflow-y:auto;
           }
        .msg-write-success{
           display:none;
           z-index:201;
           margin-left:23%;
           width:300px;
           height:120px;
           margin-top:280px;
           background-color:white;
           position:absolute;
           text-align:center;
           }   
      }
        .msg-write-success-text{
        display:inline-block;
        margin-top:40px;
        font-size:22px;
        font-weight:bold;
        width:100%;
        height:30px;
        }
        .msg-write-btn{
        display:inline-block;
        width:100px;
        height:30px;
        color:white;
        font-size:17px;
        margin-top:15px;
        padding-top:3px;
        background-color:#067DA1;
        border-radius:2%;
        font-weight:bold;
        cursor:pointer;
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .sendid:focus{
           outline:none;
        }
        #messagetext:focus{
           outline:none;
        }
   .option{
         display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 150; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
   }
   .option-content{
            background-color: #fefefe;
            border: 2px solid #BDBDBD;
            width: 100px;
            height:100px;
            margin-top:85px;
            margin-left:76%;
   }
   .option-content-tap{
      width:99%;
      height:28%;
      text-align:center;
      padding-top:4px;
      font-size:13px;
      font-weight:bold;
   }
   .option-content-tap:hover{
      cursor:pointer;
      background-color:#eaeaea;
   }
   
   .td:hover{
   cursor:pointer;
   }
   .vbtn{
   display:none;
   float:right;
   border-radius:50%;
   text-align:center;
   font-weight:bold;
   width:20px;
   height:20px;
   border:3px solid #FFC19E;
   margin-top:5px;
   margin-right:30px;
   color:#FFC19E;
   }
   .xbtn{
   display:none;
   float:right;
   border-radius:50%;
   text-align:center;
   font-weight:bold;
   width:20px;
   height:20px;
   border:3px solid #BDBDBD;
   margin-top:5px;
   margin-right:10px;
   color:#BDBDBD;
   }
   .xbtn:hover{
   border:3px solid #ABABAB;
   color:#ABABAB;
   }
   .vbtn:hover{
   border:3px solid #EDAF8C;
   color:#EDAF8C;
   }
  
}

</style>

</head>
<body onload="urlchange()">

<div class="divfriend">
<img src ="img/톱니.png" width="20" height="20" style="margin-top: 10px ; margin-left: 10px; cursor: pointer;" id="optionbtn"><br>  <!-- 설정 버튼 -->
<A href="info.do?userid=${loginUser.userid }"><img alt="" src="${loginUser.profilepic}" width="70" height="70" style="border-radius:50% ; margin-left: 40% ;margin-top: 15% ; cursor: pointer;" ><br><!-- 프로필 사진-  --></A>
<input type="hidden" value="${loginUser.userid }" id="loginuserid1">
<strong onclick="window.location='info.do?userid=${loginUser.userid }'" style="margin-left: 44%; cursor: pointer;">${loginUser.username}</strong>
<br><br><Br>
<div class="friendnmessage" style="display: flex;"> <!--display flex 로 자식 div를 정렬시킴  -->
<div onclick="f()" id="f"   class="friend" align="center" style="cursor:pointer; display: inline-block; width:100px; height:30px; border-top: 1px solid blue ;  border-right: 1px solid #C3C3C3">친구</div>
<div onclick="plusf()" id="plusf"   class="plusf" align="center" style="cursor:pointer; display: inline-block;width:98px;height:30px;  border-bottom:1px solid #C3C3C3; border-right: 1px solid #C3C3C3">신청</div>
<div onclick="msg()" id="msg"   class="message" align="center" style="cursor:pointer;  display: inline-block;  border-bottom:1px solid #C3C3C3 ;  width: 100px;height:30px;">쪽지</div>
</div>
<!-- -----------------------------친구목록 시작-------------------------- -->
<div class="friendlist" style="display:block;">
<br>
<table>
<% int z = 0; %>
    <c:forEach items="${friendlist}" var="friend">
      <% z++; %>
     <tr>
      <td class="td"><a style="color:black" href="friendinfo.do?fuserid=${friend.userid}&userid=${loginUser.userid}"><div class="pf1" id="friend<%=z%>"></div><p class="pfname">${friend.name }</p></a>
      <input type="hidden" value="${friend.userid }" id="userid<%=z%>">
      </td>
       <tr>
      
    </c:forEach>
    <small style="color:#A6A6A6;">내 친구 <%=z %></small>
    
</table>

</div>
 <!-- -----------------------------친구목록 끝-------------------------- -->
 <!-- -----------------------------친구신청 시작-------------------------- -->
 <div class="addfriend" style="display:none;">
 <br>
<table>
  <% int i = 0 ; %>
   <c:forEach items="${sendlist}" var="friend">
    <% i++; %>
     
     <tr>
     
      <td class="td" id="${friend.num }" onmouseover="vxbtnShow(this)" onmouseout = "vxbtnHide(this)"><a style="color:black" href="friendinfo.do?fuserid=${friend.userid}&userid=${loginUser.userid}"><div class="pf1" id="send<%=i%>"></div><p class="pfname">${friend.name}</p></a>
      <div class="xbtn" id="xbtn${friend.num}" style="margin-right:35px;" onclick="fdelete1(<%=i%>)">X</div>
      <input type="text" value="${friend.userid}" id="senduserid<%=i %>" style="display:none">
      </td>
   </tr>
     
   
    </c:forEach>
  <small style="color:#A6A6A6;">보낸 신청 <%=i %> </small>
 
</table>
   

 <br>
<table>
<% int j = 0; %>
   <c:forEach items="${receivelist}" var="friend">
   <% j++; %>
     <tr>
      <td class="td" id="${friend.num }" onmouseover="vxbtnShow(this)" onmouseout = "vxbtnHide(this)"><a style="color:black" href="friendinfo.do?fuserid=${friend.userid}&userid=${loginUser.userid}"><div class="pf1" id="receive<%=j%>"></div><p class="pfname">${friend.name }</p></a>
      <div class="vbtn" id="vbtn${friend.num}" onclick="friendadd(<%=j%>)">V</div>
      <div class="xbtn" id="xbtn${friend.num}" onclick="fdelete2(<%=j%>)">X</div>
      <input type="hidden" value="${friend.userid}" id="receiveuserid<%=j%>">
      </td>
   </tr>
   
    </c:forEach>
    <small style="color:#A6A6A6;">받은 신청 <%=j %></small>
</table>

 </div>
 <!-- -----------------------------친구신청 끝-------------------------- -->
 <!-- -----------------------------쪽지함 시작-------------------------- -->
     <div class="message1" style="display:none;padding:0;">
        <div class="messagewrite" id="myBtn">작성</div>
        <div class="messageForm" style="width:100%;height:auto;min-height:180px;">

      <table style="padding:2px;">
      <% int r = 0; %>
      <c:forEach items="${rmessagelist}" var="rmsg">
      <% r++; %>
             <tr>
               <td><div class="recieve" style="width:120%;height:40px;position:relative;right:10px;padding:5px;" onclick="recievemessageshow(<%=r%>)">
         <div class="pf1" style="position:relative;left:15px;" id="rpf<%=r%>"></div><p class="pfname" style="font-size:14px;position:relative;left:15px;bottom:7px;" id="writename<%=r%>">${rmsg.writename}</p><br>
         <p class="pfname" style="font-size:12px;position:relative;right:39px;bottom:7px;color:#A6A6A6;">${rmsg.mdate1} ${rmsg.mdate2}</p>
         <input type="hidden" id="rmcontent<%=r %>" value="${rmsg.mcontent}">
         <input type="hidden" id="rmwriteid<%=r %>" value="${rmsg.writeid }">
         <input type="hidden" id="rmrecieveid<%=r %>" value="${rmsg.recieveid }">
         <input type="hidden" id="rattr<%=r %>" value="${rmsg.readattr }">
         </div></td>
            </tr>
       </c:forEach>
        <small style="color:#A6A6A6;text-align:left;margin-left:10px;">받은 쪽지 <%=r %></small>
      </table>   
        <% int w = 0;%>
      <table style="padding:2px;">
            <c:forEach items="${wmessagelist}" var="rmsg">
            <% w++; %>
            <tr>
               <td><div class="recieve" style="width:120%;height:40px;position:relative;right:10px;padding:5px;" onclick="writemessageshow(<%=w%>)">
                  <div class="pf1" style="position:relative;left:15px;" id="wpf<%=w%>"></div><p class="pfname" style="font-size:14px;position:relative;left:15px;bottom:7px;" id="recievename<%=w%>">${rmsg.recievename}</p><br>
                  <p class="pfname" style="font-size:12px;position:relative;right:39px;bottom:7px;color:#A6A6A6;">${rmsg.mdate1} ${rmsg.mdate2}</p>
               <input type="hidden" id="wmcontent<%=w %>" value="${rmsg.mcontent}">
              <input type="hidden" id="wmwriteid<%=w %>" value="${rmsg.writeid }">
               <input type="hidden" id="wmrecieveid<%=w %>" value="${rmsg.recieveid }">
               <input type="hidden" id="wattr<%=w %>" value="${rmsg.readattr }">
               </div></td>
            </tr>
            </c:forEach>
             <small style="color:#A6A6A6;margin-left:10px;">보낸 쪽지 <%=w %></small>
   
      </table>   
           <p class="nomessage" style="margin-top:200px;display:none;color:#A6A6A6;">친구에게 쪽지를 보내보세요.</p>
        </div>
     </div>
 </div> 
 <input type="hidden" value="<%=i %>" id="sendnum">
 <input type="hidden" value="<%=j %>" id="receivenum">
  <input type="hidden" value="<%=z %>" id="friendnum">
  <input type="hidden" value="<%=w %>" id="sendmsgnum">
  <input type="hidden" value="<%=r %>" id="receivemsgnum">
 <!-- --------------------쪽지쓰기모달--------------------- -->

<div id="myModal" class="modal">
      <!-- Modal content -->
     <div class="msg-write-success" id="msgsuc" style="display:none;">
        <div class="msg-write-success-text" id="msgtext">쪽지 작성이 완료되었어요</div>
        <div class="msg-write-btn" id="msgbtn">닫기</div>
     </div>
     <div class="memlist" id="memlist">
          <table>
                 <tbody id="ajaxTable1">
                 <tr>
                    <td style="width:100%;height:30px;">결과가 없습니다.</td>
                 </tr>
                 </tbody>
         </table>
      </div>
      <div class="modal-content" id="modal-Content" style="display:none;">
         <input type="hidden" value="${loginUser.userid }" id="loginUserid1">
        <div style="width:100%;height:40px;border-bottom:1px solid #BDBDBD"><span style="font-size:15px; font-weight:bold; position:relative; right:100px;top:12px;" id="messageTitle">새 쪽지 작성</span><span class="close" style="position:relative; right:20px;">&times;</span></div>                                                              
        <div style="width:100%;height:50px;border-bottom:1px solid #bdbdbd"><input class="sendid" id="sendid" type="text" placeholder="받는 사람" style="color:gray;font-weight:bold;width:93%;height:48px;border:0px;padding-left:25px;" onkeyup="memlist(this)"></div>
         <div style="width:100%;height:330px;border-bottom:1px solid #bdbdbd; background-color:#067DA1;text-align:center;">
         <textarea class="textarea1" style="width:auto;height:250px;display:inline-block;color:white;font-size:30px;margin-top:50px;border:0px;background-color:#067DA1;text-align:center;" id="messagetext"></textarea>
         </div>
         <div style="width:100%;height:78px;text-align:center;"><div onclick="msgwrite()" style="cursor:pointer;width:300px;height:40px;background-color:#FFC19E;display:inline-block;margin-top:20px;color:white;text-align:center;font-weight:bold;font-size:14px;"><p style="margin-top:8px;">보내기</p></div></div>
      </div>
      <div class="modal-messageView" id="modal-messageView" style="display:none;">
        <div style="width:100%;height:40px;border-bottom:1px solid #BDBDBD"><span style="font-size:15px; font-weight:bold; position:relative; right:100px;top:12px;">쪽지 읽기</span><span class="close" style="position:relative; right:20px;">&times;</span></div>                                                              
        <div style="width:100%;height:50px;border-bottom:1px solid #bdbdbd"><input id="wrname" class="sendid" type="text" style="width:93%;height:48px;border:0px;padding-left:25px;"  value="작성자" readonly></div>
        <input type="hidden" value="" id = "writeid" name="writeid">
        <input type="hidden" value="" id="recieveid" name="recieveid">
         <div style="width:100%;height:330px;border-bottom:1px solid #bdbdbd; background-color:#067DA1;text-align:center;">
         <textarea class="textarea1" disabled="disabled" style="width:auto;height:250px;display:inline-block;color:white;font-size:30px;margin-top:50px;border:0px;background-color:#067DA1;text-align:center;" id="messagetext1">쪽지 내용</textarea>
         </div>
         <div style="width:100%;height:78px;text-align:center;"><div id="resend" style="cursor:pointer;width:300px;height:40px;background-color:#FFC19E;display:inline-block;margin-top:20px;color:white;text-align:center;font-weight:bold;font-size:14px;"><p style="margin-top:8px;" id="msgbtn">답장 하기</p></div></div>
      </div>
 
    </div>
    <input id="userid11" value="${loginUser.userid}" type="hidden">
    <input type="hidden" value="" id="messageid">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
    var memlist1 = document.getElementById("memlist");
    var request = new XMLHttpRequest();
    var messageid = document.getElementById("messageid");
    var sendid = document.getElementById("sendid");
    function memlist(arg){
      
        if(arg.value==""){
           memlist1.style.display = "none"; 
        }
        else{
           memlist1.style.display = "block";
           sendid.style.color = "gray";
          request.open("Post","./fsearch.do?username="+encodeURIComponent(arg.value),true);
          request.onreadystatechange = searchProcessone;
          request.send(null);
          
        }
    }
    function searchProcessone(){
       
       var table = document.getElementById("ajaxTable1");
       var userid = document.getElementById("userid11").value;
       table.innerHTML = "";
       if(request.readyState == 4 && request.status == 200){
         
          var object = eval('('+request.responseText+')');
          var result = object.result;
          
          
          for(var i = 0; i<result.length; i++){
            
             var row = table.insertRow(0);
             var cell = row.insertCell(0);
             cell.innerHTML = "<td><div  class='pf2' style='background-image:url("+result[i][2]+");' id='"+result[i][0]+"' onclick='memberpic(this)'></div><b style=' font-size:17px;padding-top:3px;float:left;margin-left:15px;' id='"+result[i][0]+"' onclick='memberpic(this)'>"+result[i][1]+"</b></td>";
            
          }
      
         }
       }   
    function memberpic(arg){
       sendid.value = arg.innerHTML;
       sendid.style.color = "black";
       messageid.value = arg.id;
       memlist1.style.display = "none";
       
       
    }
  
    function msgwrite(){
       var mwriteid = document.getElementById("loginUserid1").value;
       var mrecieveid = document.getElementById("sendid").value;
       var mcontent = document.getElementById("messagetext").value;
          var msgsuc = document.getElementById("msgsuc");
          var msgtext = document.getElementById("msgtext");
          
          if(sendid.style.color == "black"){
         $.ajax({
              type:"GET",
              url:'messagewrite.do?wid='+mwriteid+'&rid='+messageid.value+'&content='+mcontent,
              datatype:"TEXT",
              success:function(data){
                if(data=="success"){
                   msgtext.innerHTML = "쪽지 작성이 완료되었어요";
                   msgsuc.style.display ="block";
                }
                }
              }); 
         }else{
            msgtext.innerHTML = "받는이를 선택해주세요";
            msgsuc.style.display ="block";
         }
       
    }
    function friendadd(data){
       var fid = document.getElementById("receiveuserid"+data).value;
       var loginuserid = document.getElementById("loginuserid1").value;
    
       $.ajax({
           type:"GET",
           url:'friendadd.do?loginid='+loginuserid+'&fid='+fid,
           datatype:"TEXT",
           success:function(data){
             if(data=="success"){
                 window.location.reload();
             }
             }
           }); 
    }
    function fdelete1(data){
       
        var fid = document.getElementById("senduserid"+data).value;
        var loginuserid = document.getElementById("loginuserid1").value;
        $.ajax({
            type:"GET",
            url:'fdelete.do?loginid='+loginuserid+'&fid='+fid,
            datatype:"TEXT",
            success:function(data){
              if(data=="success"){
                  window.location.reload();
              }
              }
            }); 
     }
    function fdelete2(data){
        var fid = document.getElementById("receiveuserid"+data).value;
        var loginuserid = document.getElementById("loginuserid1").value;
        $.ajax({
            type:"GET",
            url:'fdelete.do?loginid='+loginuserid+'&fid='+fid,
            datatype:"TEXT",
            success:function(data){
              if(data=="success"){
                  window.location.reload();
              }
              }
            }); 
     }
    
   $(function(){
   var sendnum = document.getElementById("sendnum").value;
   var receivenum = document.getElementById("receivenum").value;
   var friendnum = document.getElementById("friendnum").value;
   var receivemsgnum = document.getElementById("receivemsgnum").value;
   var sendmsgnum = document.getElementById("sendmsgnum").value;
   var send = 1;
   var receive = 1;
   var friend = 1;
   var sendmsg = 1;
   var receivemsg = 1;
   for(var i =1;i<=receivemsgnum;i++){
        $.ajax({
            type:"GET",
            url:'profile.do?userid='+document.getElementById("rmwriteid"+i).value,
            datatype:'application/x-www-form-urlencoded; charset=UTF-8',
            async: false,
            success:function(data){
               $('#rpf'+receivemsg).css('background-image','url('+data+')');   
                 receivemsg = receivemsg + 1;
                 
               }
            }); 
       
       
        }   for(var i =1;i<=sendmsgnum;i++){
            $.ajax({
                type:"GET",
                url:'profile.do?userid='+document.getElementById("wmrecieveid"+i).value,
                datatype:'application/x-www-form-urlencoded; charset=UTF-8',
                async: false,
                success:function(data){
                   $('#wpf'+sendmsg).css('background-image','url('+data+')');   
                     sendmsg = sendmsg + 1;
                   }
                }); 
           
           
            } 
   for(var i =1;i<=sendnum;i++){
       $.ajax({
           type:"GET",
           url:'profile.do?userid='+document.getElementById("senduserid"+i).value,
           datatype:"TEXT",
           async: false,
           success:function(data){
              $('#send'+send).css('background-image','url('+data+')');   
                send=send+1;
              }
           }); 
       }
   
    for(var i =1;i<=receivenum;i++){
          $.ajax({
              type:"GET",
              url:'profile.do?userid='+document.getElementById("receiveuserid"+i).value,
              datatype:"TEXT",
              async: false,
              success:function(data){
                 $('#receive'+receive).css('background-image','url('+data+')');   
                   receive = receive + 1;
                 }
              }); 
         
         
          } 
    for(var i =1;i<=friendnum;i++){
          $.ajax({
              type:"GET",
              url:'profile.do?userid='+document.getElementById("userid"+i).value,
              datatype:'application/x-www-form-urlencoded; charset=UTF-8',
              async: false,
              success:function(data){
                 $('#friend'+friend).css('background-image','url('+data+')');   
                   friend = friend + 1;
                 }
              }); 
         
         
          } 
    
   
});
</script>
    <!-- --------------------쪽지쓰기모달--------------------- -->
   <div class="option" id="option">
      <div class="option-content">
         <div class="option-content-tap" style="border-bottom:1px solid #BDBDBD;">프로필 설정</div>
         <div class="option-content-tap" style="border-bottom:1px solid #BDBDBD;" onclick="window.location='./option.do?userid=${loginUser.userid}'">일반 설정</div>
         <div class="option-content-tap" onclick="window.location='logout.do'">로그아웃</div> <!--세션 로그아웃도 시켜야함 -->
      </div>
   </div>
<script>
var btn1 = document.getElementById("optionbtn");
var option = document.getElementById("option");
var modal = document.getElementById('myModal');
var modalContent = document.getElementById("modal-Content");
var modalmessageView = document.getElementById("modal-messageView");
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
var resend = document.getElementById("resend");
var messageTitle = document.getElementById("messageTitle");
var writename = document.getElementById("writename");
var msgboolean = true;
var msgbtn = document.getElementById("msgbtn");
var writeid1 = null;
function recievemessageshow(num){
      var name = document.getElementById("writename"+num).innerHTML;
      var writename = document.getElementById("wrname");
      var content = document.getElementById("rmcontent"+num).value;
      var writecontent = document.getElementById("messagetext1");
      var writeid = document.getElementById("rmwriteid"+num).value;
      writeid1 = writeid;
      writecontent.innerHTML = content;
      writename.value = name;
      modal.style.display = "block";
      modalContent.style.display = "none";
      modalmessageView.style.display = "block";
      msgbtn.innerHTML = "답장 하기";
      msgboolean = true;   
}

function writemessageshow(num){
    var name = document.getElementById("recievename"+num).innerHTML;
      var writename = document.getElementById("wrname");
      var content = document.getElementById("wmcontent"+num).value;
      var writecontent = document.getElementById("messagetext1");
      writecontent.innerHTML = content;
      writename.value = name;
      modal.style.display = "block";
      modalContent.style.display = "none";
      modalmessageView.style.display = "block";
      msgbtn.innerHTML = "닫기";
      msgboolean = false;
   
}
btn1.onclick = function() {
    option.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
    modalContent.style.display = "none";
   modalmessageView.style.display = "none";
   document.getElementById("sendid").value = ""; 
   messageTitle.innerHTML = "새 쪽지 작성";
}
msgbtn.onclick = function(){
   var msgtext = document.getElementById("msgtext");
   var msgsuc = document.getElementById("msgsuc");
   if(msgtext.innerHTML == "쪽지 작성이 완료되었어요"){
     modal.style.display = "none";
       modalContent.style.display = "none";
      modalmessageView.style.display = "none";
      document.getElementById("sendid").value = ""; 
      messageTitle.innerHTML = "새 쪽지 작성";
      window.location.reload();
      }else{
         msgsuc.style.display="none";  
      }
}
span1.onclick = function() {
    modal.style.display = "none";
    modalContent.style.display = "none";
    modalmessageView.style.display = "none";
    document.getElementById("sendid").value = "";
    messageTitle.innerHTML = "새 쪽지 작성";
}

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
    modalContent.style.display = "block";
    modalmessageView.style.display = "none";
    
}
resend.onclick= function(){
   if(msgboolean){
    modal.style.display = "block";
    modalContent.style.display = "block";
    modalmessageView.style.display = "none";
    document.getElementById("sendid").value = document.getElementById("wrname").value;
    document.getElementById("sendid").style.color = "black";
    messageTitle.innerHTML = "답장하기";
    document.getElementById("messageid").value = writeid1; 
   }else{
      modal.style.display = "none";
        modalContent.style.display = "none";
        modalmessageView.style.display = "none";
      document.getElementById("sendid").value = ""; 
      messageTitle.innerHTML = "새 쪽지 작성";
   }
   
}

window.onclick = function(event) {
    if (event.target == modal) {
    
       modal.style.display = "none";
          modalContent.style.display = "none";
          modalmessageView.style.display = "none";
        document.getElementById("sendid").value = ""; 
        messageTitle.innerHTML = "새 쪽지 작성";
    }
    if (event.target == option){
       option.style.display = "none";
    }
}
function vxbtnShow(arg){
   $('#vbtn'+arg.id).css('display','block');
   $('#xbtn'+arg.id).css('display','block');
   
   
}
function vxbtnHide(arg){
   $('#vbtn'+arg.id).css('display','none');
   $('#xbtn'+arg.id).css('display','none');
   
}

</script>
 
<!-- 
회원가입 시 멤버 테이블에 추가되면서 그 아이디를 이름으로 한 테이블을 생성 
컬럼은 id(아이디) name(이름) 속성(0=보낸신청 1=받은신청 2=내 친구)
친구신청하면 친구아이디테이블에도 추가되고 내 아이디테이블에도 추가되야됨 . 내 아이디 테이블에선 0으로 친구 아이디 테이블에선 1로 추가됨
친구신청 허락하면 둘다 속성이 2로 변해야됨.
아이디 탈퇴 하면 그아이디를 가진 친구목록도 탈퇴되야됨
친구삭제도 되야됨.
참조키 사용(친구아이디) -->
</body>
</html>