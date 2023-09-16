import 'package:creativenasa/data/api/nasa/nasa_data_providers.dart';
import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/misc/alias.dart';
import 'package:dio/dio.dart';

class PlanetsRepo {

  final NasaDataProviders _nasaDataProviders = NasaDataProviders();

  Future<List<Planet>> getMarsPhotos() async {
    Response<Json> response = await _nasaDataProviders.getMarsPhotos();
    List<dynamic> photosList = response.data?['photos'];
    return photosList.map((json) => Planet.fromJson(json)).toList();
  }

}