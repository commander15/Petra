import 'package:flutter/material.dart';
import 'package:petra/prediction/prediction_page.dart';
import 'package:petra/result/result.dart';
import 'package:petra/result/result_page.dart';
import 'package:petra/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
{
  List<Widget> screenRoutes;

  _HomePageState(): screenRoutes = List.empty() {
    screenRoutes = [
      PButton(
        text: "Prédiction",
        onPressed: _navigateToPredict,
      ),
      OButton(
        text: "Information",
        onPressed: _navigateToInformation,
      )
    ];
  } 

  void _navigateToPredict() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PredictionPage()));
  }

  void _navigateToOngoing() {
    Result res = Result.empty();
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(result: res)));
  }

  void _navigateToInformation() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                width: 200,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: screenRoutes,
                ),
              ),
              Text(
                "Version 1.0"
              )
            ],
          )
        ),
      )
    );
  }

  
}