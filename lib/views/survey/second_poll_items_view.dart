import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/second_poll_items_view_models.dart';
import 'package:health_failure_app_f/views/survey/third_poll_items_view.dart';

class SecondPollItemsView extends StatefulWidget {
  const SecondPollItemsView({Key? key}) : super(key: key);

  @override
  _SecondPollItemsViewState createState() => _SecondPollItemsViewState();
}

class _SecondPollItemsViewState extends State<SecondPollItemsView> {
  final SecondPollItemsViewModel _secondPollItemsViewModel =
      SecondPollItemsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPopIcon(),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height - 170,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  buildBloodPressure(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildCholesterolLevel(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildCholesterolTest(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildSmoking(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildStroke(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      _secondPollItemsViewModel.setItems(
                          _secondPollItemsViewModel.bloodPressure,
                          _secondPollItemsViewModel.cholesterolLevels,
                          _secondPollItemsViewModel.cholesterolTest,
                          _secondPollItemsViewModel.smoking,
                          _secondPollItemsViewModel.stroke);
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ThirdPollItemsView()));
                    },
                    child: const Text(
                      '다음',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '2/5',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPopIcon() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBloodPressure() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 100,
      child: Column(
        children: [
          const Text(
            '고혈압 진단을 받으셨습니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _secondPollItemsViewModel.bloodPressure,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.bloodPressure = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _secondPollItemsViewModel.bloodPressure,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.bloodPressure = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildCholesterolLevel() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '혈중 콜레스테롤 수치가 높다는 진단을 받은 적이 있습니까? (130㎎/㎗이하가 정상)',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _secondPollItemsViewModel.cholesterolLevels,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.cholesterolLevels = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _secondPollItemsViewModel.cholesterolLevels,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.cholesterolLevels = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildCholesterolTest() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '최근 5년간 콜레스테롤 수치에 대하여 검사를 받은 적이 있습니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _secondPollItemsViewModel.cholesterolTest,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.cholesterolTest = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _secondPollItemsViewModel.cholesterolTest,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.cholesterolTest = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildSmoking() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '지금까지 피운 담배의 개수가 100개비 이상입니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _secondPollItemsViewModel.smoking,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.smoking = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _secondPollItemsViewModel.smoking,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.smoking = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildStroke() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Text(
            '뇌졸중이 발생했던 경우가 있습니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _secondPollItemsViewModel.stroke,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.stroke = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _secondPollItemsViewModel.stroke,
                onChanged: (value) {
                  setState(() {
                    _secondPollItemsViewModel.stroke = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
