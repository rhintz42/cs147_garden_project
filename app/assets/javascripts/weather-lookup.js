function renderWeather(data) {
	console.log("data: ", data.data)
	var weatherToday = data.data.weather[0];
	var img = weatherToday.weatherIconUrl[0].value;
	var temp = data.data.current_condition[0].temp_F;

	var imgDOM = document.getElementById("weather-image");
	imgDOM.setAttribute("src", img);

	var tempDOM = document.getElementById("weather-temp");
	tempDOM.innerHTML = temp;

}
