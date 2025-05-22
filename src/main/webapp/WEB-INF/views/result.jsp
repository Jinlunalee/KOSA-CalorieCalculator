<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<meta charset="UTF-8">
<title>칼로리 계산</title>
</head>
<style>
	.flex{
		display: flex;
	}
	.bold{
		font-weight: bold;
	}
	.calc-result{
	
	}
	@font-face {
	    font-family: 'NEXON Lv1 Gothic OTF Light';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF Light.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
		list-style: none;
		color: black;
		font-family: 'NEXON Lv1 Gothic OTF Light', 'Malgun Gothic', Sans-Serif;
	}
	main{
	    margin: 120px auto 0;
    	width: 1000px;
	}
	.result{
	    justify-content: center;
	    align-items: center;
	    height: 620px;
        border: 2px solid black;
	    width: 1000px;
	}
	.title{
		text-align: center;
		margin-bottom: 20px;
		position: relative;
	}
	.title span{
		font-size: 35px;
	}
	.exer-img{
	    width: 125px;
	    height: 125px;
	    display: block;
	    margin-bottom: 5px;
	}
	.excercise{
	    margin-left: 80px;
	}
	.excercise table{
		border-spacing: 6px 10px;
	}
	.excercise h2{
	 	text-align: center;
	}
	.excercise td{
		text-align: center;
	    width: 125px;
	}
	.excercise .kcal-perhour{
		font-size: 10px;
	}
	.excercise .minute{
		font-size: 14px;
	}
	.info{
		height: 100%;
		padding-top: 40px;
	}
	.myinfo{
		width: 400px;
	}
	.info table, .info tr, .info td, .info th{
		border-collapse: collapse;
		border: 1px solid black;
	}
	.info h2{
		margin-bottom: 15px;
	}
	.info table th{
		text-align: center;
	}
	.info table th:nth-child(1){
		width:  60px;
	}
	.info table th:nth-child(2){
		width:  40px;
	}
	.info table th:nth-child(3){
		width:  40px;
	}
	.info table th:nth-child(4){
		width:  135px;
	}
	.info table th:nth-child(5){
		width:  115px;
	}
	.info table tr{
		height: 30px;
	}
	.info table td{
		text-align: center;
		font-size: 13px;
		
	}
	.info ul li{
		margin-bottom: 65px;
	}
	
	.weight>div{
		height: 30px;
	}
	.weight .bar{
		display: inline-block;
	    height: 10px;
	    background-color: gray;
	    margin-left: 10px;
	}
	.kcal-result>p{
		height: 30px;
	}
	.kcal-result>p strong{
		display: inline-block;
    	width: 150px;
	}
	.kcal-result>p span{
		display: inline-block;
	    width: 80px;
	    text-align: right;
	}
	.less{
		width: 400px;
		height: 100%;
		text-align: center;
	}
	.less img{
		width: 300px;
	}
	#root{
	    position: absolute;
	    text-decoration: none;
	    font-size: 15px;
	    top: 40px;
	    right: 4px;
	    color: red;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		var gender;
		if(${param.gender} == 1){ //남자면 22
			gender = 22;
		}else{ //여자면 21
			gender = 21; 
		}
		var height = ${param.height}/100;
		var weight = ${param.weight};
		var goalWeight = ${param.goalWeight};
		var avgWeight = Math.round(Math.round(height*100)/100 * Math.round(height*100)/100 * gender);
		
		$(".now-weight").css("width", weight*2+"px");
		$(".avg-weight").css("width", avgWeight*2+"px");
		$(".goal-weight").css("width", goalWeight*2+"px");
		$(".avg-weight-number").html(avgWeight+"kg");
		
	});
	
	
