import 'package:health_failure_app_f/providers/health_failure_poll_provider.dart';

class FourthPollItemsViewModel {
  int stairs = 0;
  int diabetes = 0;
  int condition = 1;

  setItems(int stairs, int diabetes, int condition) {
    Map<String, dynamic> temp = {
      'stairs': stairs,
      'diabetes': diabetes,
      'condition': condition,
    };
    temp.forEach((key, value) => HealthFailurePollProvider.addPollItem(key, value));
    print(HealthFailurePollProvider.tempPoll);
  }
}
