import 'package:flutter/material.dart';

class HighlightWidget extends StatelessWidget {
  final String title, unit, value;
  Widget? widget;
  HighlightWidget(
      {Key? key,
      required this.title,
      required this.unit,
      required this.value,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E213A),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value != '' ? '$value ' : '-.-',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  unit,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            widget ?? Container(),
          ],
        ),
      ),
    );
  }
}
