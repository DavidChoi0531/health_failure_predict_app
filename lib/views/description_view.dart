import 'package:flutter/material.dart';
import 'package:health_failure_app_f/models/chart_element_model.dart';
import 'package:health_failure_app_f/view_models/description_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DescriptionView extends StatefulWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  _DescriptionViewState createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  DescriptionViewModel descriptionViewModel = DescriptionViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          _buildTitle(),
          const SizedBox(
            height: 20,
          ),
          _buildContent1(),
          const SizedBox(
            height: 10,
          ),
          _buildChart1(),
          const SizedBox(
            height: 10,
          ),
          _buildContent2(),
          const SizedBox(
            height: 10,
          ),
          _buildChart2(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        '심장질환의 위험성',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildContent1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '1. 뇌.심혈관계질환이란 무엇인가?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
              '\n뇌혈관질환이란 뇌에 정상적으로 혈액공급이 안되는 장애의 의한 모든 신경질환을 의미하며 심장질환은 심장을 싸고 있는 관상동맥이 좁아지거나 작은 핏덩어리 같은 것에 의해 막히는 허혈성 심장질환을 말한다.'
              '뇌ㆍ심혈관계질환은 혈관이 막혀서 생기는 허혈성 심질환 및 뇌혈관질환과 혈관이 터져서 생기는 출혈성 뇌혈관질환으로 크게 구분할 수 있다.'),
        ],
      ),
    );
  }

  Widget _buildChart1() {
    return FutureBuilder(
      future: descriptionViewModel.highBPChart(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SfCartesianChart(
                title: ChartTitle(
                  text: '고혈압과 심장질환 발생',
                ),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  ColumnSeries(
                    width: 0.3,
                    dataSource: snapshot.data!,
                    xValueMapper: (dynamic data, _) => data.x,
                    yValueMapper: (dynamic data, _) => data.y,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ]),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildContent2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '2. 뇌.심혈관계질환이란 무엇인가?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
              '\n뇌혈관질환이란 뇌에 정상적으로 혈액공급이 안되는 장애의 의한 모든 신경질환을 의미하며 심장질환은 심장을 싸고 있는 관상동맥이 좁아지거나 작은 핏덩어리 같은 것에 의해 막히는 허혈성 심장질환을 말한다.'
              '뇌ㆍ심혈관계질환은 혈관이 막혀서 생기는 허혈성 심질환 및 뇌혈관질환과 혈관이 터져서 생기는 출혈성 뇌혈관질환으로 크게 구분할 수 있다.'),
          Text(
              '\n뇌혈관질환이란 뇌에 정상적으로 혈액공급이 안되는 장애의 의한 모든 신경질환을 의미하며 심장질환은 심장을 싸고 있는 관상동맥이 좁아지거나 작은 핏덩어리 같은 것에 의해 막히는 허혈성 심장질환을 말한다.'
              '뇌ㆍ심혈관계질환은 혈관이 막혀서 생기는 허혈성 심질환 및 뇌혈관질환과 혈관이 터져서 생기는 출혈성 뇌혈관질환으로 크게 구분할 수 있다.'),
          Text(
              '\n뇌혈관질환이란 뇌에 정상적으로 혈액공급이 안되는 장애의 의한 모든 신경질환을 의미하며 심장질환은 심장을 싸고 있는 관상동맥이 좁아지거나 작은 핏덩어리 같은 것에 의해 막히는 허혈성 심장질환을 말한다.'
              '뇌ㆍ심혈관계질환은 혈관이 막혀서 생기는 허혈성 심질환 및 뇌혈관질환과 혈관이 터져서 생기는 출혈성 뇌혈관질환으로 크게 구분할 수 있다.'),
          Text(
              '\n뇌혈관질환이란 뇌에 정상적으로 혈액공급이 안되는 장애의 의한 모든 신경질환을 의미하며 심장질환은 심장을 싸고 있는 관상동맥이 좁아지거나 작은 핏덩어리 같은 것에 의해 막히는 허혈성 심장질환을 말한다.'
              '뇌ㆍ심혈관계질환은 혈관이 막혀서 생기는 허혈성 심질환 및 뇌혈관질환과 혈관이 터져서 생기는 출혈성 뇌혈관질환으로 크게 구분할 수 있다.'),
        ],
      ),
    );
  }

  Widget _buildChart2() {
    return FutureBuilder(
      future: descriptionViewModel.hdaOfAge(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        }
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SfCartesianChart(
                title: ChartTitle(
                  text: '나이에 따른 심장질환 발병',
                ),
                primaryXAxis: CategoryAxis(),
                series: <LineSeries>[
                  LineSeries(
                    dataSource: snapshot.data!,
                    xValueMapper: (dynamic data, _) => data.x,
                    yValueMapper: (dynamic data, _) => data.y,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  ),
                ]),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
