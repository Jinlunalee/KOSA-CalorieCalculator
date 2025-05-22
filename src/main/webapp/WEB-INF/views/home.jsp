<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼로리 계산기</title>
</head>
<style>
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
	.calculator{
	    width: 470px;
	    margin: 150px auto;
	    border: 5px solid #6c8b6e;
	    padding: 45px 20px 20px 20px;
	    height: 610px;
	    position: relative;
        background-color: white;
        border-radius: 15px;
        box-shadow: 8px 8px 5px rgb(0 0 0 / 40%);
        
	}
	table{
		width: 100%;
	}
	tr{
		height: 60px;
	}
	tr>td:first-child {
		width: 35%;
		padding-left: 10px;
	    font-weight: bold;
    	font-size: 20px;
	}
	tr>td:last-child {
		width: 65%;	
	}
	input[type="text"]{
	    height: 30px;
    	width: 225px;
   	    text-align: right;
    	padding-right: 40px;
    	font-size: 16px;
	} 
	.unit{
		position: relative;
	    right: 40px;
	    font-weight: bold;
	}
	select{
	    width: 225px;
	    height: 30px;
	    text-align: center;
	    cursor: pointer;
	}
	.gender-box{
		width: 225px;
    	text-align: center;
	}
	.gender-box>label, .gender-box>input, option{
		cursor: pointer;
	}
	#male{
		margin-right: 20px;
	}
	.last-tr>td{
		text-align: center;
	    padding: 0;
	    padding-top: 40px;
	}
	.last-tr>td>input{
		width: 300px;
		height: 50px;
		cursor: pointer;
		background-color: font-weight: bold;
	    font-size: 20px;
	    font-weight: bold;
	    border: none;
	    border-radius: 10px;
	    color: white;
	    background-color: #6c8b6e;
	}
	.calc-header{
		position: absolute;
		width: 300px;
		height: 50px;
		border: 3px solid #6c8b6e;
		background-color: white;
	    top: -30px;
	    left: 85px;
	    display: flex;
   	    align-items: center;
	    justify-content: center;
	    border-radius: 10px;
	}
	.calc-header>span{
	    font-size: 20px;
    	font-weight: bold;
	}
	.exersice-page{
		width: 300px;
	    height: 50px;
		display: block;
	    position: relative;
	    top: 18px;
	    background: none;
	    color: black;
	    font-size: 15px;
	    border: 1px solid #6c8b6e;
	    margin: 0 auto;
	    border-radius: 10px;
	    text-decoration: none;
	    line-height: 50px;
	}
</style>
<body>
	<section>
		<div class="calculator">
			<div class="calc-header">
				<span>다이어터 계산기</span>
			</div>
			<form action="/result" method="get">
				<table>
					<tr>
						<td>
							키
						</td>
						<td>
							<input type="text" name="height" required>
							<span class="unit">cm</span>
						</td>
					</tr>
					<tr>
						<td>체중</td>
						<td>
							<input type="text" name="weight" required>
							<span class="unit">kg</span>
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<div class="gender-box">
								<label for="male">남성</label> 
								<input id="male" type="radio" name="gender" value="1" required>
								<label for="female">여성</label> 
								<input type="radio" id="female" name="gender" value="2" required>
							</div>
						</td>
					</tr>
					<tr>
						<td>나이</td>
						<td>
							<input type="text" name="age" required>
							<span class="unit">세</span>
						</td>
					</tr>
					<tr>
						<td>활동량</td>
						<td>
							<select name="active">
								<option value="1.2">거의 운동하지 않음</option>
								<option value="1.375">가벼운 운동</option>
								<option value="1.55">보통 수준</option>
								<option value="1.725">적극적 운동</option>
								<option value="1.9">매우 적극적 운동</option>
							</select>
						</td>
					</tr>			
					<tr>
						<td>목표 체중</td>
						<td>
							<input type="text" name="goalWeight" required>	
							<span class="unit">kg</span>				
						</td>
					</tr>	
					<tr class="last-tr">
						<td colspan="2">
							<input type="submit" value="계산하기">
							<a href="/excersice" class="exersice-page">운동별 칼로리 소모량 조회</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section> 
</body>
</html>