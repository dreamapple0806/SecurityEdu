<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
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

<style>
	@font-face{
		font-family: 'Noto_Sans_KR';
	src:url(resources/lib/fonts/Noto_Sans_KR/NotoSansKR-Regular.otf);
	}
	
	body { 
		font-family: 'Noto_Sans_KR', gothic; 
	}
	label { 
		font-family: 'Noto_Sans_KR', gothic; 
	}	
</style>

</head>
<body>
	<%
		Date d = new Date();
        SimpleDateFormat edf = new SimpleDateFormat("yyyy-MM-dd"); 
        String eymd = edf.format(d);
        
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        cal.add(cal.YEAR, -1); //날짜를 하루 더한다.
        String symd = sdf.format(cal.getTime());
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
		<form action="./excelDown.do" method="post">
		<div class="float-right" style="padding-right:5px;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm btn-warning my-2 my-sm-0" name="excelDown">엑셀다운</button>
		</div>
		<input type="hidden" id="symdToExcel" name="symdToExcel" value="<%=symd %>" />
		<input type="hidden" id="eymdToExcel" name="eymdToExcel" value="<%=eymd %>" />
		<input type="hidden" id="name" name="name" value="" />
		</form>	 	
	</nav>
	<div class="card bg-light mt-4">
		<div class="card-header bg-light show-grid ">
			<h5 class="card-title">
				<strong>방문자 등록 현황</strong>
			</h5>	
			<div class="row">
				<form class="form-inline" action="./eduListSearch.do" method="post" style="width:100%;">
					<input type="hidden" id="eduList" name="eduList" value="${list}" />
		     		<table class="table table-bordered table-condensed" style="font-size:9pt; ">
		    			<tbody>
							<tr class="text-center" style="height:35px;">
	    	    				<td class="text-center align-middle" style="font-size:12pt; width:15%">
    	    						등록자 성명
    	    					</td>
	    	    				<td class="text-center align-middle" style="font-size:12pt; width:30%">
    	    						<input class="text-center" type="text" name="name" style="width:300px" value="">
    	    					</td>
	    	    				<td class="text-center align-middle" style="font-size:12pt; width:15%">
    	    						등록일자
    	    					</td>
	    	    				<td class="text-center align-middle" style="width:35%">
    	    						<input class="text-center" type="date" name="symd" style="width:150px" value="<%=symd %>">
    	    				 		~ <input class="text-center" type="date" name="eymd" style="width:150px" value="<%=eymd %>">
    	    				 		&nbsp;&nbsp;&nbsp;
	        						<button class="btn btn-sm btn-primary my-2 my-sm-0" name="searchBtn" type="submit">조회</button>
    	    					</td>
      						</tr>
    					</tbody>
  					</table>
      			</form>
			</div>	
		</div>
		<div class="card-header bg-light show-grid ">
			<div class="row" style="height:100%; overflow-y: auto">
		     	<table class="table table-bordered table-condensed" style="margin:auto;table-layout:fixed;">
    				<thead>
	      				<tr class="text-center" style="height:35px;">
        					<th class="align-middle" style="font-size:9pt; width:50px">No</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">등록자 성명</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">생년월일</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">연락처</th>
        					<th class="align-middle" style="font-size:9pt; width:80px">Email</th>
        					<th class="align-middle" style="font-size:9pt; width:80px">등록일자</th>
        					<th class="align-middle" style="font-size:9pt; width:100px">동의여부</th>
      					</tr>
    				</thead>
    				<tbody>
    				<c:if test="${not empty list}">   	
      					<c:forEach var="item" items="${list}" varStatus="vs">
	      				<tr class="text-center" style="height:40px; padding-top: 0px; padding-bottom: 0px">
	      					<td class="align-middle" style="font-size:9pt; width:50px;">${(vs.index)+1}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">
        						<c:set var="name"       value="${list[vs.index].edu_name}" />
								<c:set var="totalLength" value="${fn:length(name) }" />
								<c:set var="first"      value="${fn:substring(name, 0, 1) }" />
								<c:set var="last"      value="${fn:substring(name, 2, totalLength) }" />
								
      							<c:forEach begin="0" end="${fn:length(list[vs.index].edu_name)-1}" varStatus="status">
        							<c:if test="${status.current%2 == 1}">
        							 	*
        							</c:if> 
        							<c:if test="${status.current%2 == 0}">
        							 	<c:out value="${fn:substring(name, status.current, status.current+1)}" />
        							</c:if>
      							</c:forEach>
								
							</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;" nowrap>
        						${fn:substring(list[vs.index].edu_birth,0,4) }
      							<!-- 월일에 *를 찍어줌 -->
      							<c:forEach begin="4" end="${fn:length(list[vs.index].edu_birth)-1}" step="1">
        						*
      							</c:forEach>
      						</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">
        						${fn:substring(list[vs.index].edu_phone,0,3) } - 
      							<!-- 전화번호 가운데 * 를 찍어줌 -->
      							<c:forEach begin="4" end="7" step="1">
        						*
      							</c:forEach>
      							-
      							${fn:substring(list[vs.index].edu_phone,7,11) }
        					</td>
        					<td class="align-middle" style="font-size:9pt; width:80px;" nowrap>
        						<c:set var="email" value="${fn:substring(list[vs.index].edu_mail,0,fn:indexOf(list[vs.index].edu_mail,'@')) }"/>
        							${fn:substring(fn:substring(list[vs.index].edu_mail,0,fn:indexOf(list[vs.index].edu_mail,'@')),0,3) }
        						<c:forEach begin="4" end="${fn:length(email)}" step="1">
        							*
      							</c:forEach>
        						@*.*
        					</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].indate}</td>
        					<td class="align-middle" style="font-size:9pt; width:100px;">${list[vs.index].edu_infochk}</td>
      					</tr>
      					</c:forEach>
      				</c:if>
      				
      				<%
      				for(int i=0; i<15; i++){
      				%>
      					<tr class="text-center" style="height:40px;">
		        			<td class="align-middle" style="font-size:9pt; width:50px;"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
        					<td class="align-middle" style="font-size:9pt; width:80px"></td>
        					<td class="align-middle" style="font-size:9pt; width:80px"></td>
        					<td class="align-middle" style="font-size:9pt; width:100px"></td>
	      				</tr>
					<%
      				}
					%>
    				</tbody>
  				</table>
			</div>	
		</div>
	</div>
	<!-- Jquery, popper, bootstrap 자바스크립트 추가 -->
	<script src="resources/lib/js/jquery-3.4.1.min.js"></script>
	<script src="resources/lib/js/popper.js"></script>
	<script src="resources/lib/js/bootstrap.min.js"></script>
	<script src="resources/lib/js/util.js"></script>
	
	<script>

	function excelDown(){
		alert("excelDown");
	}
	</script>
</body>
</html>