</script>
<body>
	<main>
		<h1 class="title">
			<span>계산 결과</span>
			<a id="root" href="/">뒤로가기</a>
		</h1>
		<section class="flex result">
			<div class="info">
				<ul>
					<li><!-- 헤더 -->
						<h2>내 정보</h2>
						<table class="myinfo">
							<tr>
								<th>신장</th>
								<th>연령</th>
								<th>성별</th>
								<th>활동량</th>
								<th>검사일시</th>
							</tr>
							<tr>
								<td>
									<fmt:formatNumber value="${param.height}" pattern="000" />cm
								</td>
								<td>${param.age}세</td>
								<td>
									<c:if test="${param.gender eq '1'}">
										남성
									</c:if>
									<c:if test="${param.gender eq '2'}">
										여성
									</c:if>
								</td>
								<td>
									<c:if test="${param.active eq '1.2'}">
										거의 운동하지 않음
									</c:if>
									<c:if test="${param.active eq '1.375'}">
										가벼운 운동
									</c:if>
									<c:if test="${param.active eq '1.55'}">
										보통 수준
									</c:if>
									<c:if test="${param.active eq '1.725'}">
										적극적 운동
									</c:if>
									<c:if test="${param.active eq '1.9'}">
										매우 적극적 운동
									</c:if>
								</td>
								<td>
									<c:set var="today" value="<%=new java.util.Date()%>" />
									<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</table>
					</li>
					<li class="weight">
						<h2>체중 정보</h2>
						<div>
							<strong>현재 체중</strong>
							<div class="bar now-weight"></div> <!-- 가로 길이는 (kg x 2) px -->
							<span>
								<fmt:formatNumber value="${param.weight}"  pattern="0" />kg
							</span>
						</div>
						<div>
							<strong>표준 체중</strong>
							<div class="bar avg-weight"></div>
							<span class="avg-weight-number"></span>
						</div>
						<div>
							<strong>목표 체중</strong>
							<div class="bar goal-weight"></div>
							<span>
								<fmt:formatNumber value="${param.goalWeight}" pattern="0" />kg
							</span>
						</div>
					</li>
					<li class="kcal-result">
						<h2>계산 결과</h2>
						<p>
							<strong>내 기초대사량</strong>
							<span><fmt:formatNumber value="${result.bmr}" pattern="0" />kcal</span>
						</p>
						<p>
							<strong>일일 총 소비에너지</strong>
							<span><fmt:formatNumber value="${result.tdee}" pattern="0" />kcal</span>
						</p>
						<c:if test="${result.period > 0}">
							<p>
								<strong>일일 권장소모 열량</strong>
								<span>500kcal</span>
							</p>
							<p>
								<strong>목표까지 예상 소요일</strong>
								<span>${result.period}일</span>
							</p>
						</c:if>
					</li>
				</ul>
			</div>
			<div class="excercise">
				<c:if test="${result.period > 0}">
					<h2>목표 달성을 위한 일일 권장 운동 시간</h2>
					<table>
						<c:forEach var="i" begin="0" end="2" step="1">
							<tr>
								<c:forEach var="j" begin="${i*3}" end="${i*3+2}" step="1">
									<c:set var="name" value="${result.exerciseItems[j].exerciseName}"></c:set>
									<td> <!-- 권장 소모 열량에 따른 운동 목록 -->
										<img class="exer-img" src="/images/${result.exerciseItems[j].exerciseName}.png">
										<strong class="exerciseName">
											<c:choose>
												<c:when test="${name eq 'jumpRope'}">줄넘기</c:when>
												<c:when test="${name eq 'golf'}">골프</c:when>
												<c:when test="${name eq 'swim'}">수영</c:when>
												<c:when test="${name eq 'dance'}">댄스</c:when>
												<c:when test="${name eq 'walking'}">걷기</c:when>
												<c:when test="${name eq 'running'}">달리기</c:when>
												<c:when test="${name eq 'climbing'}">등산</c:when>
												<c:when test="${name eq 'bicycle'}">자전거</c:when>
												<c:when test="${name eq 'soccer'}">축구</c:when>
											</c:choose>
										</strong><br>
										<span class="minute"><fmt:formatNumber value="${result.exerciseItems[j].exerciseTime}" pattern="0"  />분</span><span class="kcal-perhour">
											(시간 당 <fmt:formatNumber value="${result.exerciseItems[j].exerciseKcal}" pattern="0" />kcal)
										</span>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test="${result.period < 0}">
					<div class="less">
						<h2>목표 체중까지 화이팅!</h2>
						<img src="/images/food-rion.gif">
					</div>
				</c:if>
				<c:if test="${result.period == 0}">
					<div class="less">
						<h2>이미 목표에 달성하셨습니다.</h2>
						<img src="/images/fighting_rion.gif">
					</div>
				</c:if>
			</div>
		</section>
	</main>
</body>
</html>