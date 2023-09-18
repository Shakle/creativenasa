import 'package:creativenasa/data/api/nasa/nasa_client.dart';
import 'package:creativenasa/data/api/nasa/nasa_data_providers.dart';
import 'package:creativenasa/domain/repositories/planets_repo.dart';
import 'package:creativenasa/view/blocs/auth/auth_cubit.dart';
import 'package:creativenasa/view/blocs/planets/planets_cubit.dart';
import 'package:creativenasa/view/screens/gallery/widgets/planets_grid.dart';
import 'package:creativenasa/view/widgets/app_scaffold.dart';
import 'package:creativenasa/view/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanetsCubit>(
      // Did not use service locator to save time
      create: (context) => PlanetsCubit(
        planetsRepo: PlanetsRepo(
          nasaDataProviders: NasaDataProviders(
              nasaClient: NasaClient(),
          ),
        ),
      ),
      child: AppScaffold(
        appBar: AppBar(
          title: const Text('Mars gallery'),
          actions: [
            logoutButton(context),
          ],
        ),
        padding: EdgeInsets.zero,
        body: layout(),
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<AuthCubit>().signOut();
        },
        tooltip: 'Sign out',
        iconSize: 22,
        icon: const Icon(Icons.logout),
    );
  }

  Widget layout() {
    return BlocConsumer<PlanetsCubit, PlanetsState>(
      listenWhen: (pState, state) => state is PlanetsError,
      listener: (context, state) {
        if (state is PlanetsError) {
          showErrorSnackBar(context, state.exception.toString());
        }
      },
      builder: (context, state) {
        return switch (state) {
          PlanetsLoading() => const Center(child: CircularProgressIndicator()),
          PlanetsLoaded() => PlanetsGrid(planets: state.planets),
          PlanetsError() => Center(child: errorInfo()),
          _ => const SizedBox(),
        };
      },
    );
  }

  Widget errorInfo() {
    return Builder(
      builder: (context) {
        return const Text('Planets fetching will start again soon');
      }
    );
  }
}
