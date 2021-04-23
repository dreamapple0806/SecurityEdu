<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<!-- head 태그에는 css 링크를 걸어준다. -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>HJIT 출입자 교육인증 시스템</title>
<!-- 부트스트랩, 커스텀 css 파일 링크 설정 -->
<link rel="stylesheet" href="resources/lib/css/bootstrap.min.css">
<link rel="shortcut icon" href="resources/image/favicon.ico" type="image/x-icon">
<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
<script src="resources/lib/js/popper.js"></script>
<script src="resources/lib/js/bootstrap.min.js"></script>
<script src="resources/lib/js/util.js"></script>
<script src="resources/lib/jsDelivr/sweetalert2.all.min.js"></script>
<script src="resources/lib/jsDelivr/promise.min.js"></script>

<style>
	@font-face{
		font-family: 'Noto_Sans_KR';
	src:url(resources/lib/fonts/Noto_Sans_KR/NotoSansKR-Regular.otf);
	}
	
	.swal2-title{
		font-size: 20px;
	}
	
	body { 
		font-family: 'Noto_Sans_KR', gothic; 
	}
	label { 
		font-family: 'Noto_Sans_KR', gothic; 
	}	
</style>

</head>
<!-- <body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'> -->

<body>
	<%
		request.setCharacterEncoding("utf-8");	
		Date d = new Date();	       
        String s = d.toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String eymd = sdf.format(d);
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./">
			<img alt="한진인천컨테이너터미널" src="http://www.hjit.co.kr/homepage/kor/_Img/Common/logo.png" />&nbsp;
			<font style="font-style: normal; font-weight: bold; vertical-align:middle;">출입자 교육인증 시스템</font>
		</a>
		<div id="navbar" class="collapse navbar-collapse float-right">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="./">출입자 교육</a></li>
				<li class="nav-item active"><a class="nav-link" href="./securityEduList.do">방문자 등록 현황</a></li>
			</ul>
		</div>
	</nav>
	
	<!-- 모달 영역 -->
	<div id="SecurityPolicyDetail" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="SecurityPolicyDetail">
		<div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">HJIT 개인정보처리방침</h4>
				</div>
				<div class="modal-body">
					<img src="http://www.hjit.co.kr/_UPLOAD/BOARD/1/2021/4/82kEwmqRuYbyUpfa.PNG" alt="My Image">
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	<div class="card bg-light mt-4 container">	
		<div class="card-header bg-light show-grid" style="text-align: center;">
			<h5 class="card-title" style="vertical-align: middle; text-align: left;">
				<span class='font-weight-bold'>출입자 교육 영상</span>
			</h5>
			
			<video id="player" width="854" height="480"> <!--  autoplay="autoplay"> -->
				<source src="http://www.hjit.co.kr/homepage/kor/Popup/securityEdu.mp4">
			</video>
		<br><button class="btn btn-danger" name="videoPlay" onclick="javascript:play()">재생하기</button>
		<button class="btn btn-primary" name="videoPause" onclick="javascript:pause()">정지하기</button>
		</div>
	</div>
	<form method="post" id="Form" name="Form" method="post">
	<div class="card bg-light mt-4 container" id="Table" style="display:none;">		
		<div class="card-header bg-light show-grid" >
			<h5 class="card-title" style="vertical-align: middle;">
				<span class='font-weight-bold'>교육자 정보</span>
			</h5>	
			
			<table class="table table-bordered table-condensed" style="font-size:9pt;">
	    		<thead>
      				<tr class="text-center">
        				<th>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</th>
	   					<th>생년월일</th>
        				<th>연 락 처</th>
   						<th>E-Mail</th>        				
   						<th>개인정보 활용 동의</th>
      				</tr>
    			</thead>
    			<tbody>
	      			<tr class="text-center text-truncate">
        				<td style="vertical-align:middle;"><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="edu_name" name="edu_name" value="" placeholder="" aria-label="edu_name" ></td>
        				<td style="vertical-align:middle;"><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="edu_birth" name="edu_birth" value="" placeholder="생년월일 8자리" aria-label="edu_birth" maxlength="8"></td>
        				<td style="vertical-align:middle;"><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="edu_phone" name="edu_phone" value="" placeholder="번호만 입력하세요" aria-label="edu_phone" maxlength="11"></td>
						<td style="vertical-align:middle;"><input class="form-control mr-sm-2 text-center" style="font-size:9pt; height:30px;" type="text" id="edu_mail" name="edu_mail" value="" placeholder="" aria-label="edu_mail" ></td>
						<td style="vertical-align:middle;"><input type="checkbox" id="edu_infoChk" name="edu_infoChk" onclick="javascript:infoChk();" value="N" /></td>
        			</tr>        			
	      			<tr class="text-center">
	      				<td colspan="5">
	      					<strong>
	      						<font color="red">※ 입력하신 정보는 1년 뒤, 자동 삭제 됩니다.</font>
	      					</strong>
	      				</td>
	      			</tr>
	      			<tr>
      					<td colspan="5" style="text-align:center;">
							<a href="./"><button type="button" class="btn btn btn-danger">초기화</button></a>&nbsp;&nbsp;		
							<button type="button" class="btn btn btn-primary" onclick="javascript:functionBtn()">저장</button>
      					</td>
      				</tr>
    			</tbody>
			</table>
		</div>
	</div>
	</form>
</body>
	<script>
		$().ready(function () { 
			
		});
      	
		function functionBtn() {			
			var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	 			
			if($('#edu_name').val() == ""){
				Swal.fire("성명을 입력해 주세요.");
	            return false;
			}			
			if($('#edu_birth').val() == ""){
				Swal.fire("생년월일을 입력해 주세요.");
	            return false;
			}			
			if($('#edu_birth').val().length < 8){
				Swal.fire("생년월일을 모두 입력해 주세요");
	            return false;
			}			
			if($('#edu_phone').val() == ""){
				Swal.fire("연락처를 입력해 주세요.");
	            return false;
			}			
			if($('#edu_mail').val() == ""){
				Swal.fire("이메일주소를 입력해 주세요.");
	            return false;
			}		
			if($('#edu_infoChk').is(":checked") == false){
				Swal.fire("개인정보 활용동의를 확인해주세요.");
	            return false;
			}
			else{
				$('#edu_infoChk').val('Y');				
			}
		        	
		    var f = document.forms[0];
		    f.action = "eduUserSave.do";
		    f.target = "";
		    f.submit();
		    
		}
		
		function infoChk(){
			if($('#edu_infoChk').val() == "N"){
				$('#edu_infoChk').val("Y");
				

				$('#SecurityPolicyDetail').modal('show');
			}
		}
		
		var vid = document.getElementById("player");

		function play() {
		    vid.play();
		}

		function pause() {
		    vid.pause();
		}
		
		document.getElementById('player').addEventListener('ended', function(){
			Swal.fire({ 
				icon: 'success', // Alert 타입 
				title: '출입자 교육영상을 모두 시청하셨습니다.\n아래 교육자 정보를 입력해주세요.' // Alert 제목 
			}); 
			
 			var tableObject1 = document.getElementById("Table");
 			
 			if(tableObject1.style.display == 'none'){
	 			tableObject1.style.display = "";
 			}
 			else{
	 			tableObject1.style.display = "none";
 			}
		});
		
	</script>
</html>
