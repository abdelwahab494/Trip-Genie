part of 'travel_tips_cubit.dart';

@immutable
abstract class TravelTipsState {}

class TravelTipsInitial extends TravelTipsState {}

class TravelTipsLoading extends TravelTipsState {}

class TravelTipsLoaded extends TravelTipsState {
  final List<TravelTipModel> tips;
  
  TravelTipsLoaded(this.tips);
}

class TravelTipsError extends TravelTipsState {
  final String message;

  TravelTipsError(this.message);
}
