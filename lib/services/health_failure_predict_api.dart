import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_failure_app_f/models/health_failure_poll_model.dart';

class HealthFailurePredictApi {
  Dio dio = Dio();

  healthFailurePredict(HealthFailurePoll healthFailurePoll) async {
    Map<String, dynamic> poll = healthFailurePoll.toJson();
    String url = "http://localhost:8080/flutter/heart.jsp?Sex=${poll['gender']}&BMI=${poll['bmi']}&MentHlth=${poll['mentalDiscomfort']}" +
        "&PhysHlth=${poll['physicalDiscomfort']}&HighBP=${poll['bloodPressure']}&HighChol=${poll['cholesterolLevels']}&CholCheck=${poll['cholesterolTest']}" +
        "&Smoker=${poll['smoking']}&Stroke=${poll['stroke']}&PhysActivity=${poll['exercise']}&Fruits=${poll['fruitIntake']}&Veggies=${poll['vegeIntake']}&HvyAlcoholConsump=${poll['drink']}" +
        "&NoDocbcCost=${poll['treatment']}&DiffWalk=${poll['stairs']}&Diabetes=${poll['diabetes']}&GenHlth=${poll['condition']}";
    var response = await dio.get(url);

    var result = json.decode(response.data);
    return result["HeartDiseaseorAttack"];
  }
}
