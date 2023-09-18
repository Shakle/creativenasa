import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/domain/repositories/planets_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit({required this.planetsRepo}) : super(PlanetsInitial()) {
    fetchMarsPhotos();
  }

  final PlanetsRepo planetsRepo;

  // Gets Mars photos
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
