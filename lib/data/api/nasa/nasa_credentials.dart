import 'package:flutter_dotenv/flutter_dotenv.dart';

class NasaCredentials {
  static final String apiKey = dotenv.get('NASA_API_KEY');
}