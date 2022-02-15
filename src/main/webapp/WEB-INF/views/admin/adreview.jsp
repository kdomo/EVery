<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVery 관리자</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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

</style>
<style>
	.review-div > div{
		border: 1px solid lightgrey;
	}
	
	.selected{
	  width: 20%;
	  height: 100%;
	  margin: 0;
	  padding: 0;
	  text-align: center;
	  border: 6px solid rgb(167, 166, 170);
	  outline: none;
	  color: rgb(167, 166, 170);
	}
	.inputBox{
	  width: 55%;
	  height: 100%;
	  margin: 0;
	  padding: 0;
	  border: 5px solid rgb(167, 166, 170);
	  outline: none;
	}
	
	.searchBox{
	    height: 60px;
	    text-align: center;
	    margin-bottom: 30px
	
	}
	
	#searchOne, #searchAll{
	    width: 10%;
	    border: none;
	    background-color: rgb(167, 166, 170);
	    height: 100%;
	    color: white;
	}
	.searchBtn:hover{
	    background-color:  rgb(68, 159, 195);
	}
	
	
</style>
</head>
<body>
	<nav class="navber">
		<div class="row nav-items d-flex justify-content-center">
			<div class="col-2 col-xl-1 navi-logo">
				<a href="${pageContext.request.contextPath }/"><img
					src="/resources/images/a_logo.png" width="80px"></a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="">회원관리</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="">블랙리스트</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="">컬럼관리</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="${pageContext.request.contextPath}/review/toAdReview.do">댓글관리</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="">고객지원</a>
			</div>
			<div class="col-xl-7 col-9 navi-menu"></div>
			<div class="col-xl-0 col-1 d-xl-none navi-menu">
				<a id="btn_navi_menu"><img src="/resources/images/menu.png" width="20px"
					height="24px"></a>
			</div>
		</div>
	</nav>
	<div class="row navi-onButtons">
		<div class="col-12">
			<a href="">회원관리</a>
		</div>
		<div class="col-12">
			<a href="">블랙리스트</a>
		</div>
		<div class="col-12">
			<a href="">컬럼관리</a>
		</div>
		<div class="col-12">
			<a href="${pageContext.request.contextPath}/review/toAdReview.do">댓글관리</a>
		</div>
		<div class="col-12">
			<a href="">고객지원</a>
		</div>
	</div>
	<div class="main">
		<div class="container">
			<div class="row" >
				<div class="col-12" style="height:90%;">
					<h3>댓글 관리</h3>
				</div>
			</div>
			<div class="row">	
				<div class="col-12 review-div mb-3">
					<!-- 추가 -->
				</div>
			</div>
			<div class="row input-div mb-3">
		        <div class="col-12 d-flex justify-content-center" style="margin:auto;">
		            <div class="searchBox w-70" style="margin:0px; padding:auto; width:70%; height:90%;">
			            <select class="selected" id="selected" name ="selected" style="height:auto;">
			                <option value="id" selected>ID</option>
			                <option value="station">충전소</option>
			            </select>
			            <input type="text" class="inputBox" id="searchKey" name="searchKey" placeholder="검색어를 입력해주세요" style="height:auto;">
			            <button class="btn btn-searchBtn" id="searchOne">검색</button>
			            <button class="btn btn-searchBtn" id="searchAll">전체보기</button>
		            </div>
		        </div>
			</div>
			<div class="row">
				<div class="col-12 paging-div" style="height:10%;">
					<!-- 추가 -->
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		
		<div class="row footer-body">
			<div class="col-12 col-xl-6 footer-body-left">
				<p>EVery | 사업자번호: 350-12-43123 | 대표: 이동훈</p>
				<p>개인정보취급담당자: 이수희</p>
				<p>통신판매업신고: 제 2021-서울강남-03823 호</p>
				<div class="row footer-top">
					<ul>
						<li><a href="">이용약관</a></li>
						<li><a href="">개인정보처리방침</a></li>
						<li><a href="">고객지원</a></li>
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
			<div class="col">
				ⓒ EVery Inc. All Rights Reserved.	
			</div>
		</div>
		
	</div>
	<script>
	// 페이지 로드되자마자 댓글 리스트도 ajax 로 로드
	$(document).ready(function(){
		getAdCommentList(1);
	})
	
	function getAdCommentList(currentPage){
		$.ajax({
			type : "get"
			, url : "${pageContext.request.contextPath}/review/getAdReview.do?currentPage=" + currentPage
		}).done(function(data){
			// 기존에 댓글이 있다면 모두 비워주는 작업 
			$(".review-div").empty();
			$(".paging-div").empty();
			if(data.adList == ""){
				let commentNull = "<div class='col' style='border-bottom: 2px solid black;'><h4>등록된 댓글이 없습니다.</h4></div>";
				$(".review-div").append(commentNull);
			}else{
				for(let dto of data.adList){
					let comment = "<div class='row d-flex justify-content-center' style='border-bottom: 2px dotted black; margin:0px;'>"
								+ "<div class='col-2' style='margin:auto;'>" + dto.id + "</div>"
								+ "<div class='col-2' style='margin:auto;'>" + dto.station + "</div>"
								+ "<div class='col-3' style='margin:auto;'>" + dto.written_date + "</div>"
								+ "<div class='col-4' style='margin:auto;'>" + dto.review + "</div>"
								+ "<div class='col-1' style='margin:auto;'><button type='button' class='btn deleteCmt' style='background-color: rgb(167, 166, 170); color:white;' value='" + dto.seq_review + "'>삭제</button></div>"
								+ "</div>"
					$(".review-div").append(comment);
				}
				
				let startNavi = data.settingMap.startNavi;
				let endNavi = data.settingMap.endNavi;
				
				let paging = "<nav class='col' aria-label='Page navigation example'>"
							+ "<ul class='pagination justify-content-center'>";
							
							if(data.settingMap.needPrev == true){
								paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getAdCommentList(" + startNavi + "- 1);'><</a></li>";
							}
							
							for(var i= startNavi; i<= endNavi; i++){
								paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getAdCommentList(" + i + ");'>" + i + "</a></li>";
							}
							
							if(data.settingMap.needNext == true){
								paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getAdCommentList(" + endNavi + "+ 1);'>></a></li>";
							}
							
					paging += "</ul>" + "</nav>";		
							
					$(".paging-div").append(paging);
				
			}
		}).fail(function(e){
				
		});
		
	};
	
	// 검색 했을때 댓글 가져오는 함수
	function getByList(currentPage){
		
		let data = {"searchKey" : $("#searchKey").val(), "selected" : $("#selected").val()};
		console.log(data);
		
			$.ajax({
			type : "post"
			, data : data
			, url : "${pageContext.request.contextPath}/review/searchByKey.do?currentPage=" + currentPage
			}).done(function(data){
				// 기존에 댓글이 있다면 모두 비워주는 작업 
				$(".review-div").empty();
				$(".paging-div").empty();
				if(data.byIdList == ""){
					alert("검색 내용이 없습니다.");
					let commentNull = "<div class='col-12 mt-4'><h4>검색 내용이 없습니다.</h4></div>";
					$(".review-div").append(commentNull);
				}else{
					for(let dto of data.byIdList){
					let comment = "<div class='row d-flex justify-content-center' style='border-bottom: 2px dotted black; margin:0px;'>"
								+ "<div class='col-2' style='margin:auto;'>" + dto.id + "</div>"
								+ "<div class='col-2' style='margin:auto;'>" + dto.station + "</div>"
								+ "<div class='col-3' style='margin:auto;'>" + dto.written_date + "</div>"
								+ "<div class='col-3' style='margin:auto;'>" + dto.review + "</div>"
								+ "<div class='col-2' style='margin:auto;' text-align:center'><button type='button' class='btn btn-secondary deleteCmt' value='" + dto.seq_review + "'>삭제</button></div>"
								+ "</div>"
						$(".review-div").append(comment);			
					}
					
					let startNavi = data.settingMap.startNavi;
					let endNavi = data.settingMap.endNavi;
					
					let paging = "<nav class='col' aria-label='Page navigation example'>"
								+ "<ul class='pagination justify-content-center'>";
								
								if(data.settingMap.needPrev == true){
									paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getByList(" + startNavi + "- 1)'><</a></li>";
								}
								
								for(var i= startNavi; i<= endNavi; i++){
									paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getByList(" + i + ")'>" + i + "</a></li>";
								}
								
								if(data.settingMap.needNext == true){
									paging += "<li class='page-item'><a class='page-link' style='color:black; background-color:lightgrey;' onclick='getByList(" + endNavi + "+ 1)'>></a></li>";
								}
								
					paging += "</ul>" + "</nav>";		
								
					$(".paging-div").append(paging);
				
			}
				
		}).fail(function(e){
			console.log(e);
		});
	
		}
	// 검색 버튼을 눌렀을 때
	$("#searchOne").on("click", function(e){
		getByList(1);
	});
	
	// 전체 검색 버튼을 눌렀을 때
	$("#searchAll").on("click", function(){
		getAdCommentList(1);
	});
	
	// 삭제버튼을 눌렀을 때 
	$(document).on("click",".deleteCmt", function(e){
		let rs = confirm("삭제하시겠습니까?");
		if(!rs){
			return;
		}
		$.ajax({
			type : "get"
			,url : "${pageContext.request.contextPath}/review/delete.do?seq_review=" + $(e.target).val()
		}).done(function(rs){
			if(rs == "success"){
				getAdCommentList(1);
			}else if(rs == "fail"){
				alert("삭제에 실패하였습니다.");
			}
		}).fail(function(e){
			console.log(e);
		});
	});
	
	
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