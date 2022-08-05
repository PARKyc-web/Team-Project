<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=yfntmtqunm&submodules=geocoder"></script>
<style>
#container {
	width: 800px;
	margin: 0px auto;
}
</style>
</head>
<body>
	<div id="container">
		<div id="map" style="width: 100%; height: 50vh;"></div>
	</div>
	<input type='hidden' id="hotelAddress" value="${hotelAddr}">
 

	<script>		
		let hotelAddr = document.getElementById('hotelAddress').value;

		var mapOptions = {
			center : new naver.maps.LatLng(37.3595704, 127.105399), //경도와 위도
			zoom : 15,
			mapTypeControl : true
		};
		
		var map = new naver.maps.Map('map', mapOptions); // id and mapOption
		// 맵 만드는 부분

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.3, 127.1),
			map : map
		});
		
		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true
		});
		
		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        query: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        if (response.v2.meta.totalCount === 0) {
		            return alert('totalCount' + response.v2.meta.totalCount);
		        }

		        var htmlAddresses = [],
		            item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);

		        if (item.roadAddress) {
		            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		        }

		        if (item.jibunAddress) {
		            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		        }

		        if (item.englishAddress) {
		            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		        }

		        infoWindow.setContent([
		            '<div style="padding:10px;min-width:200px;line-height:150%;">',
		            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        map.setCenter(point);
		        marker.setPosition(point);
		        //infoWindow.open(map, point);
		    });
		}
		
		function hasArea(area) {
		    return !!(area && area.name && area.name !== '');
		}

		function hasData(data) {
		    return !!(data && data !== '');
		}

		function checkLastString (word, lastString) {
		    return new RegExp(lastString + '$').test(word);
		}

		function hasAddition (addition) {
		    return !!(addition && addition.value);
		}
		
		searchAddressToCoordinate(hotelAddr);
		
	</script>
</body>
</html>