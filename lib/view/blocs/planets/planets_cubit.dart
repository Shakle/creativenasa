import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsInitial());
}
