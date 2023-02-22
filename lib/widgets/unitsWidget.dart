import 'package:flutter/material.dart';

class UnitsWidget extends StatelessWidget {
  final String unit;
  final Function handleUnit;
  const UnitsWidget({Key? key, required this.unit, required this.handleUnit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 24.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          UnitButton(
            unit: '℃',
            enabled: unit == 'metric' ? true : false,
            handleUnit: handleUnit,
          ),
          const SizedBox(
            width: 12.0,
          ),
          UnitButton(
            unit: '℉',
            enabled: unit == 'imperial' ? true : false,
            handleUnit: handleUnit,
          ),
        ],
      ),
    );
  }
}

class UnitButton extends StatelessWidget {
  final String unit;
  final bool enabled;
  final Function handleUnit;
  const UnitButton(
      {super.key,
      required this.unit,
      required this.enabled,
      required this.handleUnit});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          enabled ? const Color(0xFFE7E7EB) : const Color(0xFF585676),
      child: TextButton(
        onPressed: () => handleUnit(unit == '℃' ? 'metric' : 'imperial'),
        child: Text(
          unit,
          style: TextStyle(
            color: enabled ? const Color(0xFF110E3C) : const Color(0xFFE7E7EB),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
