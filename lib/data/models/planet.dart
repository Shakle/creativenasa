import 'package:creativenasa/misc/alias.dart';

class Planet {
  const Planet({
    required this.imgSrc,
    required this.earthDate,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.totalPhotos,
    required this.roverName,
  });

  final String imgSrc;
  final DateTime earthDate;
  final DateTime landingDate;
  final DateTime launchDate;
  final String status;
  final int totalPhotos;
  final String roverName;

  Planet.fromJson(Json json)
      : imgSrc = json['img_src'],
        earthDate = DateTime.parse(json['earth_date']),
        landingDate = DateTime.parse(json['rover']['landing_date']),
        launchDate = DateTime.parse(json['rover']['launch_date']),
        status = json['rover']['status'],
        totalPhotos = json['rover']['total_photos'],
        roverName = json['rover']['name'];
}