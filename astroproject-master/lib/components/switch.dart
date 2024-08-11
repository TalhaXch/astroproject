import 'package:flutter/material.dart';

class SwitchComponent extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchComponent({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Text(
            value ? '24H' : '12H',
            key: ValueKey<bool>(value),  // Unique key to trigger the animation
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: value ? Color(0xFF6171FF) : Color(0xFF8A01D7),
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color(0xFF6171FF),  // Dark blue when switch is on
          inactiveTrackColor: Color(0xFF8A01D7),  // Light blue when switch is off
        ),
      ],
    );
  }
}
