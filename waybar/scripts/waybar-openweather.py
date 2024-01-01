#!/usr/bin/env python

import json
import requests

WEATHER_CODES = {
    '113': '☀️ ',
    '116': '⛅ ',
    '119': '☁️ ',
    '122': '☁️ ',
    '143': '☁️ ',
    '176': '🌧️',
    '179': '🌧️',
    '182': '🌧️',
    '185': '🌧️',
    '200': '⛈️ ',
    '227': '🌨️',
    '230': '🌨️',
    '248': '☁️ ',
    '260': '☁️ ',
    '263': '🌧️',
    '266': '🌧️',
    '281': '🌧️',
    '284': '🌧️',
    '293': '🌧️',
    '296': '🌧️',
    '299': '🌧️',
    '302': '🌧️',
    '305': '🌧️',
    '308': '🌧️',
    '311': '🌧️',
    '314': '🌧️',
    '317': '🌧️',
    '320': '🌨️',
    '323': '🌨️',
    '326': '🌨️',
    '329': '❄️ ',
    '332': '❄️ ',
    '335': '❄️ ',
    '338': '❄️ ',
    '350': '🌧️',
    '353': '🌧️',
    '356': '🌧️',
    '359': '🌧️',
    '362': '🌧️',
    '365': '🌧️',
    '368': '🌧️',
    '371': '❄️',
    '374': '🌨️',
    '377': '🌨️',
    '386': '🌨️',
    '389': '🌨️',
    '392': '🌧️',
    '395': '❄️ '
}

# Replace 'YOUR_API_KEY' with your OpenWeatherMap API key
API_KEY = 'bb986fd054fa2a52239b631378793468'
CITY_NAME = 'Koregaon, IN'  # Replace with the name of your city
UNITS = 'metric'  # Use 'metric' for Celsius, 'imperial' for Fahrenheit, or 'standard' for Kelvin

url = f"http://api.openweathermap.org/data/2.5/weather?q={CITY_NAME}&units={UNITS}&appid={API_KEY}"
weather = requests.get(url).json()

def format_temp(temp):
    return f"{temp}°C".ljust(4) if 'main' in weather else "N/A".ljust(4)

data = {}

try:
    if 'weather' in weather:
        weather_code = str(weather['weather'][0]['id'])
        icon = WEATHER_CODES.get(weather_code, '🌦️')  # Use a default icon if the code is not found
        data['text'] = f"{icon} {format_temp(weather['main']['feels_like'])}"
    else:
        data['text'] = "N/A"

    data['tooltip'] = f"<b>{weather.get('weather', [{'description': 'N/A'}])[0]['description'].capitalize()} {weather.get('main', {'temp': 'N/A'})['temp']}°C</b>\n"
    data['tooltip'] += f"Feels like: {weather.get('main', {'feels_like': 'N/A'})['feels_like']}°C\n"
    data['tooltip'] += f"Wind: {weather.get('wind', {'speed': 'N/A'})['speed']} m/s\n"
    data['tooltip'] += f"Humidity: {weather.get('main', {'humidity': 'N/A'})['humidity']}%\n"
    
    print(f"Weather Code: {weather_code}")  # Print the weather code for debugging
    print(json.dumps(data))

except Exception as e:
    print(f"Error: {e}")

