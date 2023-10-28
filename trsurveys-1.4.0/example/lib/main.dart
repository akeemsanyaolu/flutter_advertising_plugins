import 'package:flutter/material.dart';
import 'package:trsurveys/trsurveys.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    TheoremReach.instance.init(apiToken: 'api_token', userId: 'user_id');
    TheoremReach.instance.setOnRewardListener(onTheoremReachReward);
    TheoremReach.instance
        .setRewardCenterClosed(onTheoremReachRewardCenterClosed);
    TheoremReach.instance
        .setRewardCenterOpened(onTheoremReachRewardCenterOpened);
    TheoremReach.instance
        .setSurveyAvaiableListener(onTheoremReachSurveyAvailable);
    super.initState();
  }

  void onTheoremReachReward(int? quantity) {
    print('TR: $quantity');
  }

  void onTheoremReachSurveyAvailable(int? survey) {
    print('TR: $survey');
  }

  void onTheoremReachRewardCenterClosed() {
    print('TR: closed');
  }

  void onTheoremReachRewardCenterOpened() {
    print('TR: opened');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Launch TheoremReach"),
              onPressed: () => TheoremReach.instance.show(),
            ),
            ElevatedButton(
              child: const Text("Launch TheoremReach Placement"),
              onPressed: () => TheoremReach.instance.show(),
            )
          ],
        )),
      ),
    );
  }
}
