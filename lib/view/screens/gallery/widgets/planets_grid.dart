import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/view/screens/gallery/widgets/planet_thumbnail.dart';
import 'package:flutter/material.dart';

class PlanetsGrid extends StatefulWidget {
  const PlanetsGrid({
    super.key,
    required this.planets,
  });

  final List<Planet> planets;

  @override
  State<PlanetsGrid> createState() => _PlanetsGridState();
}

class _PlanetsGridState extends State<PlanetsGrid> {
  late final ScrollController scrollController;

  @override
  void initState() {
    //Prevents image blinking on redirections
    PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: GridView.builder(
        itemCount: widget.planets.length,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2.5,
          mainAxisSpacing: 2.5,
        ),
        itemBuilder: (context, index) => PlanetThumbnail(
            planet: widget.planets[index],
        ),
      ),
    );
  }
}
