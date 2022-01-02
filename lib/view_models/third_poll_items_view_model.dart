import 'package:health_failure_app_f/providers/health_failure_poll_provider.dart';

class ThirdPollItemsViewModel {
  int exercise = 0;
  int fruitIntake = 0;
  int vegeIntake = 0;
  int drink = 0;
  int treatment = 0;

  setItems(int exercise, int fruitIntake, int vegeIntake, int drink,
      int treatment) {
    Map<String, dynamic> temp = {
      'exercise': exercise,
      'fruitIntake': fruitIntake,
      'vegeIntake': vegeIntake,
      'drink': drink,
      'treatment': treatment,
    };
    temp.forEach((key, value) => HealthFailurePollProvider.addPollItem(key, value));
  }
}
