<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="/resources/js/websocket.js"></script> <!-- 웹소켓 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/resources/css/memberModal.css" rel="stylesheet">  
<title>상세보기</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');


@font-face {
    font-family: 'Pretendard-SemiBold';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff') format('woff');
    font-weight: 600;
    font-style: normal;
}
</style>
<!-- 배달의민족 도현 글꼴 -->

<style>
* {
	box-sizing: border-box;
/* 	font-family: 'Do Hyeon', sans-serif; */
	font-family: 'Pretendard-SemiBold';
	color:black;
}

html {
	width: 100vw;
	height: 100%;
}

body {
	width: 100%;
	height: auto;
	background-color: lightgray;
}

a {
	text-decoration: none;
	color: black;
}

/* Navi 영역*/
.navber {
	width: 82.6vw;
	margin: auto;
	padding-top: 30px;
	padding-bottom: 30px;
	background-color: white;
	position: fixed;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1;
	background-color: lightgray;
}

.nav-items {
	margin: auto;
	width: 100%;
}

a:hover {
	text-decoration: none;
	color: #18a8f1;
	border-bottom: 2px solid black;
}

.navi-logo {
	text-align: left;
	padding: 0px;
}

.navi-menu {
	text-align: center;
	padding: 0px 10px;
}

.navi-menu>a, img {
	line-height: 32px;
}

.navi-onButtons {
	padding-top: 92px;
	margin: auto;
	width: 82.6vw;
	height: 0;
	display: none;
}

.navi-onButtons>div {
	padding: 10px 0px;
	text-align: center;
}

.badge {
	height: 16px;
	line-height: 8px;
}

/* main 영역 */
.main {
	padding-top: 92px;
	width: 82.6vw;
	margin: auto;
}

.card {
	border-radius: 10%;
	margin: auto;
	margin-bottom: 20px;
	border: 2px solid gray;
}

/* footer 영역 */
.footer {
	margin: auto;
	width: 82.6vw;
}

.footer-top {
	margin: auto;
	width: 82.6vw;
}

.footer-top>ul {
	padding: 0px;
	margin: 0px;
}

.footer-top>ul>li {
	list-style: none;
	float: left;
	margin-right: 10px;
}

.footer-body {
	margin: auto;
	width: 82.6vw;
	border-bottom: 2px solid gray;
	border-top: 2px solid gray;
	padding-bottom: 20px;
}

.footer-body-left {
	margin-top: 20px;
	padding: 0px;
}

.footer-body-left>p {
	padding: 0px;
	margin: 0px;
}

.footer-body-right {
	margin-top: 20px;
	padding: 0px;
}

.footer-body-right>p {
	padding: 0px;
	margin: 0px;
}

.page-link {
	color: #fff;
	background-color: #333;
}

.page-link:hover {
	color: grey;
	background-color: #ccc;
}


/* 알람 css  */
/*
 	#bell{
      position: relative;
      cursor: pointer;
 
    }
    */
	#bellBox{
	position: relative;
	}
    #bell_text{
      position: absolute;
      color: white;
      font-weight: 700;
      font-size: 10px;
      width: 18px;
      right : 40%;
      top : 20%; 
   	  transform : translate( 50%,-50% );
      display: inline-block;
      background-color: red;
      border-radius: 100%;
      text-align: center;
    }
    
    .container{
width: 100%;
height: 100%;
}

