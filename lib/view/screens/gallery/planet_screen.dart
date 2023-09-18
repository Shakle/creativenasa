import 'package:cached_network_image/cached_network_image.dart';
import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/misc/extensions.dart';
import 'package:creativenasa/view/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class PlanetScreen extends StatelessWidget {
  const PlanetScreen({
    super.key, 
    required this.planet,
  });
  
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            planetImage(context),
            const SizedBox(height: 20),
            details(),
            const Spacer(),
            info(
                title: 'Status',
                value: planet.status,
                alignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 30)
          ],
        ),
    );
  }
  
  Widget planetImage(BuildContext context) {
    return Hero(
      tag: planet.imgSrc,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: planet.imgSrc,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget details() {
    return Column(
      children: [
        info(title: 'Rover', value: planet.roverName),
        info(title: 'Total photos', value: planet.totalPhotos.toString()),
        info(title: 'Earth date', value: planet.earthDate.ymd),
        info(title: 'Launch date', value: planet.launchDate.ymd),
        info(title: 'Landing date', value: planet.landingDate.ymd),
      ],
    );
  }

  Widget info({
    required String title,
    required String value,
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: alignment,
          children: [
            Text('$title:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
            )),
            const SizedBox(width: 8),
            Text(value),
          ],
        );
      }
    );
  }
}
