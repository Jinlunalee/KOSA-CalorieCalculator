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
	    height: 700px;
	    border: 2px solid black;
	    width: 800px;
	    margin: 0 auto;
	}
	.title{
		text-align: center;
		margin-bottom: 20px;
		position: relative;
	}
	.title>span{
		font-size: 35px;
	}
	.exer-img{
	    width: 125px;
	    height: 125px;
	    display: block;
        margin: 15px auto;
	}
	.excercise table{
		border-spacing: 75px 10px;
	}
	.excercise h2{
	 	text-align: center;
	}
	.excercise td{
		text-align: center;
        width: 160px;
        height: 190px;
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
        top: 66px;
    	right: 102px;
	    color: red;
	}
	/* main{
		display: none;}
	 */
	 .submit{
	    line-height: 30px;
   	 	height: 30px;
	 }
	 .submit span{
	 	font-size: 14px;
	 } 
	 .submit input{
 	    text-align: right;
	    width: 150px;
	    padding-right: 27px;
	    font-size: 12px;
	    height: 25px;
	 }
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
	.hdn{
		font-size: 10px;
	    position: relative;
    	right: 21px;
	}
	.submit button{
		display: none;
	}
	.kcal-per-hour{
		display: none;
	}
	.exerciseName{
	    font-size: 23px;
	    margin-bottom: 7px;
	    display: inline-block;
	}
</style>
<script type="text/javascript">
	$(function(){
	    $(".submit input").on("keyup",function(key){
	        if(key.keyCode==13) {
	    		var weight = $(this).val();
	    		$(".kcal").each(function(){
	    			$(".kcal-per-hour").show();
	    			var kcal =  $(this).next().val();
	    			$(this).html(kcal * weight);
	    		});
	        }
	    });
		
	});
	function findExercise(obj){
		var param = $(obj);
		var weight = param.find("input").val();
		$(".kcal").each(function(){
			$(".kcal-per-hour").show();
			var kcal =  $(this).next().val();
			$(this).html(kcal * weight);
		});
		
		return false;
	}
	
</script>
<body>
	<main>
		<h1 class="title">
			<span>운동별 칼로리 소모량</span><br>
			<!-- <form action="#" class="submit" onsubmit="findExercise(this);"> -->
			<form class="submit" onsubmit="return false;">
				<span>체중 :  </span><input type="number" placeholder="체중을 입력해주세요." required><span class="hdn">kg</span>
				<button type="submit">확인</button>
			</form>
			<a id="root" href="/">뒤로가기</a>
		</h1>
		<section class="flex result">
			<div class="excercise">
				<table>
					<c:forEach var="i" begin="0" end="2" step="1">
						<tr class="tr">
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
									<span class="kcal-per-hour">시간 당 
										<span class="kcal">${result.exerciseItems[j].exerciseKcalBy1kg}</span>
										<input class="hiddenKcal" type="hidden" value="${result.exerciseItems[j].exerciseKcalBy1kg}">
										kcal</span>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</main>
</body>
</html>