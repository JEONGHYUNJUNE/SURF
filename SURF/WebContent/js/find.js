var idfind = false;               //버튼 return 을 위한 변수
var pwchange = false;
var findtext =document.getElementById("finderrortext");
var modal = document.getElementById("findmodal");
var useridfind = document.getElementById("useridfind");
var name = document.getElementById("find1");
var phone = document.getElementById("find2");
//버튼 return 을 위한 변수
$(function(){
   var url = document.getElementById("url").value;
   if(url=="pw"){
      $('#goPw').click();
   }
});
function cc(){   
    var ss = document.getElementById("pwfind2").value; 
    var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;//이메일 형식 유효성검사 변수
    var pwfind = false;
    var idfind = false;
    var userid = document.getElementById("pwfind").value;
    var name = document.getElementById("pwfind1").value;
    var email = document.getElementById("pwfind2").value;
    
    
    if(!pwchange){
       if(!pwchange){
          findtext.innerHTML =  "양식을 모두 채워주세요.";
           modal.style.display = "block"; 
           return false;   
       }
    }
    else if(regex.test(ss) === false) {  //이메일 유효성 검사
        findtext.innerHTML =  "잘못된 이메일 형식입니다.";
         modal.style.display = "block";   
       document.getElementById('pwfind2').value="";
        return false;  
    }
    else {
       $.ajax({
           type:"GET",
           url:'idcheck.do?userid='+userid,
           datatype:"TEXT",
           success:function(data){
              if(data == "success"){
                  
                findtext.innerHTML =  "가입되어있지 않은 아이디에요";
                modal.style.display = "block"; 
                return false;  
              }else{
                 
                
                 $.ajax({
                    type:"GET",
                    url:'pwfindcheck.do?userid='+userid+'&name='+name+'&email='+email,
                    datatype:"TEXT",
                    success:function(data1){
                     if(data1 == "fail"){
                      
                      findtext.innerHTML =  "아이디와 일치하지 않은 정보에요";
                        modal.style.display = "block"; 
                        return false;  
                     }else{
                     var text = "";
                var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

             for( var i=0; i < 7; i++ )
                    text += possible.charAt(Math.floor(Math.random() * possible.length));
             var ran = text;
             $.ajax({
                   type:"GET",
                   url:'pwchange.do?userid='+userid+'&pw='+ran+'&num=0',
                   datatype:"TEXT",
                   success:function(data){
                      if(true){
                         alert(ss+"로 임시 비밀번호를 발송했습니다.\n로그인 후 비밀번호를 변경해 주세요."); 
                      }
                      },
                   error:function(){
                      alert("에러");
                   }
                });
           Email.send(
          "zulu08@naver.com",//보내는 이메일 계정
          ss,  //받는 이메일 계정
          "[SURF] 임시 비밀번호 입니다.",
       "<div style='background-color: #F5F5F5; width: 900px; height: 500px'>" +
       "<div style='background-color: #067DA1;width: 900px;height: 100px'" +
       ">" +"<br><br>"+
       "<h1 style='font:bold;margin-left:20px; color:white;font-size:xx-large;'>SURF <span style='font-size:x-large'>임시 비밀번호</span></h1></div>" +
       "<br>&nbsp;&nbsp; 안녕하세요. SURF입니다.<BR><BR>&nbsp;&nbsp;요청하신 임시 비밀번호 입니다.<BR><BR>&nbsp;&nbsp;임시 비밀번호로 로그인 하신후  비밀번호 변경을 해주시기 바랍니다.<BR><BR><BR><hr size='1' color='lightgray' width='850px' noshade='noshade'><BR><b>&nbsp;&nbsp;임시 비밀번호</b>: <br> <BR>    " +
       "<b style='font-size:large ;color:blue'>&nbsp;&nbsp;^"+ran+"</b></div>본 메일은 발신전용으로, SURF에서 사용하는 언어를 기준으로 발송되었습니다.",
          "smtp.naver.com",//네이버 smtp //구글 smtp 주소
          "zulu08",//네이버 아이디 //구글 아이디
          "tpalvmfhwprxm");     //비밀번호
                     }
                    },
                     error:function(){
                       alert("에러1");
                 }
                 });
              }
              },
           error:function(){
              alert("에러2");
           }
        });
       
    }  
   
         //비밀번호
   
   //ajax 써야됨
    
   }
   
