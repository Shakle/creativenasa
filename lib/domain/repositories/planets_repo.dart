import 'dart:async';

import 'package:creativenasa/data/api/nasa/nasa_data_providers.dart';
import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/misc/alias.dart';
import 'package:dio/dio.dart';

class PlanetsRepo {

  PlanetsRepo({required NasaDataProviders nasaDataProviders})
      : _nasaDataProviders = nasaDataProviders;

  final NasaDataProviders _nasaDataProviders;

  // Fetches and serializes Mars photos
  Future<List<Planet>> getMarsPhotos() async {
    Response<Json> response = await _nasaDataProviders.getMarsPhotos()
        .timeout(const Duration(seconds: 15),
        onTimeout: () => throw TimeoutException(
          'Photos fetching took too much time',
        ));
    List<dynamic> photosList = response.data?['photos'];
    return photosList.map((json) => Planet.fromJson(json)).toList();
  }

}