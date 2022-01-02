import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/health_failure_poll_model.dart';
import 'package:health_failure_app_f/providers/health_failure_poll_provider.dart';
import 'package:health_failure_app_f/services/health_failure_predict_api.dart';

class PredictHeathFailureViewModel with ChangeNotifier {
  final HealthFailurePredictApi _healthFailurePredictApi =
      HealthFailurePredictApi();

  String predictImgUrl = 'lib/images/green_smily.png';
  String predict = '심장질환이 발병 할 확률이 높습니다.';

  PredictHeathFailureViewModel() {
    HealthFailurePoll _healthFailurePoll =
        HealthFailurePoll.fromJson(HealthFailurePollProvider.tempPoll);
    predictResult(_healthFailurePoll);
  }

  predictResult(HealthFailurePoll healthFailurePoll) async {
    String result =
        await _healthFailurePredictApi.healthFailurePredict(healthFailurePoll);
    if (result == '0') {
      predictImgUrl = 'lib/images/green_smily.png';
      predict = '심장질환이 발병 할 확률이 낮습니다.';
    } else {
      predictImgUrl = 'lib/images/green_smily.png';
      predict = '심장질환이 발병 할 확률이 높습니다.';
    }
    notifyListeners();
  }
}
