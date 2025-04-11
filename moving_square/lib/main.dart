import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Padding(
        padding: EdgeInsets.all(32.0),
        child: SquareAnimation(),
      ),
    );
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() => SquareAnimationState();
}

class SquareAnimationState extends State<SquareAnimation> {
  static const double _squareSize = 50.0;
  Alignment _alignment = Alignment.center;
  bool _isRightButtonEnabled = true;
  bool _isLeftButtonEnabled = true;

  void _moveToRight() {
    setState(() {
      _isRightButtonEnabled = false;
      _isLeftButtonEnabled = false;
      _alignment = Alignment.centerRight;
    });
  }

  void _moveToLeft() {
    setState(() {
      _isRightButtonEnabled = false;
      _isLeftButtonEnabled = false;
      _alignment = Alignment.centerLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedAlign(
          onEnd: () {
            setState(() {
              if (_alignment == Alignment.centerRight) {
                _isLeftButtonEnabled = true;
              } else if (_alignment == Alignment.centerLeft) {
                _isRightButtonEnabled = true;
              }
            });
          },
          duration: const Duration(seconds: 1),
          alignment: _alignment,
          child: Container(
            width: _squareSize,
            height: _squareSize,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              onPressed: _isRightButtonEnabled ? _moveToRight : null,
              child: const Text('Right'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _isLeftButtonEnabled ? _moveToLeft : null,
              child: const Text('Left'),
            ),
          ],
        ),
      ],
    );
  }
}

