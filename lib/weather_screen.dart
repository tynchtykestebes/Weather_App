import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_information_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getCurrentWeather() async {
    http.get(
      Uri.parse(''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '300.67°K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '0:00',
                    icon: Icons.cloud,
                    temperature: '320.12',
                  ),
                  HourlyForecastItem(
                    time: '03:00',
                    icon: Icons.sunny,
                    temperature: '325.12',
                  ),
                  HourlyForecastItem(
                    time: '06:00',
                    icon: Icons.cloud,
                    temperature: '330.12',
                  ),
                  HourlyForecastItem(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: '328.12',
                  ),
                  HourlyForecastItem(
                    time: '12:00',
                    icon: Icons.cloud,
                    temperature: '324.12',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformationItem(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '94',
                ),
                AdditionalInformationItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.67',
                ),
                AdditionalInformationItem(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1006',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
