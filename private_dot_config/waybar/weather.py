import requests

# OpenWeatherMap API details
API_KEY = "dd4eac7919b7bf53e232fb212108a53c"
CITY_ID = "2745321"
URL = f"http://api.openweathermap.org/data/2.5/weather?id=2745321&appid=dd4eac7919b7bf53e232fb212108a53c&units=metric"

# Weather condition icons
icons = {
    "01d": "", "01n": "", "02d": "", "02n": "",
    "03d": "", "03n": "", "04d": "", "04n": "",
    "09d": "", "09n": "", "10d": "", "10n": "",
    "11d": "", "11n": "", "13d": "", "13n": "",
    "50d": "", "50n": ""
}

def get_weather():
    try:
        response = requests.get(URL)
        response.raise_for_status()
        data = response.json()

        # Extract temperature and weather icon
        temperature = round(data['main']['temp'])
        weather_icon = icons.get(data['weather'][0]['icon'], "")  # Default icon

        return f"{weather_icon} {temperature}C"
    except requests.RequestException as e:
        return "Error"

if __name__ == "__main__":
    print(get_weather())

