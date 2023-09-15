part of 'planets_cubit.dart';

@immutable
abstract class PlanetsState {}

class PlanetsInitial extends PlanetsState {}
class PlanetsLoading extends PlanetsState {}
class PlanetsLoaded extends PlanetsState {}
class PlanetsError extends PlanetsState {}
