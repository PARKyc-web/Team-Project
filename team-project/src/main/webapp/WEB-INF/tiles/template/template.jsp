<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html>
<html lang="ko">

    <head>    
        <meta charset="utf-8" />
        <title>AirBnB</title>
        
        <!-- Favicon-->
        <link rel="icon" href="image/logo.png" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="tileExample/css/styles.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
   		<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		
   		<style>
   		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap');
   		@import url('https://fonts.googleapis.com/css2?family=Secular+One&display=swap');  	
   		  	*{
   		  	  font-family: 'Noto Sans KR', sans-serif;
   		  	}
  		  	
   			#profile_image{
   				border-radius:50%;
   			}
   			
   			.uploadImageDiv{
   				width:300px;
   				height:300px;
   			}
   			#user_image{
				width:100%;
				height:100%;
   				object-fit:cover;
   			}
   			
   			.uploadLabel{
   				width:120px;
   			}
   			
   			#real-body{
   				height:auto;	
				min-height:84vh;				
				padding-bottom:70px;
   			}
   			
   			#real-footer{
   				height:70px;
				position : relative;
  				transform : translateY(0%);
   			}
   			
   		</style>   
    </head>
    
    <body>
    
        <!-- Navigation-->
		
		<tiles:insertAttribute name="head"></tiles:insertAttribute>
                        
        <!-- Menu: Never USE -->
        <tiles:insertAttribute name="menu"></tiles:insertAttribute>
        
        <!-- Section-->
		<div id="real-body">
        	<tiles:insertAttribute name="body"></tiles:insertAttribute>
		</div>
		
        <!-- Footer-->
        <div id="real-footer">
        	<tiles:insertAttribute name="foot"></tiles:insertAttribute>
        </div>
        
        <!-- Core theme JS-->
        <script src="tileExample/js/scripts.js"></script>
    </body>
</html>
