import 'dart:async';

import 'package:creativenasa/data/models/planet.dart';
import 'package:creativenasa/domain/repositories/planets_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit({required PlanetsRepo planetsRepo})
      : _planetsRepo = planetsRepo, super(PlanetsInitial()) {
    fetchMarsPhotos();
  }

  final PlanetsRepo _planetsRepo;

  // Gets Mars photos
  Future<void> fetchMarsPhotos() async {
    try {
      emit(PlanetsLoading());
      List<Planet> planets = await _planetsRepo.getMarsPhotos();

      if (!isClosed) {
        emit(PlanetsLoaded(planets: planets));
      }
    } catch (e) {
      if (!isClosed) {
        emit(PlanetsError(exception: e));
        Future.delayed(const Duration(seconds: 3), () {
          fetchMarsPhotos();
        });
      }
    }

  }
}
