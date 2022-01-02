import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/fourth_poll_items_view_model.dart';
import 'package:health_failure_app_f/views/survey/predict_health_failure_view.dart';

class FourthPollItemsView extends StatefulWidget {
  const FourthPollItemsView({Key? key}) : super(key: key);

  @override
  _FourthPollItemsViewState createState() => _FourthPollItemsViewState();
}

class _FourthPollItemsViewState extends State<FourthPollItemsView> {
  FourthPollItemsViewModel _fourthPollItemsViewModel =
      FourthPollItemsViewModel();

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
                buildStairs(),
                const SizedBox(
                  height: 20,
                ),
                buildDiabetes(),
                const SizedBox(
                  height: 20,
                ),
                buildCondition(),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    _fourthPollItemsViewModel.setItems(
                      _fourthPollItemsViewModel.stairs,
                      _fourthPollItemsViewModel.diabetes,
                      _fourthPollItemsViewModel.condition,
                    );
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PredictHealthFailureView()));
                  },
                  child: const Text(
                    '예측하기',
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
            '4/5',
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

  Widget buildStairs() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '평소 계단을 이용하는데에 불편함을 느끼십니까?',
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
                groupValue: _fourthPollItemsViewModel.stairs,
                onChanged: (value) {
                  setState(() {
                    _fourthPollItemsViewModel.stairs = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _fourthPollItemsViewModel.stairs,
                onChanged: (value) {
                  setState(() {
                    _fourthPollItemsViewModel.stairs = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildDiabetes() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '당뇨병을 앓고 계십니까?',
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
                value: 2,
                groupValue: _fourthPollItemsViewModel.diabetes,
                onChanged: (value) {
                  setState(() {
                    _fourthPollItemsViewModel.diabetes = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('아니오'),
            leading: Radio(
                value: 0,
                groupValue: _fourthPollItemsViewModel.diabetes,
                onChanged: (value) {
                  setState(() {
                    _fourthPollItemsViewModel.diabetes = value as int;
                  });
                }),
          ),
          ListTile(
            title: const Text('의심'),
            leading: Radio(
                value: 1,
                groupValue: _fourthPollItemsViewModel.diabetes,
                onChanged: (value) {
                  setState(() {
                    _fourthPollItemsViewModel.diabetes = value as int;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget buildCondition() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          const Text(
            '평균적으로 느껴지는 몸 상태를 체크 해 주세요.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _fourthPollItemsViewModel.condition,
                      onChanged: (value) {
                        setState(() {
                          _fourthPollItemsViewModel.condition = value as int;
                        });
                      },
                    ),
                    Text('매우 나쁨'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _fourthPollItemsViewModel.condition,
                      onChanged: (value) {
                        setState(() {
                          _fourthPollItemsViewModel.condition = value as int;
                        });
                      },
                    ),
                    Text('나쁨'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _fourthPollItemsViewModel.condition,
                      onChanged: (value) {
                        setState(() {
                          _fourthPollItemsViewModel.condition = value as int;
                        });
                      },
                    ),
                    Text('보통'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    Radio(
                      value: 4,
                      groupValue: _fourthPollItemsViewModel.condition,
                      onChanged: (value) {
                        setState(() {
                          _fourthPollItemsViewModel.condition = value as int;
                        });
                      },
                    ),
                    Text('좋음'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Column(
                  children: [
                    Radio(
                      value: 5,
                      groupValue: _fourthPollItemsViewModel.condition,
                      onChanged: (value) {
                        setState(() {
                          _fourthPollItemsViewModel.condition = value as int;
                        });
                      },
                    ),
                    Text('매우 좋음'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
