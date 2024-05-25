import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:petra/result/result.dart';
import 'package:petra/result/result_page.dart';
import 'package:petra/widgets/button.dart';
import 'package:table_calendar/table_calendar.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  late int _cycleLength;
  late DateTime _focusedDay;
  late DateTime _lastDay;
  late DateTime _firstDay;
  DateTime _selectedDay = DateTime.now();

  void _onDaySelect(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _navigateToResultPage(Result result) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultPage(
          result: result,
        ),
      ),
    );
  }

  void _predictCycle() {
    if (_cycleLength >= 11 &&
        _cycleLength <= 45 &&
        _selectedDay != null) {
      DateTime lastPeriod,
          nextPeriod,
          follicularPhase,
          ovulationPhase,
          lutealPhase;
      int cycleLength = _cycleLength;
      lastPeriod = _selectedDay;
      nextPeriod = lastPeriod.add(Duration(days: cycleLength));
      follicularPhase = lastPeriod;
      ovulationPhase =
      lastPeriod.add(Duration(days: (cycleLength / 2).floor()));
      lutealPhase = lastPeriod.add(Duration(days: (cycleLength / 2).floor() + 2));
      Result result = Result(1, cycleLength, lastPeriod, nextPeriod, follicularPhase, ovulationPhase, lutealPhase);
      _navigateToResultPage(result);
    } else {
      //showMessageBar(context, "Please select your last period date.", error: true);
    }
  }

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _lastDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 45));
    _cycleLength = 28;
  }

  @override
  Widget build(BuildContext context) {
       Column main() => Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                "assets/calendar.png",
                width: 48.0,
                height: 48.0,
              ),
            ),
            Text(
              "Predict cycle accurately.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Padding(padding: EdgeInsets.all(2.0)),
            Text(
              "Track period easily.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );

        Container cycleLengthPicker() => Container(
          margin: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 15.0,
            right: 15.0,
          ),
          width: MediaQuery.of(context).size.width,
          height: 100.0,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10.0,
            shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Whats your usual cycle length?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Card(
                  color: Theme.of(context).cardColor,
                  child: NumberPicker(
                    minValue: 10, 
                    maxValue: 45, 
                    value: _cycleLength, 
                    onChanged: (value) {
                      setState(() {
                        _cycleLength = value;
                      });
                    },
                    axis: Axis.horizontal,
                    selectedTextStyle: const TextStyle(color: Colors.pinkAccent, fontSize: 24),
                    )
                ),
              ],
            ),
          ),
        );

        TableCalendar tableCalendar = TableCalendar(
          firstDay: _firstDay,
          lastDay: _lastDay,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          rowHeight: 45.0,
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
          ),
          availableGestures: AvailableGestures.horizontalSwipe,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: _onDaySelect,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        );

        Container datePicker() => Container(
          margin: const EdgeInsets.only(
            top: 0.0,
            bottom: 20.0,
            left: 15.0,
            right: 15.0,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10.0,
            shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Select your last date of period?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  tableCalendar,
                ]),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prédiction'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
          margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              main(),
              cycleLengthPicker(),
              datePicker(),
              PButton(text: "Prédire", onPressed: _predictCycle)
          ],
      ),

      )
        )
      )
    );
  }
}