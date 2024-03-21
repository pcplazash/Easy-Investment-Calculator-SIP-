part of 'slider_bloc.dart';

class SliderState extends Equatable {
  final double investment;
  final double rate;
  final double time;

  bool get isValidInvestment => investment.runtimeType == double;

  bool get isValidRate => rate.runtimeType == double;

  //bool get isValidTime => time is double;

  SliderState({
    required this.investment,
    required this.rate,
    required this.time,
  });

  factory SliderState.initial() {
    return SliderState(investment: 0, rate: 0, time: 0);
  }

  @override
  List<Object> get props => [investment, rate, time,];

  @override
  String toString() {
    return 'SliderState{investment: $investment, rate: $rate, time: $time}';
  }

  SliderState copyWith({
    double? investment,
    double? rate,
    double? time,
  }) {
    return SliderState(
      investment: investment ?? this.investment,
      rate: rate ?? this.rate,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({
      "investment": investment,
      "rate": rate,
      "time": time,
    });

    return result;
  }

  factory SliderState.fromJson(Map<String, dynamic> json) {
    return SliderState(
      investment: double.parse(json["investment"]),
      rate: double.parse(json["rate"]),
      time: double.parse(
        json["time"],
      ),
    );
  }
}

class ValidationState extends SliderState {
  final bool isValid;

  ValidationState({
    required this.isValid,
    required double investment,
    required double rate,
    required double time,
  }) : super(
          investment: investment,
          rate: rate,
          time: time,
        );

  @override
  List<Object> get props => [
        isValid,
        rate,
        time,
        investment,
      ];
}
