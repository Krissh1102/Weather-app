import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/features/weather/data/weather_repository.dart';

import 'package:weather/src/features/weather/domain/weather/weather_data.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'India';
});

final currentWeatherProvider =
    FutureProvider.autoDispose<WeatherData>((ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeather(city: city);
  return WeatherData.from(weather);
});
