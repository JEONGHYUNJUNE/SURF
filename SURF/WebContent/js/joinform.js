var num = 1;   //보기 박스 체크여부 펼쳤을때 0 펼치지않았을때 1
var num1 = 1;  //동의 체크박스 체크 여부 펼쳤을때 0 펼치지 않았을때 1
var agree = "동의안함";
var nextnum = 1;//다음 버튼 누르기위해 만든 변수 
var joinfull = 1; //join텍스트박스 다 채우면 2 하나라도 안채웠으면 1 ;
var random = null;
var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
var joinsuc = false;
var userid = document.getElementById("join1");
var pwd = document.getElementById("join2");
var pwdcheck = document.getElementById("join3");
var name1 = document.getElementById("join4");
var email = document.getElementById("join5");
var phone = document.getElementById("join6");
var phonecheck = false;
var idcheck = false;

function winpopup(){
   window.open("smssend.jsp","pop","width=500,height=300,scrollbars=no");
   document.smsForm.target = "pop";
   document.smsForm.action = "smssend.jsp";
   document.smsForm.submit();
}
function smssend(){
     var jointext =document.getElementById("joinerrortext");
      var modal = document.getElementById("joinmodal");
      var ran1 = Math.floor(Math.random()*(999999-100002))+100001;
      random = ran1;
      document.getElementById("rphone").value = document.getElementById("join6").value;
    
    if (isNaN(phone.value)){
       jointext.innerHTML = "휴대폰 번호는 숫자만 가능해요.";
         modal.style.display = "block";
         phone.value='';
         return false;
    }
    $.ajax({
        
        type:"GET",
        url:'phonecheck.do?phone='+phone.value,
        datatype:"TEXT",
        success:function(data){
           if(data=="fail"){
           jointext.innerHTML = "휴대폰 번호가 중복되었습니다.";
            modal.style.display = "block";
            phone.value="";
           return false;
           }
           else if(data=="success"){
            $('#phonecheck').removeAttr("disabled");
            $('#smsbtn1').css('display','none');
            $('#smsbtn2').css('display','block');

            document.getElementById("msgtext").innerHTML = "[SURF]회원가입 인증 번호입니다. "+ran1;
            alert("인증번호가 발송되었습니다.");
            
            winpopup();
           }
           
        }});
    

}
function smscheck(){
   if(document.getElementById("phonecheck").value == random){
      alert("인증성공!!");
      phonecheck = true;
      $('#phonecheck').attr("disabled","disabled");
      
   }else{
      alert("인증번호를 확인해주세요.");
   }
}
function showagree(){
   if(num == 1){      //보기박스를 펼치지 않았으면
   $('#show').css('background-color','#067DA1');  //보기박스의 배경색
   $('#show').css('color','white');            //보기박스의 글자색
   $('.agreeopen').css('display','block');         //약관div display block 시켜줌
   $('.nextbtn').css('margin-top','50px');         //다음 박스 위치 조정
   num = 0;                              //보기박스 펼쳤다고 num값을 0으로 변경
   }else{            //보기박스가 이미 펼쳐져있다면
      $('#show').css('background-color','white');  //보기박스의 배경색
      $('#show').css('color','black');          //보기박스의 글자색
      $('.agreeopen').css('display','none');        //약관 div display none 시켜줌
      $('.nextbtn').css('margin-top','0');         //다음 박스 위치 조정 
      num=1;                               //보기박스 접었다고 num 값을 1로 변경
   }
}
function checkbox(){
   if(num==0){                              //보기박스를 열어서 보았으면
      if(num1==1){                        //약관동의하기 전
      $('#checkbox').css('background-color','#067DA1');
      $('#checkbox').css('color','white');
      $('.nextbtn').css('background-color','#067DA1');
      $('.nextbtn').css('color','white');
      $('.nextbtn').css('cursor','pointer');
      agree="동의";
      num1=0;
      }else{
         $('#checkbox').css('background-color','white');
         $('#checkbox').css('color','black');
         $('.nextbtn').css('background-color','#d5d5d5');
         $('.nextbtn').css('color','#BDBDBD');
         $('.nextbtn').css('cursor','auto');
         num1=1;
         agree="동의안함";
      }
   }
   else{
      alert("보기를 눌러 약관을  읽어주세요.");         //보기박스 안읽었으면 alert뜨면서 보기박스 체크시켜줌
      $('#show').click();
      
   }
}
function fullcheck(){            //인풋박스에 onkeyup 합수를 걸어주어 글자가 써질때마다 함수 실행
   var checkfull = 1;
   
   
   for(var i = 1 ; i<=6;i++){                                    //id가 join1~6까지인 텍스트박스의 값을 검사해 모두 채워져있으면 checkfull 변수를 1씩증가
      if(document.getElementById("join"+i).value != ""){
         checkfull++;
      }
   }
   
   if(checkfull==7){                                       //모두 채워져있어서 checkfull변수가 7이 되면 다음버튼이 활성화되게 함.
      $('.nextbtn').css('background-color','#067DA1');
      $('.nextbtn').css('color','white');
      $('.nextbtn').css('cursor','pointer');
      joinfull = 2;
   }else{
      $('.nextbtn').css('background-color','#d5d5d5');
      $('.nextbtn').css('color','#BDBDBD');
      $('.nextbtn').css('cursor','auto');
      joinfull = 1;
   }

   
}
function idsame(){
   idcheck=false;
   $.ajax({
      
      type:"GET",
      url:'idcheck.do?userid='+userid.value,
      datatype:"TEXT",
      success:function(data){
         
         var msg1 = document.getElementById("msgone");
         var msg2 = document.getElementById("msgtwo");
         
         if(data == "success"){
            msg1.innerHTML = userid.value +" 는 사용하실 수 있는 아이디입니다."
            msg1.style.display = "block";
            msg1.style.visibility = "visible";
            msg2.style.display = "none";
            idcheck=true;
         }else{
            msg2.innerHTML = userid.value+" 는 사용하실 수 없는 아이디입니다."
            msg1.style.display = "none";
            msg1.style.visibility = "hidden";
            msg2.style.display = "block";
            idcheck=false;
            
         }
          },
      error:function(){
         alert("에러");
      }
   });
}
function idcheck1(){
   idcheck=false;
   var msg1 = document.getElementById("msgone");
    var msg2 = document.getElementById("msgtwo");
    msg1.style.display = "block";
    msg1.style.visibility = "hidden";
    msg2.style.display = "none";
    
}
function nextbtn(){
   var jointext =document.getElementById("joinerrortext");
   var modal = document.getElementById("joinmodal");
   if(agree!="동의"&&nextnum==1){
      alert("약관에 동의하시면 다음으로 넘어가실수 있습니다.");
   }
   if(joinfull==1&&nextnum==2){
      jointext.innerHTML = "양식을 모두 작성해주세요.";
      modal.style.display = "block";
   }
   if(nextnum==3){
      window.close();
   }
   
   
   if(agree=="동의"&&nextnum==1){
      $('.agreepage').css('display','none');
      $('#agree1').css('background-color','#bdbdbd');
      $('#agree2').css('background-color','gray');
      $('.nextbtn').css('background-color','#d5d5d5');
      $('.nextbtn').css('color','#BDBDBD');
      $('.nextbtn').css('cursor','auto');
      $('.nextbtn').css('margin-top','0');
      $('.joinForm').css('display','block');
      
      nextnum=2;
   }
   
   if(joinfull == 2&&nextnum==2){               //이 과정에서 ajax를 거쳐 회원가입이 성공하게 만들어야 된다. 그리고 userinfo값들을 변경해줘야됨 
      if(userid.value == ""){
         jointext.innerHTML = "아이디를 입력해야해요.";
         modal.style.display = "block";
      }
      else if(!idcheck){
         jointext.innerHTML = "아이디 중복체크를 해주세요.";
          modal.style.display = "block";
      }
      else if(pwd.value.length <8 || pwd.value.length >24){
         jointext.innerHTML = "비밀번호는 8~24자리에요.";
         modal.style.display = "block";
      }else if(pwd.value != pwdcheck.value){
         jointext.innerHTML = "비밀번호가 일치하지않아요.";
         modal.style.display = "block";
      }else if(name1.value ==""){
         jointext.innerHTML = "이름을 입력해야해요.";
         modal.style.display = "block";
      }else if(!regex.test(email.value)){
         jointext.innerHTML = "이메일 형식이 이상해요";
         modal.style.display = "block";
      }else if(document.getElementById("msgtwo").style.display == "block"){
         jointext.innerHTML = "아이디가 중복됬어요";
         modal.style.display = "block";
      }else if (isNaN(phone.value)){
            jointext.innerHTML = "휴대폰 번호는 숫자만 가능해요.";
             modal.style.display = "block";
             phone.value='';
       }else if(!phonecheck){
           jointext.innerHTML = "휴대폰 인증을 해주세요.";
           modal.style.display = "block";
           
        }

      else{
      
         $.ajax({
            type:"GET",
            url:'join.do?userid='+userid.value+'&pwd='+pwd.value+'&name='+name1.value+'&email='+email.value+'&phone='+phone.value,
            datatype:"JSON",
            success:function(data){
               
                },
            error:function(){
               alert("에러");
            }
         });
         jointext.innerHTML = "회원가입이 완료되었습니다.";
         modal.style.display = "block";
         
         
         joinsuc = true;
      }
      if(joinsuc){
      $('.joinForm').css('display','none');
      $('.nextbtn').css('margin-top','43px');   
      $('.nextbtn').css('background-color','#067DA1');
      $('.nextbtn').css('color','white');
      $('.nextbtn').css('cursor','pointer');
      $('.nextbtn').html('확인');
      $('#agree1').css('background-color','#bdbdbd');
      $('#agree2').css('background-color','#bdbdbd');
      $('#agree3').css('background-color','gray');
      $('.joinsuccess').css('display','block');
      document.getElementById("joinsucid").innerHTML = userid.value;
      document.getElementById("joinsucname").innerHTML = name1.value;
      document.getElementById("joinsucemail").innerHTML = email.value;
      nextnum=3;
      }
   }
   
   
   
}