class HealthFailurePoll {
  int gender;
  double bmi;
  int mentalDiscomfort;
  int physicalDiscomfort;
  int bloodPressure;
  int cholesterolLevels;
  int cholesterolTest;
  int smoking;
  int stroke;
  int exercise;
  int fruitIntake;
  int vegeIntake;
  int drink;
  int treatment;
  int stairs;
  int diabetes;
  int condition;

  HealthFailurePoll({
    required this.gender,
    required this.bmi,
    required this.mentalDiscomfort,
    required this.physicalDiscomfort,
    required this.bloodPressure,
    required this.cholesterolLevels,
    required this.cholesterolTest,
    required this.smoking,
    required this.stroke,
    required this.exercise,
    required this.fruitIntake,
    required this.vegeIntake,
    required this.drink,
    required this.treatment,
    required this.stairs,
    required this.diabetes,
    required this.condition,
  });

  factory HealthFailurePoll.fromJson(Map<String, dynamic> json) {
    return HealthFailurePoll(
      gender: json['gender'],
      bmi: json['bmi'],
      mentalDiscomfort: json['mentalDiscomfort'],
      physicalDiscomfort: json['physicalDiscomfort'],
      bloodPressure: json['bloodPressure'],
      cholesterolLevels: json['cholesterolLevels'],
      cholesterolTest: json['cholesterolTest'],
      smoking: json['smoking'],
      stroke: json['stroke'],
      exercise: json['exercise'],
      fruitIntake: json['fruitIntake'],
      vegeIntake: json['vegeIntake'],
      drink: json['drink'],
      treatment: json['treatment'],
      stairs: json['stairs'],
      diabetes: json['diabetes'],
      condition: json['condition'],
    );
  }

  toJson() {
    return {
      'gender': gender,
      'bmi': bmi,
      'mentalDiscomfort': mentalDiscomfort,
      'physicalDiscomfort': physicalDiscomfort,
      'bloodPressure': bloodPressure,
      'cholesterolLevels': cholesterolLevels,
      'cholesterolTest': cholesterolTest,
      'smoking': smoking,
      'stroke': stroke,
      'exercise': exercise,
      'fruitIntake': fruitIntake,
      'vegeIntake': vegeIntake,
      'drink': drink,
      'treatment': treatment,
      'stairs': stairs,
      'diabetes': diabetes,
      'condition': condition
    };
  }
}
