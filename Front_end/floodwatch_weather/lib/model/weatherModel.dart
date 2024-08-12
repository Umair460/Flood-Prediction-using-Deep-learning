class WeatherData {
  final String name;
  final Temperature temperature;
  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLevel;
  final List<WeatherInfo> weather;

  WeatherData({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.weather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'] ?? 'Unknown',
      temperature: Temperature.fromJson(json['main']['temp'] ?? 273.15),
      humidity: json['main']['humidity'] ?? 0,
      wind: Wind.fromJson(json['wind'] ?? {}),
      maxTemperature: (json['main']['temp_max'] ?? 273.15) - 273.15,
      minTemperature: (json['main']['temp_min'] ?? 273.15) - 273.15,
      pressure: json['main']['pressure'] ?? 0,
      seaLevel: json['main']['sea_level'] ?? 0,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherInfo.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class WeatherInfo {
  final String main;

  WeatherInfo({
    required this.main,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'] ?? 'Clear',
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: (json as double? ?? 273.15) - 273.15,
    );
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: json['speed']?.toDouble() ?? 0.0);
  }
}
