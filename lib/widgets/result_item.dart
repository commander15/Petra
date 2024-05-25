import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String ?description;
  final DateTime text;
  final String title; 
  
  ResultItem({super.key, required this.title, this.description, required this.text});

  @override
  Widget build(BuildContext context) {
    int day = text.day;

    int month = text.month;
    
    int year = text.year;

    return SizedBox(
      width: double.infinity,
        child: Card(
            color: Theme.of(context).canvasColor,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Card(
                    color: Theme.of(context).focusColor,
                    child: Center(child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  )
                  )
                ),
                Text(
                  "$day/$month/$year",
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          )
    );
  }
}