#content-box{
box-sizing: border-box;
width: 100%;
}
#content{
width: 100%;
height: 100%;
}
#title{
background: #ccc;
text-align: center;
font-weight: bold;
border: none;
font-size: 1.5rem
}
#written_date{
background: #ccc;
text-align: center;
border: none;
font-size: 0.8rem
}
</style>
</head>
<body>
	<nav class="navber">
      <div class="row nav-items d-flex justify-content-center">
         <div class="col-2 col-xl-1 navi-logo">
            <a href="${pageContext.request.contextPath}/admin/getAdminUser.do"><img src="/resources/images/a_logo.png" width="80px"></a>
         </div>
         <div class="col-xl-1 d-none d-xl-block navi-menu">
            <a href="${pageContext.request.contextPath}/admin/getAdminUser.do">회원관리</a>
         </div>
         <div class="col-xl-1 d-none d-xl-block navi-menu">
            <a href="${pageContext.request.contextPath }/blacklist/toBlacklist.do">블랙리스트</a>
         </div>
         <div class="col-xl-1 d-none d-xl-block navi-menu">
            <a href="${pageContext.request.contextPath}/admin/columManager.do">컬럼관리</a>
         </div>
         <div class="col-xl-1 d-none d-xl-block navi-menu">
            <a href="${pageContext.request.contextPath}/review/toAdReview.do">댓글관리</a>
         </div>
         <div class="col-xl-1 d-none d-xl-block navi-menu">
            <a href="${pageContext.request.contextPath }/info/toAInfoList.do">고객지원</a>
         </div>
         <c:choose>
         	<c:when test="${!empty adminLoginSession}">
         		<div class="col-xl-4 col-8 navi-menu"></div>
         		<div class="col-xl-1 d-none d-xl-block navi-menu">
         			<a href="${pageContext.request.contextPath}/admin/adminLogout.do">로그아웃</a>
         		</div>
         		
        	 </c:when>
        	 <c:otherwise>
        	 	<div class="col-xl-6 col-8 navi-menu"></div>
        	 </c:otherwise>
         </c:choose>
         <c:choose>
			  	<c:when test="${!empty adminLoginSession}">
			  		<div class="col-xl-1 col-1 navi-menu" id="bellBox">
			  			<a data-bs-toggle="modal" data-bs-target="#bellModal" id="bell" onclick="ws.send('getUncheckedList');"><img src="/resources/images/alarm.png" width="24px"
                		height="24px"></a>
                		<div id ="bell_text"></div>
			  		</div>
				</c:when>
			</c:choose>
         <div class="col-xl-0 col-1 d-xl-none navi-menu">
            <a id="btn_navi_menu"><img src="/resources/images/menu.png" width="20px" height="24px"></a>
         </div>
      </div>
   </nav>
   <div class="row navi-onButtons">
      <div class="col-12">
         <a href="${pageContext.request.contextPath}/admin/getAdminUser.do">회원관리</a>
      </div>
      <div class="col-12">
         <a href="${pageContext.request.contextPath }/blacklist/toBlacklist.do">블랙리스트</a>
      </div>
      <div class="col-12">
         <a href="${pageContext.request.contextPath}/admin/columManager.do">컬럼관리</a>
      </div>
      <div class="col-12">
         <a href="${pageContext.request.contextPath }/info/toAInfoList.do">고객지원</a>
      </div>
      <div class="col-12">
         <a href="${pageContext.request.contextPath }/admin/adminLogout.do">로그아웃</a>
      </div>
   </div>
   
	<div class="main">
	
		<div class="container">
		
			<div class="row">
				<div class="col d-flex justify-content-center">
					<input type="text" class="form-control" id="title" name="title" value="${seq_column}" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
			  		<input type="text" class="form-control" id="written_date" name="written_date" value="" readonly>
				</div>
			</div>
		
			<div class="row">
				<div class="col" id="content-box">
			  		<div class="col-12" id="content" name="content"></div>
				</div>
			</div>
			<div class="row">
				<div class="col">
			  		<input type="text" class="form-control" name="id" value="" hidden>			  		
				</div>
			</div> 
			<div class="row">
				<div class="col d-flex justify-content-end" id="detail-footer">
					<button type="button" class="btn me-3" id="cancelBtn">뒤로가기</button>
					
				</div>
			</div>
		</div>
		
	</form>
    	
	<script>
	
	
		$.ajax({
			type: "post", //요청 메소드 방식
			url:"${pageContext.request.contextPath}/admin/toDetail.do?seq_column=${seq_column}",
			//dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
			success : function(data){
			
			//console.log(data);
				//console.log(data.content);
				 let date = data.written_date.replace(/,/,"")
							let written_date = date.split(" ");
							date = written_date[2]+"년 "+written_date[0]+" "+written_date[1]+"일"
				content = data.content
				$("#title").val(data.title)
				$("#written_date").val(date)
				//$("#writer_nickname").val(data.writer_nickname)
				$("#content").append(content);
							

			},
			error : function(e){
				//console.log(e);
			}
		});
	
	
	
		// 뒤로가기 
		$("#cancelBtn").on("click", function(){
			history.back();
		});

		
	</script>
	</div>
	<div class="footer">
		
		<div class="row footer-body">
			<div class="col-12 col-xl-6 footer-body-left">
				<p>EVery | 사업자번호: 350-12-43123 | 대표: 이동훈</p>
				<p>개인정보취급담당자: 이수희</p>
				<p>통신판매업신고: 제 2021-서울강남-03823 호</p>
			<div class="row footer-top">
					<ul>
						<li><a href="${pageContext.request.contextPath }/terms?view=service">이용약관</a></li>
						<li><a href="${pageContext.request.contextPath }/terms?view=privacy">개인정보처리방침</a></li>
						<li><a href="${pageContext.request.contextPath }/admin/toClientSupport.do">고객지원</a></li>
					</ul>
				</div>
			</div>
			<div class="col-12 col-xl-6 footer-body-right">
				<p>고객센터</p>
				<p>고객문의: cs@every.com | 전화: 02-238-5354</p>
				<p>상담시간: 평일 09:00~15:30 (점심시간 12:50~13:30)</p>
				<p>제휴문의: marketing@every.com | 전화: 02-238-5355</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				ⓒ EVery Inc. All Rights Reserved.	
			</div>
		</div>
		
	</div>
	

		
