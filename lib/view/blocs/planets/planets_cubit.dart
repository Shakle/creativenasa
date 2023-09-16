import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/domain/repositories/planets_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsInitial()) {
    fetchMarsPhotos();
  }

  final PlanetsRepo planetsRepo = PlanetsRepo();

  Future<void> fetchMarsPhotos() async {
    try {
      emit(PlanetsLoading());
      List<Planet> planets = await planetsRepo.getMarsPhotos();
      emit(PlanetsLoaded(planets: planets));
    } catch (e) {
      emit(PlanetsError(exception: e));
    }

  }
}
