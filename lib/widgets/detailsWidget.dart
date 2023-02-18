import 'package:flutter/material.dart';
import 'package:weather_app/widgets/forecastDayWidget.dart';

class DetailsWidget extends StatelessWidget {
  final List forecastData;
  const DetailsWidget({Key? key, required this.forecastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   padding: const EdgeInsets.all(48.0),
    //   childAspectRatio: ,
    //   mainAxisSpacing: 20,
    //   crossAxisSpacing: 20,
    //   shrinkWrap: true,
    //   physics: const ScrollPhysics(),
    //   crossAxisCount: 2,
    //   children: List.generate(5, (index) {
    //     return ForecastDayWidget(
    //       dayData: forecastData[index],
    //     );
    //   }),
    // );
    // return Placeholder(
    //   fallbackHeight: 600,
    // );
    return Container(
      color: const Color(0xFF100E1D),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ForecastDayWidget(dayData: forecastData[0]),
                ForecastDayWidget(dayData: forecastData[1]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ForecastDayWidget(dayData: forecastData[2]),
                ForecastDayWidget(dayData: forecastData[3]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ForecastDayWidget(dayData: forecastData[4]),
              ],
            )
          ],
        ),
      ),
    );
    // return Wrap(
    //   spacing: 8.0,
    //   runSpacing: 8.0,
    //   children: [
    //     Column(
    //       children: [
    //         ForecastDayWidget(dayData: forecastData[0]),
    //         Card(
    //           child: Column(
    //             children: [
    //               Text('Título 2'),
    //               Text('Contenido del elemento 2'),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Card(
    //           child: Column(
    //             children: [
    //               Text('Título 3'),
    //               Text('Contenido del elemento 3'),
    //             ],
    //           ),
    //         ),
    //         Card(
    //           child: Column(
    //             children: [
    //               Text('Título 4'),
    //               Text('Contenido del elemento 4'),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Card(
    //           child: Column(
    //             children: [
    //               Text('Título 5'),
    //               Text('Contenido del elemento 5'),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
