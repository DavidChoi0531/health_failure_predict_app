import 'package:flutter/cupertino.dart';
import 'package:health_failure_app_f/models/health_failure_poll_model.dart';

class HealthFailurePollProvider with ChangeNotifier {
  static HealthFailurePoll healthFailurePoll = HealthFailurePoll(
    gender: 0,
    bmi: 1,
    mentalDiscomfort: 1,
    physicalDiscomfort: 1,
    bloodPressure: 1,
    cholesterolLevels: 1,
    cholesterolTest: 1,
    smoking: 1,
    stroke: 1,
    exercise: 1,
    fruitIntake: 1,
    vegeIntake: 1,
    drink: 1,
    treatment: 1,
    stairs: 1,
    diabetes: 1,
    condition: 1,
  );

  static Map<String, dynamic> tempPoll = {};

  gender() => healthFailurePoll.gender;

  bmi() => healthFailurePoll.bmi;

  mentalDiscomfort() => healthFailurePoll.mentalDiscomfort;

  physicalDiscomfort() => healthFailurePoll.physicalDiscomfort;

  bloodPressure() => healthFailurePoll.bloodPressure;

  cholesterolLevels() => healthFailurePoll.cholesterolLevels;

  cholesterolTest() => healthFailurePoll.cholesterolTest;

  smoking() => healthFailurePoll.smoking;

  stroke() => healthFailurePoll.stroke;

  exercise() => healthFailurePoll.exercise;

  fruitIntake() => healthFailurePoll.fruitIntake;

  vegeIntake() => healthFailurePoll.vegeIntake;

  drink() => healthFailurePoll.drink;

  treatment() => healthFailurePoll.treatment;

  stairs() => healthFailurePoll.stairs;

  diabetes() => healthFailurePoll.diabetes;

  condition() => healthFailurePoll.condition;

  setPoll(json) {
    healthFailurePoll = HealthFailurePoll.fromJson(json);
    notifyListeners();
  }

  initPoll() {
    tempPoll = {};
    notifyListeners();
  }

  static addPollItem(String key, dynamic value) {
    tempPoll[key] = value;
    return tempPoll;
  }
}
