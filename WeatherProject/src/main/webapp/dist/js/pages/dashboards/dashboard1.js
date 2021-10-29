/*
Template Name: Admin Pro Admin
Author: Wrappixel
Email: niravjoshi87@gmail.com
File: js
*/
$(document).ready(function() {
    "use strict";
    // ============================================================== 
    // Newsletter
    // ============================================================== 
   
	var lat;
	var lng;
	if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      // 위도 : lat 경도 : lng 
	      console.log("함수들어옴!")
	      lat=position.coords.latitude;
	      lng=position.coords.longitude;
	      var geocode = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&language=ko&key=AIzaSyBTQZ3qftgrOjXVpGgS68to76ZrYz8e2xo";
	      $.ajax({
	          url: geocode,
	          type: 'POST',
	          dataType:"json",
	          success: function(myJSONResult){
                  if(myJSONResult.status == 'OK') {
                	  
                	  $("#address > span").text( myJSONResult.results[4].formatted_address);
                      /*
                       * var tag = "";
                       * var i;
                      for (i = 0; i < myJSONResult.results.length; i++) {
                        tag += "주소 : " +myJSONResult.results[i].formatted_address+" <br />";
                        tag += "위도 : " +myJSONResult.results[i].geometry.location.lat+" <br />";
                        tag += "경도 : " +myJSONResult.results[i].geometry.location.lng+" <br />";
                      }
                      document.getElementById("message").innerHTML = tag;
                      */
                  } else if(myJSONResult.status == 'ZERO_RESULTS') {
                      alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                  } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                      alert("할당량이 초과되었습니다.");
                  } else if(myJSONResult.status == 'REQUEST_DENIED') {
                      alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                  } else if(myJSONResult.status == 'INVALID_REQUEST') {
                      alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                  }
          		}
	      	});
	     //  alert(position.coords.latitude + ' ' + position.coords.longitude);
	      getWeatherInfo(position.coords.latitude, position.coords.longitude);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
    	
    function getWeatherInfo(lat, lon){
    	// 위도 : lat 경도 : lon
    	var weathermap = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&units=metric&appid=35f3b00f4edc36b661fce65fd4c48c85";
    	$.ajax({
            url: weathermap,
            type: 'POST',
            dataType:"json",
            success: function(weatherData){
               // console.log("현재온도: " + weatherData.current.temp); // 현재온도
               const days = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
               var labels = [];
               var series = [];
               var maxTemp = [];
               var minTemp = [];
               for(var i = 0; i < 7; i++){
            	   var date = new Date(weatherData.daily[i].dt * 1000);
            	   console.log("날짜: " + date.getDate() + "일(" + days[date.getDay()] + ")");
            	   labels.push(date.getDate() + "일(" + days[date.getDay()] + ")");
            	   maxTemp.push(weatherData.daily[i].temp.max);
            	   minTemp.push(weatherData.daily[i].temp.min);
            	   console.log(date.getDate() + "일(" + days[date.getDay()] + ")" + " 최고기온: " + weatherData.daily[i].temp.max); 
            	   console.log(date.getDate() + "일(" + days[date.getDay()] + ")" + " 최저기온: " + weatherData.daily[i].temp.min); 
               }
               var series = [maxTemp, minTemp];
               console.log("labels = " + labels);
               console.log("series = " + series);
               var chart = new Chartist.Line('.campaign', {
                   labels: labels,
                   series: series
               }, {
                   low: 0,
                   high: 20,

                   showArea: true,
                   fullWidth: true,
                   plugins: [
                       Chartist.plugins.tooltip()
                   ],
                   axisY: {
                       onlyInteger: true,
                       scaleMinSpace: 40,
                       offset: 20,
                       labelInterpolationFnc: function(value) {
                           return (value / 1);
                       }
                   },

               });

               // Offset x1 a tiny amount so that the straight stroke gets a bounding box
               // Straight lines don't get a bounding box 
               // Last remark on -> http://www.w3.org/TR/SVG11/coords.html#ObjectBoundingBox
               chart.on('draw', function(ctx) {
                   if (ctx.type === 'area') {
                       ctx.element.attr({
                           x1: ctx.x1 + 0.001
                       });
                   }
               });

               // Create the gradient definition on created event (always after chart re-render)
               chart.on('created', function(ctx) {
                   var defs = ctx.svg.elem('defs');
                   defs.elem('linearGradient', {
                       id: 'gradient',
                       x1: 0,
                       y1: 1,
                       x2: 0,
                       y2: 0
                   }).elem('stop', {
                       offset: 0,
                       'stop-color': 'rgba(255, 255, 255, 1)'
                   }).parent().elem('stop', {
                       offset: 1,
                       'stop-color': 'rgba(64, 196, 255, 1)'
                   });
               });
               var chart = [chart];
              
               // console.log("일주일 온도: " + weatherData.daily[0].temp.max); // daily를 for문써서 7일 돌려야함.
            }
        	});
    	}
    
});