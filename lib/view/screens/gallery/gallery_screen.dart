import 'package:cached_network_image/cached_network_image.dart';
import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/view/blocs/planets/planets_cubit.dart';
import 'package:creativenasa/view/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetsCubit>(
      create: (context) => PlanetsCubit(),
      child: AppScaffold(
        padding: EdgeInsets.zero,
        body: layout(),
      ),
    );
  }

  Widget layout() {
    return BlocBuilder<PlanetsCubit, PlanetsState>(
      builder: (context, state) {
        return switch (state) {
          PlanetsLoading() => const Center(child: CircularProgressIndicator()),
          PlanetsLoaded() => planetsGrid(state.planets),
          _ => const SizedBox(),
        };
      },
    );
  }

  Widget planetsGrid(List<Planet> planets) {
    return GridView.builder(
      itemCount: planets.length,
      padding: const EdgeInsets.symmetric(vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return CachedNetworkImage(
            imageUrl: planets[index].imgSrc,
            fadeInDuration: const Duration(seconds: 1),
            fadeInCurve: Curves.bounceInOut,
            fit: BoxFit.cover,
            placeholder: (context, index) => Container(
                color: Colors.red.withOpacity(0.1),
            ),
        );
      }
    );
  }
}
