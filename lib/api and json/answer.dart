// троиные ковычки == многострочный текст.

// Map<String, dynamic> firstMap = {'first': 54, 'second': secondMap,};
// Map<String, dynamic> secondMap = {'third': thirdMap};
const jsonString = '''
{
    "lat": 54.3282,
    "lon": 48.3866,
    "timezone": "Europe/Ulyanovsk",
    "timezone_offset": 14400,
    "current": {
        "dt": 1701238798,
        "sunrise": 1701232793,
        "wind_gust": 2.37,
        "weather": [
            {
                "id": 803,
                "main": "Clouds",
                "description": "облачно с прояснениями",
                "icon": "04d"
            }
        ]
    },
    "daily": [
        {
            "dt": 1701244800,
            "sunrise": 1701232793,
            "sunset": 1701260979,
            "moonrise": 1701263880,
            "moonset": 1701242880,
            "moon_phase": 0.57,
            "temp": {
                "day": -7,
                "min": -8.92,
                "max": -5.8,
                "night": -8.4,
                "eve": -8.47,
                "morn": -7.43
            },
            "feels_like": {
                "day": -10.18,
                "night": -13.56,
                "eve": -11.25,
                "morn": -11.61
            },
            "pressure": 1023,
            "humidity": 93,
            "dew_point": -7.83,
            "wind_speed": 3.61,
            "wind_deg": 251,
            "wind_gust": 5.1,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "облачно с прояснениями",
                    "icon": "04d"
                }
            ],
            "clouds": 69,
            "pop": 0,
            "uvi": 0.55
        },
        {
            "dt": 1701331200,
            "sunrise": 1701319291,
            "sunset": 1701347324,
            "moonrise": 1701354060,
            "moonset": 1701332340,
            "moon_phase": 0.6,
            "temp": {
                "day": -1.81,
                "min": -8.43,
                "max": 0.44,
                "night": 0.03,
                "eve": 0.26,
                "morn": -5.93
            },
            "feels_like": {
                "day": -8.79,
                "night": -5.28,
                "eve": -5.44,
                "morn": -12.8
            },
            "pressure": 1019,
            "humidity": 94,
            "dew_point": -2.3,
            "wind_speed": 8.28,
            "wind_deg": 139,
            "wind_gust": 15.21,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "снег",
                    "icon": "13d"
                }
            ],
            "clouds": 100,
            "pop": 1,
            "snow": 3.54,
            "uvi": 0.48
        },
        {
            "dt": 1701417600,
            "sunrise": 1701405786,
            "sunset": 1701433672,
            "moonrise": 1701444960,
            "moonset": 1701420780,
            "moon_phase": 0.63,
            "temp": {
                "day": -5.52,
                "min": -6.89,
                "max": 0.3,
                "night": -3.27,
                "eve": -4.31,
                "morn": -2.76
            },
            "feels_like": {
                "day": -11.41,
                "night": -9.49,
                "eve": -9.82,
                "morn": -9.16
            },
            "pressure": 1017,
            "humidity": 88,
            "dew_point": -6.94,
            "wind_speed": 6.94,
            "wind_deg": 270,
            "wind_gust": 11.24,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "снег",
                    "icon": "13d"
                }
            ],
            "clouds": 26,
            "pop": 1,
            "snow": 4.84,
            "uvi": 0.58
        },
        {
            "dt": 1701504000,
            "sunrise": 1701492278,
            "sunset": 1701520024,
            "moonrise": 1701536040,
            "moonset": 1701508560,
            "moon_phase": 0.66,
            "temp": {
                "day": -4.01,
                "min": -5.5,
                "max": -2.89,
                "night": -5.5,
                "eve": -3.84,
                "morn": -2.89
            },
            "feels_like": {
                "day": -11.01,
                "night": -12.5,
                "eve": -10.84,
                "morn": -8.17
            },
            "pressure": 1002,
            "humidity": 89,
            "dew_point": -5.18,
            "wind_speed": 8.54,
            "wind_deg": 116,
            "wind_gust": 14.1,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "снег",
                    "icon": "13d"
                }
            ],
            "clouds": 78,
            "pop": 1,
            "snow": 6.01,
            "uvi": 0.52
        },
        {
            "dt": 1701590400,
            "sunrise": 1701578769,
            "sunset": 1701606379,
            "moonrise": 1701627120,
            "moonset": 1701595860,
            "moon_phase": 0.69,
            "temp": {
                "day": -6.57,
                "min": -10.69,
                "max": -2.83,
                "night": -2.83,
                "eve": -4.08,
                "morn": -10.54
            },
            "feels_like": {
                "day": -10.37,
                "night": -9.83,
                "eve": -11.08,
                "morn": -15.04
            },
            "pressure": 1018,
            "humidity": 86,
            "dew_point": -8.36,
            "wind_speed": 8.18,
            "wind_deg": 141,
            "wind_gust": 13.45,
            "weather": [
                {
                    "id": 601,
                    "main": "Snow",
                    "description": "снег",
                    "icon": "13d"
                }
            ],
            "clouds": 97,
            "pop": 1,
            "snow": 4.26,
            "uvi": 0.61
        },
        {
            "dt": 1701676800,
            "sunrise": 1701665257,
            "sunset": 1701692738,
            "moonrise": 1701718080,
            "moonset": 1701682920,
            "moon_phase": 0.72,
            "temp": {
                "day": -1.43,
                "min": -9.09,
                "max": 1.63,
                "night": -9.09,
                "eve": -6.8,
                "morn": 1.63
            },
            "feels_like": {
                "day": -8.28,
                "night": -15.36,
                "eve": -13.8,
                "morn": -3.28
            },
            "pressure": 1012,
            "humidity": 78,
            "dew_point": -4.37,
            "wind_speed": 8.23,
            "wind_deg": 266,
            "wind_gust": 12.31,
            "weather": [
                {
                    "id": 616,
                    "main": "Snow",
                    "description": "снег с дождём",
                    "icon": "13d"
                }
            ],
            "clouds": 99,
            "pop": 0.73,
            "rain": 0.87,
            "snow": 1.46,
            "uvi": 1
        },
        {
            "dt": 1701763200,
            "sunrise": 1701751743,
            "sunset": 1701779100,
            "moonrise": 0,
            "moonset": 1701769800,
            "moon_phase": 0.75,
            "temp": {
                "day": -4.65,
                "min": -9.93,
                "max": 1.76,
                "night": -0.03,
                "eve": 1.76,
                "morn": -6.42
            },
            "feels_like": {
                "day": -11.65,
                "night": -6.86,
                "eve": -3.38,
                "morn": -11.73
            },
            "pressure": 1009,
            "humidity": 89,
            "dew_point": -5.89,
            "wind_speed": 9.37,
            "wind_deg": 226,
            "wind_gust": 15.27,
            "weather": [
                {
                    "id": 616,
                    "main": "Snow",
                    "description": "снег с дождём",
                    "icon": "13d"
                }
            ],
            "clouds": 100,
            "pop": 1,
            "rain": 4.21,
            "snow": 3.76,
            "uvi": 1
        },
        {
            "dt": 1701849600,
            "sunrise": 1701838226,
            "sunset": 1701865465,
            "moonrise": 1701808860,
            "moonset": 1701856620,
            "moon_phase": 0.78,
            "temp": {
                "day": -8.59,
                "min": -9.08,
                "max": -6.86,
                "night": -8.85,
                "eve": -8.76,
                "morn": -8.56
            },
            "feels_like": {
                "day": -15.59,
                "night": -15.85,
                "eve": -15.76,
                "morn": -15.56
            },
            "pressure": 1016,
            "humidity": 85,
            "dew_point": -10.75,
            "wind_speed": 11.57,
            "wind_deg": 266,
            "wind_gust": 17.6,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "пасмурно",
                    "icon": "04d"
                }
            ],
            "clouds": 90,
            "pop": 0.12,
            "uvi": 1
        }
    ]
}
''';