<!-- bell-Modal -->
<div class="modal fade" id="bellModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">알림창</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="modalcontainer">
          <div class="row">
            <div class="col-6 text-center noticeList"><a href="#" onclick="ws.send('getUncheckedList');">새소식</a></div>
            <div class="col-6 text-center noticeList"><a onclick="ws.send('getCheckedList');">이전 알림</a></div>
          </div>
          <div class="row">
           <table class="table">
                <tr class="text-center">
                  <th class=""><input type="checkbox" name="newMsgAll" id="newMsgAll"></th>
                  <th class="">시간</th>
                  <th class="">메세지</th>
                </tr>
            <tbody id="listPrint">
            </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="modal-footer" id="footerBtnAdd">
      <!--    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button> -->
      </div>
    </div>
  </div>
</div>

	<!-- modal script -->
 	<script>	
 	//체크박스
	document.addEventListener('click',function(e){
        if(e.target.id == 'newMsgAll'){
        if ($("#newMsgAll").prop("checked"))  $("input[name=newMsg]").prop("checked", true)
        else  $("input[name=newMsg]").prop("checked", false)
        }});
	
	//벨 이모티콘 클릭시 list 출력
	document.addEventListener('click',function(e){
        if(e.target.id == 'bell'){
        	ws.send("getUncheckedList");
    }});
	
	
	function messageCheck(){
			 let list = new Array(); // 배열 선언
		 	 $('input:checkbox[name=newMsg]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
		 		list.push(this.value);
		 	 });
			 	 if(list.length != 0){
			 		//console.log(list)
			 		let msg = { category: "msgCheck", list: list };
			 		let msgToJson = JSON.stringify(msg);
			 		ws.send(msgToJson);
			 		
				 }else{
			 		 alert("확인할 메세지를 선택하세요.")
			 	 }
		}
	
	function deleteMsg(){
		 let list = new Array(); // 배열 선언
	 	 $('input:checkbox[name=newMsg]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	 		list.push(this.value);
	 	 });
		 	 if(list.length != 0){
		 		//console.log(list)
		 		let msg = { category: "msgDel", list: list };
		 		let msgToJson = JSON.stringify(msg);
		 		ws.send(msgToJson);
		 		
			 }else{
		 		 alert("확인할 메세지를 선택하세요.")
		 	 }
	}
	</script>
	
	<script>
		$(function() {
			let onNavbar = 0; // 네비 햄버거버튼 클릭했는지 아닌지 알기위한 변수
			$('#btn_navi_menu').on('click', function() { //햄버거버튼 클릭 시
				if (onNavbar == 0) {
					$('.navi-onButtons').css({
						"height" : "auto",
						"display" : "block"
					}); // 세로 네비영역 열기
					$('.main').css({"padding-top" : "10px"});
					onNavbar = 1;
					$('html, body').animate({
		                scrollTop : 0
		            }, 100);
		            return false;
				} else {
					$('.navi-onButtons').css({
						"height" : "0",
						"display" : "none"
					}); //세로 네비영역 닫기
					$('.main').css({"padding-top" : "92px"});
					onNavbar = 0;
				}
			});

			$(window).resize(function() { //브라우저 크기를 조정했을때
				if (window.innerWidth > 1199) { //브라우저 크기가 1199를 넘었다면
					$('.navi-onButtons').css({
						"height" : "0",
						"display" : "none"
					}); //세로 네비영역 닫기
					onNavbar = 0;
				}
			});
		});
	</script>
	

	
</body>
</html>