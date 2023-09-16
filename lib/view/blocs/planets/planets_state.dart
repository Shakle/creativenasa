part of 'planets_cubit.dart';

@immutable
abstract class PlanetsState {}

class PlanetsInitial extends PlanetsState {}
class PlanetsLoading extends PlanetsState {}

class PlanetsLoaded extends PlanetsState {
  PlanetsLoaded({required this.planets});

  final List<Planet> planets;
}

class PlanetsError extends PlanetsState {
  PlanetsError({required this.exception});

  final dynamic exception;

}
