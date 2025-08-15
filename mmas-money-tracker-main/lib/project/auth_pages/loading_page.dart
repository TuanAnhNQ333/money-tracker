import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final Color backgroundColor;
  final Color spinnerColor;
  final double spinnerSize;
  final bool fullscreen;
  final Widget? message;
  final Widget Function(Color color, double size)? customSpinner;

  const Loading({
    Key? key,
    this.backgroundColor = const Color(0xFFF5E6CC), // Màu nâu nhạt
    this.spinnerColor = Colors.brown,
    this.spinnerSize = 50.0,
    this.fullscreen = true,
    this.message,
    this.customSpinner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinner = customSpinner != null
        ? customSpinner!(spinnerColor, spinnerSize)
        : SpinKitChasingDots(
            color: spinnerColor,
            size: spinnerSize,
          );

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        spinner,
        if (message != null) ...[
          const SizedBox(height: 10),
          message!,
        ]
      ],
    );

    return Container(
      color: fullscreen ? backgroundColor : Colors.transparent,
      child: Center(
        child: fullscreen
            ? content
            : Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: content,
              ),
      ),
    );
  }
}
