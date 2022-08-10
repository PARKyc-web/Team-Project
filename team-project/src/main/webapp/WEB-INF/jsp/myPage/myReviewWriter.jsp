<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style>
 .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }</style>
<!-- <style>
HTML CSSResult Skip Results Iframe
EDIT ON
.starpoint_wrap{display:inline-block;}
.starpoint_box{position:relative;background:(C:\Users\admin\git\Team-Project\team-project\src\main\webapp\image\0별.png) 0 0 no-repeat;font-size:0;}
.starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:(C:\Users\admin\git\Team-Project\team-project\src\main\webapp\image\5별.png) 0 -20px no-repeat;pointer-events:none;}
.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}
.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}
</style> -->
</head>
<body>
	<h3>리뷰작성</h3>
	<form action = "./myReviewSend.do" method = "post">
		내용 : <input type="text" name="contents"><br>
		
	<!-- 	별점 : <input type="number" step="0.5" max="5.0" min ="0.0" name="rate"><br>
		 -->
		 <span class="star">
  ★★★★★
  <span>★★★★★</span>
  <input type="range" oninput="drawStar(this)" name = "rate" value="1" step="1" min="0" max="10">
</span>
<script> const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
}</script>
  <!--    <div class="starpoint_wrap">
      <div class="starpoint_box">
        <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
        <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
        <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
        <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
        <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
        <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
        <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
        <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
        <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
        <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
        <input type="radio" name="rate" id="starpoint_1" class="star_radio">
        <input type="radio" name="rate" id="starpoint_2" class="star_radio">
        <input type="radio" name="rate" id="starpoint_3" class="star_radio">
        <input type="radio" name="rate" id="starpoint_4" class="star_radio">
        <input type="radio" name="rate" id="starpoint_5" class="star_radio">
        <input type="radio" name="rate" id="starpoint_6" class="star_radio">
        <input type="radio" name="rate" id="starpoint_7" class="star_radio">
        <input type="radio" name="rate" id="starpoint_8" class="star_radio">
        <input type="radio" name="rate" id="starpoint_9" class="star_radio">
        <input type="radio" name="rate" id="starpoint_10" class="star_radio">
        <span class="starpoint_bg"></span>
      </div>
    </div> -->
		<input type="hidden" name="hotelId" value="${reservation.hotelId}">
		<input type="hidden" name="memberId" value="${reservation.memberId}">
		<input type="hidden" name="hotelName" value="${reservation.hotelName}">
		<input type="submit" value="작성완료">
	</form>
</body>
</html>