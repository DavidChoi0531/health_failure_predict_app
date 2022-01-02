import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/predict_health_failure_view_model.dart';
import 'package:provider/provider.dart';

class PredictHealthFailureView extends StatefulWidget {
  const PredictHealthFailureView({Key? key}) : super(key: key);

  @override
  _PredictHealthFailureViewState createState() =>
      _PredictHealthFailureViewState();
}

class _PredictHealthFailureViewState extends State<PredictHealthFailureView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildPopIcon(),
          buildResult(),
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

  Widget buildResult() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Image.asset(
              context.watch<PredictHeathFailureViewModel>().predictImgUrl,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            context.watch<PredictHeathFailureViewModel>().predict,
          ),
        ],
      ),
    );
  }
}
