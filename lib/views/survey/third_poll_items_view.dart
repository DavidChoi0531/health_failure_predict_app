import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/third_poll_items_view_model.dart';
import 'package:health_failure_app_f/views/survey/fourth_poll_items_view.dart';

class ThirdPollItemsView extends StatefulWidget {
  const ThirdPollItemsView({Key? key}) : super(key: key);

  @override
  _ThirdPollItemsViewState createState() => _ThirdPollItemsViewState();
}

class _ThirdPollItemsViewState extends State<ThirdPollItemsView> {
  final ThirdPollItemsViewModel _thirdPollItemsViewModel =
      ThirdPollItemsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildPopIcon(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.height - 170,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                buildExercise(),
                const SizedBox(
                  height: 20,
                ),
                buildFruitIntake(),
                const SizedBox(
                  height: 20,
                ),
                buildVegeIntake(),
                const SizedBox(
                  height: 20,
                ),
                buildDrink(),
                const SizedBox(
                  height: 20,
                ),
                buildTreatment(),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    _thirdPollItemsViewModel.setItems(
                      _thirdPollItemsViewModel.exercise,
                      _thirdPollItemsViewModel.fruitIntake,
                      _thirdPollItemsViewModel.vegeIntake,
                      _thirdPollItemsViewModel.drink,
                      _thirdPollItemsViewModel.treatment,
                    );
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FourthPollItemsView()));
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
            '3/5',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
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

  Widget buildExercise() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '주기적인 운동을 하십니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _thirdPollItemsViewModel.exercise,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.exercise = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _thirdPollItemsViewModel.exercise,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.exercise = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildFruitIntake() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '하루에 한 번 이상 과일을 섭취하십니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _thirdPollItemsViewModel.fruitIntake,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.fruitIntake = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _thirdPollItemsViewModel.fruitIntake,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.fruitIntake = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildVegeIntake() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '하루에 한 번 이상 야채를 섭취하십니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _thirdPollItemsViewModel.vegeIntake,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.vegeIntake = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _thirdPollItemsViewModel.vegeIntake,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.vegeIntake = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildDrink() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '일주일에 음주를 남성 기준 14잔, 여성 기준 7잔 이상 하십니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _thirdPollItemsViewModel.drink,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.drink = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _thirdPollItemsViewModel.drink,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.drink = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildTreatment() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '지난 1년간 비용문제로 인해 치료를 받지 못 한 경우가 있습니까?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('예'),
            leading: Radio(
                value: 1,
                groupValue: _thirdPollItemsViewModel.treatment,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.treatment = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _thirdPollItemsViewModel.treatment,
                onChanged: (value) {
                  setState(() {
                    _thirdPollItemsViewModel.treatment = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
