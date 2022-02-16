<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

@font-face {
	font-family: 'Pretendard-SemiBold';
	src:
		url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff')
		format('woff');
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
	color: black;
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
				<a
					href="${pageContext.request.contextPath }/blacklist/toBlacklist.do">블랙리스트</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a href="">컬럼관리</a>
			</div>
			<div class="col-xl-1 d-none d-xl-block navi-menu">
				<a
					href="${pageContext.request.contextPath }/admin/toAClientSupport.do">고객지원</a>
			</div>
			<div class="col-xl-7 col-9 navi-menu"></div>
			<div class="col-xl-0 col-1 d-xl-none navi-menu">
				<a id="btn_navi_menu"><img src="/resources/images/menu.png"
					width="20px" height="24px"></a>
			</div>
		</div>
	</nav>
	<div class="row navi-onButtons">
		<div class="col-12">
			<a href="">회원관리</a>
		</div>
		<div class="col-12">
			<a
				href="${pageContext.request.contextPath }/blacklist/toBlacklist.do">블랙리스트</a>
		</div>
		<div class="col-12">
			<a href="">컬럼관리</a>
		</div>
		<div class="col-12">
			<a
				href="${pageContext.request.contextPath }/admin/toAClientSupport.do">고객지원</a>
		</div>
	</div>
	<div class="main">
		<div class="container">
			<div class="row mt-4">
				<div class="col-3 suv_title_div">
					<h3>블랙리스트</h3>
				</div>
				<div class="col-9" style="text-align: right;">
					<button type="button" id="btnToInsert" class="btn btn-dark">추가</button>
					<button type="button" id="modifyBtn" class="btn btn-dark">수정</button>
					<button type="button" id="deleteBtn" class="btn btn-dark">삭제</button>
				</div>
			</div>
			<div class="row mt-4" id="content">
				<div class="col">
					<form id="blacklist">
						<table class="table table-hover">
							<thead>
								<tr style="text-align: center;">
									<th class="col-1"><input type="checkbox" id="checkAll"></th>
									<th class="col-2">아이디</th>
									<th class="col-2">닉네임</th>
									<th class="col-4">사유</th>
									<th class="col-3">추가일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="6" style="text-align: center;">등록된 블랙리스트가
												없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="dto">
											<tr class="blacklist" style="text-align: center;">
												<td><input type="checkbox" class="checkOne"
													name="checkOne" value="${dto.id}"></td>
												<td>${dto.id}</td>
												<td>${dto.nickname}</td>
												<td>${dto.reason}</td>
												<td>${dto.black_date}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
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
			<div class="col">ⓒ EVery Inc. All Rights Reserved.</div>
		</div>

	</div>

	<script>
		// 추가 페이지 이동 요청
		document.getElementById("btnToInsert").onclick = function() {
			location.href = "${pageContext.request.contextPath}/blacklist/toInsert.do";
		}

		// 전체 선택
		$("#checkAll").on('click', function() {
			if ($("#checkAll").prop("checked")) {
				$("input[name=checkOne]").prop("checked", true)
			} else {
				$("input[name=checkOne]").prop("checked", false)
			}
		});

		// 선택 삭제
		$(document).on("click", '#deleteBtn', function() {
			var cnt = $("input[name='checkOne']:checked").length;
			var arr = new Array();
			
			$("input[name='checkOne']:checked").each(function() {
				arr.push($(this).attr('id'));
			});

			if (cnt == 0) {
				alert("삭제할 항목을 선택해주세요.");
			}else {
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				if (confirm_val) {
					$.ajax({
						url : "/blacklist/delete.do",
						type : "post",
						data : "text",
						dataType : "json",
						success : alert("삭제되었습니다."),
						error : function() {
							alert("삭제에 실패하였습니다. 다시 시도해 주세요.");
						}
					});
				}
			}
		});
	</script>


	$(function() { let onNavbar = 0; // 네비 햄버거버튼 클릭했는지 아닌지 알기위한 변수
	$('#btn_navi_menu').on('click', function() { //햄버거버튼 클릭 시 if (onNavbar
	== 0) { $('.navi-onButtons').css({ "height" : "auto", "display" :
	"block" }); // 세로 네비영역 열기 $('.main').css({ "padding-top" : "10px" });
	onNavbar = 1; $('html, body').animate({ scrollTop : 0 }, 100); return
	false; } else { $('.navi-onButtons').css({ "height" : "0", "display" :
	"none" }); //세로 네비영역 닫기 $('.main').css({ "padding-top" : "92px" });
	onNavbar = 0; } }); $(window).resize(function() { //브라우저 크기를 조정했을때 if
	(window.innerWidth > 1199) { //브라우저 크기가 1199를 넘었다면
	$('.navi-onButtons').css({ "height" : "0", "display" : "none" }); //세로
	네비영역 닫기 onNavbar = 0; } }); });
	</script>
</body>
</html>