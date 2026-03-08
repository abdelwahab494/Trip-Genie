part of 'travel_tips_cubit.dart';

@immutable
abstract class TravelTipsState {}

class TravelTipsInitial extends TravelTipsState {}

class TravelTipsLoading extends TravelTipsState {
  final List<TravelTipModel> tips;

  TravelTipsLoading(this.tips);
}

class TravelTipsLoaded extends TravelTipsState {
  final List<TravelTipModel> tips;

  TravelTipsLoaded(this.tips);
}

class TravelTipsError extends TravelTipsState {
  final List<TravelTipModel> tips;

  TravelTipsError(this.tips);
}
