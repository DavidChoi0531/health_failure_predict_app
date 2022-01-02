import 'package:flutter/material.dart';
import 'package:health_failure_app_f/views/survey/first_poll_items_view.dart';

class PollNotificationView extends StatelessWidget {
  const PollNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('심장질환 예측 설문',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                children: const [
                  Text(
                    '이 설문은 심장질환을 예측하는 모델에 필요한 데이터 입니다.\n해당 예측 결과는 참고용으로만 사용하십시오.\n해당 예측 결과는 의사의 진찰을 대신 할 수 없습니다.',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstPollItemsView()));
              },
              child: const Text(
                'start',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
