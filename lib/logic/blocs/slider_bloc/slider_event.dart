part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class UpdateFirstSliderValueEvent extends SliderEvent {
  final double value;

  UpdateFirstSliderValueEvent({required this.value});
}

class UpdateSecondSliderValueEvent extends SliderEvent {
  final double value;

  UpdateSecondSliderValueEvent({required this.value});
}

class UpdateThirdSliderValueEvent extends SliderEvent {
  final double value;

  UpdateThirdSliderValueEvent({required this.value});
}
