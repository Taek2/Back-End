/*
Template Name: Admin Pro Admin
Author: Wrappixel
Email: niravjoshi87@gmail.com
File: js
 */

$(document).ready(refresh()); // 페이지를 불러올 때 자동으로 실행
function refresh(){
	if (navigator.geolocation) { // GPS를 지원하면
		navigator.geolocation.getCurrentPosition(function(position) {
			// 위도 : lat 경도 : lng   
			var lat=position.coords.latitude;
			var lng=position.coords.longitude;
			// 현재 위도, 경도 페이지에 저장
			$("#lat").text(lat);
			
			// 위도 경도를 인자로 geocodeAPI에서 데이터를 받아옴
			var googleKey = "자신의 키를 입력하세요!";
			var geocode = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&language=ko&key="+googleKey;
			$.ajax({
				url: geocode,
				type: 'POST',
				dataType:"json",
				success: function(myJSONResult){
					if(myJSONResult.status == 'OK') { // 잘 수행됐다면 주소 정보를 페이지에 출력
						$("#address > span").text( myJSONResult.results[4].formatted_address);
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
			getWeatherInfo(position.coords.latitude, position.coords.longitude); // 위도, 경도 를 인자로 날씨 데이터를 받아오는 함수 호출
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
}

function getWeatherInfo(lat, lon){
	// 위도 : lat 경도 : lon
	var appId = "자신의 appId를 입력하세요!";
	var weathermap = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&exclude=minutely,alerts&units=metric&appid="+appId;
	$.ajax({
		url: weathermap,
		type: 'POST',
		dataType:"json",
		success: function(weatherData){
			// console.log("현재온도: " + weatherData.current.temp); // 현재온도
			const days = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
			const days_full = ["Sunday", "Monday", "Tuesday", "Wednesday","Thursday","Friday", "Saturday"];
			var labels = [];
			var series = [];
			var maxTemp = [];
			var minTemp = [];

			// 오늘 날씨 데이터 정제
			var curDate = new Date(weatherData.current.dt * 1000);
			$("#currentIcon").attr("src", "http://openweathermap.org/img/wn/" + weatherData.current.weather[0].icon + "@2x.png");
			$("#currentTemp").text((Math.round(weatherData.current.temp * 10) / 10) + "°C");
			$("#currentWeek").text(curDate.getDate() + "일(" + days[curDate.getDay()] + ")");
			var curHour = curDate.getHours();
			curHour = curHour >= 10 ? curHour : '0' + curHour;
			var curMin = curDate.getMinutes();
			curMin = curMin >= 10 ? curMin : '0' + curMin;
			var curSec = curDate.getSeconds();
			curSec = curSec >= 10 ? curSec : '0' + curSec;
			
			// 페이지에 맵핑
			$("#currentTime").text("현재 시각 " + curHour + ":" + curMin + ":" + curSec + " 기준");
			$("#currentWind").text(weatherData.current.wind_speed + " m/s");
			$("#currentHumidity").text(weatherData.current.humidity + " %");
			$("#currentPressure").text(weatherData.current.pressure + " hPa");
			$("#currentCloud").text(weatherData.current.clouds + " %");

			// 시간 별 데이터 정제
			var hourly = weatherData.hourly;
			for(var i = 0; i < 8; i++){
				if(i == 1 || i == 3 || i == 5 || i == 7){
					var hourTime = new Date(hourly[i].dt * 1000);
					$("#hourlyImg"+i).attr("src", "http://openweathermap.org/img/wn/" + hourly[i].weather[0].icon + "@2x.png");
					var hourlyHour = hourTime.getHours();
					hourlyHour = hourlyHour >= 10 ? hourlyHour : '0' + hourlyHour;
					$("#hourly"+i).text(hourlyHour+ ":00");
					$("#hourlyTemp"+i).text((Math.round(hourly[i].temp * 10) / 10) + "°")
					console.log(hourTime);   
				}
			}
			
			var category = ["Date","Weather","Precipitation","UV index","Pressure","Humidity","Windspeed"];
			// 주간 날씨 데이터 정제
			for(var i = 0; i < 7; i++){			
				var date = new Date(weatherData.daily[i].dt * 1000);
				var weather = weatherData.daily[i].weather[0].icon
				var precipitation = weatherData.daily[i].pop;
				var uvi = weatherData.daily[i].uvi;
				var pressure = weatherData.daily[i].pressure;
				var humidity = weatherData.daily[i].humidity;
				var windspeed = weatherData.daily[i].wind_speed;

				$("#th"+i).text(category[i]);
				$("#weekday"+i).text(days[date.getDay()])
				$("#date"+i).text((date.getMonth()+1) + "월 " +date.getDate() + "일");
				$("#sunrise"+i).html("<img src='http://openweathermap.org/img/wn/" + weather + "@2x.png' width='50px' height='50px'>");
				$("#sunset"+i).text(Math.round(precipitation*100) + " %");
				$("#moonrise"+i).text(uvi);
				$("#moonset"+i).text(pressure + " hPa");
				$("#moon_phase"+i).text(humidity + " %");
				$("#clouds"+i).text(windspeed + " m/s");

				labels.push(date.getDate() + "일(" + days[date.getDay()] + ")");
				maxTemp.push(weatherData.daily[i].temp.max);
				minTemp.push(weatherData.daily[i].temp.min);
			}
			
			var series = [maxTemp, minTemp];
			//console.log("labels = " + labels);
			//console.log("series = " + series);
			
			//최대값
			var max = maxTemp.reduce(function (previous, current) { 
				return previous > current ? previous:current;
			});

			//최소값
			var min = minTemp.reduce( function (previous, current) { 
				return previous > current ? current:previous;
			});

			var chart = new Chartist.Line('.campaign', {
				labels: labels,
				series: series
			}, {
				low: parseInt(min),
				high: parseInt(max),

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
		}
	});
};


function moonPhaseToStr(moonPhase){
	var moonPhaseStr = "";
	
	if(moonPhase == 0){moonPhaseStr = "new moon";}
	else if(moonPhase < 0.25){moonPhaseStr = "waxing crescent"}
	else if(moonPhase == 0.25){moonPhaseStr = "first quarter";}
	else if(moonPhase < 0.5){moonPhaseStr = "waxing gibbous";}
	else if(moonPhase == 0.5){moonPhaseStr = "full moon";}
	else if(moonPhase < 0.75){moonPhaseStr = "waning gibbous";}
	else if(moonPhase == 0.75){moonPhaseStr = "last quarter";}
	else{moonPhaseStr = "waning crescent"}
	
	return moonPhaseStr;

};

function parseSunMoon(data){
	var result = "";
	var Hour = data.getHours();
	Hour = Hour >= 10 ? Hour : '0' + Hour;
	var Minute = data.getMinutes();
	Minute = Minute >= 10 ? Minute : '0' + Minute;
	result = Hour + "시 " + Minute + "분"

	return result;
}

function changeItem(){
	console.log("changeItem에서 호출!1");   
	var itemidSelect = document.getElementById("selectID");

	var itemID = itemidSelect.options[itemidSelect.selectedIndex].value;
	console.log("itemID = " + itemID);	   
	if(itemID == 0){
		showWeather();
	}
	else if(itemID == 1){
		showTemp();
	}
	else if(itemID == 2){
		showSunMoon();
	}
	console.log("changeItem에서 호출!2");

}

function showSunMoon(){
	var lat = $("#lat").text();
	var lon = $("#lng").text();
	var appId = "자신의 appId를 입력하세요!";
	var weathermap = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&exclude=current,minutely,hourly,alerts&units=metric&appid="+appId;
	$.ajax({
		url: weathermap,
		type: 'POST',
		dataType:"json",
		success: function(weatherData){
			$("#weatherTitle").text("해와 달 세부 정보");
			const days = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
			var category = ["Date","Sunrise","Sunset","Moonrise","Moonset","Moon_phase","clouds"];
			for(var i = 0; i < 7; i++){
				var date = new Date(weatherData.daily[i].dt * 1000);
				//console.log("날짜: " + date.getDate() + "일(" + days[date.getDay()] + ")");
				var sunrise = new Date(weatherData.daily[i].sunrise * 1000);
				var sunset = new Date(weatherData.daily[i].sunset * 1000);
				var moonrise = new Date(weatherData.daily[i].moonrise * 1000);
				var moonset = new Date(weatherData.daily[i].moonset * 1000);
				var moonPhase = weatherData.daily[i].moon_phase;
				var moonPhaseStr = moonPhaseToStr(moonPhase);
				$("#th"+i).text(category[i]);
				$("#weekday"+i).text(days[date.getDay()])
				$("#date"+i).text((date.getMonth()+1) + "월 " +date.getDate() + "일");
				$("#sunrise"+i).text(parseSunMoon(sunrise));
				$("#sunset"+i).text(parseSunMoon(sunset));
				$("#moonrise"+i).text(parseSunMoon(moonrise));
				$("#moonset"+i).text(parseSunMoon(moonset));
				$("#moon_phase"+i).text(moonPhaseStr + "(" + moonPhase + ")");
				$("#clouds"+i).text(weatherData.daily[i].clouds + " %");
			}
		}
	})
}



function showTemp(){
	var lat = $("#lat").text();
	var lon = $("#lng").text();

	var appId = "자신의 appId를 입력하세요!";
	var weathermap = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&exclude=current,minutely,hourly,alerts&units=metric&appid="+ appId;
	$.ajax({
		url: weathermap,
		type: 'POST',
		dataType:"json",
		success: function(weatherData){
			$("#weatherTitle").text("기온 세부 정보");
			const days = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
			var category = ["Date","Morning","Day","Evening","Night","Min","Max"];
			for(var i = 0; i < 7; i++){
				var date = new Date(weatherData.daily[i].dt * 1000);
				//console.log("날짜: " + date.getDate() + "일(" + days[date.getDay()] + ")");
				var morning = weatherData.daily[i].temp.morn;
				var day = weatherData.daily[i].temp.day;
				var evening = weatherData.daily[i].temp.eve;
				var night = weatherData.daily[i].temp.night;
				var min_temp = weatherData.daily[i].temp.min;
				var max_temp = weatherData.daily[i].temp.max;
				$("#th"+i).text(category[i]);
				$("#weekday"+i).text(days[date.getDay()])
				$("#date"+i).text((date.getMonth()+1) + "월 " +date.getDate() + "일");
				$("#sunrise"+i).text(morning + "°C");
				$("#sunset"+i).text(day + "°C");
				$("#moonrise"+i).text(evening + "°C");
				$("#moonset"+i).text(night + "°C");
				$("#moon_phase"+i).text(min_temp + "°C");
				$("#clouds"+i).text(max_temp + "°C");
				console.log("showTemp에서 호출!");
			}
		}
	})
}

function showWeather(){
	var lat = $("#lat").text();
	var lon = $("#lng").text();
	var appId = "자신의 appId를 입력하세요!";
	var weathermap = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&exclude=current,minutely,hourly,alerts&units=metric&appid="+appId;
	$.ajax({
		url: weathermap,
		type: 'POST',
		dataType:"json",
		success: function(weatherData){
			$("#weatherTitle").text("날씨 세부 정보");
			const days = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];
			var category = ["Date","Weather","Precipitation","UV index","Pressure","Humidity","Windspeed"];
			for(var i = 0; i < 7; i++){

				var date = new Date(weatherData.daily[i].dt * 1000);
				//console.log("날짜: " + date.getDate() + "일(" + days[date.getDay()] + ")");
				var weather = weatherData.daily[i].weather[0].icon
				var precipitation = weatherData.daily[i].pop;
				var uvi = weatherData.daily[i].uvi;
				var pressure = weatherData.daily[i].pressure;
				var humidity = weatherData.daily[i].humidity;
				var windspeed = weatherData.daily[i].wind_speed;
				// $('#icon'+i).removeClass('dnone');
				//$("#icon"+i).attr("src", "http://openweathermap.org/img/wn/" + weatherData.daily[i].weather[0].icon + "@2x.png");
				console.log("주간 " + i + "아이콘: " +weatherData.daily[i].weather[0].icon );
				$("#th"+i).text(category[i]);
				$("#weekday"+i).text(days[date.getDay()])
				$("#date"+i).text((date.getMonth()+1) + "월 " +date.getDate() + "일");
				$("#sunrise"+i).html("<img src='http://openweathermap.org/img/wn/" + weather + "@2x.png' width='50px' height='50px'>");
				$("#sunset"+i).text((precipitation*100) + " %");
				$("#moonrise"+i).text(uvi);
				$("#moonset"+i).text(pressure + " hPa");
				$("#moon_phase"+i).text(humidity + " %");
				$("#clouds"+i).text(windspeed + " m/s");
				console.log("showWeather에서 호출!");
			}
		}
	})
}

function searchAddress(){
	// 주소를 입력받음
	var input = document.getElementById("keyword");
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(input.value, function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			var lat = result[0].y;
			var lng = result[0].x;
			$("#lat").text(lat);
			$("#lng").text(lng);

			var coord = new kakao.maps.LatLng(lat, lng);
			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
					$("#address > span").text(result[0].address.address_name);
				}
				else{
					console.log("주소잘못찾았어~~");
				}
			};
			// 위도, 경도로 다시 위치 정보 검색
			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			// 위도, 경도로 날씨 데이터 가져오기
			getWeatherInfo(lat, lng);
		} 
		else{
			alert("잘못된 주소입니다!");
		}
	});
} 