function fullfind(){                              //아이디찾기 폼 모두 쓰면 css변경
   
   if(name.value!=""&&phone.value!=""){
      
      
      $('.btnbutton').css('background-color','#067DA1');
      $('.btnbutton').css('cursor','pointer');
      $('.btnbutton').css('color','white');
      idfind = true;
   }
   else{
      
      $('.btnbutton').css('background-color','#EAEAEA');
      $('.btnbutton').css('cursor','auto');
      $('.btnbutton').css('color','gray');
      idfind = false;
   }
   
}
function idSuc(){
   var name1 = document.getElementById("find1").value;
   var phone1 = document.getElementById("find2").value;
   if(idfind){
       $.ajax({
            type:"GET",
            url:'namecheck.do?name='+name1,
            datatype:"TEXT",
            success:function(data){
               if(data == "success"){
                  findtext.innerHTML =  "가입되어있지 않은 이름이에요";
                   modal.style.display = "block";
               }else{
                  $.ajax({
                     type:"GET",
                     url:'idfindcheck.do?name='+name1+'&phone='+phone1,
                     datatype:"TEXT",
                     success:function(data){
                      if(data == "fail"){
                       findtext.innerHTML =  "이름과 전화번호가 일치하지않아요";
                      modal.style.display = "block";
                      
                      }else{
                         useridfind.innerHTML = data;
                         $('.idSuc').css('display','block');
                         $('.idForm').css('display','none');
                      }
                     },
                      error:function(){
                        alert("에러");
                  }
                  });
               }
               },
            error:function(){
               alert("에러");
            }
         });
   }
   else{
      findtext.innerHTML = "양식을 모두 작성해주세요";
        modal.style.display = "block";
      $('.idSuc').css('display','none');
      $('.idForm').css('display','block');
      
      
   }
   
}
function goId(){
   var name1 = document.getElementById("find1");
   var phone1 = document.getElementById("find2");
   $('.idfind').css('display','block');
   $('.pwfind').css('display','none');
   $('#goId').css('background-color','#067DA1');
   $('#goId').css('color','white');
   $('#goPw').css('background-color','#EAEAEA');
   $('#goPw').css('color','black');
   $('.idSuc').css('display','none');
   $('.idForm').css('display','block');
   name1.value="";
   phone1.value="";
   
}
function goPw(){
   var userid = document.getElementById("pwfind");
   var name = document.getElementById("pwfind1");
   var email = document.getElementById("pwfind2");
   $('.idfind').css('display','none');
   $('.pwfind').css('display','block');
   $('#goPw').css('background-color','#067DA1');
   $('#goPw').css('color','white');
   $('#goId').css('background-color','#EAEAEA');
   $('#goId').css('color','black');
   userid.value="";
   name.value="";
   email.value="";
}
function pwfullfind(){      //비밀번호 찾기 폼 모두 쓰면 css변경
   var   userid = document.getElementById("pwfind").value;            
   var name = document.getElementById("pwfind1").value;
   var email = document.getElementById("pwfind2").value;
   if(name!=""&&email!=""&&userid!=""){
      $('.btnbutton1').css('background-color','#067DA1');
      $('.btnbutton1').css('cursor','pointer');
      $('.btnbutton1').css('color','white');
      pwchange = true;
   }
   else{
      $('.btnbutton1').css('background-color','#EAEAEA');
      $('.btnbutton1').css('cursor','auto');
      $('.btnbutton1').css('color','gray');
      pwchange = false;
      
   }
   
}
