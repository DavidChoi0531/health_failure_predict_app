import 'package:health_failure_app_f/providers/health_failure_poll_provider.dart';

class SecondPollItemsViewModel {
  int bloodPressure = 0;
  int cholesterolLevels = 0;
  int cholesterolTest = 0;
  int smoking = 0;
  int stroke = 0;

  setItems(int bloodPressure, int cholesterolLevel, int cholesterolTest,
      int smoking, int stroke) {
    Map<String, dynamic> temp = {
      'bloodPressure': bloodPressure,
      'cholesterolLevels': cholesterolLevels,
      'cholesterolTest': cholesterolTest,
      'smoking': smoking,
      'stroke': stroke,
    };

    temp.forEach(
        (key, value) => HealthFailurePollProvider.addPollItem(key, value));
  }
}
