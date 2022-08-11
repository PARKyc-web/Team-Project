<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
   color: #fc777b;
   overflow: hidden;
   pointer-events: none;
}
#container{
   	    width: 690px;
        background-color: rgba( 255, 255, 255, 0.95 );
        margin: 0 auto;
        margin-top:2%;
        margin-bottom:1%;
        border: 1px solid #f2f2f2;
    	border-radius:10px;
    	box-shadow: 1px 1px 2px #f0f0f0;
    	padding:2%;
}
h3{
   text-align: center;
   font-weight: bold;
}

input[type="submit"]{
      float: right;
      border: 1px rgb(34, 160, 87);;
      border-radius: 12px;
      background-color: #fc777b;
      font-weight: bold;
      color : white;
      
   }
</style>

</head>
<body>
	<div id="ddd" style="padding:4%;"></div>
   <div id = "container">
   <h3>리뷰작성</h3>
   <form action="./myReviewSend.do" method="post">
      <!--    별점 : <input type="number" step="0.5" max="5.0" min ="0.0" name="rate"><br>
       -->

      <span class="star"> ★★★★★ <span>★★★★★</span> <input
         type="range" oninput="drawStar(this)" name="rate" value="0"
         step="0.5" min="0" max="5">
      </span>
      <script> const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = (target.value * 20) + "%";
    console.log(target.value);
    console.log(target.value*20);
      // document.querySelector(target).value +"점";
}
</script>

      <br>
      <br>
      <textarea name="contents" cols="40" rows="3" placeholder="리뷰를 작성해주세요." required
         style="width: 500px; height: 200px;"></textarea>

      <input type="hidden" name="hotelId" value="${reservation.hotelId}">
      <input type="hidden" name="memberId" value="${reservation.memberId}">
      <input type="hidden" name="hotelName" value="${reservation.hotelName}">
      <input type="hidden" name="reservationId" value="${reservation.reservationId}">
      <input type="submit" value="작성완료">
   </form>
</div>
</body>
</html>