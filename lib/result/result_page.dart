import 'package:flutter/material.dart';
import 'package:petra/result/result.dart';
import 'package:petra/widgets/result_item.dart';

class ResultPage extends StatefulWidget {
  final Result result;
  
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Result result;

  @override
  void initState() {
      super.initState();

      result = widget.result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset("assets/calendar.png"),
          ResultItem(
            title: "Date", 
            text: result.lastPeriod,
            description: ""
            ),
          ResultItem(
            title: "Dernière Période", 
            text: result.lastPeriod,
            description: ""
            ),
          ResultItem(
            title: "Prochaine Période", 
            text: result.nextPeriod,
            description: ""
            ),
          ResultItem(
            title: "Phase Folliculaire", 
            text: result.follicularPhase,
            description: ""
            ),
          ResultItem(
            title: "Phase Luteaire", 
            text: result.lastPeriod,
            description: ""
            ),
          ResultItem(
            title: "Phase d'Ovulation",
            text: result.ovulationPhase,
            description: ""
            ),
        ],
      )
    );
  }
}
