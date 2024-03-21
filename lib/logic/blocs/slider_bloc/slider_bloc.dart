import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_event.dart';

part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState.initial()) {
    on<UpdateFirstSliderValueEvent>((event, emit) {
      emit(state.copyWith(investment: event.value));
    });

    on<UpdateSecondSliderValueEvent>((event, emit) {
      emit(state.copyWith(rate: event.value));
    });

    on<UpdateThirdSliderValueEvent>((event, emit) {
      emit(state.copyWith(time: event.value));
    });
  }

  SliderState? fromJson(Map<String, dynamic> json) {
    final sliderState = SliderState.fromJson(json);
    return sliderState;
  }

  Map<String, dynamic>? toJson(SliderState state) {
    final counterJson = state.toJson();

    return counterJson;
  }
}
