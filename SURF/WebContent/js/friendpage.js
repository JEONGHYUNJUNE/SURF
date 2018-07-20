/**
 * 
 */

 $("textarea.texta").on('keydown keyup', function () { //textarea 사이즈 자동 조절
     $(this).height(1).height( $(this).prop('scrollHeight')+80 );   
   });
  
  window.onload = function(){  //스크롤바를 새로고침시 맨위로 고정
     setTimeout(function() {
        scrollTo(0, 0);
     }, 0)
  };
var num = 7; //불러올 글 범위 설정 숫자
var request = new XMLHttpRequest();
var attr = true;
$(window).scroll(function() {
	var iffriend = document.getElementById("iffriend").value;
  if ($(window).scrollTop() >= $(document).height() - 759-4&&attr) {
     attr= false;
     $('.loding').css('display','block');
     setTimeout(function() {
        $('.loding').css('display','none');
        if(iffriend ==1){
        request.open('Post','./friend1.do?num='+num,true);}
        else{
        	  request.open('Post','./friend2.do?num='+num,true);
        }
         request.onreadystatechange = Scroll;
         request.send(null);
         
        }, 1200)
  }else{
     attr= true;
  }
});



/*<c:choose>
<c:when test="${fn:split(dto.date,',')[0] eq today }">   <!--오늘 날짜와 비교  -->
                 ${fn:split(dto.date,',')[1]} 
</c:when>
<c:otherwise>
              ${fn:split(dto.date,',')[0]} 
</c:otherwise>
</c:choose>*/
var anum = 8;
var bsu = 0;
function Scroll(){
  if(request.readyState == 4 && request.status == 200){
     var object = eval('('+request.responseText +')');
     var result = object.result;
     var ajaxuserid = document.getElementById("ajaxuserid").value;   //webfeed.jsp 에서 받아온 로그인 유저의 아이디
     var ajaxtoday = document.getElementById("ajaxtoday").value;      //webfeed.jsp 에서 받아온 오늘 날짜
     var ajaxprofilepic = document.getElementById("ajaxprofilepic").value;      //webfeed.jsp 에서 받아온 로그인 유저의 프로필사진
     var fid = document.getElementById("fid").value;      //webfeed.jsp 에서 받아온  친구 유저의 아이디
     
     for(var i =0;i<result.length;i++){
      var disp = "none";
      var dispic = "img/profile.png";
       var date = result[i][1].split(',');
       var disdate = date[0];
       var dislink = "hidden";
       if(result[i][5]==ajaxuserid){
         disp = "block";
         dispic = ajaxprofilepic;
      }
      if(date[0]==ajaxtoday){
         disdate = date[1];
      }
      if(result[i][2] != "null"){
         dislink = "visible";
      }
       $('#mainContent').append(
             '<input type="hidden" id="boarduserid'+anum+'" value="'+result[i][5]+'">'
                +'<div class="divmain-content">'
                +' <div class="divmain-content-top">'    
             +'<div  class="pf" id="pf'+anum+'" style="background-image : url('+dispic+');" onclick="thisid(this)"></div>'
             +'<div class="namedate">'
                +'<a href="friendinfo.do?fuserid='+result[i][5]+'&userid='+ajaxuserid+'" style="text-decoration: none;color: black"><b>'+result[i][0]+'</b></a><br>'
                +disdate+'</div>'
                +'<div id="'+result[i][5]+'"  class="icon" onclick="return del(this)">'
                +'<a  style="text-decoration: none;color:black;display:'+disp+'" href="delete.do?tnum='+result[i][4]+'&userid='+ajaxuserid+'"> <img src="img/휴지통2.png" style="width:25px;height:20px;" id="trash" onmouseover=this.src="img/휴지통1.png" onmouseout=this.src="img/휴지통2.png">'
                +'</a></div>'
                +'</div>'
                +'<div class="divmain-content-mid" style="word-break:break-all;">'
                +'<img id="'+result[i][4]+'" alt="" src="'+result[i][3]+'"  style="margin-left: 70px; margin-bottom: 10px" width="400" height="auto">' 
                +'<video  width="500" height="360" controls="controls" id="video'+result[i][4]+'">'
                +'<source id="v'+result[i][4]+'" src="'+result[i][6]+'" type="video/mp4" />'
                +' <br></video><br>'+result[i][7]+' <br>'
                +'<p id="linkinsert" style="visibility:'+dislink+'"> 삽입 링크 : <A id="linkexist" href="http://'+result[i][2]+'" target="_blank">'+result[i][2]+'</A></p>'
                +'<div class="mid-icon"><img src="img/like.png" id="like" class="like" onmouseover=this.src="img/like3.png" onmouseout=this.src="img/like.png" style="width: 90%; height: 90%;">'
                +'</div></div>'
                +'<div class="divmain-content-bottom">'
                +'<input type="text" placeholder="댓글을 입력하세요." class="replyinpt">'
                +'<input type="button" value="전송" class="replybtn" onclick="">'
                +' </div></div>'
       );
         anum = anum+1;
         videodel(result[i][4]);
         num=num+1;
         bsu = bsu+1;
     }
     profilechg1(anum,bsu);

  }
} 


