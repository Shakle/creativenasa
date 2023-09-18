import 'package:cached_network_image/cached_network_image.dart';
import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlanetThumbnail extends StatefulWidget {
  const PlanetThumbnail({
    super.key,
    required this.planet,
  });

  final Planet planet;

  @override
  State<PlanetThumbnail> createState() => _PlanetThumbnailState();
}

class _PlanetThumbnailState extends State<PlanetThumbnail>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        Hero(
          tag: widget.planet.imgSrc,
          child: CachedNetworkImage(
            imageUrl: widget.planet.imgSrc,
            placeholder: (context, url) => Container(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            errorWidget: (context, url, _) => Container(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
            fadeInDuration: const Duration(seconds: 1),
            fadeOutDuration: const Duration(seconds: 1),
            fadeInCurve: Curves.easeIn,
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
        ),
        Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => openDetails(context),
            splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
        )
      ],
    );
  }

  void openDetails(BuildContext context) {
    GoRouter.of(context).pushNamed(
        AppRoute.planet.name,
        extra: widget.planet,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
