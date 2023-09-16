import 'package:creativenasa/misc/alias.dart';

class Planet {
  const Planet({
    required this.imgSrc,
    required this.earthDate,
  });

  final String imgSrc;
  final DateTime earthDate;

  Planet.fromJson(Json json)
      : imgSrc = json['img_src'],
        earthDate = DateTime.parse(json['earth_date']);
}