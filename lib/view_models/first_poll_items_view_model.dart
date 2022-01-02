import 'package:health_failure_app_f/providers/health_failure_poll_provider.dart';

class FirstPollItemsViewModel {
  int gender = 0;
  double bmi = 0.0;
  int mentalDiscomfort = 0;
  int physicalDiscomfort = 0;

  setItems(int gender, double height, double weight, int mental, int physical) {
    double bmi = height == 0
        ? 0
        : double.parse(
            (weight / (height / 100) / (height / 100)).toStringAsFixed(2));
    Map<String, dynamic> temp = {
      'gender': gender,
      'bmi': bmi,
      'mentalDiscomfort': mental,
      'physicalDiscomfort': physical,
    };

    temp.forEach((key, value) {
      HealthFailurePollProvider.addPollItem(key, value);
    });
  }
}
