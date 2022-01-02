import 'package:health_failure_app_f/models/chart_element_model.dart';
import 'package:health_failure_app_f/services/db_server_access_api.dart';

class DescriptionViewModel {
  DBServerAccessAPI dbServerAccessAPI = DBServerAccessAPI();

  Future<List> highBPChart() async {
    List result = [];
    try {
      var response = await dbServerAccessAPI.selectHighBPCount();
      response.forEach((key, value) =>
          result.add(ChartElementModel(x: key, y: double.parse(value))));
    } catch (e) {}
    return result;
  }

  Future<List> hdaOfAge() async {
    List result = [];
    try {
      var response = await dbServerAccessAPI.selectHDAofAge();
      response.forEach((key, value) =>
          result.add(ChartElementModel(x: key, y: double.parse(value))));
    } catch (e) {}

    return result;
  }
}
