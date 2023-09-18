import 'package:creativenasa/data/api/nasa/nasa_client.dart';
import 'package:creativenasa/data/api/nasa/nasa_endpoints.dart';
import 'package:creativenasa/misc/alias.dart';
import 'package:dio/dio.dart';

class NasaDataProviders {


  NasaDataProviders({required NasaClient nasaClient})
      : _nasaClient = nasaClient;

  final NasaClient _nasaClient;

  // Fetches Mars photos
  Future<Response<Json>> getMarsPhotos() async {
    return await _nasaClient.get(NasaEndpoints.marsPhotos,
      queryParameters: {
        'sol': 1000,
      }
    );
  }

}