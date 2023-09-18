import 'package:creativenasa/data/api/nasa/nasa_client.dart';
import 'package:creativenasa/data/api/nasa/nasa_data_providers.dart';
import 'package:creativenasa/domain/repositories/planets_repo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  setUpAll(() async => await dotenv.load(fileName: '.env'));

  group('Api checks', () {
    test('Nasa API and serialization', () async {
      final PlanetsRepo planetsRepo = PlanetsRepo(
        nasaDataProviders: NasaDataProviders(nasaClient: NasaClient()),
      );

      expect(await planetsRepo.getMarsPhotos(), isNotEmpty);
    }, timeout: const Timeout(Duration(seconds: 15)));
  });
}
