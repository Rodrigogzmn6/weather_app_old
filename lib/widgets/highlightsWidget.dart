import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/highlightWidget.dart';

class HighlightsWidget extends StatelessWidget {
  final Map highlightsData;
  const HighlightsWidget({Key? key, required this.highlightsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Today\'s highlights',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Column(
            children: [
              HighlightWidget(
                title: 'Wind status',
                unit: 'mph',
                value: highlightsData.isNotEmpty
                    ? highlightsData['wind']['speed']
                    : '-,-',
                widget: highlightsData.isNotEmpty
                    ? Transform.rotate(
                        angle: ((-math.pi / 2) +
                            (highlightsData['wind']['degrees'] *
                                math.pi /
                                180)),
                        child: const CircleAvatar(
                          backgroundColor: Color(0xFF3C47E9),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFFE7E7EB),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: Color(0xFF3C47E9),
                      ),
              ),
              HighlightWidget(
                title: 'Humidity',
                unit: '%',
                value: highlightsData.isNotEmpty
                    ? highlightsData['humidity']
                    : '-,-',
                widget: highlightsData.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: LinearProgressIndicator(
                          value: double.parse(highlightsData['humidity']) / 100,
                          backgroundColor: const Color(0xFFE7E7EB),
                          color: Colors.deepOrangeAccent,
                        ),
                      )
                    : const CircularProgressIndicator(
                        color: Color(0xFF3C47E9),
                      ),
              ),
              HighlightWidget(
                title: 'Visibility',
                unit: 'miles',
                value: highlightsData.isNotEmpty
                    ? highlightsData['visibility']
                    : '-,-',
              ),
              HighlightWidget(
                title: 'Air pressure',
                unit: 'mb',
                value: highlightsData.isNotEmpty
                    ? highlightsData['pressure']
                    : '-,-',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