function cancel(){
   document.getElementById("texta").value= "";
   window.location.reload();
}
function picclick(){
  picfile.click();
}
function bgclick(){ //배경화면 버튼 클릭시 파일 선택
     bgfile.click();
   }
function videoclick(){ //비디오 파일 선택

   videofile.click();
}
function linkpath(){ //링크 삽입 보이기
   alert("삽입할 링크 주소를 입력하세요!");   

      var link = document.getElementById("linkpath");
      link.style.display = "block";
   
}



function getCmaFileView() { //이미지파일만 선택하게 하기
     //파일정보
     var fileObj = document.getElementById("picfile").files[0];
     var fileObjValue = document.getElementById('picfile').value;
     var img_all_names = fileObj['name'].split('.');
     var name = img_all_names[0];//이미지 이름
     var ext = img_all_names[1].toLowerCase();//확장자
     var size = fileObj['size'];//파일사이즈
     //var ext2 = fileObj['type'].toLowerCase();//확장자
     //이미지 확장자 검사

     if(ext != 'jpg' && ext != 'jpeg' && ext != 'png' && ext != 'gif') {

  alert('이미지 파일만 가능합니다!');

        fileObjValue = '';

        return false;

     }
  
     return true;

  }


$(function() { //이미지 미리보기
    $("#picfile").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#pictemp').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}

/*누를 때 친구 / 신청 / 쪽지로 선택되는 css 영역*/
function f(){
     var f = document.getElementById("f");
     var plusf = document.getElementById("plusf");
     var msg = document.getElementById("msg");
     f.style.borderTop="1px solid blue ";
     plusf.style.borderTop="";
     msg.style.borderTop="";
     
     
     f.style.borderBottom="";
     plusf.style.borderBottom="1px solid #C3C3C3 ";
     msg.style.borderBottom="1px solid #C3C3C3 ";
     
     $('.friendlist').css('display','block');
     $('.addfriend').css('display','none');
     $('.message1').css('display','none');
  }
  function plusf(){
     var f = document.getElementById("f");
     var plusf = document.getElementById("plusf");
     var msg = document.getElementById("msg");
     f.style.borderTop="";
     plusf.style.borderTop="1px solid blue ";
     msg.style.borderTop="";
     f.style.borderBottom="1px solid #C3C3C3 ";
     plusf.style.borderBottom="";
     msg.style.borderBottom="1px solid #C3C3C3 ";
     $('.friendlist').css('display','none');
     $('.addfriend').css('display','block');
     $('.message1').css('display','none');
     
  }
  function msg(){
     var f = document.getElementById("f");
     var plusf = document.getElementById("plusf");
     var msg = document.getElementById("msg");
     f.style.borderTop="";
     plusf.style.borderTop="";
     msg.style.borderTop="1px solid blue";
     f.style.borderBottom="1px solid #C3C3C3 ";
     plusf.style.borderBottom="1px solid #C3C3C3 ";
     msg.style.borderBottom="";
     $('.friendlist').css('display','none');
     $('.addfriend').css('display','none');
     $('.message1').css('display','block');
  }

  
  function del(arg){ //게시물 삭제 
     var writer = arg.id;
     var user= document.getElementsByName("userid")[0].value;
     if(writer == user){
     msg = "정말 삭제하시겠습니까?";
         if(confirm(msg)!=0){
            return true;
         }
     else 
        return false;
         }else{
           alert("작성자만 삭제 할 수 있습니다.");
           return false;
        }
}
  var userid = document.getElementsByName("userid");
  var pwdcheck = false;
  var pwdcheckcheck = false;
  var changemodal1 =document.getElementById("changemodal");
  var pw = "";
if(document.getElementById("userpwd1").value.charAt(0)=="^"){
  document.getElementById("changemodal").style.display = "block";
}
else{
  document.getElementById("changemodal").style.display = "none";
}
function modalhide(){
  if(pwdcheck&&pwdcheckcheck){
  $.ajax({
       
       type:"GET",
       url:'pwchange.do?userid='+userid[0].value+'&pw='+pw+'&num=1',
       datatype:"TEXT",
       success:function(data){
          if(data=="success"){
          alert("비밀번호가 변경되었습니다.");
          window.location = "logout.do";
          }
    }
  });
   changemodal1.style.display = "none";
}else{
  alert("형식을 제대로 해주세요.");
}
   
}
function newpwdcheck(){
  
  var newpwd = document.getElementById("newpwd").value;
  var newpwdcheck = document.getElementById("newpwdcheck").value;
  var newpwdtext = document.getElementById("newpwdtext");
  if(newpwd.length>=8&&newpwd.length<=24){
        newpwdcheckcheck();
        newpwdtext.innerHTML = "안전한 비밀번호입니다."
        newpwdtext.style.color = "green";
        newpwdtext.style.visibility = "";
        newpwdtext.style.right = "123px";
        pwdcheck = true;
        pw = newpwd;
  }else{
     newpwdcheckcheck();
     newpwdtext.innerHTML = "비밀번호는 8자리에서 24자리입니다."
     newpwdtext.style.color = "red";
     newpwdtext.style.visibility = "";
     newpwdtext.style.right = "85px";
     pwdcheck=false;
  }
  if(newpwd == ""){
     newpwdtext.style.visibility = "hidden";
     pwdcheck = false;
     }
  }
function newpwdcheckcheck(){
  
  var newpwd = document.getElementById("newpwd").value;
  var newpwdcheck = document.getElementById("newpwdcheck").value;
  var newpwdtext = document.getElementById("newpwdchecktext");
  if(newpwd == newpwdcheck){
     
        newpwdtext.innerHTML = "비밀번호가 일치합니다."
        newpwdtext.style.color = "green";
        newpwdtext.style.visibility = "";
        newpwdtext.style.right = "37px";
        pwdcheckcheck = true;
        pw = newpwd;
  }else{
     newpwdtext.innerHTML = "비밀번호가 일치하지 않습니다."
     newpwdtext.style.color = "red";
     newpwdtext.style.visibility = "";
     newpwdtext.style.right = "17px";
     pwdcheckcheck = false;
     
  }
  if(newpwdcheck == ""){
     newpwdtext.style.visibility = "hidden";
     pwdcheckcheck = false;
  }
}
function linkpath(){ //링크 삽입 보이기
   alert("삽입할 링크 주소를 입력하세요!");   
      var link = document.getElementById("linkpath");
      link.style.display = "block";
};

$(function(){ //삽입링크 없을시 숨김

  
});

$(function(){ //사진 혹은 동영상을 올리지 않았을때 숨김
  for(var i = 1;i<=30000 ; i++){
    $("#"+i).each(function() {
         var p = $(this).attr("src");
           if(p=="no"||p=="file_upload/no"){
              document.getElementById(i).style.display='none';
           }
          });
    $("#v"+i).each(function() {
         var v = $(this).attr("src");
           if(v=="no"||v=="file_upload/no"){
              document.getElementById("video"+i).style.display='none';
           }
          });
    }
});
function videodel(num){ //사진 혹은 동영상을 올리지 않았을때 숨김
       $("#"+num).each(function() {
            var p = $(this).attr("src");
              if(p=="no"||p=="file_upload/no"){
                 document.getElementById(num).style.display='none';
              }
             });
       $("#v"+num).each(function() {
            var v = $(this).attr("src");
              if(v=="no"||v=="file_upload/no"){
                 document.getElementById("video"+num).style.display='none';

              }
             });
  }


$(function(){
   var a = document.getElementById("su").value;
     for(var i = 1;i<=7;i++){
               $.ajax({
                   type:"GET",
                   url:'profile.do?userid='+document.getElementById("boarduserid"+i).value,
                   datatype:"TEXT",
                   async: false,
                   success:function(data){
                     
                      $('#pf'+i).css('background-image','url('+data+')');   
                      }
                   });
               } 
     }); 

  function profilechg1(num,num2){ //늘어난 글의 수만큼 프로필 사진을 입혀준다.
        for(var i = (num-num2);i<=num;i++){
                  $.ajax({
                      type:"GET",
                      url:'profile.do?userid='+document.getElementById("boarduserid"+i).value,
                      datatype:"TEXT",
                      async: false,
                      success:function(data){
                        
                         $('#pf'+i).css('background-image','url('+data+')');   
                         }
                      });
        }
}
  
  function thisid(arg){
	  alert(arg.id)
	  
  }
 