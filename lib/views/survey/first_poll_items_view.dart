import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/first_poll_items_view_model.dart';
import 'package:health_failure_app_f/views/survey/second_poll_items_view.dart';
import 'package:provider/provider.dart';

class FirstPollItemsView extends StatefulWidget {
  const FirstPollItemsView({Key? key}) : super(key: key);

  @override
  _FirstPollItemsViewState createState() => _FirstPollItemsViewState();
}

class _FirstPollItemsViewState extends State<FirstPollItemsView> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController mentalController = TextEditingController();
  TextEditingController physicalController = TextEditingController();
  FirstPollItemsViewModel _firstPollItemsViewModel = FirstPollItemsViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildPopIcon(),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 100,
            height: MediaQuery
                .of(context)
                .size
                .height - 170,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                buildGenderItem(context),
                const SizedBox(
                  height: 20,
                ),
                buildBmi(),
                const SizedBox(
                  height: 20,
                ),
                buildComfort(),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    double height = heightController.text.isEmpty ? 0.0 : double.parse(heightController.text);
                    double weight = weightController.text.isEmpty ? 0.0 : double.parse(weightController.text);
                    int mental = mentalController.text.isEmpty ? 0 : int.parse(mentalController.text);
                    int physical = physicalController.text.isEmpty ? 0 : int.parse(physicalController.text);
                    _firstPollItemsViewModel.setItems(
                        _firstPollItemsViewModel.gender, height,
                        weight,
                        mental,
                        physical);
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPollItemsView()));
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
            '1/5',
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
      width: MediaQuery
          .of(context)
          .size
          .width,
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

  Widget buildGenderItem(context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      width: size.width - 100,
      child: Column(
        children: [
          const Text(
            '성별을 입력 해 주세요.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListTile(
              title: const Text('남자'),
              leading: Radio(
                  value: 0,
                  groupValue: _firstPollItemsViewModel.gender,
                  onChanged: (value) {
                    setState(() {
                      _firstPollItemsViewModel.gender = value as int;
                    });
                  }),
            ),
          ),
          ListTile(
            title: const Text('여자'),
            leading: Radio(
                value: 1,
                groupValue: _firstPollItemsViewModel.gender,
                onChanged: (value) {
                  setState(() {
                    _firstPollItemsViewModel.gender = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildBmi() {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      width: size.width - 100,
      child: Column(
        children: [
          const Text(
            '키와 몸무게를 입력 해 주세요.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 32,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: heightController,
              autocorrect: false,
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Input Height(cm)',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 32,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: weightController,
              autocorrect: false,
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Input Weight(kg)',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildComfort() {
    var size = MediaQuery
        .of(context)
        .size;
    return SizedBox(
      width: size.width - 100,
      child: Column(
        children: [
          const Text(
            '최근 30일간 정신적인 불편함(우울, 스트레스 등)을 겪은 일 수를 입력 해 주세요.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 32,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: mentalController,
              autocorrect: false,
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Input count(일)',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '최근 30일간 신체적인 불편함(질병, 부상 등)을 겪은 일 수를 입력 해 주세요.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 32,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              controller: physicalController,
              autocorrect: false,
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Input count(일)',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
